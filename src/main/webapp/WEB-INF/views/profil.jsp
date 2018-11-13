<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>



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
    <title>TravelExpress : Site de covoiturage</title>
</head>

<body>
<header>
    <jsp:include page="menu.jsp"/>

    <!-- Full Page Intro -->
    <div class="view jarallax" data-jarallax='{"speed": 0.2}' style="background-image: url('resources/img/bg.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
        <div class="mask rgba-black-light d-flex justify-content-center align-items-center">
            <div class="container">
                <div class="row mt-5 justify-content-center">
                    <form class="card" style="visibility: visible; background-color:rgba(0, 0, 0, 0.5);"
                          name='updateProfil' method="post" action="updateProfil">
                        <div class="col-md-12 mb-3 white-text text-center">
                            <h3 class="h2-reponsive white-text text-uppercase font-weight-bold mb-0 pt-md-5 pt-5"><strong>Informations personnelles</strong></h3>
                            <hr class="hr-light my-4">
                            <h4 class="text-uppercase mb-4 white-text"> Nom : ${user.firstname}  ${user.name}</h4>
                            <h4 class="text-uppercase mb-4 white-text"> Email : <input name="email" id="email" disabled="disabled" value="${user.email}" required/></h4>
                            <h4 class="text-uppercase mb-4 white-text"> Téléphone : <input name="phone" id="phone" disabled="disabled" value="${user.phone}"/></h4>
                            <h4 class="text-uppercase mb-4 white-text"> Synthèse des avis reçus :
                                <c:choose><c:when test="${user.rating == null || user.rating == ''}">Aucune note</c:when>
                                <c:otherwise>${user.rating}</c:otherwise></c:choose></h4>
                            <input class="btn btn-info" type="button" id="modifyBtn" value="Modifier les informations personnelles" />
                            <button class="btn btn-info" type="submit" style="display: none;" id="validateBtn">Valider les modifications</button>
                        </div>
                    </form>
                </div>
                <div class="row justify-content-between">
                    <div class="col-md-6 mb-3 white-text text-center">
                        <h3 class="h2-reponsive white-text text-uppercase font-weight-bold mb-0 pt-md-5 pt-5 wow fadeInDown text-center" data-wow-delay="0.3s"><strong>Trajets proposés</strong></h3>
                        <hr class="hr-light my-4 wow fadeInDown" data-wow-delay="0.4s">
                        <c:choose>
                            <c:when test="${fn:length(travelsProposed) >0}">
                            <c:forEach items="${travelsProposed}" var="travel">
                            <form method="post">
                                <h4 class="text-uppercase mb-4 white-text wow fadeInDown" data-wow-delay="0.4s"><strong> ${travel.date} ${travel.fromAdress} ${travel.toAdress} ${travel.cost}</strong>
                                        <button class="btn btn-info btn-xs" type="submit" name="infoProposedBtn" id="infoProposedBtn" formaction="infoTrajetPropose" value="${travel.id}">Infos</button>
                                </h4>
                            </form>
                            </c:forEach>
                            </c:when>
                            <c:otherwise>
                            <h4 class="text-uppercase mb-4 white-text wow fadeInDown" data-wow-delay="0.4s"><strong> Aucun trajet proposé</strong></h4>
                            </c:otherwise>
                        </c:choose>
                    </div>
                        <div class="col-md-6 mb-3 white-text text-center">
                            <h3 class="h2-reponsive text-center white-text text-uppercase font-weight-bold mb-0 pt-md-5 pt-5 wow fadeInDown" data-wow-delay="0.3s"><strong>Trajets réservés</strong></h3>
                            <hr class="hr-light my-4 wow fadeInDown" data-wow-delay="0.4s">
                            <c:choose>
                            <c:when test="${fn:length(travelsReserved) >0}">
                            <c:forEach items="${travelsReserved}" var="travel">
                            <form method="post">
                            <h4 class="text-uppercase mb-4 white-text wow fadeInDown" data-wow-delay="0.4s"><strong> ${travel.date} ${travel.fromAdress} ${travel.toAdress} ${travel.cost}</strong>
                                    <button class="btn btn-info btn-xs" type="submit" name="infoReservedBtn" id="infoReservedBtn" formaction="infoTrajetReserve" value="${travel.id}">Infos</button>
                                </h4>
                            </form>
                            </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <h4 class="text-uppercase mb-4 white-text wow fadeInDown" data-wow-delay="0.4s"><strong> Aucun trajet réservé</strong></h4>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<jsp:include page="footer.jsp"/>
<script type="text/javascript">
    $("#modifyBtn").click(function() {
        $("#email").attr('disabled', !$("#email").attr('disabled'));
        $("#phone").attr('disabled', !$("#phone").attr('disabled'));
        $("#validateBtn").show();
    });
</script>
</body>
</html>