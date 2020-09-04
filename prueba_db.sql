--crear base de datos
    CREATE DATABASE prueba_db;

--hacer uso de base de datos
    \c prueba_db;

-- crear tabla clientes
    CREATE TABLE clientes(
        id SERIAL PRIMARY KEY,
        nombre VARCHAR(60) NOT NULL,
        rut INT NOT NULL UNIQUE NOT NULL,
        direccion VARCHAR(100) NOT NULL
    );

-- crear tabla facturas
    CREATE TABLE facturas(
        id SERIAL PRIMARY KEY,
        fecha DATE NOT NULL,
        subtotal FLOAT NOT NULL,
        iva FLOAT,
        precio_total FLOAT NOT NULL
    );    

--tabla relacion entre clientes y facturas
    CREATE TABLE clientes_facturas(
        cliente_id INT NOT NULL,
        factura_id INT NOT NULL,
        FOREIGN KEY(cliente_id) REFERENCES clientes(id),
        FOREIGN KEY(factura_id) REFERENCES facturas(id)
    );

-- crear tabla categorias
    CREATE TABLE categorias(
        id SERIAL PRIMARY KEY,
        nombre VARCHAR(25) NOT NULL,
        descripcion VARCHAR(150)
    );

-- crear tabla productos
    CREATE TABLE productos(
        id SERIAL PRIMARY KEY,
        nombre VARCHAR(60),
        descripcion VARCHAR(150),
        valor_unitario FLOAT NOT NULL,
        categoria_id INT NOT NULL,
        FOREIGN KEY (categoria_id) REFERENCES categorias(id)
    );

-- crear tabla listado_productos (RELACION FACTURA PRODUCTO)
    CREATE TABLE listado_de_productos(
        producto_id INT,
        factura_id INT,
        FOREIGN KEY (producto_id) REFERENCES productos(id),
        FOREIGN KEY (factura_id) REFERENCES facturas(id),
        cantidad INT NOT NULL
    );CREATE TABLE listado_productos(
--     factura_id INT,
--     producto_id INT,
--     FOREIGN KEY(factura_id) REFERENCES facturas(id),
--     FOREIGN KEY(producto_id) REFERENCES productos(id),
--     cantidad INT NOT NULL
-- );
