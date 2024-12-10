-- Crear la tabla `articulo`
CREATE TABLE articulo (
  idarticulo SERIAL PRIMARY KEY,
  idcategoria INTEGER NOT NULL,
  codigo VARCHAR(50) DEFAULT NULL,
  nombre VARCHAR(100) NOT NULL,
  stock INTEGER NOT NULL,
  descripcion VARCHAR(256) DEFAULT NULL,
  imagen VARCHAR(50) DEFAULT NULL,
  condicion BOOLEAN NOT NULL DEFAULT TRUE
);

-- Insertar datos en la tabla `articulo`
INSERT INTO articulo (idarticulo, idcategoria, codigo, nombre, stock, descripcion, imagen, condicion) VALUES
(1, 5, '555559', 'redmi xiaimi 9', 56990, 'los mejores celulares koreanos9', '1656866627.png', TRUE),
(3, 6, '55555543333343', 'Impresora Epson M300', 567, 'los mejores celulares koreanos', '1656867124.jpg', TRUE);

-- Crear la tabla `categoria`
CREATE TABLE categoria (
  idcategoria SERIAL PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  descripcion VARCHAR(256) DEFAULT NULL,
  condicion BOOLEAN NOT NULL DEFAULT TRUE
);

-- Insertar datos en la tabla `categoria`
INSERT INTO categoria (idcategoria, nombre, descripcion, condicion) VALUES
(1, 'zapatos', 'los mejores zapatos', TRUE),
(2, 'carteras', 'las mejores carteras', TRUE),
(5, 'celulares', 'los mejores celulares', TRUE),
(6, 'laptos', 'los mejores laptops', TRUE),
(13, 'billeteras', 'las mejores billeteras', TRUE),
(14, 'zapatos mujeres', 'los mejores zapatos para mujeres', FALSE),
(15, 'cucharas', 'las mejores cucharas', FALSE),
(16, 'frutas', 'las mejores frutas', FALSE);

-- Crear la tabla `detalle_ingreso`
CREATE TABLE detalle_ingreso (
  iddetalle_ingreso SERIAL PRIMARY KEY,
  idingreso INTEGER NOT NULL,
  idarticulo INTEGER NOT NULL,
  cantidad INTEGER NOT NULL,
  precio_compra DECIMAL(11,2) NOT NULL,
  precio_venta DECIMAL(11,2) NOT NULL
);

-- Crear la tabla `detalle_venta`
CREATE TABLE detalle_venta (
  iddetalle_venta SERIAL PRIMARY KEY,
  idventa INTEGER NOT NULL,
  idarticulo INTEGER NOT NULL,
  cantidad INTEGER NOT NULL,
  precio_venta DECIMAL(11,2) NOT NULL,
  descuento DECIMAL(11,2) NOT NULL
);

-- Crear la tabla `ingreso`
CREATE TABLE ingreso (
  idingreso SERIAL PRIMARY KEY,
  idproveedor INTEGER NOT NULL,
  idusuario INTEGER NOT NULL,
  tipo_comprobante VARCHAR(20) NOT NULL,
  serie_comprobante VARCHAR(7) DEFAULT NULL,
  num_comprobante VARCHAR(10) NOT NULL,
  fecha_hora TIMESTAMP NOT NULL,
  impuesto DECIMAL(4,2) NOT NULL,
  total_compra DECIMAL(11,2) NOT NULL,
  estado VARCHAR(20) NOT NULL
);

-- Crear la tabla `permiso`
CREATE TABLE permiso (
  idpermiso SERIAL PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL
);

-- Crear la tabla `persona`
CREATE TABLE persona (
  idpersona SERIAL PRIMARY KEY,
  tipo_persona VARCHAR(20) NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  tipo_documento VARCHAR(20) DEFAULT NULL,
  num_documento VARCHAR(20) DEFAULT NULL,
  direccion VARCHAR(70) DEFAULT NULL,
  telefono VARCHAR(20) DEFAULT NULL,
  email VARCHAR(50) DEFAULT NULL
);

-- Crear la tabla `usuario`
CREATE TABLE usuario (
  idusuario SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  tipo_documento VARCHAR(20) NOT NULL,
  num_documento VARCHAR(20) NOT NULL,
  direccion VARCHAR(70) DEFAULT NULL,
  telefono VARCHAR(20) DEFAULT NULL,
  email VARCHAR(50) DEFAULT NULL,
  cargo VARCHAR(20) DEFAULT NULL,
  login VARCHAR(20) NOT NULL,
  clave VARCHAR(64) NOT NULL,
  condicion BOOLEAN NOT NULL DEFAULT TRUE
);

-- Crear la tabla `usuario_permiso`
CREATE TABLE usuario_permiso (
  idusuario_permiso SERIAL PRIMARY KEY,
  idusuario INTEGER NOT NULL,
  idpermiso INTEGER NOT NULL
);

