<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="scripts/main.js"></script>
<script src="scripts/io.js"></script>
<link rel="stylesheet" type="text/css" href="styles.css">
<title>Muuta asiakkaan tietoja</title>
</head>
<body onload="asetaFocus('etunimi')" onkeydown="tutkiKey(event, 'muuta')">
	<h1>Muuta asiakkaan tietoja</h1>
	<p>Tällä sivulla voit muuttaa tietokannasta löytyvän asikkaan tietoja</p>
	<form name="lomake">
		<table>
			<thead>
				<tr>
					<th colspan="3"><a id="linkki" href="login?logout=1">Kirjaudu ulos (<%out.print(session.getAttribute("kayttaja"));%>)</a></th>
					<th colspan="3" class="oikealle"><a id="linkki" href="ListaaAsiakkaat.jsp">Takaisin asiakkaiden listaukseen</a></th>
				</tr>
				<tr>
					<th>Asiakas ID</th>
					<th>Etunimi</th>
					<th>Sukunimi</th>
					<th>Puhelinnumero</th>
					<th>Sähköposti</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="1"></td>
					<td><input type="text" name="etunimi" id="etunimi"></td>
					<td><input type="text" name="sukunimi" id="sukunimi"></td>
					<td><input type="text" name="puhelin" id="puhelin"></td>
					<td><input type="text" name="sposti" id="sposti"></td>
					<td><input type="button" value="Muuta" onclick="tutkiJaPaivita()"></td>
				</tr>
			</tbody>
		</table>
		<input type="hidden" name="asiakas_id" id="asiakas_id">
	</form>
	<p id="ilmo"></p>
</body>
<script>
haeAsiakas();
</script>
</html>