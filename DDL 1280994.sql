/*
								SQL Project Name : Hotel Management System(HMS)
											Trainee Name : Abdullah Al Mamun  
						    				  Trainee ID : 1280994       
										Batch ID : ESAD-CS/PNTL-M/58/01 

 ---------------------------------------------------------------------------------------------------------------

Table of Contents: DDL
			=> SECTION 01: CREATE A DATABASE [HMS]
			=> SECTION 02: CREATE APPROPRIATE TABLES WITH COLUMN DEFINITION RELETED TO THE PROJECT
			=> SECTION 03: ALTER, DROP AND MODIFY TABLES & COLUMNS
			=> SECTION 04: CREATE CLUSTERED AND NONCLUSTERED INDEX
			=> SECTION 05: CREATE SEQUENCE & ALTER SEQUENCE
			=> SECTION 06: CREATE A VIEW & ALTER VIEW
			=> SECTION 07: CREATE STORED PROCEDURE & ALTER STORE PROCEDURE
			=> SECTION 08: CREATE FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTI-STATEMENT TABLE VALUED)
			=> SECTION 09: CREATE TRIGGER (FOR/AFTER TRIGGER)
			=> SECTION 10: CREATE TRIGGER (INSTEAD OF TRIGGER)
*/


/*
==============================  SECTION 01  ==============================
					CREATE DATABASE WITH ATTRIBUTES
==========================================================================
*/
CREATE DATABASE HotelManagementSystem
ON
(
	name='HMS_Data',
	filename='E:\TempData\HMS_Data.mdf',
	size=2mb,
	maxSize=200mb,
	filegrowth=2%
)
LOG ON
(
	name='HMS_Log',
	filename='E:\TempData\HMS_Data.ldf',
	size=3mb,
	maxSize=200mb,
	filegrowth=2mb
)
GO
use HotelManagementSystem
GO
/*
==============================  SECTION 02  ==============================
		          CREATE TABLES WITH COLUMN DEFINITION 
==========================================================================
*/

---- Tables with IDENTITY, PRIMARY KEY,FOREIGN KEY,DEFAULT KEY,CHECK & NULABILITY CONSTRAINT

--TABLE 01

CREATE TABLE hotel
(
	hotelId INT IDENTITY PRIMARY KEY NOT NULL,
	hotelName VARCHAR(100) NOT NULL,
	location VARCHAR(200) NOT NULL,
	phoneNumber NCHAR(15),
	email NVARCHAR(50),
	stars INT
)
GO

--TABLE 02

CREATE TABLE room
(
	roomNumber INT PRIMARY KEY NOT NULL,
	roomType VARCHAR(20) DEFAULT 'Standerd',
	availability BIT NOT NULL,
	pricePerNight MONEY UNIQUE,
	hotelId INT REFERENCES hotel(hotelId)
)
GO

--TABLE 03

CREATE TABLE guests
(
	guestId INT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	dateOfBirth DATE,
	NID int NOT NULL,
	address VARCHAR(150),
	phone VARCHAR(15),
	email NVARCHAR(50) NULL CHECK (email LIKE '%@%')
)
GO

--TABLE 04

CREATE TABLE booking
(
	bookingId INT PRIMARY KEY,
	guestId INT REFERENCES guests(guestId),
	roomNumber INT REFERENCES room(roomNumber),
	check_inDate DATE UNIQUE,
	check_outDate DATE UNIQUE,
	totalPrice MONEY
)
GO

--TABLE 05

CREATE TABLE payment
(
	paymentId INT unique,
	bookingId INT REFERENCES booking(bookingId),
	amount MONEY,
	discount FLOAT,
	paymentDate DATE DEFAULT GETDATE()
)
GO

--TABLE 06

CREATE TABLE staff
(
	staffId INT IDENTITY,
	hotelId INT REFERENCES hotel(hotelId),
	name VARCHAR(100),
	phone INT
)
--TABLE 07

CREATE TABLE feedback
(
	id INT,
	description NVARCHAR(500)
)
GO
/*
==============================  SECTION 03  ==============================
		          ALTER, DROP AND MODIFY TABLES & COLUMNS
==========================================================================
*/

--MODIFY COULMN DEFINITION
ALTER TABLE hotel
ALTER COLUMN location NVARCHAR(250) NOT NULL
GO
ALTER TABLE guestS
ALTER COLUMN NID INT
GO

--ADD COLUMN
ALTER TABLE payment
ADD paymentMethod VARCHAR(100)
GO

--DROP COLUMN
ALTER TABLE payment
DROP COLUMN paymentMethod
GO

--DROP TABLE
DROP TABLE feedback
GO

/*
==============================  SECTION 04  ==============================
		          CREATE CLUSTERED AND NONCLUSTERED INDEX
==========================================================================
*/

CREATE CLUSTERED INDEX ix_payment
ON payment (paymentId)
GO 

CREATE NONCLUSTERED INDEX nix_hotel
ON hotel (hotelName,email)
GO
/*
==============================  SECTION 05  ==============================
							 CREATE SEQUENCE
==========================================================================
*/

CREATE SEQUENCE Seq_temp 
AS INT 
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 1000
CYCLE
CACHE 9
GO


/*
==============================  SECTION 06  ==============================
							  CREATE A VIEW
==========================================================================
*/

--CREATE VIEW
CREATE VIEW vGuestStayingInfo
AS
SELECT  g.name,g.phone,h.hotelName,h.stars,r.roomNumber,r.roomType,b.check_inDate,b.check_outDate FROM hotel h
JOIN room r ON r.hotelId=h.hotelId
JOIN booking b ON b.roomNumber=r.roomNumber
JOIN guests g ON g.guestId=b.guestId
GO

