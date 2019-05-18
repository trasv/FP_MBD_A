--jumlah hari sampai terjual
CREATE OR REPLACE PROCEDURE terjual_hari( idm in date )
IS
    temp1 date;
    temp2 date;
    hasil date;
BEGIN
    SELECT tgl_terjual INTO temp1
    FROM MOBIL WHERE idm = mobil_id;
    
    SELECT tgl_titip INTO temp2
    FROM PEMBELIAN WHERE idm = mobil_id;
    
    hasil := temp1-temp2;
    
    DBMS_OUTPUT.PUT_LINE(hasil);
END;
