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
    <title>Informations trajet réservé</title>
</head>

<body>
<header>
    <jsp:include page="menu.jsp"/>

    <!-- Full Page Intro -->
    <div class="view" style="background-image: url('resources/img/reservation.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
        <div class="mask rgba-gradient d-flex justify-content-center align-items-center">
            <div class="container">
                <div class="row mt-5 justify-content-center">
                    <div class="col-md-12 mb-4 white-text text-center">
                        <form class="card" data-wow-delay="0.3s" style="visibility: visible; animation-name: fadeInDown; animation-delay: 0.3s; background-color:rgba(0, 0, 0, 0.5);"
                              name='updateProfil' method="post" action="updateReservedTravel">
                            <div class="card-body">
                                <!--Header-->
                                <div class="text-center">
                                    <h3 class="white-text text-uppercase font-weight-bold"><strong>Informations du trajet</strong></h3>
                                    <hr class="hr-light">
                                </div>
                                <!--Body-->
                                <div class="md-form">
                                    <h4 class="text-uppercase mb-4 white-text"> Trajet : ${travel.fromAdress} - ${travel.toAdress}</h4>
                                    <h4 class="text-uppercase mb-4 white-text"> Prix : ${travel.cost}</h4>
                                    <h4 class="text-uppercase mb-4 white-text"> Date : ${travel.date}</h4>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input border-white" type="checkbox" name="smoke" id="smoke" disabled="disabled" ${(travel.smoke == 0)? "" : "checked"}>
                                    <label class="text-uppercase mb-4 white-text form-check-label" for="smoke">Fumeur accepté</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input border-white" type="checkbox" name="luggage" id="luggage" disabled="disabled" ${(travel.luggage == 0)? "" : "checked"}>
                                    <label class="text-uppercase mb-4 white-text form-check-label" for="luggage">Bagage accepté</label>
                                </div>
                                <div class="md-form">
                                    <h4 class="text-uppercase mb-4 white-text"> Conducteur : ${user.firstname}</h4>
                                    <h4 class="text-uppercase mb-4 white-text"> Note :  <input type="number" min="0" max="5.00" step="0.01" name="note" id="note" disabled="disabled"/></h4>
                                </div>
                                <div class="text-center mt-4">
                                    <input class="btn btn-info" type="button" id="modifyNoteBtn" value="Modifier la note" />
                                    <button class="btn btn-info" type="submit" style="display: none;" id="validateNoteBtn" name="validateNoteBtn" value="${user.id}">Valider la note</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<jsp:include page="footer.jsp"/>
<script type="text/javascript">
    $("#modifyNoteBtn").click(function() {
        $("#note").attr('disabled', !$("#note").attr('disabled'));
        $("#validateNoteBtn").show();
    });
</script>
</body>
</html>