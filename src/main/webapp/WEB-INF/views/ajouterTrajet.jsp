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
    <script type="text/javascript">
        window.onload=function () {
            var todaysDate = new Date(); // Gets today's date

            // Max date attribute is in "YYYY-MM-DD".  Need to format today's date accordingly

            var year = todaysDate.getFullYear(); 						// YYYY
            var month = ("0" + (todaysDate.getMonth() + 1)).slice(-2);	// MM
            var day = ("0" + todaysDate.getDate()).slice(-2);			// DD

            var minDate = (year +"-"+ month +"-"+ day); // Results in "YYYY-MM-DD" for today's date

            // Now to set the max date value for the calendar to be today's date
            document.getElementById("dateTravel").setAttribute("min", minDate);
        }
    </script>
    <title>Ajouter un trajet</title>
</head>

<body>
<header>
    <jsp:include page="menu.jsp"/>

    <div class="view" style="background-image: url('resources/img/bg.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
        <div class="mask rgba-gradient d-flex justify-content-center align-items-center">
            <div class="container">
                <div class="row mt-5 justify-content-center">
                    <div class="col-md-6 col-xl-5 mb-4">
                        <!--Form-->
                        <form class="card wow fadeInUp" data-wow-delay="0.3s" style="visibility: visible; background-color:rgba(0, 0, 0, 0.5);"
                              name='identification' method="post" action="insererTrajet">
                            <div class="card-body">
                                <!--Header-->
                                <div class="text-center">
                                    <h3 class="white-text"> Ajouter un Trajet</h3>
                                    <hr class="hr-light">
                                </div>
                                <!--Body-->
                                <div class="form-row justify-content-around">
                                    <div class="col">
                                        <div class="md-form">
                                            <label for="priceTravel" class="active white-text"> Prix par personne </label>
                                            <INPUT type="number" step="0.01" min="5.00" max="5.00" class="form-control text-info" name="priceTravel" value="5.00" id="priceTravel">
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="md-form">
                                            <label for="seatTravel" class="active white-text"> Nombre de sièges </label>
                                            <INPUT type="number" step="1" class="form-control text-info" name="seatTravel" value="" id="seatTravel" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="md-form">
                                    <label for="dateTravel" class="active white-text"> Date </label>
                                    <INPUT type="date" class="form-control text-info" min="" name="dateTravel" placeholder="MM/DD/YYY" id="dateTravel" required>
                                </div>
                                <div class="md-form">
                                    <label for="fromAdressTravel" class="active white-text"> De </label>
                                    <INPUT type="text" class="form-control text-info" name="fromAdressTravel" id="fromAdressTravel" required>
                                </div>
                                <div class="md-form">
                                    <label for="toAdressTravel" class="active white-text"> A </label>
                                    <INPUT type="text" class="form-control text-info" name="toAdressTravel" id="toAdressTravel" required>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input border-white" type="checkbox" name="smoke" id="smoke">
                                    <label class="form-check-label white-text" for="smoke">Fumeur accepté</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input border-white" type="checkbox" name="luggage" id="luggage">
                                    <label class="form-check-label white-text" for="luggage">Bagage accepté</label>
                                </div>


                                <div class="text-center mt-4">
                                    <button type="submit" name="bt" class="btn btn-info">Ajouter</button>
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

</body>
</html>
