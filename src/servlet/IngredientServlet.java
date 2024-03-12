package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Ingredient;

public class IngredientServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String action = req.getParameter("action");

            if (action != null && action.equals("delete")) {
                int id = Integer.parseInt(req.getParameter("id"));
                Ingredient ingredient = new Ingredient(id);
                ingredient.delete();
            }

            String name = req.getParameter("searchName") == null ? "" : req.getParameter("searchName");
            String unit = req.getParameter("searchUnit") == null ? "" : req.getParameter("searchUnit");
            String minPriceStr = req.getParameter("searchMinPrice");
            String maxPriceStr = req.getParameter("searchMaxPrice");
            int minPrice = 0;
            int maxPrice = 0;

            if (minPriceStr != null && !minPriceStr.equals("")) {
                minPrice = Integer.parseInt(minPriceStr);
            }

            if (maxPriceStr != null && !maxPriceStr.equals("")) {
                maxPrice = Integer.parseInt(maxPriceStr);
            }

            ArrayList<Ingredient> ingredients = Ingredient.search(name, unit, minPrice, maxPrice);
            req.setAttribute("ingredients", ingredients);
            RequestDispatcher dispatcher = req.getRequestDispatcher("ingredient.jsp");
            dispatcher.forward(req, resp);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        int id = Integer.parseInt(req.getParameter("idIngredient"));
        String name = req.getParameter("ingredientName");
        String unit = req.getParameter("ingredientUnit");
        int price = Integer.parseInt(req.getParameter("ingredientPrice"));
        Ingredient ingredient = new Ingredient(id, name, unit, price);
        
        try {
            if (action != null && action.equals("update")) {
                ingredient.update();
            } else {
                ingredient.create();
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        resp.sendRedirect("ingredient");
    }

}
