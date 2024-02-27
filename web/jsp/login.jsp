<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gotta taste login</title>

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

    <!-- Page CSS -->
    <!-- Page -->
    <link rel="stylesheet" href="assets/vendor/css/pages/page-auth.css" />
    <link rel="stylesheet" href="assets/css/style.css">

    <!-- Helpers -->
    <script src="assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="assets/js/config.js"></script>
</head>
<body>
    <!-- Content -->

    <div class="container-xxl">
        <div class="authentication-wrapper authentication-basic container-p-y">
          <div class="authentication-inner">
            <!-- Register -->
            <div class="card">
              <div class="card-body">
                <!-- Logo -->
                <div class="app-brand justify-content-center">
                  <a href="recipe" class="app-brand-link gap-2 py-1">
                    <span class="app-brand-logo demo">
                      <img width="25" src="assets/img/favicon/book.png" alt="Gotta taste logo">
                    </span>
                    <span class="app-brand-text demo text-body fw-bolder">Gotta taste</span>
                  </a>
                </div>
                <!-- /Logo -->
                <h4 class="mb-2">Bienvenu dans Gotta taste ! 👋</h4>
                <p class="mb-4">Veuillez vous connecter à votre compte</p>
  
                <form id="formAuthentication" class="mb-3" action="login" method="POST">
                  <%
                    String error = request.getParameter("error");
                    if(error != null) {
                      if(error.equals("true")) {
                  %>
                        <div class="alert alert-danger alert-dismissible">
                          Identifiants incorrect
                          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                  <%
                      }
                    }
                  %>
                  <div class="mb-3">
                    <label for="userEmail" class="form-label">Email</label>
                    <input
                      value="tiarintsoa@gmail.com"
                      type="text"
                      class="form-control"
                      id="userEmail"
                      name="userEmail"
                      placeholder="Saisissez votre email"
                      autofocus
                    />
                  </div>
                  <div class="mb-3 form-password-toggle">
                    <label class="form-label" for="userPassword">Mot de passe</label>
                    <div class="input-group input-group-merge">
                      <input
                        value="12345678"
                        type="password"
                        id="userPassword"
                        class="form-control"
                        name="userPassword"
                        placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                        aria-describedby="password"
                      />
                      <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                    </div>
                  </div>
                  <div class="mb-3">
                    <button class="btn btn-primary d-grid w-100" type="submit">Me connecter</button>
                  </div>
                </form>
              </div>
            </div>
            <!-- /Register -->
          </div>
        </div>
    </div>
  
    <!-- / Content -->
  
    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="assets/vendor/libs/jquery/jquery.js"></script>
    <script src="assets/vendor/libs/popper/popper.js"></script>
    <script src="assets/vendor/js/bootstrap.js"></script>
    <script src="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="assets/js/main.js"></script>
</body>
</html>