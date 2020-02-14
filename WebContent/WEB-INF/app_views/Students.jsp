<%@ page import="soac.miniprojet.model.dao.daos.StudentsDAO" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="soac.miniprojet.model.beans.Students" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<%String role = (String) request.getAttribute("role");%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Biblio - Etudiants</title>
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
                <div class="sidebar-brand-text mx-3"><span>Biblio <%=(String) request.getAttribute("role")%></span>
                </div>
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
                    <h3 class="text-dark mb-0">Gestion des etudiants</h3>

                    <!-- Modal -->
                    <div class="modal fade " id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog"
                         aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <form>

                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Ajouter un etudiant</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="nom">Nom : </label>
                                                <input type="text" id="nom" name="nom" class="form-control" required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="prenom">Prenom : </label>
                                                <input type="text" name="prenom" class="form-control" id="prenom"
                                                       required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Date de naissence : </label>
                                            <input type="date" id="date_naiss" name="date_naiss" class="form-control"
                                                   required>
                                        </div>
                                        <div class="form-group">
                                            <label for="sexe">Sexe : </label>
                                            <select id="sexe" name="sexe" class="form-control form-control-lg" required>
                                                <option selected disabled value="">--Selectionner--</option>
                                                <option value="HOMME">Homme</option>
                                                <option value="FEMME">Femme</option>
                                            </select>
                                        </div>

                                        <div class="form-row">
                                            <div class="form-group col-md-12">
                                                <label for="bac">Numero Bac</label>
                                                <input type="number" name="bac" class="form-control" id="bac" required>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">Annuler
                                            </button>
                                            <button type="submit" class="btn btn-success"><i
                                                    class="fa fa-dot-circle-o"></i> Ajouter
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-7 col-xl-12">
                        <div class="card shadow mb-4">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h6 class="text-primary font-weight-bold m-0">Liste des etudiants</h6>
                                <div class="dropdown no-arrow">
                                    <button class="btn btn-link btn-sm dropdown-toggle" data-toggle="dropdown"
                                            aria-expanded="false" type="button"><i
                                            class="fas fa-ellipsis-v text-gray-400"></i></button>
                                    <div class="dropdown-menu shadow dropdown-menu-right animated--fade-in"
                                         role="menu"></div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-hover table-sm">
                                        <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Nom</th>
                                            <th>Prénom</th>
                                            <th>Date de de naissance</th>
                                            <th>Sexe</th>
                                            <th>Numero de BAC</th>
                                            <th>Date d'inscription</th>
                                            <th>Actions</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            LinkedList<Students> studs = (LinkedList<Students>) request.getAttribute("students");
                                            for (Students student : studs) {
                                        %>
                                        <tr>
                                            <td><%= student.getId()%>
                                            </td>
                                            <td><%= student.getNom()%>
                                            </td>
                                            <td><%= student.getPrenom()%>
                                            </td>
                                            <td>
                                                <%= student.getDateNaiss()%>
                                            </td>
                                            <td>
                                                <%= student.getSexe()%>
                                            </td>
                                            <td>
                                                <%= student.getNumBac()%>
                                            </td>
                                            <td>
                                                <%= student.getDateInsc()%>
                                            </td>
                                            <td class="text-center" style="padding-top: 0px;">

                                                <button type="button" class="btn btn-danger" data-toggle="modal"
                                                        data-target="#delete-<%= student.getId()%>"><i
                                                        class="fa fa-remove"></i>
                                                </button>

                                                <!-- Delete Modal -->
                                                <div class="modal fade " id="delete-<%= student.getId()%>"
                                                     data-backdrop="static" tabindex="-1" role="dialog"
                                                     aria-labelledby="delete-<%= student.getId()%>r" aria-hidden="true">
                                                    <form method="post">
                                                        <input type="hidden" name="action" value="delete">
                                                        <input type="hidden" name="id" value="<%= student.getId()%>">

                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title"
                                                                        id="edit-<%= student.getId()%>r">Retirer un
                                                                        etudiant</h5>
                                                                    <button type="button" class="close"
                                                                            data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <h4>Etes vous sure de vouloire supprimer cet
                                                                        etudiant ?</h4>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-success"
                                                                                data-dismiss="modal">Annuler
                                                                        </button>
                                                                        <button type="submit" class="btn btn-warning"><i
                                                                                class="fa fa-dot-circle-o"></i>
                                                                            Supprimer
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>

                                                </div>

                                                <button type="button" class="btn btn-primary" data-toggle="modal"
                                                        data-target="#edit-<%= student.getId()%>"><i
                                                        class="fa fa-edit"></i>
                                                </button>

                                                <!-- Edit Modal -->
                                                <div class="modal fade " id="edit-<%= student.getId()%>"
                                                     data-backdrop="static" tabindex="-1" role="dialog"
                                                     aria-labelledby="edit-<%= student.getId()%>r" aria-hidden="true">
                                                    <form method="post">
                                                        <input type="hidden" name="action" value="edit">
                                                        <input type="hidden" name="id" value="<%= student.getId()%>">

                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title"
                                                                        id="edit-<%= student.getId()%>r">Modifier un
                                                                        etudiant</h5>
                                                                    <button type="button" class="close"
                                                                            data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div class="form-row">
                                                                        <div class="form-group col-md-6">
                                                                            <label>Nom : </label><input type="text"
                                                                                                        name="nom"
                                                                                                        value="<%= student.getNom()%>"
                                                                                                        class="form-control"
                                                                                                        required>
                                                                        </div>
                                                                        <div class="form-group col-md-6">
                                                                            <label>Prenom : </label>
                                                                            <input type="text" name="prenom"
                                                                                   class="form-control"
                                                                                   value="<%= student.getPrenom()%>"
                                                                                   required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>Date de naissence : </label>
                                                                        <input type="date" name="date_naiss"
                                                                               class="form-control"
                                                                               value="<%= student.getDateNaiss()%>"
                                                                               required>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label>Sexe : </label>
                                                                        <select name="sexe"
                                                                                class="form-control form-control-lg"
                                                                                required>
                                                                            <option selected disabled value="">
                                                                                --Selectionner--
                                                                            </option>
                                                                            <option value="HOMME">Homme</option>
                                                                            <option value="FEMME">Femme</option>
                                                                        </select>
                                                                    </div>

                                                                    <div class="form-row">
                                                                        <div class="form-group col-md-12">
                                                                            <label>Numero Bac</label>
                                                                            <input type="text" name="num_bac"
                                                                                   class="form-control"
                                                                                   value="<%= student.getNumBac()%>"
                                                                                   required>
                                                                        </div>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-danger"
                                                                                data-dismiss="modal">Annuler
                                                                        </button>
                                                                        <button type="submit" class="btn btn-success"><i
                                                                                class="fa fa-dot-circle-o"></i> Modifier
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>

                                                </div>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="bg-white sticky-footer">
            <div class="container my-auto">
                <div class="text-center my-auto copyright"><span>Copyright © TP SOAC 2019</span></div>
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