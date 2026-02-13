/* Projeto Lógico BDEditora_13-02-26: */

CREATE TABLE TBEstado (
    IDUF varchar(2) PRIMARY KEY,
    NomeEstado varchar(50)
);

CREATE TABLE TBCidade (
    IDCidade int PRIMARY KEY,
    NomeCidade varchar(50),
    PontosTuristicos varchar(100),
    CodUF varchar(2)
);

CREATE TABLE TBAutor (
    IDAutor int PRIMARY KEY,
    NomeAutor varchar(50),
    Endereco varchar(50),
    Telefone int,
    RG int,
    CPF int,
    Email varchar(50),
    CodCidade int
);

CREATE TABLE TBEditora (
    IDEditora int PRIMARY KEY,
    NomeEditora varchar(50),
    Endereco varchar(50),
    Telefone bigint,
    CNPJ bigint,
    Email varchar(50),
    Site varchar(50),
    CodCidade int
);

CREATE TABLE TBPrateleira (
    IDPrateleira int PRIMARY KEY,
    Descricao varchar(50)
);

CREATE TABLE TBAssunto (
    IDAssunto int PRIMARY KEY,
    Observacao varchar(50),
    Descricao varchar(50)
);

CREATE TABLE TBLivro (
    IDLivro int PRIMARY KEY,
    Titulo varchar(50),
    Ano int,
    Edicao int,
    ISBN varchar(20),
    CodEditora int,
    CodPrateleira int
);

CREATE TABLE TBAutorLivro (
    CodLivro int,
    CodAutor int,
    DataPublicacao datetime,
    PRIMARY KEY (CodLivro, CodAutor)
);

CREATE TABLE TBLivroAssunto (
    CodAssunto int ),
    CodLivro int,
    Data datetime,
    PRIMARY KEY (CodAssunto, CodLivro)
);
 
ALTER TABLE TBCidade ADD CONSTRAINT FK_TBCidade_2
    FOREIGN KEY (CodUF)
    REFERENCES TBEstado (IDUF);
 
ALTER TABLE TBAutor ADD CONSTRAINT FK_TBAutor_2
    FOREIGN KEY (CodCidade)
    REFERENCES TBCidade (IDCidade);
 
ALTER TABLE TBEditora ADD CONSTRAINT FK_TBEditora_2
    FOREIGN KEY (CodCidade)
    REFERENCES TBCidade (IDCidade);
 
ALTER TABLE TBLivro ADD CONSTRAINT FK_TBLivro_2
    FOREIGN KEY (CodPrateleira)
    REFERENCES TBPrateleira (IDPrateleira);
 
ALTER TABLE TBLivro ADD CONSTRAINT FK_TBLivro_3
    FOREIGN KEY (CodEditora)
    REFERENCES TBEditora (IDEditora);
 
ALTER TABLE TBAutorLivro ADD CONSTRAINT FK_TBAutorLivro_2
    FOREIGN KEY (CodLivro)
    REFERENCES TBLivro (IDLivro);
 
ALTER TABLE TBAutorLivro ADD CONSTRAINT FK_TBAutorLivro_3
    FOREIGN KEY (CodAutor)
    REFERENCES TBAutor (IDAutor);
 
ALTER TABLE TBLivroAssunto ADD CONSTRAINT FK_TBLivroAssunto_2
    FOREIGN KEY (CodAssunto)
    REFERENCES TBAssunto (IDAssunto);
 
ALTER TABLE TBLivroAssunto ADD CONSTRAINT FK_TBLivroAssunto_3
    FOREIGN KEY (CodLivro)
    REFERENCES TBLivro (IDLivro);