DROP DATABASE DB_CDS;
CREATE DATABASE DB_CDS;

CREATE TABLE ARTISTAS
(
COD_ART INT NOT NULL,
NOME_ART VARCHAR(50) NOT NULL,
CONSTRAINT PK_ARTISTAS_COD_ART PRIMARY KEY (COD_ART),
CONSTRAINT UQ_ARTISTAS_NOME_ART UNIQUE (NOME_ART)
);

CREATE TABLE GRAVADORAS
(
COD_GRAV INT NOT NULL,
NOME_GRAV VARCHAR(50) NOT NULL,

CONSTRAINT PK_GRAVADORAS_COD_GRAV PRIMARY KEY (COD_GRAV),
CONSTRAINT UQ_GRAVADORAS_NOME_GRAV UNIQUE (NOME_GRAV)
);


CREATE TABLE CATEGORIAS
(
COD_CAT INT NOT NULL,
NOME_CAT VARCHAR(50) NOT NULL,

CONSTRAINT PK_CATEGORIAS_COD_CAT PRIMARY KEY (COD_CAT),
CONSTRAINT UQ_CATEGORIAS_NOME_CAT UNIQUE (COD_CAT)
);

CREATE TABLE ESTADOS
(
SIGLA_EST CHAR(2) NOT NULL,
NOME_EST VARCHAR(50) NOT NULL,

CONSTRAINT PK_ESTADOS_SIGLA_EST PRIMARY KEY (SIGLA_EST),
CONSTRAINT UQ_ESTAODS_NOME_EST UNIQUE (NOME_EST)
);


CREATE TABLE CIDADES 
( 
COD_CID INT NOT NULL, 
SIGLA_EST CHAR(2) NOT NULL, 
NOME_CID VARCHAR(50) NOT NULL,  

CONSTRAINT PK_CIDADES_COD_CID PRIMARY KEY (COD_CID), 
CONSTRAINT FK_CIDADES_SIGLA_EST FOREIGN KEY (SIGLA_EST) REFERENCES ESTADOS (SIGLA_EST)
);


CREATE TABLE CLIENTES
(
COD_CLI INT NOT NULL,
COD_CID INT NOT NULL,
NOME_CLI VARCHAR(50) NOT NULL,
END_CLI VARCHAR(100) NOT NULL,
RENDA_CLI DECIMAL(9,2) NOT NULL DEFAULT 0,
SEXO_CLI CHAR(1) NOT NULL DEFAULT 'F',

CONSTRAINT PK_CLIENTES_COD_CLI PRIMARY KEY (COD_CLI),
CONSTRAINT FK_CLIENTES_COD_CID FOREIGN KEY (COD_CID) REFERENCES CIDADES(COD_CID),
CONSTRAINT CK_CLIENTES_RENDA_CLI CHECK (RENDA_CLI >= 0),
CONSTRAINT CK_CLIENTES_SEXO_CLI CHECK (SEXO_CLI IN ('F', 'M'))
);


CREATE TABLE CONJUGE
(
COD_CLI INT NOT NULL,
NOME_CONJ VARCHAR(50) NOT NULL,
RENDA_CONJ DECIMAL(9,2) NOT NULL DEFAULT 0,
SEXO_CONJ CHAR(1) NOT NULL DEFAULT 'F',

CONSTRAINT PK_CONJUGE_COD_CLI PRIMARY KEY (COD_CLI),
CONSTRAINT FK_CONJUGE_COD_CLI FOREIGN KEY (COD_CLI) REFERENCES CLIENTES (COD_CLI),
CONSTRAINT CK_CONJUGE_RENDA_CONJ CHECK (RENDA_CONJ >= 0),
CONSTRAINT CK_CONJUGE_SEXO_CONJ CHECK (SEXO_CONJ IN ('F', 'M'))
);


