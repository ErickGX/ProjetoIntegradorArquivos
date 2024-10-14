<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%   // Recebe os valores dos campos do formulário
            request.setCharacterEncoding("UTF-8");

            try {

                String user, password;

                user = request.getParameter("user");
                password = request.getParameter("password");

                Connection conexao;
                PreparedStatement PS;
                Class.forName("com.mysql.cj.jdbc.Driver");

                conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "root");

                //Faz o select no banco de dados
                PS = conexao.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
                PS.setString(1, user);
                PS.setString(2, password);
                ResultSet resultado = PS.executeQuery();

                if (resultado.next()) {
                    response.sendRedirect("restrito.jsp?username=" + resultado.getString("username"));
                } else {
                    response.sendRedirect("errorlogin.html");
                }

            } catch (Exception e) {
                out.print("Falha na consulta no banco de dados" + e.getMessage());
            }

        %>

    </body>
</html>
