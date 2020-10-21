CREATE DATABASE RALaundry

USE RALaundry

-- CREATE MASTER TABLE

CREATE TABLE Staff (
	StaffID CHAR(5) PRIMARY KEY,
	StaffName VARCHAR(50),
	StaffAddress VARCHAR(50),
	StaffGender VARCHAR(6),
	StaffSalary INT,

	CONSTRAINT C_StaffID CHECK(StaffID LIKE 'ST[0-9][0-9][0-9]'),
	CONSTRAINT C_StaffAddress CHECK(LEN(StaffAddress) > 10),
	CONSTRAINT C_StaffGender CHECK(StaffGender IN('Male', 'Female')),
	CONSTRAINT C_StaffSalary CHECK(StaffSalary > 1500000 OR StaffSalary < 3000000)
)

CREATE TABLE Customer (
	CustomerID CHAR(5) PRIMARY KEY,
	CustomerName VARCHAR(50),
	CustomerAddress VARCHAR(50),
	CustomerGender VARCHAR(6),
	CustomerDOB DATE,

	CONSTRAINT C_CustomerID CHECK(CustomerID LIKE 'CU[0-9][0-9][0-9]'),
	CONSTRAINT C_CustomerAddress CHECK(LEN(CustomerAddress) > 10),
	CONSTRAINT C_CustomerGender CHECK(CustomerGender IN('Male', 'Female'))
)

CREATE TABLE Vendor (
	VendorID CHAR(5) PRIMARY KEY,
	VendorName VARCHAR(50),
	VendorAddress VARCHAR(50),
	VendorPhoneNumber VARCHAR(12),

	CONSTRAINT C_VendorID CHECK(VendorID LIKE 'VE[0-9][0-9][0-9]'),
	CONSTRAINT C_VendorAddress CHECK(LEN(VendorAddress) > 10)
)

CREATE TABLE Material (
	MaterialID CHAR(5) PRIMARY KEY,
	MaterialName VARCHAR(50),
	MaterialType VARCHAR(10),
	MaterialPrice INT,

	CONSTRAINT C_MaterialID CHECK(MaterialID LIKE 'MA[0-9][0-9][0-9]'),
	CONSTRAINT C_MaterialType CHECK(MaterialType IN('Equipment', 'Supplies'))
)

CREATE TABLE Clothes (
	ClothesID CHAR(5) PRIMARY KEY,
	ClothesName VARCHAR(50),
	ClothesType VARCHAR(15),

	CONSTRAINT C_ClothesID CHECK(ClothesID LIKE 'CL[0-9][0-9][0-9]'),
	CONSTRAINT C_ClothesType CHECK(ClothesType IN('Cotton', 'Viscose', 'Polyester', 'Linen', 'Wool'))
)

-- CREATE TRANSACTION TABLE

CREATE TABLE PurchaseTr (
	PurchaseID CHAR(5) PRIMARY KEY,
	StaffID CHAR(5) FOREIGN KEY REFERENCES Staff(StaffID),
	VendorID CHAR(5) FOREIGN KEY REFERENCES Vendor(VendorID),
	PurchaseDate DATE,
	
	CONSTRAINT C_PurchaseID CHECK(PurchaseID LIKE 'PU[0-9][0-9][0-9]')
)

CREATE TABLE ServiceTr (
	ServiceID CHAR(5) PRIMARY KEY,
	StaffID CHAR(5) FOREIGN KEY REFERENCES Staff(StaffID),
	CustomerID CHAR(5) FOREIGN KEY REFERENCES Customer(CustomerID),
	ServiceDate DATE,

	CONSTRAINT C_ServiceID CHECK(ServiceID LIKE 'SR[0-9][0-9][0-9]')
)

-- CREATE TRANSACTION DETAIL TABLE

CREATE TABLE PurchaseDtl (
	PurchaseID CHAR(5) FOREIGN KEY REFERENCES PurchaseTr(PurchaseID),
	MaterialID CHAR(5) FOREIGN KEY REFERENCES Material(MaterialID),
	PurchaseQty INT
)

CREATE TABLE ServiceDtl (
	ServiceID CHAR(5) FOREIGN KEY REFERENCES ServiceTr(ServiceID),
	ClothesID CHAR(5) FOREIGN KEY REFERENCES Clothes(ClothesID),
	ServiceType VARCHAR(25),
	ServicePrice INT,

	CONSTRAINT C_ServiceType CHECK(ServiceType IN('Laundry Service', 'Dry Cleaning Service', 'Ironing Service'))
)