<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="dao.Recipe, dao.Category, java.util.ArrayList, util.SessionUtils" %>
<% boolean connected = SessionUtils.isUserConnected(request); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recette</title>

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
                    <li class="menu-item active">
                        <a href="recipe" class="menu-link">
                            <i class="menu-icon tf-icons bx bx-book"></i>
                            <div data-i18n="Recipies">Recettes</div>
                        </a>
                    </li>
                    
                    <!-- Category -->
                    <li class="menu-item">
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
                        <!-- Search modal button trigger -->
                        <button type="button" class="btn btn-icon rounded-pill btn-secondary mx-auto me-2" data-bs-toggle="modal" data-bs-target="#searchModal">
                            <span class="tf-icons bx bx-search"></span>
                        </button>
                        <!-- /Search modal button trigger -->

                        <ul class="navbar-nav flex-row align-items-center">

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
                        <!-- Search modal -->
                        <div class="modal fade" id="searchModal" tabindex="-1" style="display: none;" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Critères de recherche</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form method="GET" action="recipe">
                                            <div class="mb-3">
                                                <label class="form-label" for="search-title">Titre</label>
                                                <input name="searchTitle" type="text" class="form-control" id="search-title" placeholder="Titre" aria-label="Titre" aria-describedby="search-title">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label" for="search-description">Description</label>
                                                <input name="searchDescription" type="text" class="form-control" id="search-description" placeholder="Description" aria-label="Description" aria-describedby="search-description">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label" for="search-category">Catégorie</label>
                                                <select name="searchIdCategory" class="form-select" id="search-category" aria-label="Catégorie de recherche">
                                                    <option selected value="0">Toutes les catégories</option>
                                                    <%  for(Category category : (ArrayList<Category>)request.getAttribute("categories")) { %>
                                                        <option value="<%= category.getId() %>">
                                                            <%= category.getName() %>
                                                        </option>
                                                    <% } %>
                                              </select>
                                            </div>
                                            <div class="row g-2 mb-3">
                                                <div class="col mb-0">
                                                    <label class="form-label" for="search-min-cook-time">Temps de préparation minimum</label>
                                                    <input name="searchMinCookTime" type="time" class="form-control" id="search-min-cook-time" placeholder="Temps de cuisson" aria-label="Temps de cuisson" aria-describedby="search-min-cook-time">
                                                </div>
                                                <div class="col mb-0">
                                                    <label class="form-label" for="search-max-cook-time">Temps de préparation maximum</label>
                                                    <input name="searchMaxCookTime" type="time" class="form-control" id="search-max-cook-time" placeholder="Temps de cuisson" aria-label="Temps de cuisson" aria-describedby="search-max-cook-time">
                                                </div>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label" for="search-creator">Créée par</label>
                                                <input name="searchCreator" type="text" class="form-control" id="search-creator" placeholder="Créateur" aria-label="Créateur" aria-describedby="search-creator">
                                            </div>
                                            <div class="row g-2 mb-3">
                                                <div class="col mb-0">
                                                    <label class="form-label" for="search-min-creation-date">Date de création minimum</label>
                                                    <input name="searchMinCreationDate" type="date" class="form-control" id="search-min-creation-date" placeholder="Date de création" aria-label="Date de création" aria-describedby="search-min-creation-date">
                                                </div>
                                                <div class="col mb-0">
                                                    <label class="form-label" for="search-max-creation-date">Date de création maximum</label>
                                                    <input name="searchMaxCreationDate" type="date" class="form-control" id="search-max-creation-date" placeholder="Date de création" aria-label="Date de création" aria-describedby="search-max-creation-date">
                                                </div>
                                            </div>
                                            <div class="modal-footer p-0">
                                                <button type="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                                    Annuler
                                                </button>
                                                <button type="submit" class="btn btn-primary">Rechercher</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Search modal -->

                        <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Gotta taste /</span> Recettes</h4>

                        <!-- Basic Bootstrap Table -->
                        <div class="card">
                            <h5 class="card-header">Liste des recettes</h5>
                            <% if(connected) { %>
                                <div class="card-body"><a href="form-recipe" type="button" class="btn btn-success">Ajouter</a></div>
                            <% } %>
                            <div class="table-responsive text-nowrap" style="overflow-x: visible;">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Titre</th>
                                            <th>Description</th>
                                            <th>ID Catégorie</th>
                                            <th>Temps de préparation</th>
                                            <th>Créée par</th>
                                            <th>Date de création</th>
                                            <% if(connected) { %>
                                                <th>Actions</th>
                                            <% } %>
                                        </tr>
                                    </thead>
                                    <tbody class="table-border-bottom-0">
                                        <% for(Recipe recipe : (ArrayList<Recipe>)request.getAttribute("recipes")) { %>
                                            <tr>
                                                <td><strong><%= recipe.getId() %></strong></td>
                                                <td><%= recipe.getTitle() %></td>
                                                <td><%= recipe.getDescriptionExcerpt() %></td>
                                                <td><%= recipe.getIdCategory() %></td>
                                                <td><%= recipe.getFormattedCookTime() %></td>
                                                <td><%= recipe.getCreatedBy() %></td>
                                                <td><%= recipe.getFormattedCreatedDate() %></td>
                                                <% if(connected) { %>
                                                    <td>
                                                        <div class="dropdown">
                                                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                                                                <i class="bx bx-dots-vertical-rounded"></i>
                                                            </button>
                                                            <div class="dropdown-menu">
                                                                <%-- <a class="dropdown-item" href="#">
                                                                    <i class="bx bx-edit-alt me-1"></i>
                                                                    Détails
                                                                </a> --%>
                                                                <a class="dropdown-item" href="form-recipe?action=update&id=<%= recipe.getId() %>">
                                                                    <i class="bx bx-edit-alt me-1"></i>
                                                                    Modifier
                                                                </a>
                                                                <a class="dropdown-item" href="recipe?action=delete&id=<%= recipe.getId() %>">
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