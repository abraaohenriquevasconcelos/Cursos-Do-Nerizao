<%@ page import="java.sql.SQLException" %> 
<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="org.postgresql.Driver" %>
<%@ page import="java.sql.Statement" %> 
<%@ page import="java.sql.ResultSet" %>

<div id="page-content-wrapper">
    	<div class="container-fluid">
        	<div class="row">
            	<div class="col-lg-8">
            		<div style="text-align: center;">
                	<h2>Usuários Do Sistema</h2><hr>
                	<a href="#"><img src="imagens/cadastrar.png" alt="Cadastrar" width="80" height="80" title="Cadastrar novo Usuário"></a>
                	</div>
                	<div style="text-align: center; margin-top: 2%;">
                		Ordenação: 
                    	<a href="usuarios.jsp?ordenacao=crescente">Crescente</a>
                    	-
                    	<a href="usuarios.jsp?ordenacao=crescente">Decrescente</a>
                    </div>
                    <table class="table table-hover" style="margin-top: 2%;">
						<thead>
							<tr>
								<th>Código</th>
								<th>Usuário</th>
								<th>Nível de Acesso</th>
								<th>Editar</th>
								<th>Excluir</th>
							</tr>
						</thead>
						<tbody>
							<%
							try{	
								Class.forName("org.postgresql.Driver"); // Carrega o drive
								Connection connection  = DriverManager.getConnection("jdbc:postgresql://ec2-54-235-221-102.compute-1.amazonaws.com:5432/db8p98qknerog8?user=guzpbrfiolpifm&password=2-OQcTQvmQ5eKjanhvV0Ruzzk2&sslmode=require");
								Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
								ResultSet.CONCUR_READ_ONLY);
								
								if(request.getParameter("acao") != null){
									statement.executeUpdate("delete from login where log_codigo = "+request.getParameter("codigo"));
								}
								
								ResultSet resultSet = null;
								if(request.getParameter("ordenacao") == null)
									 resultSet = statement.executeQuery("SELECT * FROM LOGIN ORDER BY log_codigo");
								else if(request.getParameter("ordenacao").equals("crescente"))
									 resultSet = statement.executeQuery("SELECT * FROM LOGIN ORDER BY log_usuario");
								
								
								while(resultSet.next()){
							%>
							<tr>
								<td><%=resultSet.getString("log_codigo") %></td>
								<td><%=resultSet.getString("log_usuario") %></td>
								<td><%=resultSet.getString("log_nivel_acesso") %></td>
								<td><a href="#" class="btn btn-primary">Editar</a></td>
								<td><a href="usuarios.jsp?acao=excluir&codigo=<%=resultSet.getString("log_codigo")%>" class="btn btn-danger">Excluir</a></td>
							</tr>
							<%
								}
							}catch(ClassNotFoundException e){
								out.println("A classe do Driver JDBC não foi localizado!");
								out.println("Erro: "+e);
							}
							catch(SQLException e){
								out.println("Erro: "+e);
							}
							%>
						</tbody>
					</table>
                    <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Toggle Menu</a>
            	</div>
        	</div>
    	</div>
    </div>
	<!-- /#page-content-wrapper -->
	