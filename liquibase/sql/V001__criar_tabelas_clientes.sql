--liquibase formatted sql

--changeset postgres-dev-erickbento:001
CREATE TABLE tb_pessoas (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    sobrenome VARCHAR(255),
    cpf VARCHAR(15),
    rg VARCHAR(15),
    genero VARCHAR(50),
    Perfis VARCHAR(255),
    email VARCHAR(255),
    contato VARCHAR(50),
    dataNascimento DATE,
    dataCadastro DATE DEFAULT CURRENT_DATE
);

--changeset postgres-dev-erickbento:002
CREATE TABLE tb_clientes (
    id SERIAL PRIMARY KEY,
    pessoa_id BIGINT NOT NULL,
    clienteReg VARCHAR(50),
    clienteStatus VARCHAR(50)
);

--changeset postgres-dev-erickbento:003
CREATE TABLE tb_enderecos (
    id SERIAL PRIMARY KEY,
    pessoa_id BIGINT NOT NULL,
    cep VARCHAR(10) NOT NULL,
    logradouro VARCHAR(255) NOT NULL,
    numero VARCHAR(20),
    complemento VARCHAR(255),
    bairro VARCHAR(100),
    localidade VARCHAR(100),
    estado VARCHAR(2),
    pais VARCHAR(100),
    perfil VARCHAR(50),
    tipo_de_endereco VARCHAR(50),
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--changeset postgres-dev-erickbento:004
CREATE TABLE tb_funcionarios (
    id SERIAL PRIMARY KEY,
    pessoa_id BIGINT NOT NULL,
    funcionarioTipo VARCHAR(50),
    funcionarioReg VARCHAR(50),
    funcionarioStatus VARCHAR(50),
    data_de_admissao DATE,
    data_de_demissao DATE
);

--changeset postgres-dev-erickbento:005
CREATE TABLE tb_login (
    id SERIAL PRIMARY KEY,
    pessoa_id BIGINT NOT NULL,
    nomeUsuario VARCHAR(255),
    senha VARCHAR(255),
    perfis VARCHAR(255)
);
