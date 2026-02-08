/* Projeto Lógico BDEmpressal_06-02-26: */

CREATE TABLE TBMotorista_RP307627X (
    IDMotorista int PRIMARY KEY,
    NomeMotorista varchar(50),
    CPFMotorista int,
    Endereco varchar(50),
    Numero int,
    Bairro varchar(50),
    CEP int,
    CodCidade int
);

CREATE TABLE TBCidade_RP307627X (
    IDCidade int PRIMARY KEY,
    NomeCidade varchar(50),
    CodUF varchar(2)
);

CREATE TABLE TBEstado_RP307627X (
    IDUF varchar(2) PRIMARY KEY,
    NomeEstado varchar(50)
);

CREATE TABLE TBEmpresa_RP307627X (
    IDEmpresa int PRIMARY KEY,
    NomeEmpresa varchar(50),
    Telefone int,
    CodCidade int
);

CREATE TABLE TBCarro_RP307627X (
    IDPlaca varchar(7) PRIMARY KEY,
    Marca varchar(50),
    Modelo varchar(50),
    CodEmpresa int
);

CREATE TABLE TBMotoristaCarro_RP307627X (
    CodMotorista int,
    CodPlaca varchar(7),
    DataUso datetime,
    KMInicial int,
    KMFinal int,
    AtividadesRealizadas varchar(300),
    PRIMARY KEY (CodMotorista, CodPlaca)
);
 
ALTER TABLE TBMotorista_RP307627X ADD CONSTRAINT FK_TBMotorista_RP307627X_2
    FOREIGN KEY (CodCidade)
    REFERENCES TBCidade_RP307627X (IDCidade);
 
ALTER TABLE TBCidade_RP307627X ADD CONSTRAINT FK_TBCidade_RP307627X_2
    FOREIGN KEY (CodUF)
    REFERENCES TBEstado_RP307627X (IDUF);
 
ALTER TABLE TBEmpresa_RP307627X ADD CONSTRAINT FK_TBEmpresa_RP307627X_2
    FOREIGN KEY (CodCidade)
    REFERENCES TBCidade_RP307627X (IDCidade);
 
ALTER TABLE TBCarro_RP307627X ADD CONSTRAINT FK_TBCarro_RP307627X_2
    FOREIGN KEY (CodEmpresa)
    REFERENCES TBEmpresa_RP307627X (IDEmpresa);
 
ALTER TABLE TBMotoristaCarro_RP307627X ADD CONSTRAINT FK_TBMotoristaCarro_RP307627X_2
    FOREIGN KEY (CodMotorista)
    REFERENCES TBMotorista_RP307627X (IDMotorista);
 
ALTER TABLE TBMotoristaCarro_RP307627X ADD CONSTRAINT FK_TBMotoristaCarro_RP307627X_3
    FOREIGN KEY (CodPlaca)
    REFERENCES TBCarro_RP307627X (IDPlaca);