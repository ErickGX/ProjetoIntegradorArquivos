<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%   // Recebe os valores dos campos do formulário
            try {

                String user, password;

                user = request.getParameter("user");
                password = request.getParameter("password");

                Connection conexao;
                PreparedStatement PS;
                Class.forName("com.mysql.cj.jdbc.Driver");

                conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "");

                //Faz o select no banco de dados
                PS = conexao.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
                PS.setString(1, user);
                PS.setString(2, password);
                PS.executeQuery();
                out.print("Concluido usuario encontrado");

            } catch (Exception e) {
                out.print("Falha na consulta no banco de dados" + e.getMessage());
            }

        %>

    </body>
</html>
