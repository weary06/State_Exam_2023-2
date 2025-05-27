CREATE TABLE RESIDENTE (
    codice_fiscale VARCHAR(16) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL,
    indirizzo VARCHAR(100),
    email VARCHAR(100),
    telefono VARCHAR(20),
    metodo_pagamento VARCHAR(50)
);

CREATE TABLE PISCINA (
    id_piscina INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    indirizzo VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    responsabile VARCHAR(100)
);

CREATE TABLE ISTRUTTORE (
    codice_fiscale VARCHAR(16) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL,
    telefono VARCHAR(20)
);

CREATE TABLE CORSO (
    id_corso INT PRIMARY KEY AUTO_INCREMENT,
    nome_attivita VARCHAR(100) NOT NULL,
    costo DECIMAL(8,2) NOT NULL,
    num_min INT NOT NULL,
    num_max INT NOT NULL,
    mese_inizio INT NOT NULL CHECK (mese_inizio BETWEEN 1 AND 12),
    anno_inizio INT NOT NULL,
    mese_fine INT NOT NULL CHECK (mese_fine BETWEEN 1 AND 12),
    anno_fine INT NOT NULL,
    giorno_settimana VARCHAR(20) NOT NULL,
    ora TIME NOT NULL,
    id_piscina INT NOT NULL,
    id_istruttore VARCHAR(16) NOT NULL,
    FOREIGN KEY (id_piscina) REFERENCES PISCINA(id_piscina),
    FOREIGN KEY (id_istruttore) REFERENCES ISTRUTTORE(codice_fiscale)
);

CREATE TABLE ISCRIZIONE (
    id_iscrizione INT PRIMARY KEY AUTO_INCREMENT,
    codice_fiscale_residente VARCHAR(16) NOT NULL,
    id_corso INT NOT NULL,
    data_iscrizione DATE NOT NULL,
    FOREIGN KEY (codice_fiscale_residente) REFERENCES RESIDENTE(codice_fiscale),
    FOREIGN KEY (id_corso) REFERENCES CORSO(id_corso)
);

CREATE TABLE CERTIFICATO_MEDICO (
    id_certificato INT PRIMARY KEY AUTO_INCREMENT,
    id_iscrizione INT NOT NULL,
    file_path VARCHAR(255) NOT NULL,
    data_scadenza DATE NOT NULL,
    FOREIGN KEY (id_iscrizione) REFERENCES ISCRIZIONE(id_iscrizione)
);