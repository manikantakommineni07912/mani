package com.eventwizard.platform.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * RSVPProcessor - Increments the attendee count for a given event when a user RSVPs.
 */
@WebServlet("/rsvp")
public class RSVPProcessor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int eventId = Integer.parseInt(request.getParameter("uid"));

        try (Connection conn = DatabaseBridge.openConnection()) {
            String sql = "UPDATE events SET attendee_count = attendee_count + 1 WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, eventId);
            stmt.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        response.sendRedirect("view");
    }
}
