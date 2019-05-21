-- function beli lebih dari sekali --
create or replace FUNCTION cek_beli(id_pel in CHAR)
RETURN integer
IS
jumlah NUMBER;
BEGIN

SELECT count(*) into jumlah
FROM PEMBELIAN
WHERE PELANGGAN_ID=id_pel ;

dbms_output.put_line(jumlah);

IF jumlah > 1 THEN
RETURN 1;
ELSE
RETURN 0;
END IF;
END;

-- function best employee --
