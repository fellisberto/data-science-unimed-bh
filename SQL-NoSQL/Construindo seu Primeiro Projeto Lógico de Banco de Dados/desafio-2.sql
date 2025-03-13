-- 1. Recuperações simples com SELECT Statement
SELECT * FROM cliente;

-- 2. Filtros com WHERE Statement
SELECT * FROM pedido WHERE Cliente_idCliente = 3;

-- 3. Crie expressões para gerar atributos derivados
SELECT nome, round(valor*0.1, 2) as comissao FROM produto;

-- 4. Defina ordenações dos dados com ORDER BY
SELECT * FROM pedido WHERE Cliente_idCliente = 3 ORDER BY valor_total DESC;

-- 5. Condições de filtros aos grupos – HAVING Statement
SELECT count(idPedido) as qtde_compras, Cliente_idCliente as cliente, SUM(valor_total) as valor_total
FROM pedido
GROUP BY cliente
HAVING valor_total >= 200;

-- 6. Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
SELECT count(p.idPedido) AS qtde_compras, SUM(p.valor_total) as valor_total, CONCAT(c.primeiro_nome, ' ', c.ultimo_nome)  AS nome_cliente,  
    CONCAT(c.rua, ', ', c.numero, ', ', c.bairro, ', ', c.cidade, '-', c.estado, ', ', c.pais) AS endereco
FROM pedido p
INNER JOIN cliente c ON c.idCliente = p.Cliente_idCliente
GROUP BY p.Cliente_idCliente
HAVING valor_total >= 200;

-- 7. Quantos pedidos foram feitos por cada cliente?
SELECT count(p.idPedido) AS qtde_pedidos, CONCAT(c.primeiro_nome, ' ', c.ultimo_nome)  AS nome_cliente
FROM pedido p
INNER JOIN cliente c ON c.idCliente = p.Cliente_idCliente
GROUP BY p.Cliente_idCliente;

-- 8. Algum vendedor também é fornecedor?
SELECT * FROM terceiro WHERE cnpj IN (SELECT cnpj FROM fornecedor) OR cpf IN (SELECT cpf FROM fornecedor);