--ALTER VIEW
ALTER VIEW vGuestStayingInfo
AS
SELECT  g.name,g.phone,g.NID,h.hotelName,h.stars,r.roomNumber,b.check_inDate,b.check_outDate FROM hotel h
JOIN room r ON r.hotelId=h.hotelId
JOIN booking b ON b.roomNumber=r.roomNumber
JOIN guests g ON g.guestId=b.guestId
GO

--CREATE VIEW WITH SCHEMABINDING & ENCRIPTION
CREATE VIEW vGuestPaymentInfo
WITH SCHEMABINDING, ENCRYPTION
AS
SELECT  g.name,h.hotelName,b.check_inDate,b.check_outDate,DATEDIFF(DAY,b.check_inDate,b.check_outDate)*r.pricePerNight AS 'Total Bill' FROM hotel h
JOIN room r ON r.hotelId=h.hotelId
JOIN booking b ON b.roomNumber=r.roomNumber
JOIN guests g ON g.guestId=b.guestId
GROUP BY g.name,h.hotelName,b.check_inDate,b.check_outDate
GO

/*
==============================  SECTION 07  ==============================
							 STORE PROCEDURE
==========================================================================
*/
--CREATE STORE PROCEDURE TO INSERT DATA

CREATE PROC spHotelInsert   @id INT,
							@name VARCHAR(100),
							@location VARCHAR(200),
							@phoneNumber NCHAR(15),
							@email NVARCHAR(50),
							@stars INT
AS
	INSERT INTO hotel(hotelId,hotelName,location,phoneNumber,email,stars) VALUES (@id,@name,@location,@phoneNumber,@email,@stars)
GO
EXEC spHotelInsert 1,'Hotel Sonargaon','Shahbag',025612452,'sonargaonhotel@gmail.com',5
GO

--CREATE STORE PROCEDURE TO UPDATE DATA

CREATE PROC spRoomUpdate   @id INT,
						  @type VARCHAR(20),
						  @av BIT
AS
	UPDATE room SET roomType=@type,availability=@av WHERE roomNumber=@id
GO
EXEC spRoomUpdate 1,'Standerd',1 
GO

--CREATE STORE PROCEDURE TO DELETE DATA

CREATE PROC spHotelDelete @id INT
AS
DELETE FROM hotel WHERE hotelId=@id
GO
EXEC spHotelDelete 2
GO

--ALTER PROCEDURE

ALTER PROC spRoomUpdate   @id INT,
						  @type VARCHAR(20),
						  @av BIT,
						  @price MONEY
AS
	UPDATE room SET roomType=@type,availability=@av,pricePerNight=@price WHERE roomNumber=@id
GO

/*
==============================  SECTION 08  ==============================
								 FUNCTION
==========================================================================
*/

--SCELAR VALUED FUNCTION
CREATE FUNCTION fnTotalPayment()
RETURNS MONEY
AS
BEGIN
	DECLARE @totalPayment MONEY
		SELECT @totalPayment=SUM((amount))
		FROM payment
	RETURN @totalPayment
END
GO

--SIMPLE TABLE VALUED FUNCTION
CREATE FUNCTION fnPaymentTable (@year INT, @month INT) 
RETURNS TABLE
AS
RETURN
(
	SELECT SUM(amount) AS 'Total Price',
			SUM(amount*(1-discount)) AS 'Net Payment'
	FROM payment
	WHERE YEAR(paymentDate)=@year AND MONTH(paymentDate)=@month
)
GO

--MULI-STATEMENT TABLE VALUED FUNCTION
CREATE FUNCTION fnMultiTablePayment (@year INT,@month INT)
RETURNS @payment TABLE
(
	paymentId INT,
	TotalAmount MONEY,
	totalDiscount MONEY,
	netPayment MONEY
)
AS
BEGIN 
	INSERT INTO @payment
	SELECT  paymentId,
			SUM(amount),
			SUM(amount*discount),
			SUM(amount*(1-discount))
	FROM payment
	WHERE YEAR(paymentDate)=@year AND MONTH(paymentDate)=@month
	GROUP BY paymentId
	RETURN
END
GO

/*
==============================  SECTION 09  ==============================
							FOR/AFTER TRIGGER
==========================================================================
*/

--CREATE TRIGGER ON PAYMENT TABLE TO UPDATE BOOKING TABLE BY INSERTING PAYMENT TABLE
CREATE TRIGGER trInsertPayment
ON payment
FOR INSERT
AS
BEGIN
	DECLARE @id INT
	DECLARE @a MONEY

	SELECT
	@id =bookingId,
	@a = amount
	FROM inserted

	UPDATE booking
	SET totalPrice = totalPrice + @a
	WHERE bookingId = @id
	PRINT 'Booking updated via Payment Entry'
END
GO

--AFTER TRIGGER FOR UPDATE OR DELETE 
CREATE TRIGGER trUpdatDeletests
ON payment
FOR DELETE,UPDATE
AS
BEGIN
		DECLARE @i INT
		declare @a MONEY

		SELECT @i=bookingId,@a=amount FROM deleted
		

		DELETE FROM booking WHERE bookingId=@i
		UPDATE booking SET totalPrice=totalPrice-@a WHERE bookingId=@i
END
GO

--INSTEAD OF TRIGGER ON A TABLE
CREATE TRIGGER InsteadOfInsertTrigger
ON hotel
INSTEAD OF INSERT
AS 
BEGIN

    INSERT INTO hotel(hotelId, hotelName, location)
    SELECT hotelId, hotelName, location
    FROM inserted
END
GO

--INSTEAD OF TRIGGER ON A VIEW
CREATE TRIGGER trViewInsteadInsert
ON vGuestStayingInfo
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO room(roomNumber)
	SELECT roomNumber FROM inserted 
END
GO
-----------------------------------------------------------------------------