--autofill biaya_titip dari lama titip
create or replace TRIGGER fillbiayatitip
BEFORE INSERT ON mobil
FOR EACH ROW
DECLARE temp NUMBER(11,2);
BEGIN
temp := :new.lama_hari_titip*100000;

UPDATE PEMILIK_LAMA SET BIAYA_TITIP=TEMP WHERE PEMILIK_LAMA_ID = :NEW.PEMILIK_LAMA_ID;
END;
