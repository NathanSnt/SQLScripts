DROP DATABASE   DB_CDS;
CREATE DATABASE DB_CDS;
USE DB_CDS;

CREATE TABLE ARTISTAS(
COD_ART	 INT NOT NULL AUTO_INCREMENT,
NOME_ART VARCHAR(100) NOT NULL,

PRIMARY KEY(COD_ART),
UNIQUE(NOME_ART)
);

CREATE TABLE GRAVADORAS(
COD_GRAV INT NOT NULL AUTO_INCREMENT,
NOME_GRAV VARCHAR(50) NOT NULL,

PRIMARY KEY(COD_GRAV),
UNIQUE(NOME_GRAV)
);

CREATE TABLE CATEGORIAS(
COD_CAT  INT NOT NULL AUTO_INCREMENT,
NOME_CAT VARCHAR(50) NOT NULL,

PRIMARY KEY(COD_CAT),
UNIQUE(NOME_CAT)
);

CREATE TABLE ESTADOS(
SIGLA_EST CHAR(2) NOT NULL,
NOME_EST  VARCHAR(50) NOT NULL,

PRIMARY KEY(SIGLA_EST),
UNIQUE(NOME_EST)
);

CREATE TABLE CIDADES(
COD_CID   INT NOT NULL AUTO_INCREMENT,
SIGLA_EST CHAR(2) NOT NULL,
NOME_CID VARCHAR(50) NOT NULL,

PRIMARY KEY(COD_CID),
FOREIGN KEY(SIGLA_EST) REFERENCES ESTADOS(SIGLA_EST)
);

CREATE TABLE CLIENTES(
COD_CLI INT NOT NULL AUTO_INCREMENT,
COD_CID INT NOT NULL,
NOME_CLI VARCHAR(50) NOT NULL,
END_CLI VARCHAR(100) NOT NULL,
RENDA_CLI DECIMAL(9,2) NOT NULL DEFAULT 0,
SEXO_CLI CHAR(1) NOT NULL DEFAULT 'F',

PRIMARY KEY(COD_CLI),
FOREIGN KEY(COD_CID) REFERENCES CIDADES(COD_CID),
CHECK(RENDA_CLI >= 0),
CHECK(SEXO_CLI IN ('F', 'M'))
);

CREATE TABLE CONJUGES(
COD_CONJ INT NOT NULL AUTO_INCREMENT,
COD_CLI  INT NOT NULL,
NOME_CONJ  VARCHAR(50) NOT NULL,
RENDA_CONJ DECIMAL(9,2) NOT NULL DEFAULT 0,
SEXO_CONJ  CHAR(1) NOT NULL DEFAULT 'F',

PRIMARY KEY(COD_CONJ),
FOREIGN KEY(COD_CLI) REFERENCES CLIENTES(COD_CLI),
CHECK(RENDA_CONJ >= 0),
CHECK(SEXO_CONJ IN('F', 'M'))
);

CREATE TABLE FUNCIONARIOS(
COD_FUNC  INT NOT NULL AUTO_INCREMENT,
NOME_FUNC VARCHAR(50)  NOT NULL,
END_FUNC  VARCHAR(100) NOT NULL,
SAL_FUNC  DECIMAL(9,2) NOT NULL DEFAULT 0,
SEXO_FUNC CHAR(1) NOT NULL DEFAULT 'F',

PRIMARY KEY(COD_FUNC),
CHECK(SAL_FUNC >= 0),
CHECK(SEXO_FUNC IN('F', 'M'))
);

CREATE TABLE DEPENDENTES(
COD_DEP  INT NOT NULL AUTO_INCREMENT,
COD_FUNC INT NOT NULL,
NOME_DEP VARCHAR(100) NOT NULL,
SEXO_DEP CHAR(1) NOT NULL DEFAULT 'F',

PRIMARY KEY(COD_DEP),
FOREIGN KEY(COD_FUNC) REFERENCES FUNCIONARIOS(COD_FUNC),
CHECK(SEXO_DEP IN('F', 'M'))
);

CREATE TABLE TITULOS(
COD_TIT  INT NOT NULL AUTO_INCREMENT,
COD_CAT  INT NOT NULL,
COD_GRAV INT NOT NULL,
NOME_CD VARCHAR(50) NOT NULL,
VAL_CD DECIMAL(9,2) NOT NULL,
QTD_ESTQ INT NOT NULL,

PRIMARY KEY(COD_TIT),
FOREIGN KEY(COD_CAT)  REFERENCES CATEGORIAS(COD_CAT),
FOREIGN KEY(COD_GRAV) REFERENCES GRAVADORAS(COD_GRAV),
UNIQUE(NOME_CD),
CHECK(VAL_CD > 0),
CHECK(QTD_ESTQ >= 0)
);

