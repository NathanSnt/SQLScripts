/*
----   COMANDOS MYSQL   ----
show databases; -- Lista os bancos de dados existentes
show tables; -- Lista todas as tabelas de um banco de dados
use <nome do banco de dados>; -- seleciona um banco de dados
desc <table>; -- descreve os campos de uma tabela
source <endereço>; executa um script
*/

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
senha VARCHAR(20),
PRIMARY KEY(codUsu)
);

CREATE TABLE tbProdutos(
codProd INT AUTO_INCREMENT,
descricao VARCHAR(50),
preco DECIMAL(9, 2),
validade DATE,
quantidade INT,
tipo VARCHAR(10),
PRIMARY KEY(codProd)
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

INSERT INTO tbProdutos(descricao, preco, validade, quantidade, tipo)
VALUES('Banana', 20.50, '2022-11-07', 12, 'Dúzia');

INSERT INTO tbProdutos(descricao, preco, validade, quantidade, tipo)
VALUES('Banana', 10.25, '2022-11-07', 6, 'Meia-Dúzia');

INSERT INTO tbProdutos(descricao, preco, validade, quantidade, tipo)
VALUES('Banana', 15.50, '2022-11-07', 08, 'Unidade');

INSERT INTO tbProdutos(descricao, preco, validade, quantidade, tipo)
VALUES('Melância', 30.00, '2022-11-30', 1, 'Unidade');

INSERT INTO tbProdutos(descricao, preco, validade, quantidade, tipo)
VALUES('Morango', 10.50, '2022-11-08', 1, 'Caixa');

-- Visualizando registros
SELECT * FROM tbFuncionarios;
SELECT * FROM tbUsuarios;
SELECT * FROM tbProdutos;

-- Busca por código
SELECT * FROM tbProdutos WHERE codProd = 2;

-- Busca por nome
SELECT * FROM tbProdutos WHERE descricao LIKE 'melancia%';

-- TIPO DE LIKE (%termo, termo% e %termo%)
-- %nome Retorna tudo que termina com o termo nome
-- nome% Retorna tudo que começa com o termo nome
-- %nome% Retorna tudo que contém nome

-- Alterando os registros
UPDATE tbUsuarios SET senha = 'SenhaMuitoForte' WHERE codUsu = 1;
-- SELECT * FROM tbUsuarios;

-- Excluindo registros
-- DELETE FROM tbUsuarios WHERE codUsu = 2;
-- SELECT * FROM tbUsuarios;

UPDATE tbprodutos SET preco = preco * 1.10 WHERE preco > 11;

SELECT * FROM tbProdutos;

-- Exibir sem repetir valores
SELECT DISTINCT descricao FROM tbProdutos;
