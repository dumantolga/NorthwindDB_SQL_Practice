
--Northwind örnek veri tabanında SQL pratiği




--"Müşteriler" tablosundaki tüm kayıtları seç
Select * from Customers

--"Customers" tablosundan "CustomerName" ve "City" sütunlarını seç
SELECT CompanyName, City FROM Customers

--"Müşteriler" tablosundaki "Ülke" sütunundaki tüm (yinelenenler dahil) değerleri seç
SELECT Country FROM Customers

--"Müşteriler" tablosundaki "Ülke" sütunundan yalnızca DISTINCT(birbirinden farklı) değerlerini seç
SELECT DISTINCT Country FROM Customers

--"Müşteiler" tablosunda kaç farklı ülke olduğunu listele
Select COUNT(distinct Country) from Customers

--"Müşteriler" tablosunda "Meksika" ülkesindeki tüm müşterileri seç
SELECT * FROM Customers WHERE Country='Mexico'

--"Müşteriler" tablosunda CustomerId'si ALFKI olan müşteriyi listele
select * from Customers where CustomerID = 'ALFKI'

--ülkenin "Almanya" ve şehrin "Berlin" olduğu "Müşteriler"den tüm alanları seç
SELECT * FROM Customers WHERE Country='Germany' AND City='Berlin'

--şehrin "Berlin" VEYA "München" olduğu "Müşteriler"den tüm alanları seç
SELECT * FROM Customers WHERE City='Berlin' OR City='München'

--ülkenin "Almanya" VEYA "İspanya" olduğu "Müşteriler"den tüm alanları seç
SELECT * FROM Customers WHERE Country='Germany' OR Country='Spain'

--ülkenin "Almanya" OLMADIĞI tüm alanları "Müşteriler"den seç
SELECT * FROM Customers WHERE NOT Country='Germany'

--ülkenin "Almanya" olduğu VE şehrin "Berlin" VEYA "München" olması gerektiği durumlarda "Müşteriler"den tüm alanları seç
SELECT * FROM Customers WHERE Country='Germany' AND (City='Berlin' OR City='München')

--Almanyalı ve ABD li olmayan müşterileri listele
select * from Customers where not Country='germany' and not Country = 'USA'

--"Ülke" sütununa göre sıralanmış "Müşteriler" tablosundan tüm müşterileri seç (default asc) (A'dan Z'ye)
SELECT * FROM Customers ORDER BY Country 

--"Ülke" sütununa göre DESCENDING olarak sıralanan "Müşteriler" tablosundan tüm müşterileri seç(Z'den A'ya)
SELECT * FROM Customers ORDER BY Country DESC

--"Müteriler" tablosundaki müşterileri ülkelere göre sırala aynı ülkeden olan müşterileri şirket adına göre sırala
SELECT * FROM Customers ORDER BY Country,CompanyName

--"Ülke"ye göre artan ve "MüşteriAdı" sütununa göre azalan şekilde sıralanan "Müşteriler" tablosundan tüm müşterileri seç
select * from Customers order by Country asc, CompanyName desc

--"Müşteriler" tablosuna yeni bir kayıt ekle
insert into Customers(CustomerID,CompanyName,Address,City,PostalCode,Country)
values ('TOLDU','Orontes','Cardakli','Antakya', 31160,'Türkiye')

--yalnızca "CompanyName", "City" ve "Country" sütunlarına veri ekle
insert into Customers(CustomerID,CompanyName,City,Country)
values ('ORNEK','Cardinal','Stavanger','Norway')

--"Adres" alanında NULL değerine sahip tüm müşterilerin "CompanyName", "ContactName", "Address" bilgilerini listele
SELECT CompanyName, ContactName, Address
FROM Customers
WHERE Address IS NULL

--"Adres" alanında değeri olan tüm müşterileri listele
select CompanyName, ContactName, Address
from Customers
where Address is not null

--ilk müşteriyi (CustomerID = 'ALFKI') yeni bir ilgili kişi ve yeni bir şehirle günceller.
update Customers
set ContactName='Alfred Schmidt',City='Frankfurt'
where CustomerID='ALFKI'

--ülkenin "Meksika" olduğu tüm kayıtlar için KişiAdı'nı "Juan" olarak güncelle(Dikkat where atlanırsa tüm kayıtlar güncellenir)
update Customers
set ContactName='Juan'
where Country ='mexico'

