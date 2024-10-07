<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Titulo do site</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/navbar.css" />


</head>


<body>
    <header>

         
        <div class="saudacao">

            <p>
                <%= "Olá, seja bem vindo : " + request.getParameter("username")  %>
            </p>
          
        </div>



    </header>

    <nav>
        <div class="nav-links">
            <ul class="nav-links">
                <li><a href="cadpro.html" target="centro">Cadastro</a></li>
                <li><a href="listarpro.jsp" target="centro" >Listagem</a></li>
                <li><a href="#gallery" target="centro">Excluir </a></li>
                <li><a href="alterar.html" target="centro">Alterar </a></li>
                <li><a href="carregarpro.html" target="centro">Consultar</a></li>
            </ul>
        </div>

    </nav>
    <main>

        

        <iframe src="cadpro.html" id="iframeRest" frameborder="0s" name="centro" default="nome"></iframe>





    </main>

    <footer>

        <div class="footer" style="margin-top: auto;">
            <p>Footer</p>
        </div>

    </footer>

</body>

</html>