CREATE TABLE FUNCIONARIOS
(
COD_FUNC INT NOT NULL,
NOME_FUNC VARCHAR(50) NOT NULL,
END_FUNC VARCHAR(100) NOT NULL,
SAL_FUNC DECIMAL(9,2) NOT NULL DEFAULT 0,
SEXO_FUNC CHAR(1) NOT NULL DEFAULT 'F',

CONSTRAINT PK_FUNCIONARIOS_COD_FUNC PRIMARY KEY (COD_FUNC),
CONSTRAINT CK_FUNCIONARIOS_SAL_FUNC CHECK (SAL_FUNC >= 0),
CONSTRAINT CK_FUNCIONARIOS_SEXO_FUNC CHECK (SEXO_FUNC IN ('F', 'M'))
);


CREATE TABLE DEPENDENTES
(
COD_DEP INT NOT NULL,
COD_FUNC INT NOT NULL,
NOME_DEP VARCHAR(100) NOT NULL,
SEXO_DEP CHAR(1) NOT NULL DEFAULT 'F',

CONSTRAINT PK_DEPENDENTES_COD_DEP PRIMARY KEY (COD_DEP),
CONSTRAINT FK_DEPENDENTES_COD_FUNC FOREIGN KEY (COD_FUNC) REFERENCES FUNCIONARIOS (COD_FUNC),
CONSTRAINT CK_DEPENDENTES_SEXO_DEP CHECK (SEXO_DEP IN ('F', 'M'))
);


CREATE TABLE TITULOS
(
COD_TIT INT NOT NULL,
COD_CAT INT NOT NULL,
COD_GRAV INT NOT NULL,
NOME_CD VARCHAR(50) NOT NULL,
VAL_CD DECIMAL(9,2) NOT NULL,
QTD_ESTQ INT NOT NULL,

CONSTRAINT PK_TITULOS_COD_TIT PRIMARY KEY (COD_TIT),
CONSTRAINT FK_TITULOS_COD_CAT FOREIGN KEY (COD_CAT) REFERENCES CATEGORIAS (COD_CAT),
CONSTRAINT FK_TITULOS_COD_GRAV FOREIGN KEY (COD_GRAV) REFERENCES GRAVADORAS (COD_GRAV),
CONSTRAINT UQ_TITULOS_NOME_CD UNIQUE (NOME_CD),
CONSTRAINT CK_TITULOS_VAL_CD CHECK (VAL_CD > 0),
CONSTRAINT CK_TITULOS_QTD_ESTQ CHECK (QTD_ESTQ >= 0)
);


CREATE TABLE PEDIDOS
(
NUM_PED INT NOT NULL,
COD_CLI INT NOT NULL,
COD_FUNC INT NOT NULL,
DATA_PED DATETIME NOT NULL,
VAL_PED DECIMAL(9,2) NOT NULL DEFAULT 0,

CONSTRAINT PK_PEDIDOS_NUM_PED PRIMARY KEY (NUM_PED),
CONSTRAINT FK_PEDIDOS_COD_CLI FOREIGN KEY (COD_CLI) REFERENCES CLIENTES (COD_CLI),
CONSTRAINT FK_PEDIDOS_COD_FUNC FOREIGN KEY (COD_FUNC) REFERENCES FUNCIONARIOS (COD_FUNC),
CONSTRAINT CK_PEDIDOS_VAL_PED CHECK (VAL_PED >= 0)
);


CREATE TABLE TITULOS_PEDIDO
(
NUM_PED INT NOT NULL,
COD_TIT INT NOT NULL,
QTD_CD INT NOT NULL,
VAL_CD DECIMAL(9,2) NOT NULL,

CONSTRAINT FK_TITULOS_PEDIDO_NUM_PED FOREIGN KEY (NUM_PED) REFERENCES PEDIDOS (NUM_PED),
CONSTRAINT FK_TITULOS_PEDIDO_COD_TIT FOREIGN KEY (COD_TIT) REFERENCES TITULOS (COD_TIT),
CONSTRAINT CK_TITULOS_PEDIDO_QTD_CD CHECK (QTD_CD >= 1),
CONSTRAINT CK_TITULOS_PEDIDO_VAL_CD CHECK (VAL_CD > 0)
);


