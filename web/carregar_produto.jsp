<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/navbar.css" />
        <title>Carregar produto por ID para Alteração</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            //dados recebidos do formulario
            int codigo;

            codigo = Integer.parseInt(request.getParameter("codigo"));

            // Criar conexÃ£o do banco de dados
            ResultSet rs = null;
            Connection conexao;
            PreparedStatement PS;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "root");

            PS = conexao.prepareStatement("SElECT * FROM produtos WHERE id=?");
            PS.setInt(1, codigo);

            rs = PS.executeQuery();
            
            if (rs.next()) {
        %>    
        <form method="post" action="alterarProd.jsp">
            <p>  
                <label for="id">Codigo</label>
                <input id="id" type="text" name="codigo" size="10" maxleght="40" value="<%=rs.getString("id")%>" readonly>
            </p>

            <p>  
                <label for="nome">Nome</label>
                <input id="nome" type="text" name="nome" size="40" value="<%=rs.getString("nome")%>" required>
            </p>

            <p>  
                <label for="marca">Marca</label>
                <input id="marca" type="text" name="marca" size="40"  value="<%=rs.getString("marca")%>" required>
            </p>
            <p>  
                <label for="preco">Preco</label>
                <input id="preco" type="text" name="preco" min="0" step="0.010"  value="<%=rs.getDouble("preco")%>" required>
            </p>

            <p>  
                <label for="data_fab">Data de Validade</label>
                <input id="datafab" type="date" name="data_fab"  value="<%= rs.getDate("data_fab")%>" required>
            </p>

            <p>  
                <input type="submit" value="salvar">
            </p>
        </form>

        <%
            } else {
                out.print("Produto não localizado, visualize a tabela de listagem");
            }
        %>
    </body>
</html>
