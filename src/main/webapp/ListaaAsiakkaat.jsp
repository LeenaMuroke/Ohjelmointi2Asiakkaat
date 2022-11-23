<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="scripts/main.js"></script>
<link rel="stylesheet" type="text/css" href="styles.css">
<title>Asiakkaiden listaus</title>
</head>
<body>
	<h1>Asiakkaiden listaus</h1>
	<p>Tällä sivulla voit hakea asiakkaita tietokannasta hakuasanan avulla</p>
	<table id="listaus">
		<thead>
		<tr>
			<th colspan="6" class="oikealle"><a id="linkki" href="LisaaAsiakas.jsp">Lisää asiakas</a></th>
		</tr>
			<tr>
				<th colspan="2">Hakusana:</th>
				<th colspan="3"><input type="text" id="hakusana"></th>
				<th colspan="2"><input type="button" value="Hae" id="hakunappi" onclick="haeAsiakkaat()"></th>
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
		<tbody id="tbody">
		</tbody>
	</table>
	<span id="ilmo"></span>
	<script>
		haeAsiakkaat();
	</script>
</body>
</html>