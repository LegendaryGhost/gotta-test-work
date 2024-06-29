package servlet;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.Category;

public class FormCategoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        Category category = new Category();

        if (action != null && action.equals("update")) {
            int id = Integer.parseInt(req.getParameter("id"));
            category.setId(id);
            try {
                category.find();
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        } else {
            action = "create";
        }

        req.setAttribute("action", action);
        req.setAttribute("category", category);

        RequestDispatcher dispatcher = req.getRequestDispatcher("form-category.jsp");
        dispatcher.forward(req, resp);
    }

}