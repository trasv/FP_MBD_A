--jumlah hari sampai terjual --
CREATE OR REPLACE PROCEDURE terjual_hari( idm in varchar )
IS
    temp1 date;
    temp2 date;
    hasil int;
BEGIN
    SELECT tgl_terjual INTO temp1
    FROM PEMBELIAN WHERE idm = mobil_id;
    
    SELECT tgl_titip INTO temp2
    FROM MOBIL WHERE idm = mobil_id;
    
    hasil := temp1-temp2;
    
    DBMS_OUTPUT.PUT_LINE(hasil);
END;

-- procedure sisa hari menitip-- 
create or replace PROCEDURE cek_hari(id_mobil in char)
IS
LAMA int;
selisih int;
tanggal date;
BEGIN
SELECT TGL_TITIP,LAMA_HARI_TITIP INTO tanggal,LAMA
FROM MOBIL
WHERE MOBIL_ID=id_mobil;

selisih := SYSDATE - tanggal;
lama := lama-selisih;
DBMS_OUTPUT.PUT_LINE('sisa hari titip:'||lama);

END
;
