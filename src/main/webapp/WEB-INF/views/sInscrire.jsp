<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/mdb.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css">
    <link rel="stylesheet" href="resources/css/myCSS.css">
    <title>Connexion</title>
</head>
<body>

<header>
    <jsp:include page="menu.jsp"/>
    <div class="view" style="background-image: url('resources/img/signup.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
        <div class="mask rgba-gradient d-flex justify-content-center align-items-center">
            <div class="container">
                <div class="row mt-5 justify-content-center">
                    <div class="col-md-6 col-xl-5 mb-4">
                        <!--Form-->
                        <form class="card wow fadeInDown" data-wow-delay="0.3s" style="visibility: visible; animation-name: fadeInDown; animation-delay: 0.3s; background-color:rgba(0, 0, 0, 0.5);"
                              name='connexion' method="post" action="inscription">
                            <div class="card-body">
                                <!--Header-->
                                <div class="text-center">
                                    <h3 class="white-text"> Inscription </h3>
                                    <hr class="hr-light">
                                </div>
                                <!--Body-->
                                <div class="md-form row justify-content-around">
                                    <div class="md-form">
                                        <label for="lastname" class="active white-text"> Nom </label>
                                        <INPUT type="text" class="form-control blue-text" name="lastname" value="" id="lastname" required>
                                    </div>
                                    <div class="md-form">
                                        <label for="firstname" class="active white-text"> Prénom </label>
                                        <INPUT type="text" class="form-control blue-text" name="firstname" value="" id="firstname" required>
                                    </div>
                                </div>

                                <div class="md-form row justify-content-around">
                                    <div class="md-form">
                                        <div class="input-group">
                                            <label for="phone" class="active white-text"> Téléphone </label>
                                            <INPUT type="tel" class="form-control blue-text" name="phone" value="" id="phone">
                                        </div>
                                    </div>
                                    <div class="md-form">
                                        <div class="input-group">
                                            <label for="email" class="active white-text"> Email </label>
                                            <INPUT type="email" class="form-control blue-text" name="email" value="" id="email" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="md-form">
                                    <label for="user" class="active white-text"> Identifiant </label>
                                    <INPUT type="text" class="form-control blue-text" name="username" value="" id="user" required>
                                </div>
                                <div class="md-form">
                                    <label for="pwd" class="active white-text"> Mot de passe </label>
                                    <INPUT type="password" class="form-control blue-text" name="password" id="pwd" required>
                                </div>
                                <div class="text-center mt-4">
                                    <button type="submit" name="bt" class="btn btn-info text-center">S'inscrire</button>
                                    <button type="reset" name="bt" class="btn btn-info text-center">RAZ</button>
                                    <hr class="hr-light mb-3 mt-4">
                                </div>
                                <div class="md-form">
                                    <span class="white-text"> Déjà membre? <a class="text-info" href="seConnecter"> Connectez-vous !</a> </span>
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
