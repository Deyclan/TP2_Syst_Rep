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
    <title>Résultats de la recherche</title>
</head>

<header>
    <jsp:include page="menu.jsp"/>
    <div class="view" style="background-image: url('resources/img/bg.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
        <div class="mask rgba-gradient d-flex justify-content-center align-items-center">
            <div class="container">
                <div class="row mt-5 justify-content-center">
                    <div class="col-md-12 my-3">
                        <div style="height:700px">
                            <!--Table-->
                            <table border="0" class="table table-hover text-center card" style="background-color:rgba(0, 0, 0, 0.5); max-height: 100% ; overflow-y: auto ; overflow-x: hidden">
                                <thead class="thead-light">
                                <tr class="row justify-content-center">
                                    <th class="col" scope="col">Trajet</th>
                                    <th class="col" scope="col">Date</th>
                                    <th class="col" scope="col">Prix</th>
                                    <th class="col" scope="col">Proposé par</th>
                                    <th class="col" scope="col">Préférences</th>
                                    <th class="col" scope="col">Réserver</th>
                                </tr>
                                </thead>
                                <tbody class="white-text">
                                <c:forEach items="${mesTrajets}" var="trajet">
                                    <tr class="row justify-content-center">
                                        <td class="col" scope="row">De ${trajet.fromAdress} à ${trajet.toAdress}</td>
                                        <td class="col">${trajet.date}</td>
                                        <td class="col">${trajet.cost}</td>
                                        <td class="col">${trajet.offerer.getFirstname()}</td>
                                        <td class="col">Autorisation de fumer : ${trajet.smoke} <br> Nombre de bagages autorisé : ${trajet.luggage}</td>
                                        <td class="col">
                                            <form method="post">
                                                <button type="submit" name="reserv" value="${trajet.id}" formaction="ajouterReservation"
                                                        class="btn aqua-gradient btn-sm ${(trajet.state==2)? "disabled":"active"}">Réserver</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<jsp:include page="footer.jsp"/>
</body>
</html>