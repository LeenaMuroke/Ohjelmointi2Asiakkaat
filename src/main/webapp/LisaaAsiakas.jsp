<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="scripts/main.js"></script>
<link rel="stylesheet" type="text/css" href="styles.css">
<title>Lisää asiakas</title>
</head>
<body>
	<h1>Asiakkaan lisääminen</h1>
	<p>Tällä sivulla voit lisätä tietokantaan asiakkaan</p>
<form name="lomake">
	<table>
		<thead>
			<tr>
				<th colspan="6" class="oikealle"><a id="linkki" href="ListaaAsiakkaat.jsp">Listaa asiakkaat</a></th>
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
				<td><input type="button" value="Lisää asiakas" onclick="tutkiJaLisaa()"></td>
			</tr>
		</tbody>
	</table>
</form>
<p id="ilmo"></p>
</body>
</html>