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
    <title>Rechercher un trajet</title>
</head>


<body>
<header>
    <jsp:include page="menu.jsp"/>
    <div class="view" style="background-image: url('resources/img/search.jpeg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
        <div class="mask rgba-gradient d-flex justify-content-center align-items-center">
            <div class="container">
                <div class="row mt-5 justify-content-center">
                    <div class="col-md-6 col-xl-5 mb-4">
                        <!--Form-->
                        <form class="card wow fadeInUp" data-wow-delay="0.3s" style="visibility: visible; background-color:rgba(0, 0, 0, 0.5);"
                              name='identification' method="post" action="listerTrajet">
                            <div class="card-body">
                                <!--Header-->
                                <div class="text-center">
                                    <h3 class="white-text"> Rechercher un trajet</h3>
                                    <hr class="hr-light">
                                </div>
                                <!--Body-->
                                <div class="md-form">
                                    <label for="fromAdressTravel" class="active white-text"> De </label>
                                    <INPUT type="text" class="form-control text-info" name="fromAdressTravel" value="" id="fromAdressTravel">
                                </div>
                                <div class="md-form">
                                    <label for="toAdressTravel" class="active white-text"> A </label>
                                    <INPUT type="text" class="form-control text-info" name="toAdressTravel" id="toAdressTravel">
                                </div>
                                <div class="md-form">
                                    <label for="dateTravel" class="active white-text"> Date </label>
                                    <INPUT type="date" class="form-control text-info" name="dateTravel" id="dateTravel">
                                </div>
                                <div class="text-center mt-4">
                                    <button type="submit" name="bt" class="btn btn-info">Rechercher</button>
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