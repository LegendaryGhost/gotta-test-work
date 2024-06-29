package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class RecipeIngredient {
    
    private int idRecipe;
    private int idIngredient;
    private String ingredientName;
    private String ingredientUnit;
    private double quantity;
    
    public RecipeIngredient(int idRecipe) {
        this.idRecipe = idRecipe;
    }

    public RecipeIngredient(int idRecipe, int idIngredient, String ingredientName, String ingredientUnit, double quantity) {
        this.idRecipe = idRecipe;
        this.idIngredient = idIngredient;
        this.ingredientName = ingredientName;
        this.ingredientUnit = ingredientUnit;
        this.quantity = quantity;
    }

    public static ArrayList<RecipeIngredient> search(int idRecipe) throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        ArrayList<RecipeIngredient> recipeIngredients = new ArrayList<>();

        try {
            connection = DBConnection.getPostgesConnection();
            statement = connection.prepareStatement(
                "SELECT * FROM recipe_ingredient AS ri"
                + " INNER JOIN ingredient AS i ON i.id_ingredient = ri.id_ingredient"
                + " WHERE ri.id_recipe = ?"
            );
            statement.setInt(1, idRecipe);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                recipeIngredients.add(new RecipeIngredient(
                    resultSet.getInt("id_recipe"),
                    resultSet.getInt("id_ingredient"),
                    resultSet.getString("ingredient_name"),
                    resultSet.getString("unit"),
                    resultSet.getDouble("quantity")
                ));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }

        return recipeIngredients;
    }

    public void deleteFromIdRecipe() throws Exception {
        Connection connection = null;
        PreparedStatement statement = null;
        try {
            connection = DBConnection.getPostgesConnection();
            connection.setAutoCommit(false);
            statement = connection.prepareStatement(
                "DELETE FROM recipe_ingredient"
                + " WHERE id_recipe = ?"
            );
            statement.setInt(1, idRecipe);
            statement.executeUpdate();
            connection.commit();
        } catch (Exception e) {
            connection.rollback();
            throw e;
        } finally {
            statement.close();
            connection.close();
        }
    }

    public int getIdRecipe() {
        return idRecipe;
    }
    
    public void setIdRecipe(int idRecipe) {
        this.idRecipe = idRecipe;
    }
    
    public int getIdIngredient() {
        return idIngredient;
    }
    
    public void setIdIngredient(int idIngredient) {
        this.idIngredient = idIngredient;
    }
    
    public double getQuantity() {
        return quantity;
    }
    
    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }

    public String getIngredientName() {
        return ingredientName;
    }

    public void setIngredientName(String ingredientName) {
        this.ingredientName = ingredientName;
    }

    public String getIngredientUnit() {
        return ingredientUnit;
    }

    public void setIngredientUnit(String ingredientUnit) {
        this.ingredientUnit = ingredientUnit;
    }
}
