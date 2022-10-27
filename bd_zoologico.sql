CREATE DATABASE zoologico;

USE zoologico;
CREATE TABLE animais(
codigo INT,
tipo CHAR(15),
nome CHAR(30),
idade TINYINT,
valor DECIMAL(10,2)
);

INSERT INTO animais(codigo, tipo, nome, idade, valor) VALUES (1, 'cachorro', 'Djudi', 3, 300.00);
INSERT INTO animais(codigo, tipo, nome, idade, valor) VALUES (2, 'cachorro', 'Sula', 5, 300.00);
INSERT INTO animais(codigo, tipo, nome, idade, valor) VALUES (3, 'cachorro', 'Sarina', 7, 300.00);
INSERT INTO animais(codigo, tipo, nome, idade, valor) VALUES (4, 'gato', 'Pipa', 2, 500.00);
INSERT INTO animais(codigo, tipo, nome, idade, valor) VALUES (5, 'gato', 'Sarangue', 2, 500.00);
INSERT INTO animais(codigo, tipo, nome, idade, valor) VALUES (6, 'gato', 'Clarences', 1, 500.00);
INSERT INTO animais(codigo, tipo, nome, idade, valor) VALUES (7, 'coruja', 'Agnes', 0, 700.00);
INSERT INTO animais(codigo, tipo, nome, idade, valor) VALUES (8, 'coruja', 'Arabela', 1, 700.00);
INSERT INTO animais(codigo, tipo, nome, idade, valor) VALUES (9, 'sapo', 'Quash', 1, 100.00);
INSERT INTO animais(codigo, tipo, nome, idade, valor) VALUES (10, 'peixe', 'Fish', 0, 100.00);

SELECT * FROM animais;

SELECT tipo, nome FROM animais;
SELECT tipo, nome, idade FROM animais;

SELECT tipo AS "Tipo de Animal", nome AS "Nome do Animal" FROM animais;
SELECT tipo AS "Tipo de Animal", nome AS "Nome do Animal", idade as "Tempo de Vida" FROM animais;

ALTER TABLE animais ADD COLUMN (procedencia CHAR(17));

UPDATE animais SET procedencia = 'Animal Doméstico';

SELECT procedencia, tipo, nome, idade as 'Tempo de Vida' FROM  animais;

ALTER TABLE animais ADD COLUMN (venda decimal(10, 2));

UPDATE animais SET venda = valor + valor * 0.1;

SELECT tipo, nome, idade, valor AS 'Valor Original', venda AS 'Valor de Venda' FROM animais;

SELECT tipo, valor AS 'Valor Original', venda AS 'Valor de Venda' FROM animais GROUP BY tipo;