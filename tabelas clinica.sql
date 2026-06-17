-- 1. Tabela Plano de Saúde
CREATE TABLE PlanoSaude (
    id_plano INT AUTO_INCREMENT PRIMARY KEY,
    limite_cobertura DECIMAL(10,2),
    data_vencimento DATE NOT NULL
);

-- 2. Tabela Paciente
CREATE TABLE Paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255),
    data_nascimento DATE,
    telefone VARCHAR(20),
    email VARCHAR(100),
    cpf VARCHAR(14) UNIQUE,
    id_plano INT,
    FOREIGN KEY (id_plano) REFERENCES PlanoSaude(id_plano)
);

-- 3. Tabela Médico
CREATE TABLE Medico (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100),
    crm VARCHAR(20) UNIQUE NOT NULL
);

-- 4. Tabela Consulta
CREATE TABLE Consulta (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    data_consulta DATE NOT NULL,
    horario TIME NOT NULL,
    valor_consulta DECIMAL(10,2) NOT NULL,
    id_paciente INT,
    id_medico INT,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico)
);

-- 5. Tabela Receita
CREATE TABLE Receita (
    id_receita INT AUTO_INCREMENT PRIMARY KEY,
    descricao_medicamento TEXT,
    tempo_tratamento VARCHAR(50),
    dosagem VARCHAR(50),
    id_consulta INT,
    FOREIGN KEY (id_consulta) REFERENCES Consulta(id_consulta)
);

-- 6. Tabela Pagamento
CREATE TABLE Pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    valor_pago DECIMAL(10,2) NOT NULL,
    data_pagamento DATE NOT NULL,
    id_consulta INT,
    FOREIGN KEY (id_consulta) REFERENCES Consulta(id_consulta)
);