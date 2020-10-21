USE RALaundry

-- INSERT DATA INTO MASTER TABLE

INSERT INTO Staff
VALUES
('ST001', 'Harley Price', '9889 Deerfield Street', 'Male', 1900000),
('ST002', 'Zofia Perkins', '49 Pheasant Ave.', 'Female', 2000000),
('ST003', 'Warren Villarreal', '9035 Roosevelt Street', 'Male', 2100000),
('ST004', 'Lillie Mae Wagner', '16 Grand Dr.', 'Female', 2300000),
('ST005', 'Efan Huang', '8809 Wild Rose Dr.', 'Male', 2500000),
('ST006', 'Kimberley Mcclure', '90 Glen Creek Dr.', 'Male', 2700000),
('ST007', 'Josephine Parry', '76 Green Street', 'Female', 1600000),
('ST008', 'Halimah Carpenter', '9351 Rockwell Road', 'Male', 2900000),
('ST009', 'Sherry Alford', '365 Old York Ave.', 'Female', 2400000),
('ST010', 'Renesmee Pope', '695 E. Tarkiln Hill Lane', 'Female', 2600000)

INSERT INTO Staff
VALUES
('ST011', 'Jennifer', '456 Beverage Hills', 'Female', 2700000)

INSERT INTO Customer
VALUES
('CU001', 'Jun Levy', '960 Roehampton St.', 'Male', '1995-06-03'),
('CU002', 'Rhyley Talley', '83 Fairground Avenue', 'Female', '1993-06-20'),
('CU003', 'Sumaiya Benton', '402 Grand Street', 'Female', '1993-02-03'),
('CU004', 'Reuben Lowery', '16 Acacia Rd.', 'Female', '1991-04-07'),
('CU005', 'Louise William', '11 Blue Spring Street', 'Male', '1999-04-22'),
('CU006', 'Matas Hull', '25 West Nicolls Ave.', 'Male', '1998-03-13'),
('CU007', 'August Burgess', '118 Mulberry Court', 'Male', '1992-07-08'),
('CU008', 'Troy Riddle', '930 Jockey Hollow Drive', 'Male', '1996-01-09'),
('CU009', 'Lily-Grace Valdez', '5 Peg Shop Drive', 'Female', '1991-07-06'),
('CU010', 'Faris Villa', '200 Lancaster Rd.', 'Female', '1997-12-02')

INSERT INTO Vendor
VALUES
('VE001', 'Toko Blossom', '9304 10th Court', '0811555235'),
('VE002', 'Toko Laundry Indonesia', '7338 E. Cross Lane', '0852555461'),
('VE003', 'Agen Mawar Super', '98 Sunbeam Drive', '0852555205'),
('VE004', 'Laundry Cantik', '236 Honey Creek St.', '0817555320'),
('VE005', 'MGS Laundry', '937 Thompson Drive', '0898555836'),
('VE006', 'Q2 Laundry', '7501 Honey Creek Street', '0838555563'),
('VE007', 'Lennora Laundry', '776 Iroquois St.', '0811555698'),
('VE008', 'Ycy Laundry', '7 University Court', '0897555665'),
('VE009', 'Bloob Laundry', '8636 Livingston Court', '0838555851'),
('VE010', 'YES Laundry', '9114 Gartner Avenue', '0811555964')

INSERT INTO Vendor
VALUES
('VE011', 'PT. Cuci Bersih', '123 Ave Maria St.', '082258085781')

INSERT INTO Material
VALUES
('MA001', 'Mesin Cuci IPSO', 'Equipment', 12550000),
('MA002', 'Mesin Pengering IPSO', 'Equipment', 12550000),
('MA003', 'Setrika Uap Boiler', 'Equipment', 3750000),
('MA004', 'Stabilizer Setrika Uap Boiler', 'Equipment', 1500000),
('MA005', 'Selang Setrika Uap Boiler', 'Equipment', 40000),
('MA006', 'Deterjen Laundry', 'Supplies', 46000),
('MA007', 'Parfum Laundry', 'Supplies', 128000),
('MA008', 'Pencerah Warna Oxygent Bleach', 'Supplies', 142000),
('MA009', 'Softener Microfragrance', 'Supplies', 61500),
('MA010', 'Stain Remover', 'Supplies', 72000)

INSERT INTO Clothes
VALUES
('CL001', 'Kaos', 'Cotton'),
('CL002', 'Dress', 'Polyester'),
('CL003', 'Celana Kulot', 'Linen'),
('CL004', 'Kemeja', 'Linen'),
('CL005', 'Jas', 'Viscose'),
('CL006', 'Sweater', 'Wool'),
('CL007', 'Hoodie', 'Wool'),
('CL008', 'Kaos Kaki', 'Wool'),
('CL009', 'Blouse', 'Viscose'),
('CL010', 'Celana Formal', 'Linen')

-- INSERT DATA INTO TRANSACTION TABLE

INSERT INTO PurchaseTr
VALUES
('PU001', 'ST001', 'VE001', '2019-02-08'),
('PU002', 'ST002', 'VE002', '2019-04-01'),
('PU003', 'ST003', 'VE003', '2019-04-12'),
('PU004', 'ST004', 'VE004', '2019-04-21'),
('PU005', 'ST005', 'VE005', '2019-05-26'),
('PU006', 'ST006', 'VE006', '2019-06-03'),
('PU007', 'ST007', 'VE007', '2019-06-05'),
('PU008', 'ST008', 'VE008', '2019-06-20'),
('PU009', 'ST009', 'VE009', '2019-08-17'),
('PU010', 'ST010', 'VE010', '2019-08-18'),
('PU011', 'ST001', 'VE009', '2019-09-25'),
('PU012', 'ST002', 'VE008', '2019-09-29'),
('PU013', 'ST003', 'VE007', '2019-11-23'),
('PU014', 'ST004', 'VE006', '2019-11-29'),
('PU015', 'ST005', 'VE005', '2019-12-20')