-- "Cardinal" müşterisini "Müşteriler" tablosundan sil
DELETE FROM Customers WHERE CompanyName='Cardinal'

--"Müşteriler" tablosundan ilk üç kaydı seç
select top 3 * from Customers

-- "Müşteriler" tablosundan kayıtların ilk %50'sini seç
SELECT TOP 50 PERCENT * FROM Customers

--ülkenin "Almanya" olduğu (SQL Server/MS Access için) "Müşteriler" tablosundan ilk üç kaydı seç
select top 3 * from Customers where Country='Germany'

--en ucuz ürünün fiyatını bul
select min(UnitPrice) as EnUcuz from Products

--en pahalı ürünün fiyatını bul
select max(UnitPrice) as EnPahalı from Products

--ürün sayısını bul
select count(ProductID) from Products

--tüm ürünlerin ortalama fiyatını bul
select avg(UnitPrice) from Products

--"Sipariş Ayrıntıları" tablosundaki "Miktar" alanlarının toplamını bul
select sum(Quantity) from [Order Details]

--Şirket adı "a" ile başlayan müşterileri seç
select * from Customers where CompanyName like 'a%'

--Şirket adı "a" ile biten müşterileri seç
select * from Customers where CompanyName like '%a'

--Şirketadının herhangi bir konumda "or" olan tüm müşterileri seç
select * from Customers where CompanyName like '%or%'

--Şirket adı 2.harfi "r" olan müşterileri listele
select * from Customers where CompanyName like '_r%'

--"a" ile başlayan ve en az 3 karakter uzunluğunda Şirket adı olan tüm müşterileri seç
select * from Customers where CompanyName like 'a__%'

--ContactName' i "a" ile başlayan ve "o" ile biten tüm müşterileri seç
select * from Customers where CompanyName like 'a%o'

--Şirket adı a ile başlamayan müşterileri listele
select * from Customers where CompanyName not like 'a%'

--"ber" ile başlayan bir City'ye sahip tüm müşterileri seç
SELECT * FROM Customers WHERE City LIKE 'ber%'

--"es" kalıbını içeren bir Şehire sahip tüm müşterileri seç
SELECT * FROM Customers WHERE City LIKE '%es%'

--herhangi bir karakterle başlayan ve ardından "ondon" gelen City olan tüm müşterileri seç
SELECT * FROM Customers WHERE City LIKE '_ondon'

--"L" ile başlayan, ardından herhangi bir karakter, ardından "n", ardından herhangi bir karakter ve ardından "on" olan tüm müşterileri seç
SELECT * FROM Customers WHERE City LIKE 'L_n_on'

--"b", "s" veya "p" ile başlayan bir Şehire sahip tüm müşterileri seç
SELECT * FROM Customers WHERE City LIKE '[bsp]%'

-- "a", "b" veya "c" ile başlayan bir Şehire sahip tüm müşterileri seç
select * from Customers where City like '[a-c]%'

--"b", "s" veya "p" ile BAŞLAMAYAN bir Şehri olan tüm müşterileri seç
SELECT * FROM Customers WHERE City LIKE '[!bsp]%'

--"Almanya", "Fransa" veya "İngiltere"de bulunan tüm müşterileri seç
SELECT * FROM Customers WHERE Country IN ('Germany', 'France', 'UK')

--"Almanya", "Fransa" veya "İngiltere" de OLMAYAN tüm müşterileri seç
SELECT * FROM Customers WHERE Country not IN ('Germany', 'France', 'UK')

--tedarikçilerle aynı ülkelerden gelen tüm müşterileri seç
SELECT  * FROM Customers WHERE  Country IN (SELECT Country FROM Suppliers)

--fiyatı 10 ile 20 arasında olan tüm ürünleri seç
SELECT * FROM Products WHERE UnitPrice BETWEEN 10 AND 20

--fiyatı 10 ile 20 arasında olanlar dışındaki tüm ürünleri seç
SELECT * FROM Products WHERE UnitPrice not BETWEEN 10 AND 20

--Fiyatı 10 ile 20 arasında olan ürünleri kategori kimliği 1,2,3 olanlar hariç listele
SELECT * FROM Products WHERE UnitPrice BETWEEN 10 AND 20 and CategoryID not in(1,2,3)

