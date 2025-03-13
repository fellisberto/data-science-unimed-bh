SHOW DATABASES;
USE e_commerce;
SHOW TABLES;
DESC cliente;

-- Inserindo Clientes

INSERT INTO cliente (primeiro_nome, nome_meio, ultimo_nome, documento, tipo_conta, data_nascimento, rua,
    bairro, cidade, numero, complemento, estado, pais) VALUES 
    ('Ana', 'Beatriz', 'Souza', 11122233344, 'PF', '1990-03-15', 'Rua das Flores', 'Jardim Primavera', 'São Paulo', '123', 'Apto 101', 'SP', 'BR'),
    ('Pedro', 'Henrique', 'Oliveira', 55566677788, 'PF', '1985-07-22', 'Avenida Central', 'Centro', 'Rio de Janeiro', '456', '', 'RJ', 'BR'),
    ('Mariana', 'Gomes', 'Ferreira', 99988877766, 'PJ', '1978-11-01', 'Rua da Paz', 'Vila Nova', 'Belo Horizonte', '789', 'Sala 5', 'MG', 'BR');
    
-- Inserindo Cartões dos clientes

DESC cartoes;

INSERT INTO cartoes (nro_cartao, nome_cartao, bandeira_cartao, idCliente) VALUES
    ('1234567890123456', 'Ana B Souza', 'Mastercard', 1),
    ('9876543210987654', 'Pedro H Oliveira', 'Visa', 2),
    ('1122334455667788', 'Mariana G Ferreira', 'Elo', 3);
    
-- Inserindo Fornecedor

DESC fornecedor;

INSERT INTO fornecedor (razao_social, cnpj, telefone) VALUES
    ('Brinquedos Alegres LTDA', '12345678000199', '11987654321'),
    ('Moda Bela Vista S/A', '98765432000112', '31998765432');
    
-- Inserindo Produto

DESC produto;

INSERT INTO produto (nome, categoria, descricao, valor, classificacao_criancas,
altura_cm, largura_cm, comprimento_cm, peso_kg) VALUES
    ('Camiseta Algodão', 'Roupas', 'Camiseta básica 100% algodão.', 25.90, 0, 35, 30, 10, 0.150),
    ('Robô Educacional', 'Brinquedos', 'Robô interativo com atividades educativas.', 89.99, 1, 25, 35, 45, 0.600),
    ('Calça Sarja', 'Roupas', 'Calça sarja slim fit.', 54.50, 0, 32, 30, 6, 0.250),
    ('Quebra-cabeça 1000 peças', 'Brinquedos', 'Quebra-cabeça com paisagem.', 45.00, 0, 32, 30, 6, 0.250);

-- Inserindo Relaçao Produto-Fornecedor

DESC fornecimento_de_produto;

INSERT INTO fornecimento_de_produto VALUES
    (1, 2),
    (2, 1),
    (3, 2),
    (4, 1);
    
-- Inserindo Vendedor terceiro

DESC terceiro;

INSERT INTO terceiro (razao_social, endereco, nome_fantasia, cnpj, cpf) VALUES
    ('Vendedor Moda Online', 'Rua X, 50, Centro, São Paulo, SP', 'Moda X', '11223344000155', ''),
    ('Brinquedos Divertidos LTDA', 'Rua Y, 25, Vila Z, Rio de Janeiro, RJ', 'Brinque Mais', '55667788000199', '');
    
-- Inserindo Produto por terceiro

DESC produto_por_vendedor;

INSERT INTO produto_por_vendedor (Terceiro_idTerceiro, Produto_idProduto, quantidade) VALUES
    (1, 3, 15),
    (2, 4, 25);
    
-- Inserindo dados de estoque

DESC estoque;

INSERT INTO estoque (locacao, endereco) VALUES
    ('Prateleira 1, Nível 3', 'Depósito Central'),
    ('Caixa 5, Setor A', 'Depósito Secundário'),
    ('', 'Armazenado por parceiro');
    
-- Inserindo dados de estoque dos produtos

DESC estoque_do_produto;

INSERT INTO estoque_do_produto (Produto_idProduto, Estoque_idEstoque, quantidade) VALUES
    (1, 1, 30),
    (2, 1, 40),
    (3, 2, 15),
    (4, 3, 30);
    
-- Inserindo pedidos

DESC pedido;

INSERT INTO pedido (status, descricao, Cliente_idCliente, Frete, valor_total) VALUES
    ('Confirmado', '', 1, 15.50, 250.00),
    ('Embalando', '', 2, 22.00, 400.00),
    ('A caminho', '', 3, 8.00, 120.00),
    ('Entregue', 'Pedido finalizado', 3, 12.00, 95.00);
    
-- Inserindo entrega

DESC entrega;

INSERT INTO entrega (cod_rastreio, data_entrega, data_saida, status, transportadora, idPedido) VALUES
    ('ABCD12345', NULL, NULL, 'Em separação', 'Transportadora Azul', 1),
    ('EFGH67890', NULL, NULL, 'Aguardando envio', 'Transportadora Verde', 2),
    ('IJKL13579', '2023-11-25', NULL, 'Saiu para entrega', 'Transportadora Vermelha', 3),
    ('MNOP24680', '2023-11-26', '2023-11-24', 'Entregue', 'Transportadora Amarela', 4);
    
-- Inserindo pagamento

DESC pagamento;

INSERT INTO pagamento (idCliente, tipo, data_pagamento, id_cartao, codigo_pix, link_boleto, idPedido) VALUES
    ('1', 'boleto', '2023-11-20', NULL, NULL, 'https://boleto.bancodigital.com/123456', 1),
    ('2', 'boleto', '2023-11-21', NULL, NULL, 'https://boleto.bancodigital.com/654321', 2),
    ('3', 'pix', '2023-11-22', NULL, 'pix123456789', NULL, 3),
    ('3', 'cartao_credito', '2023-11-23', 3, NULL, NULL, 4);