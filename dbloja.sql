-- Apagar banco de dados
DROP DATABASE dbLoja;

-- Criando banco de dados
CREATE DATABASE dbLoja;

-- Visualizar banco de dados
SHOW DATABASES;

-- Acessar banco de dados
USE dbLoja;

-- Criando tabelas
CREATE TABLE tbFuncionarios(
codFunc INT AUTO_INCREMENT,
nome VARCHAR(50),
email VARCHAR(50),
cpf CHAR(14),
tel CHAR(10),
PRIMARY KEY(codFunc)
);

CREATE TABLE tbUsuarios(
codUsu INT AUTO_INCREMENT,
nome VARCHAR(15),
senha VARCHAR(14),
PRIMARY KEY(codUsu)
);

-- Visualizar tabelas
SHOW TABLES;

-- Visualizar estruturas das tabelas
DESC tbFuncionarios;
DESC tbUsuarios;

-- Inserindo valores
INSERT INTO tbFuncionarios(nome, email, cpf, tel)
VALUES ('Maria da Piedade', 'maria.p@outlook.com', '255.255.255.30', '94321-4321');

INSERT INTO tbFuncionarios(nome, email, cpf, tel)
VALUES ('José Maranhao', 'jose.m@outlook.com', '10.127.192.55', '91234-1234');

INSERT INTO tbUsuarios(nome, senha)
VALUES('maria.piedade', '12431243');

INSERT INTO tbUsuarios(nome, senha)
VALUES('jose.marahnao', '43214321');

-- Visualizando registros
SELECT * FROM tbFuncionarios;
SELECT * FROM tbUsuarios;