-- Código para criar as tabelas e inserir dados

-- Tabela de Clientes
CREATE TABLE clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT, -- Identificador único do cliente
    nome TEXT NOT NULL,                   -- Nome do cliente (obrigatório)
    email TEXT UNIQUE,                   -- Email do cliente (único)
    endereco TEXT
);

-- Inserindo alguns clientes
INSERT INTO clientes (nome, email, endereco) VALUES
('João Silva', 'joao.silva@email.com', 'Rua das Flores, 123'),
('Maria Oliveira', 'maria.oliveira@email.com', 'Avenida Principal, 456'),
('Carlos Pereira', 'carlos.pereira@email.com', 'Travessa da Paz, 789');

-- Tabela de Produtos
CREATE TABLE produtos (
    id INTEGER PRIMARY KEY AUTOINCREMENT, -- Identificador único do produto
    nome TEXT NOT NULL,                   -- Nome do produto (obrigatório)
    preco REAL NOT NULL                   -- Preço do produto (obrigatório)
);

-- Inserindo alguns produtos
INSERT INTO produtos (nome, preco) VALUES
('Notebook', 2500.00),
('Mouse', 50.00),
('Teclado', 120.00),
('Monitor', 800.00);

-- Tabela de Pedidos
CREATE TABLE pedidos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,             -- Identificador único do pedido
    cliente_id INTEGER NOT NULL,                      -- Chave estrangeira referenciando a tabela clientes
    produto_id INTEGER NOT NULL,                      -- Chave estrangeira referenciando a tabela produtos
    quantidade INTEGER NOT NULL,                      -- Quantidade do produto no pedido
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,   -- Data e hora do pedido (padrão é a hora atual)
    FOREIGN KEY (cliente_id) REFERENCES clientes(id), -- Define a chave estrangeira para a tabela clientes
    FOREIGN KEY (produto_id) REFERENCES produtos(id)   -- Define a chave estrangeira para a tabela produtos
);

-- Inserindo alguns pedidos
INSERT INTO pedidos (cliente_id, produto_id, quantidade) VALUES
(1, 1, 1),   -- João Silva comprou 1 Notebook
(2, 3, 2),   -- Maria Oliveira comprou 2 Teclados
(1, 2, 3),   -- João Silva comprou 3 Mouses
(3, 4, 1),   -- Carlos Pereira comprou 1 Monitor
(2, 1, 1);   -- Maria Oliveira comprou 1 Notebook

-- consulta SELECT funcionando:
SELECT
    c.nome AS nome_cliente,
    p.nome AS nome_produto,
    ped.quantidade
FROM
    pedidos ped
JOIN
    clientes c ON ped.cliente_id = c.id
JOIN
    produtos p ON ped.produto_id = p.id;