CREATE TABLE PEDIDOS(
NUM_PED  INT NOT NULL AUTO_INCREMENT,
COD_CLI  INT NOT NULL,
COD_FUNC INT NOT NULL,
DATA_PED DATE NOT NULL,
VAL_PED  DECIMAL(9,2) NOT NULL DEFAULT 0,

PRIMARY KEY(NUM_PED),
FOREIGN KEY(COD_CLI)  REFERENCES CLIENTES(COD_CLI),
FOREIGN KEY(COD_FUNC) REFERENCES FUNCIONARIOS(COD_FUNC),
CHECK(VAL_PED >= 0)
);

CREATE TABLE TITULOS_PEDIDO(
NUM_PED INT NOT NULL,
COD_TIT INT NOT NULL,
QTD_CD  INT NOT NULL, 
VAL_CD DECIMAL(9,2) NOT NULL,

PRIMARY KEY(NUM_PED, COD_TIT),
FOREIGN KEY(NUM_PED) REFERENCES PEDIDOS(NUM_PED),
FOREIGN KEY(COD_TIT) REFERENCES TITULOS(COD_TIT),
CHECK(QTD_CD >= 1),
CHECK(VAL_CD > 0)
);

CREATE TABLE TITULOS_ARTISTA(
COD_TIT INT NOT NULL,
COD_ART INT NOT NULL,

PRIMARY KEY(COD_TIT, COD_ART),
FOREIGN KEY(COD_TIT) REFERENCES TITULOS(COD_TIT),
FOREIGN KEY(COD_ART) REFERENCES ARTISTAS(COD_ART)
);

/*
DESC ARTISTAS;
DESC GRAVADORAS;
DESC CATEGORIAS;
DESC ESTADOS;
DESC CIDADES;
DESC CLIENTES;
DESC CONJUGES;
DESC FUNCIONARIOS;
DESC DEPENDENTES;
DESC TITULOS;
DESC PEDIDOS;
DESC TITULOS_PEDIDO;
DESC TITULOS_ARTISTA;
*/

INSERT INTO ARTISTAS(NOME_ART) VALUES
('MARISA MONTE'),
('GILBERTO GIL'),
('CAETANO VELOSO'),
('MILTON NASCIMENTO'),
('LEGIÃO URBANA'),
('THE BEATLES'),
('RITA LEE');

INSERT INTO GRAVADORAS(NOME_GRAV) VALUES
('POLYGRAM'),
('EMI'),
('SOM LIVRE'),
('SOM MUSIC');

INSERT INTO CATEGORIAS(NOME_CAT) VALUES
('MPB'),
('TRILHA SONORA'),
('ROCK INTERNACIONAL'),
('ROCK NACIONAL');

INSERT INTO ESTADOS(SIGLA_EST, NOME_EST) VALUES
('SP', 'SÃO PAULO'),
('MG', 'MINAS GERAIS'),
('RJ', 'RIO DE JANEIRO'),
('ES', 'ESPÍRITO SANTO');

INSERT INTO CIDADES(SIGLA_EST, NOME_CID) VALUES
('SP', 'SÃO PAULO'),
('SP', 'SOROCABA'),
('SP', 'JUNDIAÍ'),
('SP', 'AMERICANA'),
('SP', 'ARARAQUARA'),
('MG', 'OURO PRETO'),
('ES', 'CACHOEIRA DO ITAPEMIRIM');

INSERT INTO CLIENTES(COD_CID, NOME_CLI, END_CLI, RENDA_CLI, SEXO_CLI) VALUES
(1 ,'JOSÉ NOGUEIRA', 'RUA A', '1500.00', 'M'),
(1 ,'ÂNGELO PEREIRA', 'RUA B', '2000.00', 'M'),
(1 ,'ALÉM MAR PARANHOS', 'RUA C', '1500.00', 'M'),
(1 ,'CATARINA SOUZA', 'RUA D', '892.00', 'F'),
(1 ,'VAGNER COSTA', 'RUA E', '950.00', 'M'),
(2 ,'ANTENOR DA COSTA', 'RUA F', '1582.00', 'M'),
(2 ,'MARIA AMÉLIA DE SOUZA', 'RUA G', '1152.00', 'F'),
(2 ,'PAULO ROBERTO SILVA', 'RUA H', '3250.00', 'M'),
(3 ,'FÁTIMA SOUZA', 'RUA I', '1632.00', 'F'),
(3 ,'JOEL DA ROCHA', 'RUA J', '2000.00', 'M');

