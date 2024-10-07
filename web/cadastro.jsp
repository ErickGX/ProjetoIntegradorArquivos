<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/navbar.css" />
        <title>JSP Page</title>
    </head>
    <body>
        <%   // Recebe os valores dos campos do formul�rio
            try {

                String user, password;

                user = request.getParameter("user");
                password = request.getParameter("password");

                Connection conexao;
                PreparedStatement PS;
                Class.forName("com.mysql.cj.jdbc.Driver");

                conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "");

                //Faz o select no banco de dados
                PS = conexao.prepareStatement("INSERT INTO users VALUES(?,?)");
                PS.setString(1, user);
                PS.setString(2, password);
               
                PS.executeUpdate();
    
                
             
               response.sendRedirect("loginsucess.html");
               
                
                

            } catch (Exception e) {
                out.print("Falha na inser��o do usuario no banco de dados" + e.getMessage());
            }

        %>
        
    </body>
</html>
