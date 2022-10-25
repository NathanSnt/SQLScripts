
USE sucos_vendas;
SELECT * FROM tabela_de_clientes;

SELECT embalagem, tamanho FROM tabela_de_produtos;

SELECT DISTINCT embalagem, tamanho FROM tabela_de_produtos; -- DISTINCT não se repete os valores.

SELECT * FROM tabela_de_produtos LIMIT 5, 8; -- Puxa 8 registros a partir do 5º registro.

SELECT * FROM tabela_de_produtos ORDER BY preco_de_lista; -- Lista os registro organizado pelo menor ao maior preço.
SELECT * FROM tabela_de_produtos ORDER BY preco_de_lista desc; -- Lista os registro organizado pelo maior ao menor preço.

SELECT * FROM tabela_de_produtos ORDER BY nome_do_produto; -- Lista os registro organizados alfabeticamente (A - Z);
SELECT * FROM tabela_de_produtos ORDER BY nome_do_produto desc; -- Lista os registro organizados alfabeticamente (Z - A);

SELECT * FROM tabela_de_produtos ORDER BY embalagem desc, nome_do_produto asc; -- Organiza pela embalagem em ordem decrecente e pelo nome do produto em ordem crescente;


SELECT estado, limite_de_credito FROM tabela_de_clientes;
SELECT estado, SUM(limite_de_credito) FROM tabela_de_clientes; -- Soma toda a tabela limite_de_credito (SOMA TODA A TABELA).
SELECT estado, SUM(limite_de_credito) FROM tabela_de_clientes GROUP BY estado; -- Soma limite_de_credito de cada estado.

SELECT embalagem, MAX(preco_de_lista) as maior_preco FROM tabela_de_produtos; -- Retorna o maior preço.
SELECT embalagem, MIN(preco_de_lista) as menor_preco FROM tabela_de_produtos; -- Retorna o menor preço.

SELECT embalagem, COUNT(*) as contador FROM tabela_de_produtos GROUP BY embalagem; -- Retorna a quantidade de produtos de uma embalagem.

SELECT bairro, SUM(limite_de_credito) as limites FROM tabela_de_clientes GROUP BY bairro; -- Mostra o total de limite de credito de cada bairro.
SELECT bairro, SUM(limite_de_credito) AS limites FROM tabela_de_clientes WHERE cidade = 'Rio de Janeiro' GROUP BY bairro; -- Mostra o total de limite de credito de cada bairro do Rio de janeiro.

SELECT estado, SUM(limite_de_credito) AS soma_limite FROM tabela_de_clientes GROUP BY estado having SUM(limite_de_credito) > 90000; -- Calcula a soma dos limite por estado, e mostra caso seja maior que 90.000.

SELECT embalagem, MAX(preco_de_lista) AS maior_preco, MIN(preco_de_lista) AS menor_preco FROM tabela_de_produtos GROUP BY embalagem; -- Exibe o maior e o menor preço de cada embalagem.
SELECT embalagem, MAX(preco_de_lista) AS maior_preco, MIN(preco_de_lista) AS menor_preco FROM tabela_de_produtos GROUP BY embalagem; -- Exibe o maior e o menor preço de cada embalagem.
SELECT embalagem, MAX(preco_de_lista) AS maior_preco, MIN(preco_de_lista) AS menor_preco FROM tabela_de_produtos GROUP BY embalagem HAVING SUM(preco_de_lista); -- || Exibe, caso a soma de todos os produto for menor ou igual à 80.

SELECT nome_do_produto, preco_de_lista ,
case
	when preco_de_lista >= 12 then 'Tipo 03 - Caro'
    when preco_de_lista >= 7 and preco_de_lista < 12 then 'Tipo 02 - Em conta'
	else 'Tipo 01 - Barato'
end as status_preco from tabela_de_produtos ORDER BY status_preco;

SELECT * FROM tabela_de_vendedores;
SELECT * FROM notas_fiscais;


SELECT * FROM tabela_de_vendedores AS A INNER JOIN notas_fiscais AS B on A.matricula = B.matricula;