INSERT INTO CONJUGES(COD_CLI, NOME_CONJ, RENDA_CONJ, SEXO_CONJ) VALUES
(1 , 'CARLA NOGUEIRA' , '2500.00', 'F'),
(2 , 'EMILIA PEREIRA' , '5500.00', 'F'),
(6 , 'ALTIVA DA COSTA', '3000.00', 'F'),
(7 , 'CARLOS DE SOUZA', '3250.00', 'M');

INSERT INTO FUNCIONARIOS(NOME_FUNC, END_FUNC, SAL_FUNC, SEXO_FUNC) VALUES
('VÂNIA GABRIELA PEREIRA', 'RUA A', '2500.00', 'F'),
('NORBERTO PEREIRA DA SILVA', 'RUA B', '300.00', 'M'),
('OLAVO LINHARES', 'RUA C', '580.00', 'M'),
('PAULA DA SILVA', 'RUA D', '3000.00', 'F'),
('ROLANDO ROCHA', 'RUA E', '2000.00', 'M'),
('MARTIN LUTHER KING JR', 'RUA F', '2850.00', 'M'),
('OSAMA BIN LADEN', 'RUA G', '3210.00', 'M');

INSERT INTO DEPENDENTES(COD_FUNC, NOME_DEP, SEXO_DEP) VALUES
(1 , 'ANA PEREIRA', 'F'),
(1 , 'ROBERTO PEREIRA', 'M'),
(1 , 'CELSO PEREIRA', 'M'),
(3 , 'BRISA LINHARES', 'F'),
(3 , 'MARIO SOL LINHARES', 'F'),
(4 , 'SONIA DA SILVA', 'F');

INSERT INTO TITULOS(COD_CAT, COD_GRAV, NOME_CD, VAL_CD, QTD_ESTQ) VALUES
(1 ,1 , 'TRIBALISTAS', '30.00', '1500'),
(1 ,2 , 'TROPICÁLIA', '50.00', '500'),
(1 ,1 , 'AQUELE ABRAÇO', '50.00', '600'),
(1 ,2 , 'REFAZENDA', '60.00', '1000'),
(1 ,3 , 'TOTALMENTE DEMAIS', '50.00', '2000'),
(1 ,3 , 'TRAVESSIA', '55.00', '500'),
(1 ,2 , 'COURAGE', '30.00', '200'),
(4 ,3 , 'LEGIÃO URBANA', '20.00', '100'),
(3 ,2 , 'THE BEATLES', '30.00', '300'),
(4 ,1 , 'RITA LEE', '30.00', '500');

INSERT INTO PEDIDOS(COD_CLI, COD_FUNC, DATA_PED, VAL_PED) VALUES
(1 ,2 , '02/05/02', '1500.00'),
(3 ,4 , '02/05/02', '50.00  '),
(4 ,7 , '02/06/02', '100.00 '),
(1 ,4 , '02/02/03', '200.00 '),
(7 ,5 , '02/03/03', '300.00 '),
(4 ,4 , '02/03/03', '100.00 '),
(5 ,5 , '02/03/03', '50.00  '),
(8 ,2 , '02/03/03', '50.00  '),
(2 ,2 , '02/03/03', '2000.00'),
(7 ,1 , '02/03/03', '3000.00');

INSERT INTO TITULOS_ARTISTA(COD_TIT, COD_ART) VALUES
(1 ,1 ),
(2 ,2 ),
(3 ,2 ),
(4 ,2 ),
(5 ,3 ),
(6 ,4 ),
(7 ,4 ),
(8 ,5 ),
(9 ,6 ),
(10 ,7 );

INSERT INTO TITULOS_PEDIDO(NUM_PED, COD_TIT, QTD_CD, VAL_CD) VALUES
(1  ,1 ,2 , '30.00'),
(1  ,2 ,3 , '20.00'),
(2  ,1 ,1 , '50.00'),
(2  ,2 ,3 , '30.00'),
(3  ,1 ,2 , '40.00'),
(4  ,2 ,3 , '20.00'),
(5  ,1 ,2 , '25.00'),
(6  ,2 ,3 , '30.00'),
(6  ,3 ,1 , '35.00'),
(7  ,4 ,2 , '55.00'),
(8  ,1 ,4 , '60.00'),
(9  ,2 ,3 , '15.00'),
(10 ,7 ,2 , '15.00');

