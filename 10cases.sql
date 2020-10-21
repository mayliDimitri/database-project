USE RALaundry

-- 1. Display CustomerId, CustomerName, and TotalServicePrice (obtained from sum of 
-- service price) for every service transaction that occurred on July and the customer gender 
-- is male.

SELECT 
	Customer.CustomerId,
	CustomerName,
	[TotalServicePrice] = SUM(ServicePrice) 
FROM Customer 
	JOIN ServiceTr ON Customer.CustomerId= ServiceTr.CustomerId 
	JOIN ServiceDtl ON ServiceDtl.ServiceId = ServiceTr.ServiceId
WHERE CustomerGender LIKE 'Male'
	AND MONTH(ServiceDate) = 7
GROUP BY Customer.CustomerId, CustomerName

-- 2. Display StaffName, PurchaseDate, and TotalTransaction (obtained from count of 
-- purchase transaction) for each staff whose name contains ‘o’ and TotalTransaction is 
-- greater than 1.

SELECT
	Staff.StaffName,
	PurchaseTr.PurchaseDate,
	[TotalTransaction] = COUNT(PurchaseDtl.PurchaseID)
FROM Staff
	JOIN PurchaseTr ON Staff.StaffId = PurchaseTr.StaffId
	JOIN PurchaseDtl ON PurchaseTr.PurchaseID = PurchaseDtl.PurchaseID
WHERE StaffName LIKE '%o%'
GROUP BY Staff.StaffName, PurchaseTr.PurchaseDate
HAVING COUNT(PurchaseDtl.PurchaseID) > 1

-- 3. Display VendorName, PurchaseDate (obtained from PurchaseDate in ‘Mon dd,yyyy’ 
-- format), TotalTransaction (obtained from count of purchase transaction), and 
-- TotalPurchasePrice (obtained from the sum of quantity*material price) for every vendor
-- whose name starts with ‘PT. ’ and transaction occurred at odd day.

SELECT
	Vendor.VendorName,
	[PurchaseDate] = FORMAT(PurchaseDate, 'MM dd,yyyy'),
	[TotalTransaction] = COUNT(PurchaseDtl.PurchaseId),
	[TotalPurchasePrice] = SUM(PurchaseQty * Material.MaterialPrice)
FROM Vendor
	JOIN PurchaseTr ON Vendor.VendorId = PurchaseTr.VendorId
	JOIN PurchaseDtl ON PurchaseTr.PurchaseId = PurchaseDtl.PurchaseId
	JOIN Material ON PurchaseDtl.MaterialId = Material.MaterialId
WHERE SUBSTRING(VendorName, 1, 3) LIKE 'PT.'
	AND DAY(PurchaseDate) % 2 > 0
GROUP BY PurchaseDate, Vendor.VendorName

-- 4. Display StaffName, MaterialName, TotalTransaction (obtained from count of purchase 
-- transaction), and TotalQuantity (obtained from sum of quantity and ended with ‘ pcs’) 
-- for every purchase transaction that occurred in July and TotalQuantity is less than 9.

SELECT
	StaffName,
	MaterialName,
	[TotalTransaction] = COUNT(PurchaseDtl.PurchaseID),
	[TotalQuantity] = CAST(SUM(PurchaseDtl.PurchaseQty) AS VARCHAR) + ' pcs'
FROM Staff
	JOIN PurchaseTr ON Staff.StaffId = PurchaseTr.StaffId
	JOIN PurchaseDtl ON PurchaseTr.PurchaseId = PurchaseDtl.PurchaseId
	JOIN Material ON PurchaseDtl.MaterialId = Material.MaterialId
WHERE MONTH(PurchaseTr.PurchaseDate) = 7
GROUP BY StaffName, MaterialName
HAVING COUNT(PurchaseDtl.PurchaseID) < 9

-- 5. Display MaterialId (obtained by replacing ‘MA’ with ‘Material ’), MaterialName 
-- (obtained from material name in uppercase format), PurchaseDate, and Quantity where 
-- material type is ‘Supplies’ and quantity is greater than average quantity. Then sort by 
-- MaterialId in ascending format.

SELECT
	[MaterialId] = REPLACE(PurchaseDtl.MaterialID, 'MA', 'Material '),
	MaterialName = UPPER(Material.MaterialName),
	PurchaseDate,
	PurchaseQty
FROM Material
	JOIN PurchaseDtl ON Material.MaterialId = PurchaseDtl.MaterialId
	JOIN PurchaseTr ON PurchaseDtl.PurchaseId = PurchaseTr.PurchaseId,
	(
		SELECT [AverageQty] = AVG(PurchaseQty)
		FROM PurchaseDtl
	) AS AQ
WHERE 
	MaterialType LIKE 'Supplies'
	AND PurchaseDtl.PurchaseQty > AQ.AverageQty
ORDER BY PurchaseDtl.MaterialID ASC 

-- 6. Display StaffName, CustomerName, and ServiceDate (obtained from ServiceDate in ‘dd 
-- Mon yyyy’ format) which handled by staff whose salary is more than the average salary 
-- and staff name only has one word. 

SELECT
	Staff.StaffName,
	Customer.CustomerName,
	[ServiceDate] = FORMAT(ServiceDate, 'dd MM yyyy')
