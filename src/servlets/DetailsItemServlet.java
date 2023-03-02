package servlets;

import db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Item;

import java.io.IOException;

@WebServlet(value = "/detailsItem")
public class DetailsItemServlet extends HomeServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Item item = DBManager.getItemById(Long.parseLong(id));
        request.setAttribute("item", item);
        request.getRequestDispatcher("/details.jsp").forward(request, response);
    }
}
