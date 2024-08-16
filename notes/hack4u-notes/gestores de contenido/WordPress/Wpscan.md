---
tags:
  - "#web"
  - "#tools"
  - "#wordpress"
  - "#reconocimiento"
  - "#recon"
  - "#herramientas"
---
-----
La herramienta **Wpscan** [^1] se utiliza para enumerar paginas web que dispongan de contenidos [[WordPress]].

Su modo de uso es sencillo, para realizar un escaneo a modo de prueba se puede usar el siguiente comando:

```bash
wpscan --url <url>
```

Si quisiéramos enumerar usuarios validos existentes detrás de este gestor de contenidos, podríamos ejecutar el siguiente escaneo alternativo:

```bash
wpscan --url <url> --enumerate u
```

Tambien podriamos aplicar fuerza bruta para descubrir credenciales validas en los paneles de autenticacion:

```bash
wpscan --url <url> -U <user> -P /usr/share/wordlists/rockyou.txt
```

Este procedimiento tambien puede aplicarse de forma manual [^2] siendo necesario crear un script por ejemplo en Bash o en Python.

---
### Referencias

[^1]: gitHub: [Enlace](https://github.com/wpscanteam/wpscan)
[^2]: ejemplo abusando del XMLRPC: [[XMLRPC]].
