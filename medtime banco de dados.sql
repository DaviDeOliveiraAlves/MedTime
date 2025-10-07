-- Tabela de usuários
CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(20)
);

-- Tabela de remédios
CREATE TABLE remedios (
    id_remedio INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    nome_remedio VARCHAR(100),
    horario TIME,
    data DATE,
    tomado BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Tabela de notificações
CREATE TABLE notificacoes (
    id_notificacao INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    mensagem TEXT,
    horario TIME,
    data DATE,
    lida BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Tabela de configurações
CREATE TABLE configuracoes (
    id_configuracao INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    idioma VARCHAR(20) DEFAULT 'Português',
    tema VARCHAR(20) DEFAULT 'Claro',
    notificacoes_ativas BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Tabela de logs de acesso ou histórico (opcional)
CREATE TABLE historico_acesso (
    id_log INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    data_acesso DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
