<%
    // Recebe os valores dos campos do formulário
    String user = request.getParameter("user");
    String senha = request.getParameter("senha");
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            //Exibe os valores recebidos
            if (user != null && senha != null) {
                out.println("Usuário: " + user + "<br>");
                out.println("Senha: " + senha + "<br>");
            } else {
                System.out.println("Dados Recebidos");
            }
        %>

    </body>
</html>
