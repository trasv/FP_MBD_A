--autofill biaya_titip dari lama titip
create or replace TRIGGER fillbiayatitip
BEFORE INSERT ON mobil
FOR EACH ROW
DECLARE temp NUMBER(11,2);
BEGIN
temp := :new.lama_hari_titip*100000;

UPDATE PEMILIK_LAMA SET BIAYA_TITIP:=TEMP WHERE PEMILIK_LAMA_ID = :NEW.PEMILIK_LAMA_ID;
END;

-- autofill administrasi + total--
create or replace TRIGGER filladmintotal
BEFORE INSERT ON pembayaran
FOR EACH ROW
DECLARE ADM INT;
        temp int;
BEGIN
  IF :new.cara_pembayaran = 'Cash' THEN 
  :new.administrasi := 50000;
  ADM := 50000;
  ELSIF :new.cara_pembayaran = 'BCA' THEN
  :new.administrasi := 55000;
  ADM := 55000;
  ELSIF :new.cara_pembayaran = 'Mandiri' THEN
  :new.administrasi := 60000;
  ADM := 60000;
  ELSIF :new.cara_pembayaran = 'Citibank' THEN
  :new.administrasi := 80000;
  ADM := 80000;
  END IF;
  
  select harga_jual into temp from pembelian
  where pembelian_id=:new.pembelian_id;
  temp:=temp+adm;
  :new.total := temp;
  
END;

-- autofill hargajual --
create or replace TRIGGER fillhargajual
BEFORE INSERT ON pembelian
FOR EACH ROW
DECLARE temp int;
BEGIN
  select harga_pemilik into temp from mobil
  where mobil_id=:new.mobil_id;
  temp := temp*1.3;
  :new.harga_jual := temp ;
END;
