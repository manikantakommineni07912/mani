package com.eventwizard.platform.servlet;

import com.eventwizard.platform.model.EventRecord;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * EventListController - Handles HTTP GET requests to fetch all stored event entries
 * and forwards the data to the event listing view.
 */
@WebServlet("/viewEvents")
public class EventListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<EventRecord> records = new ArrayList<>();

        try (Connection db = DatabaseBridge.openConnection()) {
            String fetchSQL = "SELECT * FROM events ORDER BY event_date";
            PreparedStatement statement = db.prepareStatement(fetchSQL);
            ResultSet result = statement.executeQuery();

            while (result.next()) {
                EventRecord record = new EventRecord();
                record.setId(result.getInt("id"));
                record.setName(result.getString("name"));
                record.setDate(result.getDate("event_date"));
                record.setLocation(result.getString("location"));
                record.setDescription(result.getString("description"));
                record.setCategory(result.getString("event_type"));
                record.setAttendeeCount(result.getInt("attendee_count"));
                records.add(record);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        // Share data with the view page
        request.setAttribute("events", records);
        request.getRequestDispatcher("/WEB-INF/views/event.jsp").forward(request, response);
    }
}
