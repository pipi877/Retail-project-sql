CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    edad INT CHECK (edad >= 18)
);

CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) CHECK (precio > 0),
    stock INT CHECK (stock >= 0)
);

-- ventas va última porque apunta a clientes y productos
CREATE TABLE ventas (
    venta_id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL REFERENCES clientes(cliente_id),
    producto_id INT NOT NULL REFERENCES productos(producto_id),
    cantidad INT CHECK (cantidad > 0),
    fecha DATE NOT NULL
);
BEGIN;

INSERT INTO clientes (nombre, email, edad) VALUES
    ('Ana López', 'ana@mail.com', 30),
    ('Juan Pérez', 'juan@mail.com', 25),
    ('María Gómez', 'maria@mail.com', 41),
    ('Lucas Díaz', 'lucas@mail.com', 19),
    ('Sofía Ruiz', 'sofia@mail.com', 35);

INSERT INTO productos (nombre, categoria, precio, stock) VALUES
    ('Teclado', 'Electrónica', 25000.00, 10),
    ('Mouse', 'Electrónica', 12000.00, 25),
    ('Remera', 'Ropa', 15000.00, 40),
    ('Pantalón', 'Ropa', 30000.00, 20),
    ('Taza', 'Hogar', 5000.00, 50);

INSERT INTO ventas (cliente_id, producto_id, cantidad, fecha) VALUES
    (1, 1, 1, '2026-11-01'),
    (2, 3, 2, '2026-11-02'),
    (3, 5, 4, '2026-11-03'),
    (4, 2, 1, '2026-11-04'),
    (5, 4, 1, '2026-11-05');

COMMIT;
