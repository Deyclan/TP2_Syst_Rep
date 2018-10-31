<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg navbar-dark fixed-top scrolling-navbar">
    <div class="container">
        <span class="navbar-brand h1"> <a class="navbar-brand text-info" href="/">TravelExpress </a></span>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#myNavbar" aria-controls="myNavbar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="nav-item col-auto ml-md-auto">
                    <a class="nav-link" href="rechercherTrajet"><span class="glyphicon glyphicon-search"></span> Rechercher </a>
                </li>
                <li class="nav-item col-auto ml-md-auto">
                    <a class="nav-link" href="annoncerTrajet"><span class="glyphicon glyphicon-plus-sign"></span> Annoncer </a>
                </li>
            </ul>
            <% boolean $session = false;
                if(!$session) {%>
            <ul class="nav navbar-nav my-2 my-lg-0">
                <li class="nav-item col-auto ml-md-auto">
                    <a class="nav-link" href="sInscrire"><span class="glyphicon glyphicon-user"></span> Inscription </a>
                </li>
                <li class="nav-item col-auto ml-md-auto">
                    <a class="nav-link white-text" href="seConnecter"><span class="glyphicon glyphicon-log-in"></span> Connexion </a>
                </li>
            </ul>
            <% } if($session) { %>
            <ul class="nav navbar-nav my-2 my-lg-0">
                <li class="nav-item col-auto ml-md-auto">
                    <a class="nav-link" href="profil"><span class="glyphicon glyphicon-user"></span> Profil </a>
                </li>
                <li class="nav-item col-auto ml-md-auto">
                    <a class="nav-link white-text" href="seDeconnecter"><span class="glyphicon glyphicon-log-out"></span> Déconnexion </a>
                </li>
            </ul>
            <%}%>
        </div>
    </div>
</nav>
<script src="https://code.jquery.com/jquery-2.1.3.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
