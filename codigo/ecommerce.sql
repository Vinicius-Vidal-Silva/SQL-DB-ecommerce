--
-- Arquivo gerado com SQLiteStudio v3.4.8 em ter jan 7 00:14:27 2025
--
-- Codificação de texto usada: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Tabela: Clientes
CREATE TABLE IF NOT EXISTS Clientes (
    id_cliente INTEGER PRIMARY KEY,
    nome       TEXT    NOT NULL,
    tipo       TEXT    CHECK (tipo IN ('PF', 'PJ') ) 
                       NOT NULL,
    cpf_cnpj   TEXT    UNIQUE
                       NOT NULL,
    endereco   TEXT    NOT NULL,
    telefone   TEXT,
    email      TEXT
);

INSERT INTO Clientes (
                         id_cliente,
                         nome,
                         tipo,
                         cpf_cnpj,
                         endereco,
                         telefone,
                         email
                     )
                     VALUES (
                         1,
                         'João Silva',
                         'PF',
                         '123.456.789-00',
                         'Rua A, 123',
                         '11987654321',
                         'joao@email.com'
                     );

INSERT INTO Clientes (
                         id_cliente,
                         nome,
                         tipo,
                         cpf_cnpj,
                         endereco,
                         telefone,
                         email
                     )
                     VALUES (
                         2,
                         'Empresa ABC',
                         'PJ',
                         '12.345.678/0001-99',
                         'Av. Central, 456',
                         '1134567890',
                         'abc@empresa.com'
                     );


-- Tabela: Pagamentos
CREATE TABLE IF NOT EXISTS Pagamentos (
    id_pagamento    INTEGER PRIMARY KEY,
    id_pedido       INTEGER NOT NULL,
    forma_pagamento TEXT    CHECK (forma_pagamento IN ('boleto', 'dinheiro', 'cartao', 'pix') ) 
                            NOT NULL,
    valor           REAL    NOT NULL,
    FOREIGN KEY (
        id_pedido
    )
    REFERENCES Pedidos (id_pedido) 
);

INSERT INTO Pagamentos (
                           id_pagamento,
                           id_pedido,
                           forma_pagamento,
                           valor
                       )
                       VALUES (
                           1,
                           1,
                           'pix',
                           55.8
                       );

INSERT INTO Pagamentos (
                           id_pagamento,
                           id_pedido,
                           forma_pagamento,
                           valor
                       )
                       VALUES (
                           2,
                           2,
                           'boleto',
                           39.9
                       );


-- Tabela: Pedidos
CREATE TABLE IF NOT EXISTS Pedidos (
    id_pedido      INTEGER PRIMARY KEY,
    id_cliente     INTEGER NOT NULL,
    data_pedido    TEXT    NOT NULL,
    status_entrega TEXT    CHECK (status_entrega IN ('finalizada', 'em andamento', 'em processamento', 'pedido recebido') ) 
                           DEFAULT 'pedido recebido',
    FOREIGN KEY (
        id_cliente
    )
    REFERENCES Clientes (id_cliente) 
);

INSERT INTO Pedidos (
                        id_pedido,
                        id_cliente,
                        data_pedido,
                        status_entrega
                    )
                    VALUES (
                        1,
                        1,
                        '2025-01-01',
                        'finalizada'
                    );

INSERT INTO Pedidos (
                        id_pedido,
                        id_cliente,
                        data_pedido,
                        status_entrega
                    )
                    VALUES (
                        2,
                        2,
                        '2025-01-02',
                        'em processamento'
                    );


-- Tabela: Produtos
CREATE TABLE IF NOT EXISTS Produtos (
    id_produto   INTEGER PRIMARY KEY,
    nome_produto TEXT    NOT NULL,
    descricao    TEXT,
    preco        REAL    NOT NULL,
    estoque      INTEGER NOT NULL,
    fornecedor   TEXT
);

INSERT INTO Produtos (
                         id_produto,
                         nome_produto,
                         descricao,
                         preco,
                         estoque,
                         fornecedor
                     )
                     VALUES (
                         1,
                         'Batom',
                         'Batom vermelho',
                         15.9,
                         100,
                         'Fornecedor A'
                     );

INSERT INTO Produtos (
                         id_produto,
                         nome_produto,
                         descricao,
                         preco,
                         estoque,
                         fornecedor
                     )
                     VALUES (
                         2,
                         'Base',
                         'Base líquida',
                         39.9,
                         50,
                         'Fornecedor B'
                     );


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
