<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css">
    <link rel="stylesheet" href="resources/css/mdb.min.css">
    <link rel="stylesheet" href="resources/css/myCSS.css">
    <link rel="stylesheet" href="resources/css/myCSS.css">
    <title>TravelExpress : Site de covoiturage</title>
</head>

<body>
<header>
    <jsp:include page="menu.jsp"/>

    <!-- Full Page Intro -->
    <div class="view jarallax" data-jarallax='{"speed": 0.2}' style="background-image: url('resources/img/bg.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
        <div class="mask rgba-black-light d-flex justify-content-center align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 mb-3 white-text text-center">
                        <h3 class="h2-reponsive white-text text-uppercase font-weight-bold mb-0 pt-md-5 pt-5 wow fadeInDown" data-wow-delay="0.3s"><strong>Informations personnelles</strong></h3>
                        <hr class="hr-light my-4 wow fadeInDown" data-wow-delay="0.4s">
                        <h4 class="text-uppercase mb-4 white-text wow fadeInDown" data-wow-delay="0.4s"><strong> Nom : ${user.firstname}  ${user.name}</strong></h4>
                        <h4 class="text-uppercase mb-4 white-text wow fadeInDown" data-wow-delay="0.4s"><strong> Email : ${user.email}</strong></h4>
                        <h4 class="text-uppercase mb-4 white-text wow fadeInDown" data-wow-delay="0.4s"><strong> Téléphone : ${user.phone} </strong></h4>
                        <h4 class="text-uppercase mb-4 white-text wow fadeInDown" data-wow-delay="0.4s"><strong> Synthèse des avis reçus : ${user.rating}</strong></h4>
                    </div>
                </div>
                <div class="row justify-content-between">
                    <div class="col-md-6 mb-3 white-text">
                        <h3 class="h2-reponsive white-text text-uppercase font-weight-bold mb-0 pt-md-5 pt-5 wow fadeInDown" data-wow-delay="0.3s"><strong>Trajets proposés</strong></h3>
                        <hr class="hr-light my-4 wow fadeInDown" data-wow-delay="0.4s">
                        <c:forEach items="${travelsProposed}" var="travel">
                            <h4 class="text-uppercase mb-4 white-text wow fadeInDown" data-wow-delay="0.4s"><strong> ${travel.date} ${travel.fromAdress} ${travel.toAdress} ${travel.cost}</strong></h4>
                        </c:forEach>
                    </div>
                    <div class="col-md-6 mb-3 white-text">
                        <h3 class="h2-reponsive white-text text-uppercase font-weight-bold mb-0 pt-md-5 pt-5 wow fadeInDown" data-wow-delay="0.3s"><strong>Trajets réservés</strong></h3>
                        <hr class="hr-light my-4 wow fadeInDown" data-wow-delay="0.4s">
                        <c:forEach items="${travelsReserved}" var="travel">
                            <h4 class="text-uppercase mb-4 white-text wow fadeInDown" data-wow-delay="0.4s"><strong> ${travel.date} ${travel.fromAdress} ${travel.toAdress} ${travel.cost}</strong></h4>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<jsp:include page="footer.jsp"/>
</body>
</html>