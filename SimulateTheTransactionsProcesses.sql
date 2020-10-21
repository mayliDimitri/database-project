USE RALaundry

-- Seorang pelanggan setia RALaundry bernama Sumaiya Benton dengan kode Customer CU003
-- Ia ingin melakukan laundry service pada sebuah gaun dan ironing service pada sebuah kemeja
-- Transaksi ini dilakukan pada tanggal 21 Desember 2019
-- Ia dilayani oleh seorang staff bernama Efan Huang dengan kode Staff ST005
-- Harga service yang harus ia tanggung untuk laundry service pada sebuah gaun adalah 16000
-- Harga service yang harus ia tanggung untuk ironing service pada sebuah kemeja adalah 8000

INSERT INTO ServiceTr
VALUES
('SR017', 'ST005', 'CU003', '2019-12-21')

INSERT INTO ServiceDtl
VALUES
('SR017', 'CL002', 'Laundry Service', 16000),
('SR017', 'CL004', 'Ironing Service', 8000)

-- Seorang staff bernama Zofia Perkins dengan kode Staff ST002 ingin melakukan re-stock di toko RALaundry
-- Ia ingin melakukan transaksi dengan vendor Ycy Laundry dengan kode Vendor VE008
-- Barang yang ingin ia beli adalah 12 pcs Deterjen Laundry dengan kode Material MA006
-- Transaksi ini dilakukan pada tanggal 21 Desember 2019

INSERT INTO PurchaseTr
VALUES
('PU017', 'ST002', 'VE008', '2019-12-21')

INSERT INTO PurchaseDtl
VALUES
('PU017', 'MA006', 12)