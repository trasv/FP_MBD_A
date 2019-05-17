-- Table: pemilik_lama
CREATE TABLE pemilik_lama (
    pemilik_lama_id char(5),
    nama varchar(100) NOT NULL,
    biaya_titip numeric(8,2) NOT NULL,
    alamat varchar(100) NOT NULL,
    no_telp varchar(15) NOT NULL,
    jk char(1) NOT NULL,
    CONSTRAINT pemilik_lama_pk PRIMARY KEY (pemilik_lama_id)
);

-- Table: mobil
CREATE TABLE mobil (
    mobil_id char(5),
    pemilik_lama_id char(5) NOT NULL,
    merek varchar(100) NOT NULL,
    tipe varchar(100) NOT NULL,
    warna varchar(100) NOT NULL,
    harga_pemilik numeric(8,2) NOT NULL,
    tgl_titip date NOT NULL,
    lama_hari_titip int NOT NULL,
    availability int,
    CONSTRAINT mobil_id PRIMARY KEY (mobil_id),
    FOREIGN KEY(pemilik_lama_id) REFERENCES pemilik_lama(pemilik_lama_id)
);

-- Table: pegawai
CREATE TABLE pegawai (
    pegawai_id char(5),
    nama varchar(100) NOT NULL,
    alamat varchar(100) NOT NULL,
    no_telp varchar(15) NOT NULL,
    jk char(1) NOT NULL,
    CONSTRAINT pegawai_id PRIMARY KEY (pegawai_id)
);

-- Table: pelangan
CREATE TABLE pelanggan (
    pelanggan_id char(5),
    nama varchar(100) NOT NULL,
    alamat varchar(100) NOT NULL,
    no_telp varchar(15) NOT NULL,
    jk char(1) NOT NULL,
    CONSTRAINT pelanggan_id PRIMARY KEY (pelanggan_id)
);

-- Table: pembelian
CREATE TABLE pembelian (
    pembelian_id char(5),
    pelanggan_id char(5) NOT NULL,
    mobil_id char(5) NOT NULL,
    pegawai_id char(5) NOT NULL,
    tgl_terjual date NOT NULL,
    harga_jual numeric(8,2),
    keuntungan numeric(8,2),
    CONSTRAINT pembelian_pk PRIMARY KEY (pembelian_id),
    FOREIGN KEY(pelanggan_id) REFERENCES pelanggan(pelanggan_id),
    FOREIGN KEY(mobil_id) REFERENCES mobil(mobil_id),
    FOREIGN KEY(pegawai_id) REFERENCES pegawai(pegawai_id)
);

-- Table: pembayaran
CREATE TABLE pembayaran (
    pembayaran_id char(5),
    pembelian_id char(5) NOT NULL,
    cara_pembayaran varchar(100) NOT NULL,
    administrasi numeric(8,2),
    total numeric(8,2),
    CONSTRAINT pembayaran_id PRIMARY KEY (pembayaran_id),
    FOREIGN KEY(pembelian_id) REFERENCES pembelian(pembelian_id)
);
-- End of file.