--'Carnarvon Tigers' ve 'Mozzarella di Giovanni' arasındaki ürünleri ürün adına göre sırala
select * from Products 
where ProductName between 'Carnarvon Tigers' and 'Mozzarella di Giovanni'
order by ProductName

--'Carnarvon Tigers' ve 'Chef Anton's Cajun Seasoning' arasındaki ürünleri ürün adına göre sırala
select * from Products 
where ProductName between 'Carnarvon Tigers' and 'Chef Anton''s Cajun Seasoning'
order by ProductName

--Carnarvon Tigers ve Mozzarella di Giovanni arasında olmayan ürünleri ürün adına göre sırala
select * from Products 
where ProductName not between 'Carnarvon Tigers' and 'Mozzarella di Giovanni'
order by ProductName

--'01-Temmuz-1996' ve '31-Temmuz-1996' arasındaki OrderDate'li tüm siparişleri seç
select * from Orders
where OrderDate between '1996-07-01' and '1996-07-31'

--biri CustomerID sütunu ve diğeri CompanyName sütunu için olmak üzere iki takma ad oluşturur
select CustomerID as MüşteriID, CompanyName as ŞirketAdı from Customers

--Not: Takma ad boşluk içeriyorsa, çift tırnak işareti veya köşeli parantez gerekir
--biri CustomerID sütunu ve diğeri CompanyName sütunu için olmak üzere iki takma ad oluşturur
select CustomerID as MüşteriID, CompanyName as [Şirket Adı] from Customers

--dört sütunu (Adres, Posta Kodu, Şehir ve Ülke) birleştiren "Adres" adlı bir takma ad oluştur
select CompanyName,Address+','+PostalCode+','+City+','+Country as Adres from Customers

