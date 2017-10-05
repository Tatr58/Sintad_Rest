'use strict';
const Hapi = require('hapi');
const MySQL = require('mysql');
const Joi = require('joi');
const crypto = require('crypto');


const server = new Hapi.Server();

const connection = MySQL.createConnection({
     host: 'localhost',
     user: 'root',
     password: 'mysql',
     database: 'db_trans_00_web'
});

server.connection({
    port: 3001,
    routes: { cors: true }    
});

connection.connect();


server.route({
    method: 'GET',
    path: '/auth/login/{username}/{password}',
    handler: function (request, reply) {
    const username = request.params.username;
    const password = request.params.password;
    var pass_crypt = crypto.createHash('sha1').update(password).digest("hex");

    connection.query('SELECT usu.id_user, \
                      usu.id_empleado, \
                      usu.id_role, \
                      CONCAT(emp.nombres, " ",emp.paterno) as nombre \
                      FROM _user as usu INNER JOIN _empleado as emp \
                      ON usu.id_empleado = emp.id_empleado \
                      WHERE usu.user = "' + username + '" and usu.password = "' + pass_crypt + '"',
    function (error, results, fields) {
       if (error) throw error;
       reply(results);
    });
    },
   config: {
       validate: {
        params: {
        username: Joi.string().required(),
        password: Joi.string().regex(/^[a-zA-Z0-9]{1,30}$/).required()
        }
      } 
    }
});


server.route({
    method: 'GET',
    path: '/service_order/getList/{id_empleado}',
    handler: function (request, reply) {
    const id_empleado = request.params.id_empleado;

    connection.query('SELECT \
                    nro_orden as idOrden, \
                    fh_orden as fechaOrden, \
                    ruc_clte as ruc, \
                    name_clte as nombreCliente, \
                    serv.nombre as tipoServicio \
                    FROM \
                    se_ordenservicio AS os \
                    INNER JOIN _servicio AS serv ON os.tipo_serv = serv.tipo_serv \
                    WHERE \
                    os.id_empleado = ' + id_empleado,
    function (error, results, fields) {
       if (error) throw error;
       reply(results);
    });
    },
   config: {
       validate: {
        params: {
        id_empleado: Joi.number().integer().required(),
        }
      } 
    }
});


server.route({
    method: 'GET',
    path: '/service_order_deta/getRoute/{id_order}',
    handler: function (request, reply) {
    const id_order = request.params.id_order;

    connection.query('SELECT \
                    viaje, \
                    lat_P, \
                    lon_P, \
                    depoNom_P, \
                    lat_L, \
                    lon_L, \
                    depoNom_L \
                    FROM \
                    se_ordenservicio_deta  \
                    WHERE \
                    nro_orden = ?', [id_order],
    function (error, results, fields) {
       if (error) throw error;
       reply(results);
    });
    },
   config: {
       validate: {
        params: {
        id_order: Joi.string().required(),
        }
      } 
    }
});


server.start((err) => {
   if (err) {
     throw err;
   }
  console.log('Server running at:', server.info.uri);
});

server.on('response', function (request) {
    console.log(request.info.remoteAddress + ': ' + request.method.toUpperCase() + ' ' + request.url.path + ' --> ' + request.response.statusCode);
});