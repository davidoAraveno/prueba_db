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
    );

    -------------POBLAR TABLAS-------------

    INSERT INTO clientes(nombre,rut,direccion)
    VALUES
        ('cliente1',111111,'direccion cliente1'),
        ('cliente2',222222,'direccion cliente2'),
        ('cliente3',333333,'direccion cliente3'),
        ('cliente4',444444,'direccion cliente4'),
        ('cliente5',555555,'direccion cliente5')
    ;

    INSERT INTO categorias(nombre,descripcion)
    VALUES
        ('categoria1','esta es la descripcion de la categ1'),
        ('categoria2','esta es la descripcion de la categ2'),
        ('categoria3','esta es la descripcion de la categ3')
    ;
    
    INSERT INTO productos(nombre,descripcion,valor_unitario,categoria_id)
    VALUES  
        ('platano','descripcion platanos',100,1),
        ('cafe dolca','descripcion cafe dolca',500,2),
        ('pantalon','descripcion pantalon',800,3),
        ('manzana','descripcion de las manzanas',150,1),
        ('cafe royal','descripcion del cafe royal',600,2),
        ('vestido','descripcion del vestido',1000,3),
        ('piña', 'descripcion',300,1),
        ('cafe donky', 'descripcion cafe donky',400,2)
    ;