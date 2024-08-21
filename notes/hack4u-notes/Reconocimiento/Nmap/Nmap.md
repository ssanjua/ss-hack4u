
---
- Tags: #recon #nmap #tools 
----
# Definicion
> **Nmap** es un programa de código abierto que sirve para efectuar rastreo de puertos escrito originalmente por Gordon Lyon y cuyo desarrollo se encuentra hoy a cargo de una comunidad. Fue creado originalmente para Linux aunque actualmente es multiplataforma. [Wikipedia](https://es.wikipedia.org/wiki/Nmap)

Lenguajes de programación: [Python](https://www.google.com/search?sca_esv=b7f3dd37d608f534&sxsrf=ADLYWIKvqFs0Hnd8G1AxC0p7xcBtxGG41A:1723806294362&q=Python&si=ACC90nyvvWro6QmnyY1IfSdgk5wwjB1r8BGd_IWRjXqmKPQqmxTgf2VRnKwIGjFkG347NklyxDsC2V6CrKZd44pJgBSUlvhXObx7EKY-xiJ-ZF5IbtlveH4COH9VO5qJiyijwFd7kzctQ3OrC3aykMR4WuEllgyjCBrW7r6VrLG6g5Qs0Y3jh-CHyKkOMPaTjcV90NOqsff7UPzo3aKhEyyVabl_Khxbai8MOvZ-DoS7wP1esdinCPO9Mu5roZR2tl943F0-J-ILwRLZCqv7RQfgh3VMQ2w4cA%3D%3D&sa=X&ved=2ahUKEwif1NjurvmHAxUEcfEDHXJLBfgQmxMoAHoECEAQAg), [C](https://www.google.com/search?sca_esv=b7f3dd37d608f534&sxsrf=ADLYWIKvqFs0Hnd8G1AxC0p7xcBtxGG41A:1723806294362&q=C&si=ACC90nyvvWro6QmnyY1IfSdgk5wwjB1r8BGd_IWRjXqmKPQqm43Ys_ib4J8sJZReM_QHsCl0cjFHe6EIcc1O_bSADzgcp5x_oz8T-2TOYe08wAOCKGmJs1qm_z7e8U4nnG2wJWZIpsJkywGlGZtWCPnEd9WYd-kxiwhYiNodbxCsAvyRIM5eHkxcNMejbLzt6NxahpWS9CaBUzOTyKFByWRW4to5Kut2ETx9ay8tHeHOYDXBbjzB6P67_OVIezMWqTfm5GfzlPxjA2taYFdB1KDsyTr7YGVxqQ%3D%3D&sa=X&ved=2ahUKEwif1NjurvmHAxUEcfEDHXJLBfgQmxMoAXoECEAQAw), [C++](https://www.google.com/search?sca_esv=b7f3dd37d608f534&sxsrf=ADLYWIKvqFs0Hnd8G1AxC0p7xcBtxGG41A:1723806294362&q=C%2B%2B&si=ACC90nyvvWro6QmnyY1IfSdgk5wwjB1r8BGd_IWRjXqmKPQqmy4n3QmsTWDXuijRHHWYwsTTwKKPXPXa3yjti3eJN-i3JOtRh9GPsMZGfCaKVSpzOhjX12UX5kH5XztDkq_lGUApGWpipG5psNh7LycBTfaahJh4IPv3Jpe9kPv8GxZPwt0sUu9vZIjgguCfp8rkvaVqcmUUrZEea486wT4Kz0nDRShQb_IBf_u7Q5jZqbtx0WlDUvwkwbB4WYh69Zy3WvsT4FJNrdzRijuYHHjl5B-GT1qGBg%3D%3D&sa=X&ved=2ahUKEwif1NjurvmHAxUEcfEDHXJLBfgQmxMoAnoECEAQBA), [Lua](https://www.google.com/search?sca_esv=b7f3dd37d608f534&sxsrf=ADLYWIKvqFs0Hnd8G1AxC0p7xcBtxGG41A:1723806294362&q=Lua&si=ACC90nyvvWro6QmnyY1IfSdgk5wwjB1r8BGd_IWRjXqmKPQqm_Lk711ULjaUzCy1R6q-bh6eELWME85aAs00Mdd8lENPOsHV6NBBRLhlDowEoWmV28cPL7Sost0Pf5VVkeYKuV4e2WW75ryVFwuxvV3Ytf9ncuWBfjQnrLesEvjcUuMBtczCm2C1p1kuWuPWfE0ZkKc2N-cgwPQzAvqD8VEpJy5S_qzTFm-axyB7psqQa-2nrc5S6MrDAPVa12Fhvt3w8CYh-DfA-CW9YTa-ms9v6V5CGhixQQ%3D%3D&sa=X&ved=2ahUKEwif1NjurvmHAxUEcfEDHXJLBfgQmxMoA3oECEAQBQ)

**Nmap** es una herramienta de **escaneo de red** gratuita y de código abierto que se utiliza en pruebas de penetración (pentesting) para explorar y auditar redes y sistemas informáticos.

Con Nmap, los profesionales de seguridad pueden identificar los **hosts** conectados a una red, los **servicios** que se están ejecutando en ellos y las **vulnerabilidades** que podrían ser explotadas por un atacante. La herramienta es capaz de detectar una amplia gama de dispositivos, incluyendo enrutadores, servidores web, impresoras, cámaras IP, sistemas operativos y otros dispositivos conectados a una red.

Asimismo, esta herramienta posee una variedad de funciones y características avanzadas que permiten a los profesionales de seguridad adaptar la misma a sus necesidades específicas. Estas incluyen técnicas de escaneo agresivas, capacidades de scripting personalizadas, y un conjunto de herramientas auxiliares que pueden ser utilizadas para obtener información adicional sobre los hosts objetivo.

## Técnicas de evasión de Firewalls (MTU, Data Length, Source Port, Decoy, etc.)

- Tags: #firewalls

Cuando se realizan pruebas de penetración, uno de los mayores desafíos es evadir la detección de los **Firewalls**, que son diseñados para proteger las redes y sistemas de posibles amenazas. Para superar este obstáculo, Nmap ofrece una variedad de técnicas de evasión que permiten a los profesionales de seguridad realizar escaneos sigilosos y evitar así la detección de los mismos.

Algunos de los parámetros vistos en esta clase son los siguientes:

- **MTU (–mtu)**: La técnica de evasión de **MTU** o “**Maximum Transmission Unit**” implica ajustar el tamaño de los paquetes que se envían para evitar la detección por parte del Firewall. Nmap permite configurar manualmente el tamaño máximo de los paquetes para garantizar que sean lo suficientemente pequeños para pasar por el Firewall sin ser detectados.
- **Data Length (–data-length)**: Esta técnica se basa en ajustar la **longitud de los datos** enviados para que sean lo suficientemente cortos como para pasar por el Firewall sin ser detectados. Nmap permite a los usuarios configurar manualmente la longitud de los datos enviados para que sean lo suficientemente pequeños para evadir la detección del Firewall.
- **Source Port (–source-port)**: Esta técnica consiste en configurar manualmente el número de **puerto de origen** de los paquetes enviados para evitar la detección por parte del Firewall. Nmap permite a los usuarios especificar manualmente un puerto de origen aleatorio o un puerto específico para evadir la detección del Firewall.
- **Decoy (-D)**: Esta técnica de evasión en Nmap permite al usuario enviar **paquetes falsos** a la red para confundir a los sistemas de detección de intrusos y evitar la detección del Firewall. El comando **-D** permite al usuario enviar paquetes falsos junto con los paquetes reales de escaneo para ocultar su actividad.
    
- **Fragmented (-f)**: Esta técnica se basa en **fragmentar los paquetes** enviados para que el Firewall no pueda reconocer el tráfico como un escaneo. La opción **-f** en Nmap permite fragmentar los paquetes y enviarlos por separado para evitar la detección del Firewall.
- **Spoof-Mac (–spoof-mac)**: Esta técnica de evasión se basa en **cambiar la dirección MAC** del paquete para evitar la detección del Firewall. Nmap permite al usuario configurar manualmente la dirección MAC para evitar ser detectado por el Firewall.
- **Stealth Scan (-sS)**: Esta técnica es una de las más utilizadas para realizar escaneos sigilosos y evitar la detección del Firewall. El comando **-sS** permite a los usuarios realizar un escaneo de tipo **SYN** **sin establecer una conexión completa**, lo que permite evitar la detección del Firewall.
- **min-rate (–min-rate)**: Esta técnica permite al usuario **controlar la velocidad de los paquetes** enviados para evitar la detección del Firewall. El comando **–min-rate** permite al usuario reducir la velocidad de los paquetes enviados para evitar ser detectado por el Firewall.

Es importante destacar que, además de las técnicas de evasión mencionadas anteriormente, existen muchas otras opciones en Nmap que pueden ser utilizadas para realizar pruebas de penetración efectivas y evadir la detección del Firewall. Sin embargo, las técnicas que hemos mencionado son algunas de las más populares y ampliamente utilizadas por los profesionales de seguridad para superar los obstáculos que presentan los Firewalls en la realización de pruebas de penetración.

