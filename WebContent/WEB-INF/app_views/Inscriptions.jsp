<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<%String role = (String) request.getAttribute("role");%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Biblio - Instructions</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
</head>

<body id="page-top">
<div id="wrapper">
    <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
        <div class="container-fluid d-flex flex-column p-0">
            <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                <div class="sidebar-brand-text mx-3"><span>Biblio</span></div>
            </a>
            <hr class="sidebar-divider my-0">
            <ul class="nav navbar-nav text-light" id="accordionSidebar">
                <%if (role.equals("RESP_BIBLIO")) {%>
                <li class="nav-item" role="presentation"><a class="nav-link"
                                                            href="<%=request.getContextPath() %>/dashboard"><i
                        class="fas fa-tachometer-alt"></i><span>Dashboard</span></a></li>
                <li class="nav-item" role="presentation"><a class="nav-link"
                                                            href="<%=request.getContextPath() %>/users"><i
                        class="fas fa-tachometer-alt"></i><span>Gerer les employée</span></a></li>
                <%}%>
                <li class="nav-item" role="presentation"><a class="nav-link"
                                                            href="<%=request.getContextPath() %>/students"><i
                        class="fas fa-tachometer-alt"></i><span>Gestion des etudiants</span></a></li>
                <li class="nav-item" role="presentation"><a class="nav-link"
                                                            href="<%=request.getContextPath() %>/inscription"><i
                        class="fas fa-tachometer-alt"></i><span>Inscrire un étudiant</span></a></li>
                <li class="nav-item" role="presentation"><a class="nav-link"
                                                            href="<%=request.getContextPath() %>/reinscription"><i
                        class="fas fa-tachometer-alt"></i><span>Reinscription</span></a></li>  <li class="nav-item" role="presentation"><a class="nav-link"
                                                            href="<%=request.getContextPath() %>/inscriptions"><i
                        class="fas fa-tachometer-alt"></i><span>Inscriptions</span></a></li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" href="<%=request.getContextPath() %>/logout">
                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Logout</a></li>
            </ul>
            <div class="text-center d-none d-md-inline">
                <button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button>
            </div>
        </div>
    </nav>
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                <div class="container-fluid">
                    <button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button"><i
                            class="fas fa-bars"></i></button>
                    <ul class="nav navbar-nav flex-nowrap ml-auto">
                        <li class="nav-item dropdown no-arrow" role="presentation">
                            <div class="nav-item dropdown no-arrow">
                                <a class="dropdown-toggle nav-link"
                                   data-toggle="dropdown" aria-expanded="false"
                                   href="#"><span
                                        class="d-none d-lg-inline mr-2 text-gray-600 small"><%= request.getAttribute("user")%></span></a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="container-fluid">
                <div class="d-sm-flex justify-content-between align-items-center mb-4">
                    <h3 class="text-dark mb-0">Inscriptions</h3>
                </div>
                <div class="row">
                    <div class="col-lg-7 col-xl-12">
                        <div class="card shadow mb-4">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h6 class="text-primary font-weight-bold m-0">Informations de l'etudiant</h6>
                            </div>
                            <div class="card-body">
                                <form method="post">
                                    <div class="form-group">
                                        <div class="form-row">
                                            <div class="col"><label>Nom :</label><input class="form-control" type="text" name="nom"
                                                                                        required></div>
                                            <div class="col"><label>Prenom :</label><input class="form-control" name ="prenom"
                                                                                           type="text" required></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-row">
                                            <div class="col"><label>date de naissance:</label>
                                            <input
                                               name="date_naiss" 
                                                     class="form-control" type="date" required></div>
                                            <div class="col">
                                            
                                            <label>Immatriculation BAC :</label><input
                                                    name="num_bac" 
                                                    class="form-control" type="text" required></div>
                                        </div>
                                    </div>
                                <div class="form-group">
                                            <label for="sexe">Sexe : </label>
                                            <select id="sexe" name="sexe" class="form-control form-control-lg" required>
                                                <option selected disabled value="">--Selectionner--</option>
                                                <option value="HOMME">Homme</option>
                                                <option value="FEMME">Femme</option>
                                            </select>
                                        </div>
                              
                                    <button class="btn btn-success float-right" type="submit" style="font-size: 25px;">
                                        <i class="fa fa-plus" style="font-size: 25px;"></i>&nbsp;Inscrire
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="bg-white sticky-footer">
            <div class="container my-auto">
                <div class="text-center my-auto copyright"><span>Copyright © Brand 2019</span></div>
            </div>
        </footer>
    </div>
    <a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a></div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
<script src="assets/js/theme.js"></script>
</body>

</html>