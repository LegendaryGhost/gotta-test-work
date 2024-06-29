package servlet;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.Category;

public class CategoryServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String action = req.getParameter("action");

            if (action != null && action.equals("delete")) {
                int id = Integer.parseInt(req.getParameter("id"));
                Category category = new Category(id);
                category.delete();
            }

            ArrayList<Category> categories = Category.all();
            req.setAttribute("categories", categories);
            RequestDispatcher dispatcher = req.getRequestDispatcher("category.jsp");
            dispatcher.forward(req, resp);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String action = req.getParameter("action");
        int id = Integer.parseInt(req.getParameter("idCategory"));
        String name = req.getParameter("categoryName");
        Category category = new Category(id, name);
        
        try {
            if (action != null && action.equals("update")) {
                category.update();
            } else {
                category.create();
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        resp.sendRedirect("category");
    }

}
