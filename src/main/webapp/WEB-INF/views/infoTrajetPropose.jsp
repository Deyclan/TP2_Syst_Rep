<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
    <title>Informations trajet proposé</title>
</head>

<body>
<header>
    <jsp:include page="menu.jsp"/>

    <!-- Full Page Intro -->
    <div class="view jarallax" data-jarallax='{"speed": 0.2}' style="background-image: url('resources/img/bg.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
        <div class="mask rgba-black-light d-flex justify-content-center align-items-center">
            <div class="container">
                <div class="row">
                    <form class="card" data-wow-delay="0.3s" style="visibility: visible; animation-name: fadeInDown; animation-delay: 0.3s; background-color:rgba(0, 0, 0, 0.5);"
                          name='updateProfil' method="post" action="updateProposedTravel">
                    <div class="col-md-12 mb-4 white-text text-center">
                        <h3 class="h2-reponsive white-text text-uppercase font-weight-bold mb-0 pt-md-5 pt-5"><strong>Informations du trajet</strong></h3>
                        <hr class="hr-light my-4 wow fadeInDown" data-wow-delay="0.4s">
                        <h4 class="text-uppercase mb-4 white-text"> Trajet : ${travel.fromAdress} - ${travel.toAdress}</h4>
                        <h4 class="text-uppercase mb-4 white-text"> Prix : ${travel.cost}</h4>
                        <h4 class="text-uppercase mb-4 white-text"> Date : ${travel.date}</h4>
                        <h4 class="text-uppercase mb-4 white-text"> Autorisation de fumer : <input type="checkbox" name="smoke" id="smoke" class="form-check-input border-white" disabled="disabled" ${(travel.smoke == 0)? "" : "checked"}> <br>
                            Bagage autorisé : <input type="checkbox" class="form-check-input border-white" name="luggage" id="luggage" disabled="disabled" ${(travel.luggage == 0)? "" : "checked"}></h4>
                        <h4 class="text-uppercase mb-4 white-text"> Personnes ayant réservé : ${user.firstname}</h4>
                        <h4 class="text-uppercase mb-4 white-text"> Nombre de places restantes : ${seats}</h4>
                        <input class="btn btn-info" type="button" id="modifyTravelBtn" value="Modifier les informations" />
                        <button class="btn btn-info" type="submit" style="display: none;" name="validateTravelBtn" id="validateTravelBtn" value="${travel.id}">Valider les modifications</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</header>
<jsp:include page="footer.jsp"/>
<script type="text/javascript">
    $("#modifyBtn").click(function() {
        $("#smoke").attr('disabled', !$("#smoke").attr('disabled'));
        $("#luggage").attr('disabled', !$("#luggage").attr('disabled'));
        $("#validateBtn").show();
    });
</script>
</body>
</html>