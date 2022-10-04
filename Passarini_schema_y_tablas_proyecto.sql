CREATE SCHEMA cheques;

USE cheques;

CREATE TABLE estado_cheque(
	idEstadoCheque INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    estado VARCHAR (24) NOT NULL,
    observaciones VARCHAR(255)
);

CREATE TABLE proveedores(
	idProveedor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombreProveedor VARCHAR (255) NOT NULL
);

CREATE TABLE bancos(
	idBanco INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombreBanco VARCHAR (24) NOT NULL
);

CREATE TABLE firmante(
	idFirmante INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombreFirmante VARCHAR (24) NOT NULL
);

CREATE TABLE clientes(
	idCLiente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombreCliente VARCHAR (255) NOT NULL
);

CREATE TABLE destino_cheque_t(
	idDestinoCheque INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    destinoCheque VARCHAR (24) NOT NULL
);

CREATE TABLE cuentas(
	idCuenta INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nroCuenta VARCHAR (24),
    idBanco INT NOT NULL,
    FOREIGN KEY (idBanco) REFERENCES bancos(idBanco)
);

CREATE TABLE cheques_propios(
	idCheque INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nroCheque NUMERIC(22,0) NOT NULL,
    fechaEmision DATE NOT NULL,
    idProveedor INT NOT NULL,
    idBanco INT NOT NULL, 
    idCuenta INT NOT NULL, 
    fechaCobro DATE NOT NULL, 
    idEstadoCheque INT NOT NULL, 
    fechaCobroEfectivo DATE, 
    idFirmante INT NOT NULL,
    FOREIGN KEY (idProveedor) REFERENCES proveedores(idProveedor),
    FOREIGN KEY (idBanco) REFERENCES bancos(idBanco),
    FOREIGN KEY (idCuenta) REFERENCES cuentas(idCuenta),
    FOREIGN KEY (idEstadoCheque) REFERENCES estado_cheque(idEstadoCheque),
	FOREIGN KEY (idFirmante) REFERENCES firmante(idFirmante)
);

CREATE TABLE cheques_de_terceros(
	idChequeTerceros INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nroCheque NUMERIC(22,0) NOT NULL,
    fechaEmision DATE NOT NULL,
    idProveedor INT,
    idBanco INT NOT NULL, 
    idCuenta INT, 
    fechaCobro DATE NOT NULL, 
    idCliente INT NOT NULL,
    idDestinoCheque INT NOT NULL,
    FOREIGN KEY (idProveedor) REFERENCES proveedores(idProveedor),
    FOREIGN KEY (idBanco) REFERENCES bancos(idBanco),
    FOREIGN KEY (idCuenta) REFERENCES cuentas(idCuenta),
    FOREIGN KEY (idCliente) REFERENCES clientes(idCliente),
    FOREIGN KEY (idDestinoCheque) REFERENCES destino_cheque_t(idDestinoCheque)
);