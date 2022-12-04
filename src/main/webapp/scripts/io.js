function haeAsiakkaat() {
	let url = "Asiakkaat?hakusana=" + document.getElementById("hakusana").value;
	let requestOptions = {
	        method: "GET",
	        headers: { "Content-Type": "application/x-www-form-urlencoded" }       
	    }; 
	
	fetch(url, requestOptions)
	.then(response => response.json())
	.then(response => printItems(response))
	.catch(errorText => console.error("Fetch failed: " + errorText));
}


function printItems(respObjList) {
	let htmlStr = "";
	for (let item of respObjList) {
		htmlStr += "<tr id='rivi_" + item.asiakas_id + "'>";
		htmlStr += "<td>" + item.asiakas_id + "</td>"
		htmlStr += "<td>" + item.etunimi + "</td>";
		htmlStr += "<td>" + item.sukunimi + "</td>";
		htmlStr += "<td>" + item.puhelin + "</td>";
		htmlStr += "<td>" + item.sposti + "</td>";
		htmlStr += "<td><a href='MuutaAsiakas.jsp?asiakas_id="+item.asiakas_id+"'>Muuta</a>&nbsp";
		htmlStr += "<span class='poista' onclick=varmistaPoisto("+item.asiakas_id+",'"+encodeURI(item.sukunimi + " " + item.etunimi)+"')>Poista</span></td>"; 
		htmlStr += "</tr>";
	}
	document.getElementById("tbody").innerHTML = htmlStr;
}

function lisaaTiedot() {
	let formData = serialize_form(document.lomake);
	console.log(formData);
	
	let url = "Asiakkaat";
	let requestOptions = {
		method: "POST",
		headers: { "Content-Type": "application/json; charset=UTF-8" },
		body: formData
	};
	
	fetch(url, requestOptions) 
	.then(response => response.json())
	.then(responsObj => {
		if(responsObj.response == 0) {
			document.getElementById("ilmo").innerHTML = "Asiakkaan lisäys epäonnistui";
		} else if (responsObj.response == 1) {
			document.getElementById("ilmo").innerHTML = "Asiakkaan lisäys onnistui";
			document.lomake.reset();
		}
		setTimeout(function(){ document.getElementById("ilmo").innerHTML=""; }, 3000);
	})
	.catch (errorText => console.error("Fetch failed: " + errorText));
}

function poistaAsiakas(asiakas_id, nimi){
	let url = "Asiakkaat?asiakas_id=" + asiakas_id;    
    let requestOptions = {
        method: "DELETE"             
    };    
    fetch(url, requestOptions)
    .then(response => response.json())
   	.then(responseObj => {	
   		if(responseObj.response==0){
			alert("Asiakkaan poisto epäonnistui.");	        	
        }else if(responseObj.response==1){
			document.getElementById("rivi_"+asiakas_id).style.backgroundColor="red";
			alert("Asiakkaan " + decodeURI(nimi) + " poisto onnistui."); 
			haeAsiakkaat();        	
		}
   	})
   	.catch(errorText => console.error("Fetch failed: " + errorText));
}	

function haeAsiakas() {		
	let url = "Asiakkaat?asiakas_id="+requestURLParam("asiakas_id");
	console.log(url);
    let requestOptions = {
        method: "GET",
        headers: { "Content-Type": "application/x-www-form-urlencoded" }       
    }; 
    fetch(url, requestOptions)
    .then(response => response.json())
   	.then(response => {
		console.log(response);
		document.getElementById("asiakas_id").value=response.asiakas_id;
		document.getElementById("etunimi").value=response.etunimi;
		document.getElementById("sukunimi").value=response.sukunimi;
		document.getElementById("puhelin").value=response.puhelin;
		document.getElementById("sposti").value=response.sposti;
	})
	.catch (errorText => console.error("Fetch failed: " + errorText));
}


function paivitaTiedot() {
	let formData = serialize_form(lomake);	
	console.log(formData)
	let url = "Asiakkaat";    
    let requestOptions = {
        method: "PUT",
        headers: { "Content-Type": "application/json; charset=UTF-8" },  
    	body: formData
    };    
    fetch(url, requestOptions)
    .then(response => response.json())
   	.then(responseObj => {	
   		console.log(responseObj);
   		if(responseObj.response==0){
   			document.getElementById("ilmo").innerHTML = "Asiakkaan tietojen päivitys epäonnistui.";	
        }else if(responseObj.response==1){ 
        	document.getElementById("ilmo").innerHTML = "Asiakkaan tietojen päivitys onnistui.";
			document.lomake.reset();	        	
		}
		setTimeout(function(){ document.getElementById("ilmo").innerHTML=""; }, 3000);
   	})
   	.catch(errorText => console.error("Fetch failed: " + errorText));
}