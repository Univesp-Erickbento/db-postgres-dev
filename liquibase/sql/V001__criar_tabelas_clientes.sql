--liquibase formatted sql

--changeset db-postgres-dev-erickbento:001
CREATE TABLE tb_clientes (
    id BIGSERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255),
    cpf CHAR(11),
    rg VARCHAR(50),
    genero VARCHAR(50),
    perfis VARCHAR(255),
    email VARCHAR(255),
    contato VARCHAR(50),
    data_nascimento DATE,
    data_cadastro DATE DEFAULT CURRENT_DATE,
    pessoa_id BIGINT NOT NULL,
    cliente_reg VARCHAR(255),
    ativo BOOLEAN DEFAULT TRUE NOT NULL
);

--changeset db-postgres-dev-erickbento:002
CREATE UNIQUE INDEX uq_tb_clientes_cpf ON tb_clientes(cpf);
CREATE UNIQUE INDEX uq_tb_clientes_email ON tb_clientes(email);
