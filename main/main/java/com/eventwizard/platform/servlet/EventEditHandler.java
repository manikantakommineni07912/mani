package com.eventwizard.platform.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;

/**
 * EventEditHandler - Handles updates to existing event records using form data.
 */
@WebServlet("/update")
public class EventEditHandler extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int eventId = Integer.parseInt(request.getParameter("uid"));
        String title = request.getParameter("title");
        String dateStr = request.getParameter("schedule");
        String venue = request.getParameter("venue");
        String summary = request.getParameter("summary");
        String type = request.getParameter("type");

        java.sql.Date formattedDate = null;
        try {
            java.util.Date parsed = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
            formattedDate = new java.sql.Date(parsed.getTime());
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        try (Connection conn = DatabaseBridge.openConnection()) {
            String sql = "UPDATE events SET name = ?, event_date = ?, location = ?, description = ?, event_type = ? WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, title);
            stmt.setDate(2, formattedDate);
            stmt.setString(3, venue);
            stmt.setString(4, summary);
            stmt.setString(5, type);
            stmt.setInt(6, eventId);
            stmt.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        response.sendRedirect("view");
    }
}
