-- Criação da tabela 'clientes'
CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    cidade VARCHAR(50)
);

-- Criação da tabela 'produtos'
CREATE TABLE produtos (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2),
    fornecedor_id INT
);

-- Criação da tabela 'fornecedores'
CREATE TABLE fornecedores (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

-- Adição da chave estrangeira à tabela 'produtos'
-- referenciando a coluna 'id' da tabela 'fornecedores' (sem nomear a constraint)
ALTER TABLE produtos
ADD FOREIGN KEY (fornecedor_id)
REFERENCES fornecedores(id);

-- Inserção de dados de exemplo
INSERT INTO fornecedores (id, nome, email, telefone) VALUES
(101, 'Fornecedor A', 'contato@fornecedora.com.br', '(11) 9999-8888'),
(102, 'Fornecedor B', 'vendas@fornecedorb.com.br', '(21) 8888-7777'),
(103, 'Fornecedor C', 'comercial@fornecedorc.com.br', '(31) 7777-6666');

INSERT INTO produtos (id, nome, preco, fornecedor_id) VALUES
(1, 'Notebook', 2500.00, 101),
(2, 'Mouse', 50.00, 102),
(3, 'Teclado', 120.00, 101),
(4, 'Monitor', 800.00, 103);

-- Selecionar os dados das tabelas 'produtos' e 'fornecedores'
SELECT
    p.nome AS nome_produto,
    p.preco,
    f.nome AS nome_fornecedor
FROM
    produtos p
JOIN
    fornecedores f ON p.fornecedor_id = f.id;