CREATE TABLE TITULOS_ARTISTA
(
COD_TIT INT NOT NULL,
COD_ART INT NOT NULL,

CONSTRAINT FK_TITULOS_ARTISTA_COD_TIT FOREIGN KEY (COD_TIT) REFERENCES TITULOS (COD_TIT),
CONSTRAINT FK_TITULOS_ARTISTA_COD_ART FOREIGN KEY (COD_ART) REFERENCES ARTISTAS (COD_ART)
);


INSERT INTO ARTISTAS VALUES
(1, 'MARISA MONTE'),
(2, 'GILBERTO GIL'),
(3, 'CAETANO VELOSO'),
(4, 'MILTON NASCIMENTO'),
(5, 'LEGI??O URBANA'),
(6, 'THE BEATLES'),
(7, 'RITE LEE');

INSERT INTO GRAVADORAS VALUES
(1, 'POLYGRAM'),
(2, 'EMI'),
(3, 'SOM LIVRE'),
(4, 'SOM MUSIC');

INSERT INTO CATEGORIAS VALUES
(1, 'MPB'),
(2, 'TRILHA SONORA'),
(3, 'ROCK INTERNACIONAL'),
(4, 'ROCK NACIONAL');

INSERT INTO ESTADOS VALUES
('SP', 'S??O PAULO'),
('MG', 'MINAS GERAIS'),
('RJ', 'RIO DE JANEIRO');

INSERT INTO CIDADES VALUES
(1, 'SP', 'S??O PAULO'),
(2, 'SP', 'SOROCABA'),
(3, 'SP', 'JUNDIA??'),
(4, 'SP', 'AMERICANA'),
(5, 'SP', 'ARARAQUARA'),
(6, 'MG', 'OURO PRETO');

-- (7, 'ES', 'CACHOEIRA DO ITAPEMIRIM');

INSERT INTO CLIENTES VALUES
(1, 1, 'JOS?? NOGUEIRA', 'RUA A', 1500.00, 'M'),
(2, 1, '??NGELO PEREIRA', 'RUA B', 2000.00, 'M'),
(3, 1, 'AL??M MAR PARANHOS', 'RUA C', 1500.00, 'M'),
(4, 1, 'CATARINA SOUZA', 'RUA D', 892.00, 'F'),
(5, 1, 'VEGNER COSTA', 'RUA E', 950.00, 'M'),
(6, 2, 'ANTENOR DA COSTA', 'RUA F', 1582.00, 'M'),
(7, 2, 'MARIA AM??LIA DE SOUZA', 'RUA G', 1152.00, 'F'),
(8, 2, 'PAULO ROBERTO SILVA', 'RUA H', 3250.00, 'M'),
(9, 3, 'F??TIMA SOUZA', 'RUA I', 1632.00, 'F'),
(10, 3, 'JOEL DA ROCHA', 'RUA J', 2000.00, 'M');

INSERT INTO CONJUGE VALUES
(1, 'CARLA NOGUEIRA', 2500.00, 'F'),
(2, 'EMILIA PEREIRA', 5500.00, 'F'),
(6, 'ALTIVA DA COSTA', 3000.00, 'F'),
(7, 'CARLOS DE SOUZA', 3250.00, 'M');

INSERT INTO FUNCIONARIOS VALUES
(1, 'V??NIA GABRIELA PEREIRA', 'RUA A', 2500.00, 'F'),
(2, 'NORBERTO PEREIRA DA SILVA', 'RUA B', 300.00, 'M'),
(3, 'OLAVO LINHARES', 'RUA C', 580.00, 'M'),
(4, 'PAULA DA SILVA', 'RUA D', 3000.00, 'F'),
(5, 'ROLANDO ROCHA', 'RUA E', 2000.00, 'M');

