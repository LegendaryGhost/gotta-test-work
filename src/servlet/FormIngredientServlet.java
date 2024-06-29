package servlet;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.Ingredient;

public class FormIngredientServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        Ingredient ingredient = new Ingredient();

        if (action != null && action.equals("update")) {
            int id = Integer.parseInt(req.getParameter("id"));
            ingredient.setId(id);
            try {
                ingredient.find();
            } catch (Exception e) {
                throw new ServletException(e);
            }
        } else {
            action = "create";
        }

        req.setAttribute("action", action);
        req.setAttribute("ingredient", ingredient);

        RequestDispatcher dispatcher = req.getRequestDispatcher("form-ingredient.jsp");
        dispatcher.forward(req, resp);
    }

}