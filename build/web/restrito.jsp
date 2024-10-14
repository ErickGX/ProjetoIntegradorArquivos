<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">

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
                <% request.setCharacterEncoding("UTF-8"); %>
                <%= "Olá, seja bem vindo : " + request.getParameter("username")  %>
            </p>
          
        </div>



    </header>

    <nav>
        <div class="nav-links">
            <ul class="nav-links">
                <li><a href="cadastroDeProd.html" target="centro">Cadastro</a></li>
                <li><a href="listarpro.jsp" target="centro" >Listagem</a></li>
                <li><a href="excluirProd.html" target="centro">Excluir</a></li>
                <li><a href="consultarProd.html" target="centro">Consultar</a></li>
                <li><a href="alterarProd.html" target="centro">Alterar</a></li>
                
            </ul>
        </div>

    </nav>
    <main>

        

        <iframe src="cadastroDeProd.html" id="iframeRest" frameborder="0s" name="centro" default="nome"></iframe>





    </main>

    <footer>

        <div class="footer" style="margin-top: auto;">
            <p>Footer</p>
        </div>

    </footer>

</body>

</html>