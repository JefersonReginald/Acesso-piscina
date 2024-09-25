USE controle_acesso_piscina;
-- Criar o banco de dados
CREATE DATABASE controle_acesso_piscina;

-- Usar o banco de dados criado
USE controle_acesso_piscina;

-- Criar a tabela de Usuários (moradores)
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    apartamento VARCHAR(10) NOT NULL,
    telefone VARCHAR(15)
);

-- Criar a tabela de Acessos (registros de acesso à piscina)
CREATE TABLE acessos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    data_acesso DATETIME DEFAULT CURRENT_TIMESTAMP,
    status_acesso ENUM('Autorizado', 'Negado') DEFAULT 'Autorizado',
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

-- Criar a tabela de Regras de Acesso (regras de uso da piscina)
CREATE TABLE regras_acesso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao TEXT NOT NULL,
    horario_inicio TIME NOT NULL,
    horario_fim TIME NOT NULL,
    max_pessoas INT NOT NULL
);

-- Inserir algumas regras iniciais de acesso
INSERT INTO regras_acesso (descricao, horario_inicio, horario_fim, max_pessoas)
VALUES 
('A piscina pode ser utilizada de segunda a sexta-feira, das 8h às 18h', '08:00:00', '18:00:00', 20),
('A piscina pode ser utilizada aos finais de semana, das 9h às 20h', '09:00:00', '20:00:00', 15);

INSERT INTO usuarios (nome, email, senha, apartamento, telefone) 
VALUES 
('Carolina Farinhack', 'carolina.farinhack@example.com', 'carolina123', 'C303', '(41) 97777-7777'),
('Marcelo Farinhack', 'marcelo.farinhack@example.com', 'marcelo123', 'C303', '(41) 96666-6666'),
('Jaqueline Ferreira', 'jaqueline.ferreira@example.com', 'jaqueline123', 'D404', '(41) 95555-5555'),
('Simone Cienslinki', 'simone.cienslinki@example.com', 'simone123', 'E505', '(41) 94444-4444');


-- Inserir registros de acesso para teste
INSERT INTO acessos (usuario_id, status_acesso) 
VALUES 
(1, 'Autorizado'),
(2, 'Negado'),
(3, 'Autorizado'),
(4, 'Autorizado'),
(5, 'Negado'),
(6, 'Autorizado');

-- Consulta para verificar as regras de acesso
SELECT * FROM regras_acesso;

-- Consulta para listar todos os usuários e seus acessos
SELECT u.nome, u.apartamento, a.data_acesso, a.status_acesso
FROM usuarios u
JOIN acessos a ON u.id = a.usuario_id;
SELECT * FROM usuarios;
SELECT * FROM regras_acesso;

SELECT u.nome, u.apartamento, a.data_acesso, a.status_acesso
FROM usuarios u
JOIN acessos a ON u.id = a.usuario_id;