--CustomerID=4 (Around the Horn) olan müşteriden gelen tüm siparişleri seçer. 
--"Müşteriler" ve "Siparişler" tablolarını kullanıyoruz ve onlara sırasıyla 
--"c" ve "o" tablo takma adlarını veriyoruz (Burada SQL'i kısaltmak için takma adlar kullanıyoruz)
select c.CompanyName,o.OrderDate,o.OrderID from Customers as c,Orders as o
where c.CompanyName='Around the Horn' and o.CustomerID=c.CustomerID

--yukarıdakiyle aynıdır, ancak takma adları yoktur
SELECT Orders.OrderID, Orders.OrderDate, Customers.CompanyName
FROM Customers, Orders
WHERE Customers.CompanyName='Around the Horn' AND Customers.CustomerID=Orders.CustomerID

--Siparişler tablosundaki OrderID,OrderDate ve Müşteriler tablosundan CompanyName bilgilerini birleştir yeni bir tablo oluştur
select Orders.OrderID,Orders.OrderDate,Customers.CustomerID 
from Orders join Customers 
on Customers.CustomerID=Orders.CustomerID

--SQL'deki farklı JOIN türleri şunlardır:

--(INNER) JOIN: Her iki tabloda da eşleşen değerlere sahip kayıtları döndürür
--LEFT (OUTER) JOIN: Soldaki tablodaki tüm kayıtları ve sağdaki tablodaki eşleşen kayıtları döndürür
--RIGHT (OUTER) JOIN: Sağdaki tablodaki tüm kayıtları ve soldaki tablodaki eşleşen kayıtları döndürür
--FULL (OUTER) JOIN: Sol veya sağ tabloda bir eşleşme olduğunda tüm kayıtları döndürür

--müşteri bilgilerine sahip tüm siparişleri seç
select o.OrderID,c.CompanyName 
from Orders as o inner join customers as c 
on o.CustomerID=c.CustomerID

--tüm müşterileri ve sahip olabilecekleri siparişleri seç
select c.CompanyName, o.OrderID
from Customers as c left join Orders as o 
on o.CustomerID=c.CustomerID
order by c.CompanyName -- çok gerekli deil zaten default

--tüm çalışanları ve hazırladıkları siparişleri döndür
select o.OrderID,e.FirstName,e.LastName 
from Orders as o right join Employees as e
on o.EmployeeID=e.EmployeeID
order by o.OrderID

--tüm müşterileri ve tüm siparişleri seç
select c.CompanyName,o.OrderID 
from customers as c full join orders as o 
on c.CustomerID=o.CustomerID 
order by c.CompanyName

--Müşteiler tablosundaki heşeri(aynı şehirden) olan müşterileri eşleyerek birleştir.
select M1.CompanyName [Müşteri Adı],M2.CompanyName [Hemşeri Adı], m1.city 
from Customers M1 inner join Customers M2 
on M1.CustomerID<>M2.CustomerID and M1.City=m2.City 
order by m1.City

--Müşteriler" hem de "Tedarikçiler" tablosundan şehirleri (yalnızca farklı değerler) döndür
select city from Customers
union
select city from Suppliers
order by city

--Müşteriler" hem de "Tedarikçiler" tablosundan şehirleri (yinelenen değerler de) döndür
select city from Customers
union all
select city from Suppliers
order by city

--hem "Müşteriler" hem de "Tedarikçiler" tablosundan Alman şehirlerini (yalnızca farklı değerler) döndür
SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City

--"Müşteriler" hem de "Tedarikçiler" tablosundan Alman şehirlerini (yinelenen değerler de) döndür
SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION ALL
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City

--tüm müşterileri ve tedarikçileri listele
select 'Müşteri' as Type, ContactName, City, Country from Customers
union
select 'Tedarikçi' , ContactName, City, Country from Suppliers

--her ülkedeki müşteri sayısını listele
select Country, count(CustomerID) MüşteriSayısı from Customers group by Country


--yüksekten düşüğe doğru sıralanmış olarak her ülkedeki müşteri sayısını listele
select Country, count(CustomerID) MüşteriSayısı 
from Customers 
group by Country 
order by MüşteriSayısı desc --müşteri sayısı yerine count(CustomerID) kullanılabilir

--her bir gönderici tarafından gönderilen siparişlerin sayısını listele
select Shippers.CompanyName,count(orders.OrderID) as [Sipariş Sayısı]
from Orders 
left join Shippers on Orders.ShipVia = Shippers.ShipperID 
group by CompanyName

--üsteki örneğin aynsı
select s.ShipperID, s.CompanyName, COUNT(o.OrderID) from Orders o 
join Shippers s on o.ShipVia= s.ShipperID 
group by CompanyName,ShipperID

--her ülkedeki müşteri sayısını listeler. Yalnızca 5'ten fazla müşterisi olan ülkeleri dahil edin
select country, count(CustomerID) from Customers group by country having count(CustomerID)>5 

--yüksekten düşüğe doğru sıralanmış olarak her ülkedeki müşteri sayısını listele
select Country,count(CustomerID) as m 
from Customers 
group by Country 
having count(CustomerID)>5 
order by m desc

--10'dan fazla sipariş kaydeden çalışanları listele
select e.EmployeeID,(e.FirstName+' '+e.LastName),count(o.OrderID) 
from Orders o
join Employees e on o.EmployeeID=e.EmployeeID
group by e.EmployeeID,(e.FirstName+' '+e.LastName)
having count(o.OrderID)>10

--"Davolio" veya "Fuller" çalışanlarının 25'ten fazla sipariş kaydettirip kaydetmediğini listele
select e.LastName, count(o.OrderID) 
from Orders o
join Employees e on e.EmployeeID = o.EmployeeID
group by LastName
having e.LastName='Davolio' and count(o.OrderID)>25 or e.LastName='Fuller' and count(o.OrderID)>25
--veya
SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE LastName = 'Davolio' OR LastName = 'Fuller'
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 25

--DOĞRU değerini döndürerek ve ürün fiyatı 20'den az olan tedarikçileri listele
SELECT CompanyName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND UnitPrice < 20)

-- DOĞRU değerini döndürür ve ürün fiyatı 22'ye eşit olan tedarikçileri listele
select CompanyName from Suppliers 
where exists 
(select * from Products 
where Suppliers.SupplierID=Products.SupplierID and UnitPrice =22)

