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
                                <div class="md-form">
                                    <label for="lastname" class="active white-text"> Nom </label>
                                    <INPUT type="text" class="form-control blue-text" name="lastname" value="" id="lastname">
                                </div>
                                <div class="md-form">
                                    <label for="firstname" class="active white-text"> Prénom </label>
                                    <INPUT type="text" class="form-control blue-text" name="firstname" value="" id="firstname">
                                </div>

                                <div class="md-form row row-space">
                                    <div class="col-2">
                                        <div class="input-group">
                                            <label for="birthday" class="active white-text"> Année d'anniversaire </label>
                                            <INPUT type="number" class="form-control blue-text" name="birthday" value="" id="birthday">
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <div class="input-group">
                                            <label for="gender" class="active white-text"> Sexe </label>
                                            <select class="form-control" name="gender" aria-hidden="true" id="gender">
                                                <option disabled="disabled" selected="selected">Gender</option>
                                                <option>Male</option>
                                                <option>Female</option>
                                                <option>Other</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="md-form">
                                    <label for="user" class="active white-text"> Identifiant </label>
                                    <INPUT type="text" class="form-control blue-text" name="username" value="" id="user">
                                </div>
                                <div class="md-form">
                                    <label for="pwd" class="active white-text"> Mot de passe </label>
                                    <INPUT type="password" class="form-control blue-text" name="password" id="pwd">
                                </div>
                                <div class="text-center mt-4">
                                    <button type="submit" name="bt" class="btn btn-default text-center">S'inscrire</button>
                                    <button type="reset" name="bt" class="btn btn-default text-center">RAZ</button>
                                    <hr class="hr-light mb-3 mt-4">
                                </div>
                                <div class="md-form">
                                    <label class="active white-text"> Déjà membre? <a class="nav-link white-text" href="seConnecter"> Connectez-vous !</a> </label>
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