SELECT * FROM ARTISTAS;
SELECT * FROM GRAVADORAS;
SELECT * FROM CATEGORIAS;
SELECT * FROM ESTADOS;
SELECT * FROM CIDADES;
SELECT * FROM CLIENTES;
SELECT * FROM CONJUGES;
SELECT * FROM FUNCIONARIOS;
SELECT * FROM DEPENDENTES;
SELECT * FROM TITULOS;
SELECT * FROM PEDIDOS;
SELECT * FROM TITULOS_PEDIDO;
SELECT * FROM TITULOS_ARTISTA;

-- MOSTRAR A TABELA PEDIDOS COM O NOME DO CLIENTE, NOME DO FUNCIONÁRIOS, DATA DO PEDIDO E VALOR DO PEDIDO
SELECT CLI.NOME_CLI AS 'COMPRADOR', FUNC.NOME_FUNC AS 'VENDEDOR', PED.DATA_PED AS 'DATA DA COMPRA', 
PED.VAL_PED AS 'VALOR DA COMPRA' FROM PEDIDOS AS PED
INNER JOIN CLIENTES AS CLI ON PED.COD_CLI = CLI.COD_CLI
INNER JOIN FUNCIONARIOS AS FUNC ON PED.COD_FUNC = FUNC.COD_FUNC;

-- MOSTRAR O VALOR TOTAL DE VENDAS DOS FUNCIONÁRIOS ATRAVÉS DA TABELA PEDIDOS
SELECT FUNC.NOME_FUNC AS 'FUNCIONÁRIO', SUM(VAL_PED) AS 'TOTAL VENDAS' FROM PEDIDOS AS PED
INNER JOIN FUNCIONARIOS AS FUNC ON PED.COD_FUNC = FUNC.COD_FUNC
GROUP BY NOME_FUNC ORDER BY SUM(VAL_PED) DESC;

-- MOSTRAR NOME, QUANTIDADE DE VENDAS E A COMISSÃO DE VENDAS(15% DO TOTAL DE VENDAS) DE CADA FUNCIONÁRIO COM BASE NA TABELA PEDIDOS
SELECT FUNC.NOME_FUNC AS 'FUNCIONÁRIO', COUNT(PED.COD_FUNC) AS 'QUANTIDADE DE VENDAS',
ROUND(SUM(VAL_PED) * 0.15, 2) AS 'COMISSÃO (15%)' FROM PEDIDOS AS PED
INNER JOIN FUNCIONARIOS AS FUNC ON PED.COD_FUNC = FUNC.COD_FUNC
GROUP BY NOME_FUNC ORDER BY SUM(VAL_PED) DESC;



-- LAB PAG 88 - 89
-- SELECIONE O NOME DOS CDS E O NOME DA GRAVADORA DE CADA CD
SELECT TIT.NOME_CD AS 'NOME DO CD', GRAV.NOME_GRAV AS 'NOME DA GRAVADORA'
FROM TITULOS AS TIT
INNER JOIN GRAVADORAS AS GRAV ON TIT.COD_GRAV = GRAV.COD_GRAV;

-- SELECIONE O NOME DOS CDS E O NOME DA CATEGORIA DE CADA CD
SELECT TIT.NOME_CD AS 'NOME DO CD', CAT.NOME_CAT AS 'CATEGORIA'
FROM TITULOS AS TIT
INNER JOIN CATEGORIAS AS CAT ON TIT.COD_CAT = CAT.COD_CAT;

-- SELECIONE O NOME DOS CDS, O NOME DAS GRAVADORAS DE CADA CD E O NOME DA CATEGORIA DE CADA CD
SELECT TIT.NOME_CD AS 'NOME DO CD', GRAV.NOME_GRAV AS 'GRAVADORA', CAT.NOME_CAT AS 'CATEGORIA'
FROM TITULOS AS TIT
INNER JOIN GRAVADORAS AS GRAV ON TIT.COD_GRAV = GRAV.COD_GRAV
INNER JOIN CATEGORIAS AS CAT  ON TIT.COD_CAT  = CAT.COD_CAT;

