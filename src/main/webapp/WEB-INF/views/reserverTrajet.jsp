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
    <title>Ajouter réservation</title>
</head>

<body>
<header>
    <jsp:include page="menu.jsp"/>

    <!-- Full Page Intro -->
    <div class="view jarallax" data-jarallax='{"speed": 0.2}' style="background-image: url('resources/img/reservation.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
        <div class="mask rgba-black-light d-flex justify-content-center align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 mb-4 white-text text-center">
                        <h3 class="h2-reponsive white-text text-uppercase font-weight-bold mb-0 pt-md-5 pt-5"><strong>Informations du trajet</strong></h3>
                        <hr class="hr-light my-4 wow fadeInDown" data-wow-delay="0.4s">
                        <h4 class="text-uppercase mb-4 white-text"> Conducteur : ${user.firstname}</h4>
                        <h4 class="text-uppercase mb-4 white-text"> Contact : ${user.email} ${user.phone}</h4>
                        <h4 class="text-uppercase mb-4 white-text"> Trajet : ${travel.fromAdress} - ${travel.toAdress}</h4>
                        <h4 class="text-uppercase mb-4 white-text"> Prix : ${travel.cost}</h4>
                        <h4 class="text-uppercase mb-4 white-text"> Date : ${travel.date}</h4>
                        <h4 class="text-uppercase mb-4 white-text"> Autorisation de fumer : ${(travel.smoke == 0)? "Non" : "Oui"} <br> Bagage
                        autorisé : ${(travel.luggage == 0)? "Non" : "Oui"}</h4>
                        <h4 class="text-uppercase mb-4 white-text"> Nombre de places restantes : ${seats}</h4>
                        <form method="post">
                        <label for="seatsReserved" class="active white-text"> Nombre de places que vous souhaitez réserver </label>
                        <input class="text-info" type="number" max="${seats}" min="0" id="seatsReserved" name="seatsReserved">
                        <button class="btn btn-info" formaction="insererReservation" type="submit" name="payBtn" value="${travel.id}" id="payBtn"> Payer </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<jsp:include page="footer.jsp"/>
</body>
</html>