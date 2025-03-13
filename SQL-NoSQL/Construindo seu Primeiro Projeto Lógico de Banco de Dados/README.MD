# Desafio de Projeto - Construindo seu Primeiro Projeto Lógico de Banco de Dados para E-commerce

Este projeto representa a evolução do modelo conceitual de um banco de dados para e-commerce, refinado e transformado em um modelo lógico utilizando o MySQL Workbench. O objetivo principal foi criar um script SQL para a criação do banco de dados e, em seguida, popular as tabelas com dados de teste para demonstrar a funcionalidade e capacidade do modelo.

## Modelo Lógico

O modelo lógico foi desenvolvido a partir do modelo conceitual, detalhando as entidades, atributos, tipos de dados, chaves primárias e estrangeiras, e os relacionamentos entre as tabelas. O MySQL Workbench foi utilizado para criar o diagrama ER e gerar o script SQL correspondente.

## Script SQL

O script SQL gerado pelo MySQL Workbench foi utilizado para criar o banco de dados e suas tabelas. O script inclui comandos `CREATE TABLE`, `ALTER TABLE` para definir chaves estrangeiras, e `INSERT INTO` para inserir dados de teste.

## Consultas SQL

Para demonstrar a funcionalidade do banco de dados, foram elaboradas consultas SQL que abrangem os seguintes tópicos:

* **Recuperações simples com SELECT Statement:** Consultas básicas para recuperar dados de uma única tabela.
* **Filtros com WHERE Statement:** Consultas para filtrar dados com base em condições específicas.
* **Expressões para gerar atributos derivados:** Consultas que criam novas colunas com base em cálculos ou funções sobre os dados existentes.
* **Ordenação dos dados com ORDER BY:** Consultas para ordenar os resultados por uma ou mais colunas.
* **Condições de filtros aos grupos – HAVING Statement:** Consultas que agrupam dados e filtram os grupos com base em condições.
* **Junções entre tabelas para fornecer uma perspectiva mais complexa dos dados:** Consultas que combinam dados de várias tabelas para fornecer informações mais abrangentes.

### Perguntas e Consultas

As seguintes perguntas foram elaboradas e respondidas com consultas SQL:

1.  **Quantos pedidos foram feitos por cada cliente?**

    ```sql
    SELECT count(p.idPedido) AS qtde_pedidos, CONCAT(c.primeiro_nome, ' ', c.ultimo_nome) AS nome_cliente
    FROM pedido p
    INNER JOIN cliente c ON c.idCliente = p.Cliente_idCliente
    GROUP BY p.Cliente_idCliente;
    ```

2.  **Algum vendedor também é fornecedor?**

    ```sql
    SELECT * FROM terceiro WHERE cnpj IN (SELECT cnpj FROM fornecedor) OR cpf IN (SELECT cpf FROM fornecedor);
    ```

3.  **Relação de produtos, fornecedores e estoques:**

    ```sql
    SELECT p.nome AS produto, f.razao_social AS fornecedor, e.locacao AS estoque, ep.quantidade AS quantidade_estoque
    FROM produto p
    INNER JOIN fornecimento_de_produto fp ON p.idProduto = fp.Produto_idProduto
    INNER JOIN fornecedor f ON fp.Fornecedor_idFornecedor = f.idFornecedor
    INNER JOIN estoque_do_produto ep ON p.idProduto = ep.Produto_idProduto
    INNER JOIN estoque e ON ep.Estoque_idEstoque = e.idEstoque;
    ```

4.  **Relação de nomes dos fornecedores e nomes dos produtos:**

    ```sql
    SELECT f.razao_social AS fornecedor, p.nome AS produto
    FROM fornecedor f
    INNER JOIN fornecimento_de_produto fp ON f.idFornecedor = fp.Fornecedor_idFornecedor
    INNER JOIN produto p ON fp.Produto_idProduto = p.idProduto;
    ```

## Diretrizes

* Não há um número mínimo de consultas a serem realizadas.
* Os tópicos mencionados acima devem estar presentes nas consultas.
* As perguntas devem ser elaboradas de forma que possam ser respondidas pelas consultas.
* As cláusulas podem estar presentes em mais de uma consulta.

## Conclusão

Este projeto demonstra a capacidade de transformar um modelo conceitual em um modelo lógico e implementar um banco de dados funcional. As consultas SQL elaboradas demonstram a capacidade de recuperar, filtrar, ordenar e agrupar dados, fornecendo uma visão abrangente do banco de dados de e-commerce.