INSERT INTO DEPENDENTES VALUES
(1, 1, 'ANA PEREIRA', 'F'),
(2, 1, 'ROBERTO PEREIRA', 'M'),
(3, 1, 'CELSO PEREIRA', 'M'),
(4, 3, 'BRISA LINHARES', 'F'),
(5, 3, 'MARI SOL LINHARES', 'F'),
(6, 4, 'SONIA DA SILVA', 'F');

INSERT INTO TITULOS VALUES
(1, 1, 1, 'TRIBALISTAS', 30.00, 1500),
(2, 1, 2, 'TROPIC??LIA', 50.00, 500),
(3, 1, 1, 'AQUELE ABRA??O', 50.00, 600),
(4, 1, 2, 'REFAZENDA', 60.00, 1000),
(5, 1, 3, 'TOTALMENTE DEMAIS', 50.00, 2000),
(6, 1, 3, 'TRAVESSIA', 55.00, 500),
(7, 1, 2, 'COURAGE', 30.00, 200),
(8, 4, 3, 'LEGI??O URBANA', 20.00, 100),
(9, 3, 2, 'THE BEATLES', 30.00, 300),
(10, 4, 1, 'RITA LEE', 30.00, 500);

INSERT INTO PEDIDOS VALUES
(1, 1, 2, '02/05/02', 1500.00),
(2, 3, 4, '02/05/02', 50.00),
-- (3, 4, 7, '02/06/02', 100.00),
(4, 1, 4, '02/02/03', 200.00),
-- (5, 7, 5, '02/03/03', 300.00),
(6, 4, 4, '02/03/03', 100.00),
(7, 5, 5, '02/03/03', 50.00),
(8, 8, 2, '02/03/03', 50.00),
(9, 2, 2, '02/03/03', 2000.00),
-- (10, 7, 1, '02/03/03', 3000.00);

INSERT INTO PEDIDOS VALUES
(1, 1, 2, '02/05/02', 1500.00),
(2, 3, 4, '02/05/02', 50.00),
(4, 1, 4, '02/02/03', 200.00),
(6, 4, 4, '02/03/03', 100.00),
(7, 5, 5, '02/03/03', 50.00),
(8, 8, 2, '02/03/03', 50.00),
(9, 2, 2, '02/03/03', 2000.00);

INSERT INTO TITULOS_ARTISTA VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 2),
(5, 3),
(6, 4),
(7, 4),
(8, 5),
(9, 6),
(10, 7);

INSERT INTO TITULOS_PEDIDO VALUES
(1, 1, 2, 30.00),
(1, 2, 3, 20.00),
(2, 1, 1, 50.00),
(2, 2, 3, 30.00),
-- (3, 1, 2, 40.00),
(4, 2, 3, 20.00),
-- (5, 1, 2, 25.00),
(6, 2, 3, 30.00),
(6, 3, 1, 35.00),
(7, 4, 2, 55.00),
(8, 1, 4, 60.00),
(9, 2, 3, 15.00);
-- (10, 7, 2, 15.00);

-- INNER JOIN
SELECT NOME_CLI, END_CLI, CID.NOME_CID
FROM CLIENTES AS CLI
INNER JOIN CIDADES AS CID 
ON CID.COD_CID = CLI.COD_CID;

-- CHEGA NO MESMO RESULTADO COM:
SELECT NOME_CLI, END_CLI, CID.NOME_CID
FROM CLIENTES AS CLI, CIDADES AS CID
WHERE CID.COD_CID = CLI.COD_CID;

-- LEFT JOIN
/*
Obtem n??o apenas os dados relacionados de duas tabelas, mas tamb??m os dados n??o relacionados encontrados
na tabela ?? esquerda da cl??sula JOIN.
Caso n??o existam dados relacinados entre as tabelas ?? esquerda e ?? direita do JOIN, os valores
resultantes de todas as colunas da lista de sele????o ?? direita ser??o nulos.
*/
SELECT CLIENTES.NOME_CLI, CONJUGE.NOME_CONJ
FROM CLIENTES
LEFT JOIN CONJUGE
ON CLIENTES.COD_CLI = CONJUGE.COD_CLI;

