--Sequance id tabel pemilik_lama--
CREATE SEQUENCE sequence_pemilik_lama nocache;

CREATE OR REPLACE TRIGGER auto_pemilik_lama
BEFORE INSERT ON PEMILIK_LAMA
FOR EACH ROW
BEGIN
  SELECT sequence_pemilik_lama.NEXTVAL INTO :NEW.PEMILIK_LAMA_ID FROM DUAL;
END;

--Sequence id tabel pembayaran--
CREATE SEQUENCE sequence_pembayaran nocache;

CREATE OR REPLACE TRIGGER auto_pembayaran
BEFORE INSERT ON PEMBAYARAN
FOR EACH ROW
BEGIN
  SELECT sequence_pembayaran.NEXTVAL INTO :NEW.PEMBAYARAN_ID FROM DUAL;
END;

--Sequence id tabel pembelian--
CREATE SEQUENCE sequence_pembelian nocache;

CREATE OR REPLACE TRIGGER auto_pembelian
BEFORE INSERT ON PEMBELIAN
FOR EACH ROW
BEGIN
  SELECT sequence_pembelian.NEXTVAL INTO :NEW.PEMBELIAN_ID FROM DUAL;
END;

--Sequence id tabel pelanggan--
CREATE SEQUENCE sequence_pelanggan nocache;

CREATE OR REPLACE TRIGGER auto_pelanggan
BEFORE INSERT ON PELANGGAN
FOR EACH ROW
BEGIN
  SELECT sequence_pelanggan.NEXTVAL INTO :NEW.PELANGGAN_ID FROM DUAL;
END;

--Sequence id pegawai --
CREATE SEQUENCE sequence_pegawai nocache;

CREATE OR REPLACE TRIGGER auto_pegawai
BEFORE INSERT ON PEGAWAI
FOR EACH ROW
BEGIN
  SELECT sequence_pegawai.NEXTVAL INTO :NEW.PEGAWAI_ID FROM DUAL;
END;

--Sequence id mobil--
create sequence sequence_mobil nocache;

create or replace trigger auto_mobil
before insert on mobil
for each row
declare depan varchar(50);
begin
  select SUBSTR(:new.tipe,1,3)
  into depan
  from mobil;
  select depan || to_char(sequence_mobil.NEXTVAL,'FM00000')
  into :NEW.mobil_id
  from DUAL;
end;