FROM Staff
	JOIN ServiceTr ON Staff.StaffId = ServiceTr.StaffId
	JOIN Customer ON ServiceTr.CustomerId = Customer.CustomerId,
	(
		SELECT [AverageSalary] = AVG(StaffSalary)
		FROM Staff
	) AS AvgSal
WHERE
	Staff.StaffID > AvgSal.AverageSalary
	AND CHARINDEX(' ', StaffName) < 0
GROUP BY Staff.StaffName, Customer.CustomerName, ServiceDate

-- 7. Display ClothesName, TotalTransaction (obtained from count of service and ended with 
-- ‘ transaction’), ServiceType (obtained from the first word of service type), and 
-- ServicePrice where the service price is less than the average of service price and clothes 
-- type is ‘Cotton’.

SELECT 
	Clothes.ClothesName,
	[TotalTransaction] = CAST(COUNT(ServiceDtl.ServiceId) AS VARCHAR) + ' transaction',
	[ServiceType] = SUBSTRING(ServiceDtl.ServiceType, 1, CHARINDEX(' ', ServiceDtl.ServiceType)),
	ServiceDtl.ServicePrice
FROM Clothes
	JOIN ServiceDtl ON Clothes.ClothesId = ServiceDtl.ClothesId
	JOIN ServiceTr ON ServiceDtl.ServiceId = ServiceTr.ServiceId,
	(
		SELECT [AverageServicePrice] = AVG(ServicePrice)
		FROM ServiceDtl
	) AS ASP
WHERE ServiceDtl.ServicePrice < ASP.AverageServicePrice
	AND ClothesType LIKE 'Cotton'
GROUP BY Clothes.ClothesName, ServiceDtl.ServiceID, ServiceType, ServicePrice

-- 8. Display StaffFirstName (obtained from the first word of staff name), VendorName, 
-- VendorPhoneNumber (obtained from vendor phone number by replacing ‘08’ with 
-- ‘+628’), and TotalTransaction (obtained from the count of purchase) for every 
-- transaction which quantity is greater than the average quantity and staff name at least 
-- consists of two words.

SELECT
	[StaffFirstName] = SUBSTRING(StaffName, 1, CHARINDEX(' ', StaffName)),
	VendorName,
	[VendorPhoneNumber] = REPLACE(VendorPhoneNumber, '08', '+628'),
	[TotalTransaction] = COUNT(PurchaseDtl.PurchaseID)
FROM Staff
	JOIN PurchaseTr ON Staff.StaffId = PurchaseTr.PurchaseId
	JOIN Vendor ON PurchaseTr.VendorId = Vendor.VendorId
	JOIN PurchaseDtl ON PurchaseTr.PurchaseID = PurchaseDtl.PurchaseID,
	(
		SELECT [AveragePurchaseQty] = AVG(PurchaseQty)
		FROM PurchaseDtl
	) AS APQ
WHERE PurchaseQty > APQ.AveragePurchaseQty
	AND CHARINDEX(' ', StaffName) > 0
GROUP BY StaffName, VendorName, VendorPhoneNumber

-- 9. Create a view named ‘ViewMaterialPurchase’ to display MaterialName, MaterialPrice
-- (obtained by adding ‘Rp. ’ in front of the material price and in money format), 
-- TotalTransaction (obtained from count of purchase), and TotalPrice (obtained from sum 
-- of quantity*material price) where material type is ‘Supplies’ and TotalTransaction is 
-- greater than 2.

CREATE VIEW ViewMaterialPurchase
AS
SELECT
	Material.MaterialName,
	[MaterialPrice] = 'Rp. ' + CAST(Material.MaterialPrice AS VARCHAR),
	[TotalTransaction] = COUNT(PurchaseDtl.PurchaseID),
	[TotalPrice] = SUM(PurchaseQty * MaterialPrice)
FROM Material
	JOIN PurchaseDtl ON PurchaseDtl.MaterialID = Material.MaterialID
WHERE MaterialType LIKE 'Supplies'
GROUP BY Material.MaterialName, Material.MaterialPrice
HAVING COUNT(PurchaseDtl.PurchaseID) > 2

SELECT *
FROM ViewMaterialPurchase

-- 10. Create a view named ‘ViewMaleCustomerTransaction’ to display CustomerName, 
-- ClothesName, TotalTransaction (obtained from count of service), and TotalPrice 
-- (obtained from sum of service price) for every male customer and the clothes type are 
-- ‘Wool’ and ‘Linen’.

CREATE VIEW ViewMaleCustomerTransaction
AS
SELECT
	CustomerName,
	ClothesName,
	[TotalTransaction] = COUNT(ServiceDtl.ServiceID),
	[TotalPrice] = SUM(ServicePrice)
FROM Customer
	JOIN ServiceTr ON ServiceTr.CustomerID = Customer.CustomerID
	JOIN ServiceDtl ON ServiceDtl.ServiceID = ServiceTr.ServiceID
	JOIN Clothes ON Clothes.ClothesID = ServiceDtl.ClothesID
WHERE
	CustomerGender LIKE 'Male'
	AND ClothesType IN('Wool', 'Linen')
GROUP BY CustomerName, ClothesName

SELECT *
FROM ViewMaleCustomerTransaction




