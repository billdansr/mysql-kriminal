CREATE TABLE Pelaku (
    id_pelaku INT PRIMARY KEY,
    nama VARCHAR(60),
    alamat VARCHAR(255),
    tempat_lahir VARCHAR(100),
    tgl_lahir DATE
);

CREATE TABLE Kejahatan (
    id_kejahatan INT AUTO_INCREMENT PRIMARY KEY,
    nama_kejahatan VARCHAR(255),
    tgl_kejadian DATE,
    jalan VARCHAR(255),
    kota VARCHAR(255),
    provinsi VARCHAR(255)
);

CREATE TABLE Korban (
    id_korban INT AUTO_INCREMENT PRIMARY KEY,
    id_kejahatan INT,
    nama VARCHAR(60),
    alamat VARCHAR(255),
    tempat_lahir VARCHAR(255),
    tgl_lahir DATE,
    FOREIGN KEY (id_kejahatan) REFERENCES Kejahatan(id_kejahatan)
);

CREATE TABLE Polisi (
    id_polisi INT AUTO_INCREMENT PRIMARY KEY,
    nama_tim VARCHAR(50)
);

CREATE TABLE AnggotaTim (
    id_polisi INT PRIMARY KEY,
    anggota_tim VARCHAR(60),
    FOREIGN KEY (id_polisi) REFERENCES Polisi(id_polisi)
);

CREATE TABLE TimInvestigasi (
    id_polisi INT PRIMARY KEY,
    nama_tim VARCHAR(60),
    FOREIGN KEY (id_polisi) REFERENCES Polisi(id_polisi)
);

CREATE TABLE TimResponCepat (
    id_polisi INT PRIMARY KEY,
    nama_tim VARCHAR(60),
    FOREIGN KEY (id_polisi) REFERENCES Polisi(id_polisi)
);

CREATE TABLE Penduduk (
    nik INT(16) PRIMARY KEY,
    nama VARCHAR(60),
    pekerjaan VARCHAR(100),
    kewarganegaraan CHAR(3),
    agama VARCHAR(20),
    alamat VARCHAR(255),
    tempat_lahir VARCHAR(100),
    tgl_lahir DATE
);

CREATE TABLE PelakuMelakukanKejahatan (
    id_kasus INT AUTO_INCREMENT PRIMARY KEY,
    id_pelaku INT,
    id_kejahatan INT,
    id_polisi INT,
    nik INT,
    nama_kasus VARCHAR(255),
    deskripsi_kasus TEXT,
    FOREIGN KEY (id_pelaku) REFERENCES Pelaku(id_pelaku),
    FOREIGN KEY (id_kejahatan) REFERENCES Kejahatan(id_kejahatan),
    FOREIGN KEY (id_polisi) REFERENCES Polisi(id_polisi),
    FOREIGN KEY (nik) REFERENCES Penduduk(nik)
);