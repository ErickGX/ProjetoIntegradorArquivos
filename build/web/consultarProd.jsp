<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/navbar.css" />
        <title>Carregar produtos</title>
    </head>
    <body>

        <table>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Marca</th>
                <th>Preços</th>
                <th>Data de Validade</th>
            </tr>
        <%
            
            request.setCharacterEncoding("UTF-8");

            //dados recebidos do formulario
            int codigo;
            
            try {               
                        
            
                codigo = Integer.parseInt(request.getParameter("codigo"));

                // Criar conexão do banco de dados
                ResultSet rs = null;
                Connection conexao;
                PreparedStatement PS;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "root");
                
               
                PS = conexao.prepareStatement("SElECT * FROM produtos WHERE id=?");
                PS.setInt(1, codigo);
                
                rs = PS.executeQuery();
                
                // Iterar sobre os resultados e construir a tabela
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String nome = rs.getString("nome");
                    String marca = rs.getString("marca");
                    double preco = rs.getDouble("preco");
                    java.sql.Date datafab = rs.getDate("data_fab");
                    %>
                    <tr>
                        <td><%= id %></td>
                        <td><%= nome %></td>
                        <td><%= marca %></td>
                        <td><%= preco %></td>
                        <td><%= datafab %></td>
                    </tr>
                    <%
                }
            } catch (Exception x) {
                out.print("Falha na inserção de dados : " + x.getMessage());
                x.printStackTrace();
            }
            %>
        </table>
    </body>
</html>
