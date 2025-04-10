package com.eventwizard.platform.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import weka.classifiers.meta.FilteredClassifier;
import weka.core.Instance;
import weka.core.DenseInstance;
import weka.core.Instances;
import weka.core.SerializationHelper;
import weka.core.converters.ConverterUtils.DataSource;

import java.io.IOException;

/**
 * EventTypePredictor - Servlet that loads a trained Weka model and predicts the event type
 * based on user input (location, date, and description).
 */
@WebServlet("/predict")
public class EventTypePredictor extends HttpServlet {

    private FilteredClassifier model;
    private Instances structure;

    /**
     * Load model and structure when servlet is initialized.
     */
    @Override
    public void init() throws ServletException {
        try {
            String modelPath = getServletContext().getRealPath("/WEB-INF/models/trained_event_predictor.model");
            String arffPath = getServletContext().getRealPath("/WEB-INF/data/event_structure_template.arff");

            model = (FilteredClassifier) SerializationHelper.read(modelPath);
            DataSource source = new DataSource(arffPath);
            structure = source.getDataSet();
            structure.setClassIndex(0);
        } catch (Exception e) {
            throw new ServletException("Failed to load classifier or structure.", e);
        }
    }

    /**
     * Handle POST form data and return predicted event category.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String venue = request.getParameter("venue");
        String date = request.getParameter("schedule");
        String description = request.getParameter("summary");

        try {
            Instance input = new DenseInstance(structure.numAttributes());
            input.setDataset(structure);

            input.setMissing(0); // Class to predict
            input.setValue(1, venue != null ? venue : "?");
            input.setValue(2, date != null ? date : "?");
            input.setValue(3, description != null ? description : "?");

            double predIndex = model.classifyInstance(input);
            String result = structure.classAttribute().value((int) predIndex);

            request.setAttribute("prediction", result);
        } catch (Exception e) {
            request.setAttribute("error", "Prediction failed: " + e.getMessage());
        }

        request.getRequestDispatcher("/WEB-INF/views/predictionOutput.jsp").forward(request, response);
    }
}
