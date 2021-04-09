# Backend "Delilah Restó", App de comidas

Trabajo #3 del curso de Desarrollo Web Full Stack de Acámica.

# Instalacion de depencias del proyecto:
Se utiliza :
    - Node
    - Servidor MariaDB
```
npm install

Una vez ejecutado el comando, se instalan las siguientes dependencias:

BD
- express, sequelize, mysql2

JSON
- express.json

Autenticación 
- jsonwebtoken

Encriptacion de contraseñas
-bcryptjs
```

# Instalacion de depencias del proyecto:

nodemon app

-requiere tener nodemon como parte global de nodes js 


# Inicializacion de base de datos:
En el proyecto puedes importar las base de datos el documento se llama delilah.sql
puede importarlo en las siguientes BD
-phpadmin
-tableplus 

NO REQUIERE CONTRASEÑA

## Recursos y tecnologías utilizadas

- Node.js
- Nodemon
- Express
- JWT para autenticación via Token
- bcryptjs para contraseñas 
- MySQL
- Sequelize
- Postman para manejo de endpoints y testing
- Swagger para documentación de API

Este proyecto plantea la creación de un sistema de pedidos online para un restaurante y El objetivo del trabajo es generar el backend de una app de pedidos de comida llamada Delilah Restó, generando la arquitectura, bases de datos relacionales, endpoints funcionales y documentación.


## Estructura del proyecto

Se definen 5 modelos para las tablas de la base de datos:

- Order para las "Pedidos" 
- Productos para "comidas"
- Rol para definir que tipo de usuario es solo ADMIN y USER
- User para almacenar los usuarios 


Se crean las siguientes rutas en la applicación:

Rutas 
- auth  localhost:3000/auth
- orders  localhost:3000/order
- Product localhost:3000/products
- User localhost:3000/users



Se utiliza Middlewares para Autenticación de Usuarios para solo permitir ciertas rutas a los usuarios y otras solo al Admin.

-helpers /jwt. js : requiere .env para su respectiva contraseña
-middlewares /validate-jwt.js : validacion requerida solo para los que esten logeados y roles como ADMIN.

GRACIAS!!