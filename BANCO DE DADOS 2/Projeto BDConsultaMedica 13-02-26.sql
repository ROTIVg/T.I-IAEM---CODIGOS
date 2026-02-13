/* Projeto BDConsultaMedica 13-02-26: */

CREATE TABLE TBEstado (
    IDUF varchar(2) PRIMARY KEY,
    NomeEstado varchar(50)
);

CREATE TABLE TBCidade (
    IDCidade int PRIMARY KEY,
    NomeCidade varchar(50),
    CodUF varchar(2)
);

CREATE TABLE TBMedico (
    IDCRMMedico int PRIMARY KEY,
    NomeMedico varchar(50),
    DataNascimento date,
    Sexo varchar(1),
    CodCidade int
);

CREATE TABLE TBPaciente (
    IDPaciente int (Chave Primária) PRIMARY KEY,
    NomePaciente varchar(50),
    DataNascimento date,
    Sexo varchar(1),
    Endereco varchar(50),
    Bairro varchar(50),
    CEP int,
    CodCidade int
);

CREATE TABLE TBFuncionario (
    IDFuncionario int PRIMARY KEY,
    NomeFuncionario varchar(50),
    DataNascimento date,
    Sexo varchar(1),
    Endereco varchar(50),
    Bairro varchar(50),
    CEP int,
    DataAdmissao date,
    Salario decimal(10,2),
    CodCidade int
);

CREATE TABLE TBEspecialidade (
    IDEspecialidade int PRIMARY KEY,
    NomeEspecialidade varchar(40)
);

CREATE TABLE TBConvenioMedico (
    IDConvenioMedico int PRIMARY KEY,
    NomeConvenio varchar(50),
    ValorConsulta decimal(10,2)
);

CREATE TABLE TBMedicoEspecialidade (
    CodCRM int,
    CodEspecialidade int,
    Data date,
    PRIMARY KEY (CodCRM, CodEspecialidade)
);

CREATE TABLE TBConsultaMedica (
    IDConsultaMedica int PRIMARY KEY,
    DataConsulta date,
    Valor decimal(10,2),
    Observacao varchar(200),
    CodPaciente int,
    CodFuncionario int,
    CodConvenio int,
    CodEspecialidade int,
    CodMedico int
);
 
ALTER TABLE TBCidade ADD CONSTRAINT FK_TBCidade_2
    FOREIGN KEY (CodUF)
    REFERENCES TBEstado (IDUF);
 
ALTER TABLE TBMedico ADD CONSTRAINT FK_TBMedico_2
    FOREIGN KEY (CodCidade)
    REFERENCES TBCidade (IDCidade);
 
ALTER TABLE TBPaciente ADD CONSTRAINT FK_TBPaciente_2
    FOREIGN KEY (CodCidade)
    REFERENCES TBCidade (IDCidade);
 
ALTER TABLE TBFuncionario ADD CONSTRAINT FK_TBFuncionario_2
    FOREIGN KEY (CodCidade)
    REFERENCES TBCidade (IDCidade);
 
ALTER TABLE TBMedicoEspecialidade ADD CONSTRAINT FK_TBMedicoEspecialidade_2
    FOREIGN KEY (CodCRM)
    REFERENCES TBMedico (IDCRMMedico);
 
ALTER TABLE TBMedicoEspecialidade ADD CONSTRAINT FK_TBMedicoEspecialidade_3
    FOREIGN KEY (CodEspecialidade)
    REFERENCES TBEspecialidade (IDEspecialidade);
 
ALTER TABLE TBConsultaMedica ADD CONSTRAINT FK_TBConsultaMedica_2
    FOREIGN KEY (CodPaciente)
    REFERENCES TBPaciente (IDPaciente);
 
ALTER TABLE TBConsultaMedica ADD CONSTRAINT FK_TBConsultaMedica_3
    FOREIGN KEY (CodFuncionario)
    REFERENCES TBFuncionario (IDFuncionario);
 
ALTER TABLE TBConsultaMedica ADD CONSTRAINT FK_TBConsultaMedica_4
    FOREIGN KEY (CodConvenio)
    REFERENCES TBConvenioMedico (IDConvenioMedico);
 
ALTER TABLE TBConsultaMedica ADD CONSTRAINT FK_TBConsultaMedica_5
    FOREIGN KEY (CodEspecialidade)
    REFERENCES TBEspecialidade (IDEspecialidade);
 
ALTER TABLE TBConsultaMedica ADD CONSTRAINT FK_TBConsultaMedica_6
    FOREIGN KEY (CodMedico)
    REFERENCES TBMedico (IDCRMMedico);