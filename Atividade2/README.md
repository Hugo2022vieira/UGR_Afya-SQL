# 📊 Atividade 2: Aplicação Prática Da Linguagem SQL

## 🧠 Contextualização

A **SQL (Structured Query Language)**, ou **Linguagem de Consulta Estruturada**, é o padrão de linguagem para operação de **bancos de dados relacionais**. Com ela, é possível:

- Criar objetos como **tabelas**, **visões** e **índices**;
- Manipular dados com **inserções**, **atualizações**, **deleções** e **consultas**.

A SQL surgiu na década de 1970, na **IBM**, baseada em conceitos da **Álgebra Relacional**, com o objetivo de padronizar o acesso a sistemas gerenciadores de banco de dados relacionais (SGBDs).

Antes da popularização do modelo relacional, os dados eram armazenados em arquivos simples, frequentemente estruturados de forma **hierárquica**, com limitações para representar relações complexas do mundo real. Com o modelo relacional e a SQL, tornou-se possível representar situações como a de alunos com múltiplos professores e vice-versa, com **consistência**, **flexibilidade** e **eficiência**.

Hoje, a SQL é um dos conhecimentos fundamentais para profissionais de tecnologia, mesmo aqueles que não atuam diretamente com bancos de dados.

---

## ✅ Questões Práticas em SQL

### 1️⃣ Exibir o nome do cliente, o nome do produto e a quantidade comprada, para cada pedido registrado:

```sql
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
```

---

### 2️⃣ Inserir um novo pedido com os seguintes dados:

- **id:** 10  
- **cliente_id:** 2  
- **produto_id:** 1  
- **quantidade:** 3  

```sql
INSERT INTO pedidos (id, cliente_id, produto_id, quantidade)
VALUES (10, 2, 1, 3);
```

---

### 3️⃣ Atualizar o preço do produto com id 3 para R$ 49,90:

```sql
UPDATE produtos
SET preco = 49.90
WHERE id = 3;
```

---

### 4️⃣ Criar a tabela `fornecedores` e relacionar com a tabela `produtos`:

```sql
CREATE TABLE fornecedores (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

ALTER TABLE produtos
ADD COLUMN fornecedor_id INT;

ALTER TABLE produtos
ADD CONSTRAINT fk_fornecedor
FOREIGN KEY (fornecedor_id) REFERENCES fornecedores(id);
```

---

### 5️⃣ Mostrar quantos pedidos foram feitos por cada cliente:

```sql
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

```

---

## 💾 Sobre este Repositório

Este repositório contém exercícios e exemplos práticos com SQL, voltados para iniciantes e entusiastas que desejam aprender mais sobre bancos de dados relacionais e suas aplicações no dia a dia da tecnologia.

Sinta-se à vontade para explorar.
