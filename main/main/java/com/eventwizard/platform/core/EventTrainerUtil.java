package com.eventwizard.platform.core;

import weka.classifiers.bayes.NaiveBayes;
import weka.classifiers.meta.FilteredClassifier;
import weka.classifiers.Evaluation;
import weka.core.Instances;
import weka.core.converters.CSVLoader;
import weka.core.converters.ArffSaver;
import weka.filters.Filter;
import weka.filters.unsupervised.attribute.Remove;
import weka.filters.unsupervised.attribute.StringToWordVector;
import weka.core.SerializationHelper;

import java.io.File;
import java.util.Random;

/**
 * EventTrainerUtil - Responsible for training a Weka model to categorize event types.
 * It reads event data from a CSV, processes features, and serializes the trained model.
 */
public class EventTrainerUtil {

    public static void main(String[] args) throws Exception {

        // Step 1: Load event dataset from CSV
        CSVLoader csvReader = new CSVLoader();
        csvReader.setSource(new File("events.csv"));
        Instances rawData = csvReader.getDataSet();

        // Step 2: Exclude non-predictive field (e.g., event title - 2nd column)
        Remove excludeAttribute = new Remove();
        excludeAttribute.setAttributeIndices("2"); // 1-based index
        excludeAttribute.setInputFormat(rawData);
        Instances cleanedData = Filter.useFilter(rawData, excludeAttribute);

        // Step 3: Mark the target class (first column)
        cleanedData.setClassIndex(0);

        // Step 4: Apply text vectorization to relevant fields
        StringToWordVector textVectorFilter = new StringToWordVector();
        textVectorFilter.setAttributeIndices("2-4");
        textVectorFilter.setInputFormat(cleanedData);
        Instances transformedData = Filter.useFilter(cleanedData, textVectorFilter);

        // Step 5: Train a Naive Bayes model
        NaiveBayes nbClassifier = new NaiveBayes();
        nbClassifier.buildClassifier(transformedData);

        // Step 6: Evaluate model using 10-fold cross-validation
        Evaluation evaluation = new Evaluation(transformedData);
        evaluation.crossValidateModel(nbClassifier, transformedData, 10, new Random(1));

        System.out.println("==== Model Performance Report ====");
        System.out.println(evaluation.toSummaryString());
        System.out.println(evaluation.toClassDetailsString());
        System.out.println(evaluation.toMatrixString());

        // Step 7: Create a filter+model pipeline and serialize it
        FilteredClassifier pipeline = new FilteredClassifier();
        pipeline.setFilter(textVectorFilter);
        pipeline.setClassifier(nbClassifier);
        pipeline.buildClassifier(cleanedData);

        SerializationHelper.write("event_model_v5.model", pipeline);
        System.out.println("✔ Model successfully saved as: event_model_v5.model");

        // Step 8: Save empty ARFF structure for inference use
        transformedData.delete(); // clear data rows
        ArffSaver structureSaver = new ArffSaver();
        structureSaver.setInstances(transformedData);
        structureSaver.setFile(new File("header_only_v5.arff"));
        structureSaver.writeBatch();
        System.out.println("✔ Header structure saved to: header_only_v5.arff");
    }
}
