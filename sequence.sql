--Sequance id tabel pemilik_lama
CREATE SEQUENCE sequence_pemilik_lama nocache;

CREATE OR REPLACE TRIGGER auto_pemilik_lama
BEFORE INSERT ON PEMILIK_LAMA
FOR EACH ROW
BEGIN
  SELECT sequence_pemilik_lama.NEXTVAL INTO :NEW.PEMILIK_LAMA_ID FROM DUAL;
END;

--Sequence id tabel pembayaran
CREATE SEQUENCE sequence_pembayaran nocache;

CREATE OR REPLACE TRIGGER auto_pembayaran
BEFORE INSERT ON PEMBAYARAN
FOR EACH ROW
BEGIN
  SELECT sequence_pembayaran.NEXTVAL INTO :NEW.PEMBAYARAN_ID FROM DUAL;
END;

--Sequence id tabel pembelian
CREATE SEQUENCE sequence_pembelian nocache;

CREATE OR REPLACE TRIGGER auto_pembelian
BEFORE INSERT ON PEMBELIAN
FOR EACH ROW
BEGIN
  SELECT sequence_pembelian.NEXTVAL INTO :NEW.PEMBELIAN_ID FROM DUAL;
END;
