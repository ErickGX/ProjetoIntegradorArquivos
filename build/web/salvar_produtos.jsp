<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>

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

            
            //dados recebidos do formulario
            int codigo;
            String nome, marca, fabricacao;
            double preco;
            
            
            try{
            codigo = Integer.parseInt(request.getParameter("codigo"));
            nome =  request.getParameter("nome");
            marca = request.getParameter("marca");
            preco = Double.parseDouble(request.getParameter("preco"));
            fabricacao   = request.getParameter("datafab");    
            
            

                //System.out.println("Codigo : "+ codigo + "  Nome : "+nome +" marca : " +marca + "preco :" +preco);

            //Criar conexao do banco de dados
            
            Connection conexao;
            PreparedStatement PS;
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "root");
            
            //Inserir dados no banco de dados
            PS = conexao.prepareStatement("INSERT INTO produtos VALUES(?,?,?,?,?)");
            PS.setInt(1, codigo);
            PS.setString(2, nome);
            PS.setString(3, marca);
            PS.setDouble(4, preco);
            PS.setString(5, fabricacao);
            PS.executeUpdate();
            out.print("Produto Inserido com Sucesso");
            
            } catch(Exception x){
            out.print("Falha na inserção de dados : " + x.getMessage());
            }


            %>
    </body>
</html>
