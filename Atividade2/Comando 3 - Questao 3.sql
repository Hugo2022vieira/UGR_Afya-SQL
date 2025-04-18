-- Criação da tabela 'produtos'.
CREATE TABLE produtos (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2),
    fornecedor_id INT
);

-- Inserção de um dado de exemplo na tabela 'produtos'
-- para que a atualização tenha algo para modificar
INSERT INTO produtos (id, nome, preco, fornecedor_id) VALUES
(3, 'Produto Exemplo', 100.00, 999);

-- Executa a atualização do preço do produto com id = 3
UPDATE produtos
SET preco = 49.90
WHERE id = 3;

--Seleciona o produto atualizado para verificar a mudança
SELECT * FROM produtos WHERE id = 3;