-- SELECIONE O NOME DOS CLIENTES E OS TÍTULOS DOS CDS VENDIDOS EM CADA PEDIDO QUE O CLIENTE FEZ
SELECT CLI.NOME_CLI AS 'CLIENTE', TIT.NOME_CD AS 'NOME DO CD'
FROM PEDIDOS AS PED
INNER JOIN CLIENTES AS CLI ON PED.COD_CLI = CLI.COD_CLI
INNER JOIN TITULOS_PEDIDO AS TITPED ON PED.NUM_PED = TITPED.NUM_PED
INNER JOIN TITULOS AS TIT ON TITPED.COD_TIT = TIT.COD_TIT;

-- SELECIONE O NOME DO FUNCIONÁRIO, NÚMERO, DATA E VALOR DOS PEDIDOS QUE ESTE FUNCIONÁRIO REGISTROU, ALÉM DO NOME DO CLIENTE QUE ESTÁ FAZENDO O PEDIDO
SELECT FUNC.NOME_FUNC AS 'FUNCIONARIO', PED.NUM_PED AS 'PEDIDO', PED.DATA_PED AS 'DATA',  
PED.VAL_PED AS 'VALOR', CLI.NOME_CLI AS 'CLIENTE' FROM PEDIDOS AS PED
INNER JOIN FUNCIONARIOS AS FUNC ON PED.COD_FUNC = FUNC.COD_FUNC
INNER JOIN CLIENTES AS CLI ON PED.COD_CLI = CLI.COD_CLI;

-- SELECIONE O NOME DOS FUNCIONÁRIO E O NOME DE TODOS OS DEPENDENTES DE CADA FUNCIONÁRIO
SELECT FUNC.NOME_FUNC AS 'FUNCIONARIO', DEP.NOME_DEP AS 'DEPENDENTES'
FROM DEPENDENTES AS DEP
INNER JOIN FUNCIONARIOS AS FUNC ON DEP.COD_FUNC = FUNC.COD_FUNC;

-- SELECIONE O NOME DOS CLIENTES E O NOME DOS CÔNJUGES DE CADA CLIENTE
SELECT CLI.NOME_CLI AS 'CLIENTES', CONJ.NOME_CONJ AS 'CONJUGE'
FROM CONJUGES AS CONJ
INNER JOIN CLIENTES AS CLI ON CONJ.COD_CLI = CLI.COD_CLI;

-- SELECIONE O NOME DE TODOS OS CLIENTES. SE ESTES POSSUEM CÔNJUGES, MOSTRAR OS NOMES DE SEUS CÔNJUGES TAMBÉM
SELECT CLI.NOME_CLI AS 'CLIENTE', CONJ.NOME_CONJ AS 'CONJUGE'
FROM CLIENTES AS CLI
LEFT JOIN CONJUGES AS CONJ ON CLI.COD_CLI = CONJ.COD_CLI;

-- SELECIONE NOME DO CLIENTE, NOME DO CÔNJUGE, NÚMERO DO PEDIDIO QUE CADA CLIENTE FEZ, VALOR DE CADA PEDIDIO QUE CADA CLIENTE FEZ E CÓDIGO DO FUNCIONÁRIO QUE ATENDEU A CADA PEDIDO
SELECT CLI.NOME_CLI AS 'CLIENTES', CONJ.NOME_CONJ AS 'CONJUGE', PED.NUM_PED AS 'PEDIDO', 
PED.VAL_PED AS 'VALOR', PED.COD_FUNC AS 'FUNCIONARIO' FROM CLIENTES AS CLI
LEFT JOIN CONJUGES AS CONJ ON CLI.COD_CLI = CONJ.COD_CLI -- CASO QUEIRA EXIBIR SOMENTE CLIENTES QUE TENHA CONJUGES, MUDAR DE LEFT PARA INNER
INNER JOIN PEDIDOS AS PED ON CLI.COD_CLI = PED.COD_CLI; -- CASO QUEIRA EXIBIR CLIENTES QUE NAO FIZERAM PEDIDOS, MUDAR DE INNER PARA LEFT


-- SUBQUERY
SELECT CLI.NOME_CLI AS 'CLIENTE', CONJ.NOME_CONJ AS 'CONJUGE'
FROM CLIENTES AS CLI
INNER JOIN CONJUGES AS CONJ ON CLI.COD_CLI = CONJ.COD_CLI;

-- MESMO RESULTADO COM SUBQUERY
SELECT CLI.NOME_CLI AS 'CLIENTE', (
    SELECT NOME_CONJ 
    FROM CONJUGES 
    WHERE COD_CLI = CLI.COD_CLI) AS 'CONJUGE'
FROM CLIENTES AS CLI 
WHERE CLI.COD_CLI IN (SELECT COD_CLI FROM CONJUGES);