<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="dao.Category, java.util.ArrayList, util.SessionUtils" %>
<% boolean connected = SessionUtils.isUserConnected(request); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catégorie de recette</title>

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="assets/img/favicon/favicon.ico" />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <link rel="stylesheet" href="assets/vendor/libs/apex-charts/apex-charts.css" />

    <!-- Page CSS -->
    <link rel="stylesheet" href="assets/css/style.css">

    <!-- Helpers -->
    <script src="assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="assets/js/config.js"></script>
</head>
<body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
        <div class="layout-container">
            <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
                <!-- App brand -->
                <div class="app-brand demo">
                    <a href="recipe" class="app-brand-link">
                      <span class="app-brand-logo demo">
                        <img width="25" src="assets/img/favicon/book.png" alt="Gotta taste logo">
                      </span>
                      <span class="app-brand-text demo menu-text fw-bolder ms-2">Gotta taste</span>
                    </a>
        
                    <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
                      <i class="bx bx-chevron-left bx-sm align-middle"></i>
                    </a>
                  </div>
                <!-- / App brand -->

              <div class="menu-inner-shadow"></div>

              <ul class="menu-inner py-1">
                    <!-- Recipe -->
                    <li class="menu-item">
                        <a href="recipe" class="menu-link">
                            <i class="menu-icon tf-icons bx bx-book"></i>
                            <div data-i18n="Recipies">Recettes</div>
                        </a>
                    </li>
                    
                    <!-- Category -->
                    <li class="menu-item active">
                        <a href="category" class="menu-link">
                            <i class="menu-icon tf-icons bx bx-category"></i>
                            <div data-i18n="Categories">Catégories</div>
                        </a>
                    </li>

                    <!-- Ingredient -->
                    <li class="menu-item">
                        <a href="ingredient" class="menu-link">
                            <i class="menu-icon tf-icons bx bx-dish"></i>
                            <div data-i18n="Ingredients">Ingrédients</div>
                        </a>
                    </li>

                    <!-- Step -->
                    <li class="menu-item">
                        <a href="step" class="menu-link">
                            <i class="menu-icon tf-icons bx bx-book-open"></i>
                            <div data-i18n="Steps">Etapes</div>
                        </a>
                    </li>

                    <!-- Review -->
                    <li class="menu-item">
                        <a href="review" class="menu-link">
                            <i class="menu-icon tf-icons bx bxs-star-half"></i>
                            <div data-i18n="Reviews">Retours</div>
                        </a>
                    </li>
              </ul>
            </aside>

            <!-- Layout container -->
            <div class="layout-page">
                <!-- Navbar -->
                <nav
                    class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
                    id="layout-navbar"
                >
                    <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                        <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                            <i class="bx bx-menu bx-sm"></i>
                        </a>
                    </div>

                    <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
                        

                        <ul class="navbar-nav flex-row align-items-center ms-auto">

                        <!-- User -->
                        <%@ include file="user.jsp" %>
                        <!--/ User -->
                        </ul>
                    </div>
                </nav>
                <!-- / Navbar -->

                <!-- Content wrapper -->
                <div class="content-wrapper">
                    <!-- Content -->
                    <div class="container-xxl flex-grow-1 container-p-y">
                        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Gotta taste /</span> Catégories de recette</h4>

                        <!-- Basic Bootstrap Table -->
                        <div class="card">
                            <h5 class="card-header">Liste des catégories</h5>
                            <% if(connected) { %>
                                <div class="card-body"><a href="form-category" type="button" class="btn btn-success">Ajouter</a></div>
                            <% } %>
                            <div class="table-responsive text-nowrap" style="overflow-x: visible;">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Nom</th>
                                            <% if(connected) { %>
                                                <th>Actions</th>
                                            <% } %>
                                        </tr>
                                    </thead>
                                    <tbody class="table-border-bottom-0">
                                        <% for(Category category : (ArrayList<Category>)request.getAttribute("categories")) { %>
                                            <tr>
                                                <td><strong><%= category.getId() %></strong></td>
                                                <td><%= category.getName() %></td>
                                                <% if(connected) { %>
                                                    <td>
                                                        <div class="dropdown">
                                                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                                                                <i class="bx bx-dots-vertical-rounded"></i>
                                                            </button>
                                                            <div class="dropdown-menu">
                                                                <a class="dropdown-item" href="form-category?action=update&id=<%= category.getId() %>">
                                                                    <i class="bx bx-edit-alt me-1"></i>
                                                                    Modifier
                                                                </a>
                                                                <a class="dropdown-item" href="category?action=delete&id=<%= category.getId() %>">
                                                                    <i class="bx bx-trash me-1"></i>
                                                                    Supprimer
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </td>
                                                <% } %>
                                            </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!--/ Basic Bootstrap Table -->
                    </div>
                    <!-- / Content -->
                </div>
                <!-- / Content wrapper -->
            </div>
            <!-- / Layout container -->
        </div>
    </div>
    <!-- / Layout wrapper -->

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="assets/vendor/libs/jquery/jquery.js"></script>
    <script src="assets/vendor/libs/popper/popper.js"></script>
    <script src="assets/vendor/js/bootstrap.js"></script>
    <script src="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="assets/js/dashboards-analytics.js"></script>
</body>
</html>