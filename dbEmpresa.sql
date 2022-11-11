DROP DATABASE DB_EMPRESA;
CREATE DATABASE DB_EMPRESA;
USE DB_EMPRESA;

CREATE TABLE TB_FUNCIONARIOS(
COD_FUNC INT NOT NULL AUTO_INCREMENT,
NOME VARCHAR(100),
EMAIL VARCHAR(100),
CPF CHAR(14) NOT NULL UNIQUE,
SALARIO DECIMAL(9,2) NOT NULL DEFAULT 0 CHECK(SALARIO >= 0),
SEXO CHAR(1) DEFAULT 'F' CHECK(SEXO IN ('F', 'M')),
PRIMARY KEY(COD_FUNC)
);

CREATE TABLE TB_USUARIOS(
COD_USU INT NOT NULL AUTO_INCREMENT,
NOME VARCHAR(20) NOT NULL,
SENHA VARCHAR(20) NOT NULL,
COD_FUNC INT NOT NULL,
PRIMARY KEY(COD_USU),
FOREIGN KEY(COD_FUNC) REFERENCES TB_FUNCIONARIOS(COD_FUNC)
);

CREATE TABLE TB_PRODUTOS(
COD_PROD INT NOT NULL AUTO_INCREMENT,
DESCRICAO VARCHAR(100),
QUANTIDADE INT DEFAULT 0 CHECK(QUANTIDADE >= 0),
VALOR DECIMAL(9,2) CHECK(VALOR >= 0),
COD_USU INT NOT NULL,
PRIMARY KEY(COD_PROD),
FOREIGN KEY(COD_USU) REFERENCES TB_USUARIOS(COD_USU)
);

DESC TB_PRODUTOS;
DESC TB_USUARIOS;
DESC TB_FUNCIONARIOS;

INSERT INTO TB_FUNCIONARIOS(NOME, EMAIL, CPF, SALARIO, SEXO) VALUES
('Paulo Miranda da Silva', 'paulo.msilva@hotmail.com', '258.247.248-00', '1500.00', 'M'),
('Maria do Carmo Oliveira', 'maria.coliveira@gmail.com', '123.123.123-44', '3500.00', 'F'),
('Nathan Souza de Abreu', 'nathan.sabreu@outlook.com', '234.234.234-99', '3250.00', 'M');

INSERT INTO TB_USUARIOS(NOME, SENHA, COD_FUNC) VALUES
('nathan.sabreu', 'TroqueASenha', 3),
('maria.coliveira', 'TroqueASenha', 2),
('paulo.msilva', 'TroqueASenha', 1);

INSERT INTO TB_PRODUTOS(DESCRICAO, QUANTIDADE, VALOR, COD_USU) VALUES
('Morango', 20, 35.00, 2),
('Laranja', 6, 9.90, 1),
('Banana', 12, 10.50, 3);

SELECT * FROM TB_FUNCIONARIOS;
SELECT * FROM TB_USUARIOS;
SELECT * FROM TB_PRODUTOS;

SELECT PROD.DESCRICAO AS PRODUTO, USU.NOME AS USUARIO, 
FUNC.NOME AS 'NOME COMPLETO' FROM TB_PRODUTOS AS PROD
INNER JOIN TB_USUARIOS AS USU ON PROD.COD_USU = USU.COD_USU
INNER JOIN TB_FUNCIONARIOS AS FUNC ON USU.COD_FUNC = FUNC.COD_FUNC;