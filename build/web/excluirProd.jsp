<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <body>
        <%
            request.setCharacterEncoding("UTF-8");

            //Codigo recebido do formulario para exclusao
            int codigo;
            
            try {               
                        
            
                codigo = Integer.parseInt(request.getParameter("codigo"));

                // Criar conexão do banco de dados
                Connection conexao;
                PreparedStatement PS;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "root");
                
               
                PS = conexao.prepareStatement("DELETE FROM produtos WHERE id=?");
                PS.setInt(1, codigo);
                
                PS.executeUpdate();
                
                out.print("Produto Excluido com Sucesso");
                
               
            } catch (Exception x) {
                out.print("Falha da exclusão ou codigo inexistente, Consultar O ADMIN : " + x.getMessage());
                x.printStackTrace();
            }
            %>
        </table>
    </body>
</html>
