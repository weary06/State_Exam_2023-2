-- Domanda 3
-- Tabella PISCINA
CREATE TABLE Piscina (
    id_piscina INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    indirizzo VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    responsabile VARCHAR(100)
);

-- Tabella RESIDENTE
CREATE TABLE Residente (
    codice_fiscale CHAR(16) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL,
    indirizzo VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    citta VARCHAR(50) NOT NULL CHECK (citta IN ('TORINO', 'GRUGLIASCO', 'COLLEGNO')),
    metodo_pagamento CHAR(16) NOT NULL CHECK (
        metodo_pagamento LIKE '1111%' OR
        metodo_pagamento LIKE '2222%' OR
        metodo_pagamento LIKE '4444%'
    )
);

-- Tabella ISTRUTTORE
CREATE TABLE Istruttore (
    codice_fiscale CHAR(16) PRIMARY KEY,
    nome VARCHAR(50),
    cognome VARCHAR(50),
    telefono VARCHAR(20)
);

-- Tabella CORSO
CREATE TABLE Corso (
    id_corso INT PRIMARY KEY,
    nome_attivita VARCHAR(100) NOT NULL,
    costo DECIMAL(6,2) NOT NULL,
    num_min INT,
    num_max INT,
    mese_inizio INT,
    anno_inizio INT,
    mese_fine INT,
    anno_fine INT,
    giorno_settimana VARCHAR(20),
    ora TIME,
    id_piscina INT,
    id_istruttore CHAR(16),
    FOREIGN KEY (id_piscina) REFERENCES Piscina(id_piscina),
    FOREIGN KEY (id_istruttore) REFERENCES Istruttore(codice_fiscale)
);

-- Tabella ISCRIZIONE
CREATE TABLE Iscrizione (
    id_iscrizione INT PRIMARY KEY,
    codice_fiscale_residente CHAR(16),
    id_corso INT,
    data_iscrizione DATE,
    FOREIGN KEY (codice_fiscale_residente) REFERENCES Residente(codice_fiscale),
    FOREIGN KEY (id_corso) REFERENCES Corso(id_corso)
);

-- Tabella CERTIFICATO_MEDICO
CREATE TABLE Certificato_Medico (
    id_certificato INT PRIMARY KEY,
    id_iscrizione INT,
    file_path VARCHAR(255),
    data_scadenza DATE,
    FOREIGN KEY (id_iscrizione) REFERENCES Iscrizione(id_iscrizione)
);



-- Domanda 4
-- Tabella UTENTI
CREATE TABLE Utenti (
    IDutente INT PRIMARY KEY,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(100) NOT NULL,
    Cognome VARCHAR(50) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Città VARCHAR(50)
);

-- Tabella PRODOTTI
CREATE TABLE Prodotti (
    IDprodotto INT PRIMARY KEY,
    Denominazione VARCHAR(100) NOT NULL,
    Categoria VARCHAR(20) NOT NULL CHECK (Categoria IN ('FIORI', 'PIANTE'))
);

-- Tabella POSTS
CREATE TABLE Posts (
    ID INT PRIMARY KEY,
    IDutente_fk INT,
    IDprodotto_fk INT,
    Voto INT NOT NULL CHECK (Voto BETWEEN 1 AND 5),
    Note TEXT NOT NULL,
    FOREIGN KEY (IDutente_fk) REFERENCES Utenti(IDutente),
    FOREIGN KEY (IDprodotto_fk) REFERENCES Prodotti(IDprodotto)
);