-- Crear la tabla `venta`
CREATE TABLE venta (
  idventa SERIAL PRIMARY KEY,
  idcliente INTEGER NOT NULL,
  idusuario INTEGER NOT NULL,
  tipo_comprobante VARCHAR(20) NOT NULL,
  serie_comprobante VARCHAR(7) DEFAULT NULL,
  num_comprobante VARCHAR(10) NOT NULL,
  fecha_hora TIMESTAMP NOT NULL,
  impuesto DECIMAL(4,2) NOT NULL,
  total_venta DECIMAL(11,2) NOT NULL,
  estado VARCHAR(20) NOT NULL
);


-- Índices para tablas volcadas

-- Índices de la tabla `articulo`
CREATE INDEX fk_articulo_categoria_idx ON articulo (idcategoria);
CREATE UNIQUE INDEX nombre_unique ON articulo (nombre);

-- Índices de la tabla `categoria`
CREATE UNIQUE INDEX nombre_unique_categoria ON categoria (nombre);

-- Índices de la tabla `detalle_ingreso`
CREATE INDEX fk_detalle_ingreso_ingreso_idx ON detalle_ingreso (idingreso);
CREATE INDEX fk_detalle_ingreso_articulo_idx ON detalle_ingreso (idarticulo);

-- Índices de la tabla `detalle_venta`
CREATE INDEX fk_detalle_venta_venta_idx ON detalle_venta (idventa);
CREATE INDEX fk_detalle_venta_articulo_idx ON detalle_venta (idarticulo);

-- Índices de la tabla `ingreso`
CREATE INDEX fk_ingreso_persona_idx ON ingreso (idproveedor);
CREATE INDEX fk_ingreso_usuario_idx ON ingreso (idusuario);

-- Índices de la tabla `permiso`
-- No es necesario crear índices adicionales ya que el `idpermiso` es PRIMARY KEY.

-- Índices de la tabla `persona`
-- No es necesario crear índices adicionales ya que el `idpersona` es PRIMARY KEY.

-- Índices de la tabla `usuario`
CREATE UNIQUE INDEX login_unique ON usuario (login);

-- Índices de la tabla `usuario_permiso`
CREATE INDEX fk_usuario_permiso_permiso_idx ON usuario_permiso (idpermiso);
CREATE INDEX fk_usuario_permiso_usuario_idx ON usuario_permiso (idusuario);

-- Índices de la tabla `venta`
CREATE INDEX fk_venta_persona_idx ON venta (idcliente);
CREATE INDEX fk_venta_usuario_idx ON venta (idusuario);

-- Restricciones para tablas volcadas

-- Filtros para la tabla `articulo`
ALTER TABLE articulo ADD CONSTRAINT fk_articulo_categoria FOREIGN KEY (idcategoria) REFERENCES categoria (idcategoria) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Filtros para la tabla `detalle_ingreso`
ALTER TABLE detalle_ingreso ADD CONSTRAINT fk_detalle_ingreso_articulo FOREIGN KEY (idarticulo) REFERENCES articulo (idarticulo) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE detalle_ingreso ADD CONSTRAINT fk_detalle_ingreso_ingreso FOREIGN KEY (idingreso) REFERENCES ingreso (idingreso) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Filtros para la tabla `detalle_venta`
ALTER TABLE detalle_venta ADD CONSTRAINT fk_detalle_venta_articulo FOREIGN KEY (idarticulo) REFERENCES articulo (idarticulo) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE detalle_venta ADD CONSTRAINT fk_detalle_venta_venta FOREIGN KEY (idventa) REFERENCES venta (idventa) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Filtros para la tabla `ingreso`
ALTER TABLE ingreso ADD CONSTRAINT fk_ingreso_persona FOREIGN KEY (idproveedor) REFERENCES persona (idpersona) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE ingreso ADD CONSTRAINT fk_ingreso_usuario FOREIGN KEY (idusuario) REFERENCES usuario (idusuario) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Filtros para la tabla `usuario_permiso`
ALTER TABLE usuario_permiso ADD CONSTRAINT fk_usuario_permiso_permiso FOREIGN KEY (idpermiso) REFERENCES permiso (idpermiso) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE usuario_permiso ADD CONSTRAINT fk_usuario_permiso_usuario FOREIGN KEY (idusuario) REFERENCES usuario (idusuario) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Filtros para la tabla `venta`
ALTER TABLE venta ADD CONSTRAINT fk_venta_persona FOREIGN KEY (idcliente) REFERENCES persona (idpersona) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE venta ADD CONSTRAINT fk_venta_usuario FOREIGN KEY (idusuario) REFERENCES usuario (idusuario) ON DELETE NO ACTION ON UPDATE NO ACTION;
