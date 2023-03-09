package servlets;

import db.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Item;

import java.io.IOException;

@WebServlet(value = "/editItem")
public class EditItemServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String name = req.getParameter("i_name");
        String price = req.getParameter("i_price");
        String amount = req.getParameter("i_amount");

        Item item = DBUtil.getById(Long.parseLong(id));
        if (item.getId()!=null) {
            item.setName(name);
            item.setPrice(Double.parseDouble(price));
            item.setAmount(Integer.parseInt(amount));
            DBUtil.editItem(item);
            resp.sendRedirect("/detailsItem?id="+id);
        }else {
            resp.sendRedirect("/");
        }
    }
}