-- RIGHT JOIN
/*
Ao contr??rio do LEFT JOIN, a cl??usula RIGHT JOIN retorna todos os dados encontrados na tabela ?? direito de JOIN. 
Caso n??o existam dados associados entre as tabelas, ser??o retornados valores nulos.
*/
SELECT CLIENTES.NOME_CLI, CONJUGE.NOME_CONJ
FROM CLIENTES
RIGHT JOIN CONJUGE
ON CLIENTES.COD_CLI = CONJUGE.COD_CLI;

-- ASSOCIANDO MAIS DE DUAS TABELAS
SELECT CLI.NOME_CLI AS NOME, CONJ.NOME_CONJ AS CONJUGE, CID.NOME_CID AS CIDADE
FROM CLIENTES AS CLI
INNER JOIN CONJUGE AS CONJ 
ON CONJ.COD_CLI = CLI.COD_CLI
INNER JOIN CIDADES AS CID 
ON CID.COD_CID = CLI.COD_CID;

-- FULL OUTER JOIN (acho que n??o funciona no mysql)
/*
Todas as linha de dados da tabela ?? esquerda de JOIN e da tabela ?? direita ser??o retornadas pela cl??usula FULL OUTER JOIN.
Caso uma linha de dados n??o esteja associada a qualquer linha da outra tabela, os valores da colunas da lista de sele????o 
ser??o nulos. Caso contr??rio, os valores obtidos ser??o baseados nas tabelas utilizadas como refer??ncia.
*/

SELECT CLI.NOME_CLI AS NOME, CONJ.NOME_CONJ AS CONJUGE
FROM CLIENTES AS CLI
FULL OUTER JOIN CONJUGE AS CONJ 
ON CONJ.COD_CLI = CLI.COD_CLI;

-- para conseguir um mesmo resultado do c??digo acima, usei o right join e o left join atrav??s do union para unir os resultados.

SELECT CLI.NOME_CLI AS NOME, CONJ.NOME_CONJ AS CONJUGE
FROM CLIENTES AS CLI
LEFT OUTER JOIN CONJUGE AS CONJ
ON CONJ.COD_CLI = CLI.COD_CLI

UNION

SELECT CLI.NOME_CLI AS NOME, CONJ.NOME_CONJ AS CONJUGE
FROM CLIENTES AS CLI
RIGHT OUTER JOIN CONJUGE AS CONJ
ON CONJ.COD_CLI = CLI.COD_CLI;


-- CROSS JOIN

/*
Todos os resultados da tabela ?? esquerda de JOIN ser??o cruzados com os dados da tabela ?? direita de JOIN
*/

SELECT CLI.NOME_CLI AS NOME, CONJ.NOME_CONJ AS CONJUGE 
FROM CLIENTES AS CLI
CROSS JOIN CONJUGE AS CONJ ORDER BY CLI.NOME_CLI;

-- CRIANDO OUTRO DB

CREATE DATABASE IDIOMAS;
USE IDIOMAS;

CREATE TABLE ALUNOS(
COD_ALUNO INT NOT NULL,
NOME VARCHAR(50) NOT NULL,
COD_CURSO INT,

CONSTRAINT PK_ALUNOS_COD_ALUNO PRIMARY KEY (COD_ALUNO),
CONSTRAINT FK_ALUNOS_COD_CURSO FOREIGN KEY (COD_CURSO) REFERENCES CURSOS(COD_CURSO)
);

CREATE TABLE CURSOS (
COD_CURSO INT,
NOME VARCHAR(50) NOT NULL,

CONSTRAINT PK_CURSOS_COD_CURSO PRIMARY KEY (COD_CURSO)
);

INSERT INTO ALUNOS VALUES
(1, 'JOAQUIM MANUEL', 1),
(2, 'MARIA MADALENA', 1),
(3, 'CARLITOS AMARAL', 3),
(4, 'JOS?? DA BRAGA E TINO', 3);

INSERT INTO CURSOS VALUES
(1, 'INGLES'),
(2, 'ESPANHOL'),
(3, 'ALEMAO');



