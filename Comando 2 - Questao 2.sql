-- Criação das tabelas
CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    cidade VARCHAR(50)
);

CREATE TABLE produtos (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2),
    fornecedor_id INT
);

CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    cliente_id INT,
    produto_id INT,
    quantidade INT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- Inserção de dados iniciais
INSERT INTO clientes (id, nome, email, cidade) VALUES
(1, 'João Silva', 'joao.silva@email.com', 'São Paulo'),
(2, 'Maria Oliveira', 'maria.oliveira@email.com', 'Rio de Janeiro'),
(3, 'Carlos Pereira', 'carlos.pereira@email.com', 'Belo Horizonte');

INSERT INTO produtos (id, nome, preco, fornecedor_id) VALUES
(1, 'Notebook', 2500.00, 101),
(2, 'Mouse', 50.00, 102),
(3, 'Teclado', 120.00, 101),
(4, 'Monitor', 800.00, 103);

INSERT INTO pedidos (cliente_id, produto_id, quantidade) VALUES
(1, 1, 1),
(2, 3, 2),
(1, 2, 3),
(3, 4, 1),
(2, 1, 1);

-- Inserção do pedido específico
INSERT INTO pedidos (id, cliente_id, produto_id, quantidade)
VALUES (10, 2, 1, 3);

-- Consulta para verificar os dados
SELECT
    c.nome AS nome_cliente,
    p.nome AS nome_produto,
    ped.quantidade,
    ped.id AS pedido_id
FROM
    pedidos ped
JOIN
    clientes c ON ped.cliente_id = c.id
JOIN
    produtos p ON ped.produto_id = p.id;
