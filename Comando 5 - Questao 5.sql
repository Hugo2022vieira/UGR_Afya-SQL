-- Criação da tabela 'clientes' 
CREATE TABLE IF NOT EXISTS clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100)
);

-- Inserção de dados de exemplo na tabela 'clientes'
INSERT INTO clientes (id, nome) VALUES
(1, 'João Silva'),
(2, 'Maria Oliveira'),
(3, 'Carlos Pereira'),
(4, 'Ana Souza');

-- Criação da tabela 'pedidos'
CREATE TABLE IF NOT EXISTS pedidos (
    id INT PRIMARY KEY,
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Inserção de dados de exemplo na tabela 'pedidos'
INSERT INTO pedidos (id, cliente_id) VALUES
(101, 1),
(102, 2),
(103, 1),
(104, 1),
(105, 3),
(106, 2);

-- Consulta para listar o nome de cada cliente e o número total de pedidos
SELECT
    c.nome AS nome_cliente,
    COUNT(ped.id) AS total_pedidos
FROM
    clientes c
LEFT JOIN
    pedidos ped ON c.id = ped.cliente_id
GROUP BY
    c.nome
ORDER BY
    total_pedidos DESC;

