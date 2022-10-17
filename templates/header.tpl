<!DOCTYPE html>
<html lang="en">

<head>
    <base href="{BASE_URL}">

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="css/styles.css">
    <title>TID STORE</title>
</head>

<body>
    <header>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="">TID STORE</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <ul class="collapse navbar-collapse">
                        <li class="navbar-nav">
                            <a class="nav-item nav-link" aria-current="page" href=" ">Home</a>
                            {if !isset($smarty.session.USER_ID)}
                                <a class="nav-item nav-link" aria-current="page" href="products">Ver Productos</a>
                            {else}
                                <a class="nav-item nav-link" aria-current="page" href="products">Administrar productos</a>
                            {/if}
                            {if !isset($smarty.session.USER_ID)}
                                <a class="nav-item nav-link" aria-current="page" href="categories">Ver Categorias</a>
                            {else}
                                <a class="nav-item nav-link" aria-current="page" href="categories">Administar categorias
                                </a>

                            {/if}

                            {if !isset($smarty.session.USER_ID)}

                                <a class="btn btn-outline-success my-2 my-sm-0" aria-current="page" id="style"
                                    href="login">Login</a>

                            {else}

                                <a class="btn btn-danger" aria-current="page" href="logout">Logout
                                    ({$smarty.session.USER_EMAIL})</a>

                            {/if}
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
<main class="container">