<%@page import="soac.miniprojet.model.dao.daos.InscriptionPeriodDAO"%>
<%@page import="soac.miniprojet.model.dao.daos.InscriptionPeriodDAO"%>
<%@page import="soac.miniprojet.utils.ScholarYearHelper"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<% String role = (String) request.getAttribute("role");%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Biblio - Dashboard</title>
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
                    <h3 class="text-dark mb-0">Tableau de bord</h3>
                </div>
                <div class="row">
                    <%--           <div class="col-lg-7 col-xl-6">
                                   <div class="card shadow mb-4">
                                       <div class="card-header d-sm-flex justify-content-between align-items-center">
                                           <h6 class="text-primary font-weight-bold m-0">Année scolaire</h6>
                                           <div class="btn-group">
                                               <button type="button" class="btn btn-primary">Action</button>
                                               <button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split"
                                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                   <span class="sr-only">Toggle Dropdown</span>
                                               </button>
                                               <div class="dropdown-menu">
                                                   <a class="dropdown-item" data-toggle="modal" data-target="#add_year">Demarrer
                                                       une nouvelle periode</a>
                                                   <div class="dropdown-divider"></div>
                                                   <a class="dropdown-item" data-toggle="modal" data-target="#edit_year">Modifier
                                                       la periode en cours</a>
                                                   <div class="dropdown-divider"></div>
                                                   <a class="dropdown-item" data-toggle="modal" data-target="#delete_year">Fermer
                                                       la periode en cours</a>
                                               </div>
                                           </div>
                                       </div>
                                       <div class="card-body">
                                           <div class="row">
                                               <div class="col-6">
                                                   <label class="col-form-label">Debut de l'année scolaire</label>
                                                   <input class="form-control" type="date"
                                                          value="<%= request.getAttribute("start_year")%>" readonly disabled>
                                               </div>
                                               <div class="col-6">
                                                   <label>FIn de l'année scolaire</label>
                                                   <input class="form-control" type="date"
                                                          value="<%= request.getAttribute("end_year")%>" readonly disabled>
                                               </div>
                                           </div>
                                       </div>
                                   </div>
                               </div>--%>
                    <div class="col-12">
                        <div class="card shadow mb-4">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h6 class="text-primary font-weight-bold m-0">Periode d'inscriptions</h6>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-primary">Action</button>
                                    <button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="sr-only">Toggle Dropdown</span>
                                    </button>
                                    <div class="dropdown-menu">
                                    
                                    
                                        <a class="dropdown-item" data-toggle="modal" data-target="#add_periode">Demarrer
                                            une nouvelle periode</a>
                                        <div class="dropdown-divider"></div>
                                        <% if(ScholarYearHelper.isInscPeriodOpen()){ %>
                                        <a class="dropdown-item" data-toggle="modal" data-target="#edit-periode">Modifier
                                            la periode en cours</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" data-toggle="modal" data-target="#delete_periode">Fermer
                                            la periode en cours</a>
                                            <%} %>

                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-6">
                                        <label class="col-form-label">Debut: </label>
                                        <input class="form-control" type="date"
                                               value="<%= request.getAttribute("start_period")==null ?"": request.getAttribute("start_period") %>" readonly/>
                                    </div>
                                    <div class="col-6">
                                        <label>Fin :</label>
                                        <input class="form-control" type="date"
                                               value="<%= request.getAttribute("end_period")==null ?"":request.getAttribute("end_period")%>" readonly/>
                                    </div>
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
    <a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
</div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
<script src="assets/js/theme.js"></script>

<!-- Add periode Modal -->
<div class="modal fade" id="add_periode" data-backdrop="static" tabindex="-1" role="dialog"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Ouvrire une nouvelle periode</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post">
                    <input type="hidden" name="action" value="add_periode">
                    <div class="form-group">
                        <label>Date de debut :</label>
                        <input type="date" min="<%= request.getAttribute("end_period") ==null ?"": request.getAttribute("end_period") %>" class="form-control date-picker" name="start" placeholder="Date début"
                               required>
                    </div>
                    <div class="form-group">
                        <label>Date de fin</label>
                        <input type="date" class="form-control" name="end" placeholder="Date fin" required>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Fermer</button>
                        <button type="submit" value="add_periode" class="btn btn-success">créer</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

<!-- Edit periode Modal -->
<div class="modal fade" id="edit-periode" data-backdrop="static" tabindex="-1" role="dialog"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Modifier la periode en cours</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post">
                    <input type="hidden" name="action" value="edit_periode">
                    <input type="hidden" name="id" value="<%= request.getAttribute("period_id")==null ?"": request.getAttribute("period_id")%>">
                    <div class="form-group">
                        <label>Date de debut :</label>
                        <input type="date" class="form-control" value="<%= request.getAttribute("start_period") ==null ?"": request.getAttribute("start_period")%>"
                               name="start" placeholder="Nouvelle date"
                               required>
                    </div>
                    <div class="form-group">
                        <label>Date de fin</label>
                        <input type="date" class="form-control" value="<%= request.getAttribute("end_period") ==null ?"": request.getAttribute("end_period") %>"
                               name="end" placeholder="Nouvelle date"
                               required>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Fermer</button>
                        <button type="submit" value="edit_periode" class="btn btn-success">Modifier</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

<!-- Delete periode Modal -->
<div class="modal fade" id="delete_periode" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Fermer la periode en cours </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Etes vous sure de fermer l'année en cours ?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Non</button>
                <form method="post">
                    <input type="hidden" name="action" value="end_periode">
                    <input type="hidden" name="id" value="<%= request.getAttribute("period_id")%>">

                    <button type="submit" class="btn btn-primary">Oui</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Add year Modal -->
<div class="modal fade" id="add_year" data-backdrop="static" tabindex="-1" role="dialog"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Ouvrire une nouvelle année</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post">
                    <input type="hidden" name="action" value="add_year">
                    <div class="form-group">
                        <label>Date de debut :</label>
                        <input type="date" class="form-control date-picker" name="start" placeholder="Date début"
                               required>
                    </div>
                    <div class="form-group">
                        <label>Date de fin</label>
                        <input type="date" class="form-control" name="end" placeholder="Date fin" required>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Fermer</button>
                        <button type="submit" class="btn btn-success">créer</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

<!-- Edit year Modal -->
<div class="modal fade" id="edit_year" data-backdrop="static" tabindex="-1" role="dialog"
     aria-labelledby="staticBackdropLabel1" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel1">Modifier l'année en cours</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post">
                    <input type="hidden" name="action" value="edit_year">
                    <div class="form-group">
                        <label>Date de debut :</label>
                        <input type="date" class="form-control" name="start" placeholder="Nouvelle date" value=""
                               required>
                    </div>
                    <div class="form-group">
                        <label>Date de fin</label>
                        <input type="date" class="form-control" name="end" placeholder="Nouvelle date" value=""
                               required>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Fermer</button>
                        <button type="submit" class="btn btn-success">Modifier</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

<!-- Delete year Modal -->
<div class="modal fade" id="delete_year" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel2">Fermer l'année en cours </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Etes vous sure de fermer l'année en cours ?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Non</button>
                <form method="post">
                    <input type="hidden" name="action" value="delete_periode">
                    <button type="submit" class="btn btn-primary">Oui</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>

</html>