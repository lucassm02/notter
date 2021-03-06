<%@page import="br.senai.sp.model.Compromisso"%>
<%@page import="br.senai.sp.dao.ContatoDAO"%>
<%@page import="br.senai.sp.model.Contato"%>
<%@page import="br.senai.sp.model.Usuario"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sun.java2d.pipe.SpanShapeRenderer.Simple"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.Date"%>

<%
	if (session.getAttribute("usuario") == null) {
		response.sendRedirect("login.jsp");
	} else {

		Usuario usuario = new Usuario();

		/*usuario = (Usuario) request.getAttribute("user");
		*/

		usuario = (Usuario) session.getAttribute("usuario");

		SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
		
		Compromisso compromisso = new Compromisso();
		compromisso = (Compromisso) request.getAttribute("compromisso");
		
%>

<!DOCTYPE html>
<html class="ls-theme-orange ls-html-nobg ">
<head>

	<title>Atulizar contato</title>

	<meta charset="utf-8">
	<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-title" content="Painel 2">
	
	<link rel="icon" sizes="192x192" href="imagens/icone.ico">
  <link rel="apple-touch-icon" href="imagens/icone.ico">
	
	
	<script src="js/mediaqueries-ie.js" type="text/javascript"></script>
	<script src="js/html5shiv.js" type="text/javascript"></script>
	
	<link rel="stylesheet" type="text/css" href="css/locastylev2.css">


</head>
<body
	class="documentacao documentacao_exemplos documentacao_exemplos_painel2 documentacao_exemplos_painel2_home documentacao_exemplos_painel2_home_index">

	<%@include file="header.html"%>

	<%@include file="aside.html"%>

	<main class="ls-main ">

	<div class="container-fluid">

		<h1 class="ls-title-intro ls-ico-spinner ls-no-bg">Atualizar Compromisso</h1>
		<div class="ls-box">
			
			<form action="AtualizarCompromissoServlet" method="post" class="ls-form ls-form-horizontal row" data-ls-module="form">
			
				<input type="hidden" value="<% out.print(compromisso.getId()); %>" name="txtId">
				
				<fieldset>
				
					<label class="ls-label col-md-4 col-xs-12"> <b
						class="ls-label-text">Nome:</b> <input type="text" name="txtNome"
						placeholder="Nome" class="ls-field" required maxlength="50" value="<%= compromisso.getNome() %>">
					</label>
					
					 <label class="ls-label col-md-4 col-xs-12"> <b
						class="ls-label-text">Assunto:</b> <input type="text" name="txtAssunto"
						placeholder="Assunto" class="ls-field" maxlength="40" required value="<%= compromisso.getAssunto() %>">
					</label>
					
					 <label class="ls-label col-md-4 col-xs-12"> <b
						class="ls-label-text">Contato:</b> <input type="text" name="txtContato"
						placeholder="Contato" class="ls-field" maxlength="50" required value="<%= compromisso.getContato() %>">
					</label>
					
					
					<label class="ls-label col-md-4 col-xs-12"> <b
						class="ls-label-text">Local:</b> <input type="text" name="txtLocal"
						placeholder="Local" class="ls-field" maxlength="50" required value="<%= compromisso.getLocal() %>">
					</label>  
					
					<label class="ls-label col-md-4 col-xs-12"> <b
						class="ls-label-text">Telefone:</b> <input type="text" name="txtTelefone"
						placeholder="Telefone" class="ls-field ls-mask-phone8_with_ddd" value="<%= compromisso.getTelefone()  %>">
					</label>
					
					 <label class="ls-label col-md-4 col-xs-12"> <b
						class="ls-label-text">Celular:</b> <input type="text" name="txtCelular"
						placeholder="Celular" class="ls-field ls-mask-phone9_with_ddd" value="<%= compromisso.getCelular() %>">
					</label>
					
					 <label class="ls-label col-md-3 col-sm-12">
					 		<b class="ls-label-text">Data inicio:</b>
					    <div class="ls-prefix-group">
					      <span data-ls-module="popover" data-content="Escolha o per�odo desejado e clique em 'Filtrar'."></span>
					      <input type="text" name="txtDataInicio" class="datepicker ls-daterange ls-mask-date" placeholder="dd/mm/aaaa" required id="datepicker1" data-ls-daterange="#datepicker2" value="<%= df.format(compromisso.getDataInicio()) %>">
					      <a class="ls-label-text-prefix ls-ico-calendar" data-trigger-calendar="#datepicker1" href="#"></a>
					    </div>
					  </label>

 				 <label class="ls-label col-md-3 col-sm-12">
 				 		<b class="ls-label-text">Data fim:</b>
				    <div class="ls-prefix-group">
				      <span data-ls-module="popover" data-content="Clique em 'Filtrar' para exibir  o per�odo selecionado."></span>
				      <input type="text" name="txtDataFim" class="datepicker ls-daterange ls-mask-date" placeholder="dd/mm/aaaa" id="datepicker2"  value="<%= df.format(compromisso.getDataFim()) %>">
				      <a class="ls-label-text-prefix ls-ico-calendar" data-trigger-calendar="#datepicker2" href="#"></a>
				    </div>
				  </label>
					
					<label class="ls-label col-md-3 col-xs-12"> <b
						class="ls-label-text">Hora inicio:</b> <input type="text" name="txtHoraInicio"
						placeholder="Hora de inicio:" class="ls-field ls-mask-time" required value="<%= compromisso.getHoraInicio() %>">
					</label>
					
					<label class="ls-label col-md-3 col-xs-12"> <b
						class="ls-label-text">Hora fim:</b> <input type="text" name="txtHoraFim"
						placeholder="Hora de finaliza��o:" class="ls-field ls-mask-time" value="<%= compromisso.getHoraFim() %>">
					</label>
					
					</fieldset>
					
					<br>
					
					<fieldset>
					
					<label class="ls-label col-md-6 col-xs-12"> <b class="ls-label-text">Descri��o:</b>
						<textarea rows="4"  name="txtDescricao" 
						maxlength="500"><%= compromisso.getDescricao() %></textarea>
					</label>
					
						<!-- Exemplo com Radio button -->
					<div class="ls-label col-md-4 col-xs-12" >
						<p>Prioridade:</p>
						<label class="ls-label-text"> <input type="radio" 
							name="txtPrioridade" class="ls-field-radio" value="A" <%= (compromisso.getPrioridade().equals("A")) ? "checked" : ""%> > Alta
						</label> <label class="ls-label-text"> <input type="radio" 
							name="txtPrioridade" class="ls-field-radio" value="M" <%= (compromisso.getPrioridade().equals("M")) ? "checked" : ""%>> M�dia
						</label> <label class="ls-label-text"> <input type="radio"
							name="txtPrioridade" class="ls-field-radio" value="B" <%= (compromisso.getPrioridade().equals("B")) ? "checked" : ""%>> Baixa
						</label> 
					</div>
					
					</fieldset>
					
				<div class="ls-actions-btn">
					<button class="ls-btn" type="submit">Atualizar</button>
					<a href="index.jsp" class="ls-btn-danger">Cancelar</a>
				</div>

			</form>
				
		</div>
	</div>

	<%@include file="footer.html"%> </main>


</body>
</html>
	<%
		}
	%>