create database grafitti_papeleria;
use grafitti_papeleria;

-- -----------------------------------------------------
-- Table `grafitti_papeleria`.`producto`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `grafitti_papeleria`.`producto` (
  `id_producto` INT NOT NULL,
  `nombre_producto` VARCHAR(45) NULL,
  `existencia_producto` DOUBLE NULL,
  `descripcion` VARCHAR(45) NULL,
  `precio_producto` DOUBLE NULL,
  `iva_producto` FLOAT NULL,
  PRIMARY KEY (`id_producto`));

-- -----------------------------------------------------
-- Table `grafitti_papeleria`.`vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grafitti_papeleria`.`vendedor` (
  `id_vendedor` INT NOT NULL,
  `nombre_vendedor` VARCHAR(45) NULL,
  `telefono_vendedor` DOUBLE NULL,
  `documento_vendedor` VARCHAR(20) NULL,
  `email_vendedor` VARCHAR(45) NULL,
  PRIMARY KEY (`id_vendedor`));


-- -----------------------------------------------------
-- Table `grafitti_papeleria`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grafitti_papeleria`.`cliente` (
  `id_cliente` INT NOT NULL,
  `nombre_cliente` VARCHAR(45) NULL,
  `telefono_cliente` DOUBLE NULL,
  `direccion_cliente` VARCHAR(45) NULL,
  `documento_cliente` VARCHAR(20) NULL,
  `email_cliente` VARCHAR(45) NULL,
  PRIMARY KEY (`id_cliente`));


-- -----------------------------------------------------
-- Table `grafitti_papeleria`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grafitti_papeleria`.`venta` (
  `id_venta_producto` INT NOT NULL,
  `valor_venta` DOUBLE NULL,
  `fecha_venta` DATE NULL,
  `id_cliente` INT NULL,
  `id_vendedor` INT NULL,
  `iva_venta` FLOAT NULL,
  PRIMARY KEY (`id_venta_producto`),
  CONSTRAINT `id_venta_vendedor_fk`
    FOREIGN KEY (`id_vendedor`)
    REFERENCES `grafitti_papeleria`.`vendedor` (`id_vendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_venta_cliente_fk`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `grafitti_papeleria`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `grafitti_papeleria`.`venta_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grafitti_papeleria`.`venta_producto` (
  `id_producto` INT NULL,
  `id_venta_producto` INT NULL,
  CONSTRAINT `id-venta_producto_producto_fk`
    FOREIGN KEY (`id_producto`)
    REFERENCES `grafitti_papeleria`.`producto` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_venta_producto_venta_fk`
    FOREIGN KEY (`id_venta_producto`)
    REFERENCES `grafitti_papeleria`.`venta` (`id_venta_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `grafitti_papeleria`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grafitti_papeleria`.`proveedor` (
  `id_proveedor` INT NOT NULL,
  `nombre_proveedor` VARCHAR(45) NULL,
  `telefono_proveedor` DOUBLE NULL,
  `direccion_proveedor` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`id_proveedor`));


-- -----------------------------------------------------
-- Table `grafitti_papeleria`.`compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grafitti_papeleria`.`compra` (
  `id_compra_producto` INT NOT NULL,
  `fecha_compra` DATE NULL,
  `valor_compra` DOUBLE NULL,
  `id_proveedor` INT NULL,
  `cantidad_compra` FLOAT NULL,
  `precio_compra_total` DOUBLE NULL,
  PRIMARY KEY (`id_compra_producto`),
  CONSTRAINT `id_compra_producto_proveedor_fk`
    FOREIGN KEY (`id_proveedor`)
    REFERENCES `grafitti_papeleria`.`proveedor` (`id_proveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `grafitti_papeleria`.`compra_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grafitti_papeleria`.`compra_producto` (
  `id_compra_producto` INT NULL,
  `id_producto` INT NULL,
  CONSTRAINT `id-compra_producto_producto_fk`
    FOREIGN KEY (`id_producto`)
    REFERENCES `grafitti_papeleria`.`producto` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_compra_producto_compra_fk`
    FOREIGN KEY (`id_compra_producto`)
    REFERENCES `grafitti_papeleria`.`compra` (`id_compra_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);