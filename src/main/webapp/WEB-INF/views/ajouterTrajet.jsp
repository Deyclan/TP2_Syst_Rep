<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

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
    <title>Ajouter un trajet</title>
</head>

<body>
<header>
    <jsp:include page="menu.jsp"/>

    <div class="view" style="background-image: url('resources/img/book.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
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
                                <div class="md-form">
                                    <label for="priceTravel" class="active white-text"> Prix du trajet </label>
                                    <INPUT type="number" class="form-control amber-text" name="priceTravel" value="" id="priceTravel">
                                </div>
                                <div class="md-form">
                                    <label for="dateTravel" class="active white-text"> Date du trajet </label>
                                    <INPUT type="text" class="form-control amber-text" name="dateTrajet" value="" id="dateTravel">
                                </div>
                                <div class="md-form">
                                    <label for="fromAdressTravel" class="active white-text"> De </label>
                                    <INPUT type="text" class="form-control amber-text" name="fromAdressTravel" id="fromAdressTravel">
                                </div>
                                <div class="md-form">
                                    <label for="toAdressTravel" class="active white-text"> A </label>
                                    <INPUT type="text" class="form-control amber-text" name="toAdressTravel" id="toAdressTravel">
                                </div>
                                <div class="md-form">
                                    <label for="seatTravel" class="active white-text"> Nombre de sièges </label>
                                    <INPUT type="number" class="form-control amber-text" name="seatTravel" value="" id="seatTravel">
                                </div>
                                <div class="text-center mt-4">
                                    <button type="submit" name="bt" class="btn btn-default">Ajouter</button>
                                    <hr class="hr-light mb-3 mt-4">
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