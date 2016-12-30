<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page import="java.sql.SQLException" %> 
<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="org.postgresql.Driver" %>
<%@ page import="java.sql.Statement" %> 
<%@ page import="java.sql.ResultSet" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	
</head>
<body>

	<%
		try{
			
			Class.forName("org.postgresql.Driver"); // Carrega o drive
			//out.println("Conseguiu carregar o Driver\n");
			Connection connection  = DriverManager.getConnection("jdbc:postgresql://ec2-54-235-221-102.compute-1.amazonaws.com:5432/db8p98qknerog8?user=guzpbrfiolpifm&password=2-OQcTQvmQ5eKjanhvV0Ruzzk2&sslmode=require");
			//out.println("Conseguiu carregar o banco do heroku\n");
			
			if(request.getParameter("usuario") != null){
				Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
				ResultSet.CONCUR_READ_ONLY);
				ResultSet resultSet = statement.executeQuery("SELECT * FROM login WHERE LOG_USUARIO = '"+request.getParameter("usuario")+"' AND LOG_SENHA = '"+request.getParameter("senha")+"'");
	 			/*
	 			resultSet.first();
				out.println(resultSet.getString("usr_user_name"));
				resultSet.next();
		    	out.println("<br/>");
				out.println(resultSet.getString("usr_user_name"));
				*/
				/*
				while(resultSet.next())
					out.println("Usuário: "+resultSet.getString("log_usuario")+"<br/>");
				*/
				if(resultSet.next()) //next(): boolean
					response.sendRedirect("index.jsp"); //HttpServletResponse
				else 
					out.println("não deu certo login!");
				
			}
		}
		catch(ClassNotFoundException e){
			out.println("A classe do Driver JDBC não foi localizado!");
			out.println("Erro: "+e);
		}
		catch(SQLException e){
			out.println("Erro: "+e);
		}
	
	%>
	
	<h2 style="text-align: center; margin-top: 2%;">Sistema ensinado pelo Neri</h2>
	
	<div class="imgcontainer"  style="text-align: center; margin-top:1%;">
	    	<img src="imagens/login.png" alt="Avatar" width="156" height="174">
	</div>
	
	<form action="" method="post" style="max-width: 600px; height: 400px; margin: 0 auto; margin-top: 1%;">
  		<div class="form-group">
    		<label for="usuario">Usuário</label>
    		<input type="text" class="form-control" name="usuario" id="usuario" placeholder="Usuário">
  		</div>
  		<div class="form-group">
   			<label for="senha">Senha</label>
    		<input type="password" class="form-control" name="senha" id="senha" placeholder="Password">
  		</div>
  
  		<button type="submit" class="btn btn-default">Entrar</button>
	</form>
	
</body>
</html>