require('dotenv').config();

const express = require('express');
const app = express();

app.use(express.json());

//rutas
app.use('/users', require('./routers/user'));
app.use('/products', require('./routers/product'));
app.use('/auth', require('./routers/auth'));
app.use('/order', require('./routers/orders'));

//crear la conexion a la base de BD
const db = require('./config/db');

db.sync()
    .then(() => console.log('conectado al servidor'))
    .catch(error => console.log(error));

//importar el modelo
require('./models/User');
require('./models/Rols');
require('./models/Product');
require('./models/Orders');

//puerto del server
app.listen(process.env.PORT, () => {
    console.log('the server', process.env.PORT);
});

//Document swagger
const swaggerUI = require('swagger-ui-express');

//URL para ver la documentación
app.use('/swagger', swaggerUI.serve, swaggerUI.setup('./swagger.yaml'));