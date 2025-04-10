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
 * EventSearchFilter - Handles filtered search requests for events based on venue, date, and type.
 */
@WebServlet("/search")
public class EventSearchFilter extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String category = request.getParameter("type");
        String selectedDate = request.getParameter("schedule");
        String keyword = request.getParameter("venue");

        // Load only the search form if no criteria is passed
        if ((category == null || category.trim().isEmpty()) &&
                (selectedDate == null || selectedDate.trim().isEmpty()) &&
                (keyword == null || keyword.trim().isEmpty())) {
            request.getRequestDispatcher("/WEB-INF/views/searchFilters.jsp").forward(request, response);
            return;
        }

        List<EventRecord> filteredEvents = new ArrayList<>();

        try (Connection conn = DatabaseBridge.openConnection()) {
            StringBuilder sql = new StringBuilder("SELECT * FROM events WHERE 1=1");
            List<Object> filters = new ArrayList<>();

            if (category != null && !category.isEmpty()) {
                sql.append(" AND event_type = ?");
                filters.add(category);
            }

            if (selectedDate != null && !selectedDate.isEmpty()) {
                sql.append(" AND event_date = ?");
                filters.add(Date.valueOf(selectedDate));
            }

            if (keyword != null && !keyword.isEmpty()) {
                sql.append(" AND location LIKE ?");
                filters.add("%" + keyword + "%");
            }

            PreparedStatement stmt = conn.prepareStatement(sql.toString());
            for (int i = 0; i < filters.size(); i++) {
                stmt.setObject(i + 1, filters.get(i));
            }

            ResultSet result = stmt.executeQuery();
            while (result.next()) {
                EventRecord record = new EventRecord();
                record.setId(result.getInt("id"));
                record.setName(result.getString("name"));
                record.setDate(result.getDate("event_date"));
                record.setLocation(result.getString("location"));
                record.setDescription(result.getString("description"));
                record.setCategory(result.getString("event_type"));
                record.setAttendeeCount(result.getInt("attendee_count"));

            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        request.setAttribute("events", filteredEvents);
        request.getRequestDispatcher("/WEB-INF/views/eventTable.jsp").forward(request, response);
    }
}
