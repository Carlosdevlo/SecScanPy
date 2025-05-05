# 🔒 SecScanPy

![Security Shield](https://img.shields.io/badge/Security-Ethical_Hacking-blue)
![License: MIT Ethical](https://img.shields.io/badge/license-MIT--Ethical-blue.svg)

**SecScanPy** es una herramienta de escaneo de vulnerabilidades desarrollada en **Bash** y **Python**, diseñada para facilitar auditorías de seguridad en redes locales o entornos de desarrollo. Es de código abierto, ligera y pensada para su uso **ético, legal y controlado**.

---

## 🚀 ¿Qué hace SecScanPy?

SecScanPy permite:

- Escaneo rápido de puertos abiertos en dispositivos o servidores.
- Identificación de servicios activos (SSH, HTTP, FTP, etc.).
- Recolección de banners.
- Búsqueda de vulnerabilidades conocidas.
- Escaneo de puertos personalizados.
- Pruebas en localhost o IPs remotas (con permiso).

---

## ⚙️ Instalación

### 1. Clonar el repositorio

```bash
git clone https://github.com/carlosdevlo/SecScanPy.git
cd SecScanPy
```

### 2. Dar permisos de ejecución

```bash
chmod +x secscanpy.sh
```

### 3. Ejecutar

```bash
./secscanpy.sh [comando] [opciones]
```

---

## 🧪 Ejemplos de uso

```bash
./secscanpy.sh scan 192.168.1.1 --quick
# Escaneo rápido de puertos en la IP 192.168.1.1

./secscanpy.sh scan localhost --ports 22,80,443
# Escaneo local de puertos específicos

./secscanpy.sh help
# Muestra el menú de ayuda con los comandos disponibles
```

---

## 📜 Comandos disponibles

| Comando                       | Descripción                                           |
|------------------------------|-------------------------------------------------------|
| `scan [IP] --quick`          | Escanea puertos comunes rápidamente                   |
| `scan [IP] --ports x,y,z`    | Escanea puertos específicos                           |
| `scan localhost`             | Ejecuta el escaneo en la máquina local               |
| `help`                       | Muestra la ayuda del script                          |

El script usa herramientas como `nmap`, `netcat` y `curl`, por lo que es ideal ejecutarlo en entornos Linux como **Kali** o **Parrot**.

---

## ⚠️ Aviso Legal

Esta herramienta está destinada únicamente para:

✅ Pruebas de seguridad en tus propios sistemas  
✅ Auditorías de sistemas con autorización expresa  
✅ Fines educativos y de investigación ética  

🚫 **Prohibido** usar esta herramienta para:

- Ingresar a redes o sistemas sin autorización.
- Violaciones de privacidad o legislación vigente.
- Actividades maliciosas, destructivas o ilegales.

> El autor **no se hace responsable** por el uso indebido de esta herramienta.

---

## 📄 Licencia con Cláusula Ética

```text
MIT License with Ethical Clause

Copyright (c) 2024 Carlos Carrillo

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software ONLY FOR LAWFUL PURPOSES including without limitation security 
testing of authorized systems, and subject to the following conditions:

1. Ethical Use Clause: The license is automatically revoked if used to:
   - Violar leyes o regulaciones
   - Acceder a sistemas sin permiso explícito
   - Causar daño o interrupciones

2. Todas las modificaciones deben conservar esta licencia y su descargo de responsabilidad.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND...
```

Puedes generar este archivo automáticamente con:

```bash
cat > LICENSE <<'EOL'
[texto de la licencia como se muestra arriba]
EOL
```

---

## 👨‍💻 Autor

**Carlos Carrillo**  
🛡️ Ciberseguridad | Linux | Ethical Hacking  
🔗 GitHub: [@carlosdevlo](https://github.com/carlosdevlo)  
📧 Email: carlosdevlo@gmail.com  


![Security Shield](https://img.shields.io/badge/Security-Ethical_Hacking-blue)
![License: MIT Ethical](https://img.shields.io/badge/license-MIT--Ethical-blue.svg)

**SecScanPy** es una herramienta de escaneo de vulnerabilidades desarrollada en **Bash** y **Python**, diseñada para facilitar auditorías de seguridad en redes locales o entornos de desarrollo. Es de código abierto, ligera y pensada para su uso **ético, legal y controlado**.

---

## 🚀 ¿Qué hace SecScanPy?

SecScanPy permite:

- Escaneo rápido de puertos abiertos en dispositivos o servidores.
- Identificación de servicios activos (SSH, HTTP, FTP, etc.).
- Recolección de banners.
- Búsqueda de vulnerabilidades conocidas.
- Escaneo de puertos personalizados.
- Pruebas en localhost o IPs remotas (con permiso).

---

## ⚙️ Instalación

### 1. Clonar el repositorio

```bash
git clone https://github.com/carlosdevlo/SecScanPy.git
cd SecScanPy
```

### 2. Dar permisos de ejecución

```bash
chmod +x secscanpy.sh
```

### 3. Ejecutar

```bash
./secscanpy.sh [comando] [opciones]
```

---

## 🧪 Ejemplos de uso

```bash
./secscanpy.sh scan 192.168.1.1 --quick
# Escaneo rápido de puertos en la IP 192.168.1.1

./secscanpy.sh scan localhost --ports 22,80,443
# Escaneo local de puertos específicos

./secscanpy.sh help
# Muestra el menú de ayuda con los comandos disponibles
```

---

## 📜 Comandos disponibles

| Comando                       | Descripción                                           |
|------------------------------|-------------------------------------------------------|
| `scan [IP] --quick`          | Escanea puertos comunes rápidamente                   |
| `scan [IP] --ports x,y,z`    | Escanea puertos específicos                           |
| `scan localhost`             | Ejecuta el escaneo en la máquina local               |
| `help`                       | Muestra la ayuda del script                          |

El script usa herramientas como `nmap`, `netcat` y `curl`, por lo que es ideal ejecutarlo en entornos Linux como **Kali** o **Parrot**.

---

## ⚠️ Aviso Legal

Esta herramienta está destinada únicamente para:

✅ Pruebas de seguridad en tus propios sistemas  
✅ Auditorías de sistemas con autorización expresa  
✅ Fines educativos y de investigación ética  

🚫 **Prohibido** usar esta herramienta para:

- Ingresar a redes o sistemas sin autorización.
- Violaciones de privacidad o legislación vigente.
- Actividades maliciosas, destructivas o ilegales.

> El autor **no se hace responsable** por el uso indebido de esta herramienta.

---

## 📄 Licencia con Cláusula Ética

```text
MIT License with Ethical Clause

Copyright (c) 2024 Carlos Carrillo

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software ONLY FOR LAWFUL PURPOSES including without limitation security 
testing of authorized systems, and subject to the following conditions:

1. Ethical Use Clause: The license is automatically revoked if used to:
   - Violar leyes o regulaciones
   - Acceder a sistemas sin permiso explícito
   - Causar daño o interrupciones

2. Todas las modificaciones deben conservar esta licencia y su descargo de responsabilidad.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND...
```

Puedes generar este archivo automáticamente con:

```bashhttps://github.com/Carlosdevlo/SecScanPy/blob/main/README.md
cat > LICENSE <<'EOL'
[texto de la licencia como se muestra arriba]
EOL
```https://github.com/Carlosdevlo/SecScanPy/blob/main/README.md

---

## 👨‍💻 Autor

**Carlos Carrillo**  
🛡️ Ciberseguridad | Linux | Ethical Hacking  
🔗 GitHub: [@carlosdevlo](https://github.com/carlosdevlo)  
📧 Email: carlosdevlo@protonmail.com  

