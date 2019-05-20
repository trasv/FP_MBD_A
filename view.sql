--view katalog mobil--
CREATE OR REPLACE VIEW katalog_mobil as
SELECT MOBIL_ID,MEREK,TIPE,WARNA,HARGA_PEMILIK*1.3 harga
FROM MOBIL
WHERE availability=1;

--view checkout pembelian--
CREATE OR REPLACE VIEW checkout_pembelian as
SELECT MO.MOBIL_ID,MO.MEREK,MO.TIPE,MO.WARNA,PB.PEMBELIAN_ID,PB.PEMBAYARAN_ID,PB.TOTAL
FROM MOBIL MO JOIN PEMBELIAN PE ON(PE.MOBIL_ID = MO.MOBIL_ID) JOIN PEMBAYARAN PB ON (PE.PEMBELIAN_ID = PB.PEMBELIAN_ID); 

--View balik nama--
CREATE OR REPLACE VIEW balik_nama as
SELECT mo.mobil_id "ID Mobil", pl.nama as "Nama PL", pl.alamat as "alamat PL", pl.no_telp as "no. telp PL", pg.nama as "Nama PG", pg.alamat as "Alamat PG", pg.no_telp as "No. Telp PG"
FROM pemilik_lama pl join mobil mo on (pl.pemilik_lama_id=mo.pemilik_lama_id) join pembelian pe on(mo.mobil_id=pe.mobil_id) join pelanggan pg on (pe.pelanggan_id=pg.pelanggan_id);

--View costumer service--
CREATE OR REPLACE VIEW costumer_service AS
SELECT PG.PEGAWAI_ID as "Pegawai ID",PG.NAMA as "Nama Pegawai",PG.NO_TELP as "No. Telp PG",PL.PELANGGAN_ID as "ID PL",PL.NAMA as "Nama PL",PL.NO_TELP as "No.Telp PL"
FROM PEGAWAI PG JOIN PEMBELIAN PE ON(PG.PEGAWAI_ID = PE.PEGAWAI_ID) JOIN PELANGGAN PL ON(PL.PELANGGAN_ID = PE.PEMBELIAN_ID);
