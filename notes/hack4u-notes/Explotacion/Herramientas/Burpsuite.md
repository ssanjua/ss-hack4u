
---
- Tags: #burpsuite #tools 
----

>**BurpSuite** es una herramienta de prueba de penetración utilizada para encontrar vulnerabilidades de seguridad en aplicaciones web. Es una de las herramientas de prueba de penetración más populares y utilizadas en la industria de la seguridad informática. BurpSuite se compone de varias herramientas diferentes que se pueden utilizar juntas para identificar vulnerabilidades en una aplicación web.

Las principales herramientas que componen BurpSuite son las siguientes:

- **Proxy**: Es la herramienta principal de BurpSuite y actúa como un intermediario entre el navegador web y el servidor web. Esto permite a los usuarios interceptar y modificar las solicitudes y respuestas HTTP y HTTPS enviadas entre el navegador y el servidor. El Proxy también es útil para la identificación de vulnerabilidades, ya que permite a los usuarios examinar el tráfico y analizar las solicitudes y respuestas.
- **Scanner**: Es una herramienta de prueba de vulnerabilidades automatizada que se utiliza para identificar vulnerabilidades en aplicaciones web. El Scanner utiliza técnicas de exploración avanzadas para detectar vulnerabilidades en la aplicación web, como inyecciones SQL, cross-site scripting (XSS), vulnerabilidades de seguridad de la capa de aplicación (OSWAP Top 10) y más.
- **Repeater**: Es una herramienta que permite a los usuarios reenviar y repetir solicitudes HTTP y HTTPS. Esto es útil para probar diferentes entradas y verificar la respuesta del servidor. También es útil para la identificación de vulnerabilidades, ya que permite a los usuarios probar diferentes valores y detectar respuestas inesperadas.
- **Intruder**: Es una herramienta que se utiliza para automatizar ataques de fuerza bruta. Los usuarios pueden definir diferentes payloads para diferentes partes de la solicitud, como la URL, el cuerpo de la solicitud y las cabeceras. Posteriormente, Intruder automatiza la ejecución de las solicitudes utilizando diferentes payloads y los usuarios pueden examinar las respuestas para identificar vulnerabilidades.
- **Comparer**: Es una herramienta que se utiliza para comparar dos solicitudes HTTP o HTTPS. Esto es útil para detectar diferencias entre las solicitudes y respuestas y analizar la seguridad de la aplicación.

Se trata de una herramienta extremadamente potente, la cual puede ser utilizada para identificar una amplia variedad de vulnerabilidades de seguridad en aplicaciones web. Al utilizar las diferentes herramientas que componen BurpSuite, los usuarios pueden identificar vulnerabilidades de forma automatizada o manual, según sus necesidades. Esto permite a los usuarios encontrar vulnerabilidades y corregirlas antes de que sean explotadas por un atacante.

En resumen, Burp Suite es una herramienta imprescindible para cualquier profesional de seguridad informática que busque asegurar la seguridad de aplicaciones web. En la siguiente sección, tendremos la oportunidad de utilizar BurpSuite en detalle y sacarle el máximo provecho a esta herramienta.

### Cargas Básicas

- **Lista Simple:** Solo una lista que contiene una entrada en cada línea.
    
- **Archivo en Tiempo de Ejecución:** Una lista leída en tiempo de ejecución (no cargada en memoria). Para soportar listas grandes.
    
- **Modificación de Mayúsculas y Minúsculas:** Aplicar algunos cambios a una lista de cadenas (sin cambios, a minúsculas, a MAYÚSCULAS, a Nombre Propio -primera letra en mayúscula y el resto en minúsculas-, a Nombre Propio -primera letra en mayúscula y el resto se mantiene igual-.
    
- **Números:** Generar números desde X hasta Y usando un paso Z o de forma aleatoria.
    
- **Fuerza Bruta:** Conjunto de caracteres, longitud mínima y máxima.
    

[https://github.com/0xC01DF00D/Collabfiltrator](https://github.com/0xC01DF00D/Collabfiltrator) : Carga útil para ejecutar comandos y obtener la salida a través de solicitudes DNS a burpcollab.