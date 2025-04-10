package com.eventwizard.platform.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;

/**
 * EventAddHandler - Processes form submissions for new event records.
 * Supports both GET (form display) and POST (data insertion) requests.
 */
@WebServlet("/addEvent")
public class EventCreationHandler extends HttpServlet {

    /**
     * Handles form display via GET method.
     * Routes users to the JSP where new events are submitted.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/create.jsp").forward(request, response);
    }

    /**
     * Handles event creation via POST.
     * Extracts data from the form and inserts it into the database.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Step 1: Collect submitted form values
        String titleInput = request.getParameter("title");
        String dateInput = request.getParameter("schedule");
        String locationInput = request.getParameter("venue");
        String detailsInput = request.getParameter("summary");
        String categoryInput = request.getParameter("type");

        // Step 2: Parse the date into SQL format
        java.sql.Date sqlDate = null;
        try {
            java.util.Date parsed = new SimpleDateFormat("yyyy-MM-dd").parse(dateInput);
            sqlDate = new java.sql.Date(parsed.getTime());
        } catch (Exception parseError) {
            parseError.printStackTrace();
        }

        // Step 3: Store the event data in the database
        try (Connection conn = DatabaseBridge.openConnection()) {
            String insertQuery = "INSERT INTO events (name, event_date, location, description, event_type) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(insertQuery);
            pstmt.setString(1, titleInput);
            pstmt.setDate(2, sqlDate);
            pstmt.setString(3, locationInput);
            pstmt.setString(4, detailsInput);
            pstmt.setString(5, categoryInput);
            pstmt.executeUpdate();
        } catch (Exception dbError) {
            dbError.printStackTrace();
        }

        // Step 4: Redirect to the list view
        response.sendRedirect("overview");
    }
}