INSERT INTO PurchaseTr
VALUES
('PU016', 'ST003', 'VE011', '2019-12-25')

INSERT INTO PurchaseTr
VALUES
('PU018', 'ST006', 'VE004', '2019-12-22')

INSERT INTO PurchaseTr
VALUES
('PU019', 'ST007', 'VE005', '2019-07-30')

INSERT INTO ServiceTr
VALUES
('SR001', 'ST010', 'CU001', '2019-01-11'),
('SR002', 'ST009', 'CU002', '2019-01-24'),
('SR003', 'ST008', 'CU003', '2019-02-14'),
('SR004', 'ST007', 'CU004', '2019-03-16'),
('SR005', 'ST006', 'CU005', '2019-03-26'),
('SR006', 'ST005', 'CU006', '2019-04-21'),
('SR007', 'ST004', 'CU007', '2019-05-12'),
('SR008', 'ST003', 'CU008', '2019-05-20'),
('SR009', 'ST002', 'CU009', '2019-07-12'),
('SR010', 'ST001', 'CU010', '2019-09-15'),
('SR011', 'ST002', 'CU001', '2019-09-24'),
('SR012', 'ST003', 'CU002', '2019-10-03'),
('SR013', 'ST004', 'CU003', '2019-10-26'),
('SR014', 'ST005', 'CU004', '2019-11-03'),
('SR015', 'ST006', 'CU005', '2019-12-10')

INSERT INTO ServiceTr
VALUES
('SR016','ST001','CU001','2019-07-25')

INSERT INTO ServiceTr
VALUES
('SR018', 'ST011', 'CU002', '2019-08-13')

-- INSERT DATA INTO TRANSACTION DETAIL TABLE

INSERT INTO PurchaseDtl
VALUES
('PU001', 'MA010', 10),
('PU002', 'MA009', 10),
('PU003', 'MA008', 10),
('PU004', 'MA007', 10),
('PU005', 'MA006', 10),
('PU006', 'MA005', 1),
('PU007', 'MA004', 1),
('PU008', 'MA003', 1),
('PU009', 'MA002', 1),
('PU010', 'MA001', 1),
('PU011', 'MA010', 5),
('PU012', 'MA009', 5),
('PU013', 'MA008', 5),
('PU014', 'MA007', 5),
('PU015', 'MA006', 5),
('PU001', 'MA005', 1),
('PU002', 'MA004', 1),
('PU003', 'MA003', 2),
('PU004', 'MA002', 2),
('PU005', 'MA001', 2),
('PU006', 'MA010', 8),
('PU007', 'MA009', 8),
('PU008', 'MA008', 8),
('PU009', 'MA007', 8),
('PU010', 'MA006', 8)

INSERT INTO PurchaseDtl
VALUES
('PU016', 'MA006', 2),
('PU016', 'MA007', 3),
('PU016', 'MA008', 2)

INSERT INTO PurchaseDtl
VALUES
('PU018', 'MA009', 4)

INSERT INTO PurchaseDtl
VALUES
('PU019', 'MA010', 6)

INSERT INTO ServiceDtl
VALUES
('SR001', 'CL010', 'Laundry Service', 8000),
('SR002', 'CL009', 'Dry Cleaning Service', 10000),
('SR003', 'CL008', 'Ironing Service', 4000),
('SR004', 'CL007', 'Laundry Service',16000),
('SR005', 'CL006', 'Dry Cleaning Service', 20000),
('SR006', 'CL005', 'Ironing Service', 12000),
('SR007', 'CL004', 'Laundry Service', 8000),
('SR008', 'CL003', 'Dry Cleaning Service', 10000),
('SR009', 'CL002', 'Ironing Service', 12000),
('SR010', 'CL001', 'Laundry Service', 8000),
('SR011', 'CL002', 'Dry Cleaning Service', 20000),
('SR012', 'CL003', 'Ironing Service',8000),
('SR013', 'CL004', 'Laundry Service', 8000),
('SR014', 'CL005', 'Dry Cleaning Service', 20000),
('SR015', 'CL006', 'Ironing Service', 8000),
('SR001', 'CL007', 'Laundry Service', 16000),
('SR002', 'CL008', 'Dry Cleaning Service', 10000),
('SR003', 'CL009', 'Ironing Service', 8000),
('SR004', 'CL010', 'Laundry Service', 16000),
('SR005', 'CL009', 'Dry Cleaning Service', 10000),
('SR006', 'CL008', 'Ironing Service', 4000),
('SR007', 'CL007', 'Laundry Service', 16000),
('SR008', 'CL006', 'Dry Cleaning Service', 20000),
('SR009', 'CL005', 'Ironing Service', 8000),
('SR010', 'CL004', 'Laundry Service', 8000)

INSERT INTO ServiceDtl
VALUES
('SR016','CL001','Laundry Service',10000),
('SR016','CL002','Laundry Service',20000)

INSERT INTO ServiceDtl
VALUES
('SR018', 'CL003', 'Dry Cleaning Service', 20000)