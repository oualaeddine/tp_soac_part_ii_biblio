<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Login - Brand</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
</head>

<body class="bg-gradient-primary">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-12 ">
            <div class="card shadow-lg o-hidden border-0 my-5">
                <div class="card-body p-0">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="p-5">
                                <div class="text-center">
                                    <h4 class="text-dark mb-4">Bienvenue</h4>
                                </div>
                                <form class="user" method="post">
                                    <div class="form-group">
                                        <input class="form-control form-control-user"
                                               type="text" id="username"
                                               aria-describedby="emailHelp"
                                               placeholder="Nom d'utilisateur ..." name="username">
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control form-control-user"
                                               type="password" id="password"
                                               placeholder="Mot de passe"
                                               name="password">
                                    </div>
                                    <button class="btn btn-primary btn-block text-white btn-user" type="submit">
                                        S'authentifier
                                    </button>
                                    <%if ((boolean) request.getAttribute("error")) {%>
                                    <div class="alert  alert-danger m-3" role="alert">
                                        Le nom d'utilisateur ou le mot de passe utilis�s sont erron�s, veuillez
                                        reessayer!
                                    </div>
                                    <%}%>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
<script src="assets/js/theme.js"></script>
</body>

</html>