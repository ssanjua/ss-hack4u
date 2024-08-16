----
- Tags: #web #wordpress #scripting #herramientas #tools 
---
Si quisieramos aplicar fuerza bruta en un [[WordPress]] de la misma forma que hace [[Wpscan]] pero de forma manual para descubrir credenciales validas seria necesario realizar una peticion POST al archivo **xmlrpc.php** tramitando una estructura XML:

```xml
<?xml version="1.0" encoding="UTF-8"?>
```

![[Pasted image 20240816121825.png]]