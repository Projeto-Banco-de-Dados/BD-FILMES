-- Tabela Diretor
CREATE TABLE Diretor (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(255) NOT NULL
);

-- Tabela Ator
CREATE TABLE Ator (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(255) NOT NULL
);

-- Tabela Genero
CREATE TABLE Genero (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL
);

-- Tabela Titulo
CREATE TABLE Titulo (
    id INT PRIMARY KEY IDENTITY(1,1),
    titulo VARCHAR(255),
    ano INT,
    classificacao_indicativa VARCHAR(20),
    duracao VARCHAR(20),
    sinopse TEXT,
    avaliacao_imdb FLOAT,
    nota_critica FLOAT,
    votos INT,
    receita BIGINT,
    poster_link TEXT,
    diretor_id INT,
    FOREIGN KEY (diretor_id) REFERENCES Diretor(id)
);

-- Tabela associativa Titulo_Ator
CREATE TABLE Titulo_Ator (
    titulo_id INT,
    ator_id INT,
    PRIMARY KEY (titulo_id, ator_id),
    FOREIGN KEY (titulo_id) REFERENCES Titulo(id),
    FOREIGN KEY (ator_id) REFERENCES Ator(id)
);

-- Tabela associativa Titulo_Genero
CREATE TABLE Titulo_Genero (
    titulo_id INT,
    genero_id INT,
    PRIMARY KEY (titulo_id, genero_id),
    FOREIGN KEY (titulo_id) REFERENCES Titulo(id),
    FOREIGN KEY (genero_id) REFERENCES Genero(id)
);