--OrderDetails tablosunda Quantity'nin 10'a eşit HERHANGİ bir kaydı bulursa ProductName'i listele 
--(Quantity sütununda 10'luk bazı değerler olduğundan bu, TRUE değerini döndürür)
select ProductName 
from products 
where ProductID = any 
(select ProductID from [Order Details] where Quantity=10)

--OrderDetails tablosunda Quantity'nin 99'dan büyük HERHANGİ bir kaydı bulursa ProductName'i listele 
--(Quantity sütununda 99'dan büyük bazı değerler olduğundan bu, TRUE değerini döndürür)
select ProductName 
from products 
where ProductID = any 
(select ProductID from [Order Details] where Quantity>99)

--OrderDetails tablosunda Miktar 1000'den büyük HERHANGİ bir kayıt bulursa ÜrünAdı'nı listele
--(Miktar sütununda 1000'den büyük değer olmadığı için bu YANLIŞ döndürür)
select ProductName 
from products 
where ProductID = any 
(select ProductID from [Order Details] where Quantity>1000)

--TÜM ürün adlarını listele
select all ProductName from Products 

--OrderDetails tablosundaki TÜM kayıtların Quantity değeri 10'a eşitse ProductName'i listeler. 
--Quantity sütununda birçok farklı değer olduğundan 
--(yalnızca 10 değeri değil) bu elbette FALSE değerini döndürür
select ProductName 
from products 
where ProductID = all 
(select ProductID from [Order Details] where Quantity=10)

--Müşterilerin bir yedek kopyasını oluştur
select * into CustomersBackup2022 from Customers

--yalnızca birkaç sütunu yeni bir tabloya kopyalar
SELECT CompanyName, ContactName INTO CustomersBackup2022
FROM Customers

-- oluşturulan kopya tabloyu sil
drop table CustomersBackup2022

--"Müşteriler" tablosundaki tüm satırları tabloyu silmeden sil
delete from CustomersBackup2022

--yalnızca Alman müşterileri yeni bir tabloya kopyala
select * into AlmanMusteriler
from Customers
where country='germany'

--birden fazla tablodaki verileri yeni bir tabloya kopyala
SELECT Customers.CompanyName, Orders.OrderID
INTO CustomersOrderBackup2017
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID

-- "Tedarikçiler"i "Müşteriler"e kopyalar (verilerle doldurulmayan sütunlar NULL içerecektir)
insert into Customers (CompanyName,City,Country)
select CompanyName,City,Country from Suppliers

--"Tedarikçiler"i "Müşteriler"e kopyalar (tüm sütunları doldurun)
INSERT INTO Customers (CompanyName, ContactName, Address, City, PostalCode, Country)
SELECT CompanyName, ContactName, Address, City, PostalCode, Country FROM Suppliers

--yalnızca Alman tedarikçileri "Müşteriler"e kopyala
INSERT INTO Customers (CompanyName, City, Country)
SELECT CompanyName, City, Country FROM Suppliers
WHERE Country='Germany'


--koşullardan geçer ve bir koşul karşılandığında bir değer döndürür
select OrderID,Quantity,
case
when Quantity>30 then 'Miktar 30dan fazla'
when Quantity=30 then'Miktar 30'
else 'Miktar 30dan az'
end as MiktarAcıklama
from [Order Details]

--müşterileri Şehir bazında sıralayacaktır. Ancak, Şehir NULL ise Ülkeye göre sıralayın
select CompanyName,City,Country
from Customers
order by
(case
when city is null then Country
else city
end)

/*
--"Customers" tablosundan tüm kayıtları seçen "SelectAllCustomers" adlı bir saklı yordam oluşturur
CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Customers
GO

--Yukarıdaki saklı yordamı yürüt
exec SelectAllCustomers

--Müşteriler" tablosundan belirli bir Şehirden Müşterileri seçen saklı bir prosedür oluştur
create procedure SelectAllCustomers2 @City nvarchar(30)
as
select * from Customers where City = @City
go

--Yordamı çağır
exec SelectAllCustomers2 @City = 'london'

--"Müşteriler" tablosundan belirli bir Posta Koduna sahip belirli bir Şehirden Müşterileri seçen saklı bir prosedür oluştur
CREATE PROCEDURE SelectAllCustomers3 @City nvarchar(30), @PostalCode nvarchar(10)
AS
SELECT * FROM Customers WHERE City = @City AND PostalCode = @PostalCode
GO

--Yordamı çağır
EXEC SelectAllCustomers3 @City = 'London', @PostalCode = 'WA1 1DP'
*/
