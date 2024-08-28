/*

					SQL Project Name : Hotel Management System(HMS)
							    Trainee Name : Abdullah Al Mamun   
						    	  Trainee ID : 1280994      
							Batch ID : ESAD-CS/PNTL-M/58/01 

 --------------------------------------------------------------------------------
Table of Contents: DML
			=> SECTION 01: INSERT DATA USING INSERT INTO KEYWORD
			=> SECTION 02: INSERT DATA THROUGH STORED PROCEDURE
				SUB SECTION => 2.1 : INSERT DATA USING SEQUENCE VALUE
			=> SECTION 03: UPDATE DELETE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.1 : UPDATE DATA THROUGH STORED PROCEDURE
				SUB SECTION => 3.2 : DELETE DATA THROUGH STORED PROCEDURE
			=> SECTION 04: INSERT UPDATE DELETE DATA THROUGH VIEW
				SUB SECTION => 4.1 : INSERT DATA through view
				SUB SECTION => 4.2 : UPDATE DATA through view
				SUB SECTION => 4.3 : DELETE DATA through view
			=> SECTION 05: RETREIVE DATA USING FUNCTION(SCALAR, SIMPLE TABLE VALUED, MULTISTATEMENT TABLE VALUED)
			=> SECTION 06: TEST TRIGGER (FOR/AFTER TRIGGER ON TABLE)
			=> SECTION 07: QUERY
				SUB SECTION => 7.01 : SELECT FROM TABLE
				SUB SECTION => 7.02 : SELECT FROM VIEW
				SUB SECTION => 7.03 : SELECT INTO
				SUB SECTION => 7.04 : INNER JOIN WITH GROUP BY CLAUSE
				SUB SECTION => 7.05 : TOP CLAUSE WITH TIES
				SUB SECTION => 7.06 : DISTINCT
				SUB SECTION => 7.07 : COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR
				SUB SECTION => 7.08 : LIKE, IN, NOT IN, OPERATOR & IS NULL CLAUSE
				SUB SECTION => 7.09 : OFFSET FETCH
				SUB SECTION => 7.10 : UNION
				SUB SECTION => 7.11 : EXCEPT INTERSECT
				SUB SECTION => 7.12 : AGGREGATE FUNCTIONS
				SUB SECTION => 7.13 : GROUP BY & HAVING CLAUSE
				SUB SECTION => 7.14 : ROLLUP & CUBE OPERATOR
				SUB SECTION => 7.15 : GROUPING SETS
				SUB SECTION => 7.16 : SUB-QUERIES (INNER, CORRELATED)
				SUB SECTION => 7.17 : EXISTS
				SUB SECTION => 7.18 : CTE
				SUB SECTION => 7.19 : MERGE
				SUB SECTION => 7.20 : BUILT IN FUNCTION
				SUB SECTION => 7.21 : IF,ELSE,PRINT,ANY,ALL,SOME
				
*/


/*
==============================  SECTION 01  ==============================
					INSERT DATA USING INSERT INTO KEYWORD
==========================================================================
*/

USE HotelManagementSystem
GO

----- Insert data by specifying column name

INSERT INTO hotel (hotelName,location,phoneNumber,stars)
VALUES
('Shahi Bangala','Kalkata',0225879898,4),
('Victory','Coxs Bazar',013654789,5),
('Shurja Kanna','Kuakata',018589898,3),
('Hill Tracs','Chottogram',020585878,1),
('Ocean Era','Cent Martine',017545878,2)
GO

------ Insert data by column sequence

--TABLE 01
INSERT INTO hotel VALUES 
('Hotel Shajahan','New delhi',020545878,'sajahan@hotel.com',5),
('Ananda Dhara','Rajsahi',0880545878,'anondaest@yahoo.com',2),
('Rajanigandha','Demra',0154878877,'rajanikant@hotel.com',3),
('Hotel intercontinental','Dhaka',0228578888,'intercont@hotel.com',5),
('Momotaj Mahal','Sylhet',0157899678,'mtaj@gmail.com',4),
('Ruposhi Bangla','Dhaka',0178965655,'bangla71@hotel.com',5),
('Sea Gull','Cox"s Bazar',0147899668,'seagull11@gmail.com',3)
GO
SELECT * FROM room
INSERT INTO room VALUES 
(100,'Delux',1,3000,2),
(102,'Delux',0,5000,1),
(101,'Super Delux',1,4000,3),
(103,'Economy',0,2000,4),
(104,'Standerd',1,4000,5),
(105,'Double Delux',0,6000,6)
GO
SELECT * FROM guests 
INSERT INTO guests VALUES
(14,'RANA Ahmed','1945-12-01',12236,'Joypurhat',0178989898,'faruk898@gmail.com'),
(11,'Nawaj Ahmed','1955-12-01',258788,'Joypurhat',0154878878,'najinawaj@gmail.com'),
(12,'Dildar Ahsan','1977-12-01',4569877,'Joypurhat',0178955898,'dilbar877@gmail.com'),
(15,'Kumar Boshak','1978-12-01',7855545,'Joypurhat',0178968898,'boshak65@gmail.com'),
(13,'Faria Jannat','1997-12-01',755215,'Joypurhat',0178987898,'jannat4141@gmail.com')
GO
SELECT * FROM booking
INSERT INTO booking VALUES 
(1000,10,100,'2020-02-01','2020-02-05',25000),
(1001,11,101,'2020-03-01','2020-03-05',20000),
(1005,12,102,'2020-04-01','2020-04-05',30000),
(1003,13,103,'2020-02-01','2020-02-05',19000),
(1004,14,104,'2020-01-01','2020-01-05',15000)
GO
SELECT * FROM payment
INSERT INTO payment VALUES
(1,1000,25000,'2020-02-06'),
(3,1001,20000,'2020-03-07'),
(5,1004,30000,'2020-04-06'),
(4,1003,19000,'2020-02-08')
GO
INSERT INTO payment (paymentId,bookingId,amount)
VALUES
(2,1004,15000),
(6,1005,35000),
(7,1007,42000)
GO
SELECT * FROM staff  
INSERT INTO staff VALUES
(1,'Kalam Khan',015477787),
(2,'Hashem Khan',014498787),
(1,'Abdur Rahman',015547745),
(3,'Pradip Poddar',012177547)
GO

/*
==============================  SECTION 02  ==============================
					INSERT DATA THROUGH STORED PROCEDURE
==========================================================================
*/

EXEC spHotelInsertt'Hotel moumita','Shahbag',02567882452,'moumita@gmail.com',5
EXEC spHotelInsertt'Sagor Konna','Coxs Bazar',0856177452,'sagorkonna@gmail.com',2
EXEC spHotelInsertt'Probal','Rangpur',0856788452,'s475834873@gmail.com',3
EXEC spHotelInsertt'Hotel Viconce','Jessore',02561787852,'kikikki7@gmail.com',4
EXEC spHotelInsertt'Solomon Island','Kuakata',0257782452,'solomon@gmail.com',5
GO
--============== INSERT DATA USING SEQUENCE VALUE ============--
INSERT INTO feedback VALUES((NEXT VALUE FOR Seq_temp), NULL)
GO
SELECT * FROM feedback
GO

/*
==============================  SECTION 03  ==============================
			UPDATE DELETE DATA THROUGH STORED PROCEDURE
==========================================================================
*/

--============== UPDATE DATA THROUGH STORED PROCEDURE ============--

EXEC spRoomUpdate 104,'Standerd',1 
EXEC spRoomUpdate 103,'Delux',0 
EXEC spRoomUpdate 102,'Super Delux',1 
EXEC spRoomUpdate 105,'Economy',0 
EXEC spRoomUpdate 106,'Standerd',1 
GO

--============== DELETE DATA THROUGH STORED PROCEDURE ============--

EXEC spHotelDelete 2
EXEC spHotelDelete 4
EXEC spHotelDelete 6
GO

/*
==============================  SECTION 04  ==============================
					INSERT UPDATE DELETE DATA THROUGH VIEW
==========================================================================
*/

--============== INSERT DATA through view ============--

SELECT * FROM vGuestStayingInfo

INSERT INTO vGuestStayingInfo (name,phone,NID,hotelName,stars,roomNumber,check_inDate,check_outDate) VALUES
('Sajjad Ahmed',10212211,545455,'sagor konna',4,105,'2023-01-01','2023-01-05')
GO

--============== UPDATE DATA through view ============--

UPDATE vGuestStayingInfo
SET stars=5
WHERE roomNumber=102
GO

--============== DELETE DATA through view ============--
DELETE FROM vGuestStayingInfo 
WHERE roomNumber=101
GO

/*
==============================  SECTION 05  ==============================
						RETREIVE DATA USING FUNCTION
==========================================================================
*/

-- A Scalar Function to get monthly total Payment
SELECT dbo.fnTotalPayment() AS 'Currrent total payment'
GO
-- A Table Valued Function to get monthly total payment & discount using two parameter @year & @month
SELECT * FROM dbo.fnPaymentTable(2020, 2)
GO

-- A Multi Statement Table Valued Function to get monthly net sales using two parameter @year & @month
SELECT * FROM dbo.fnMultiTablePayment(2020, 02)
GO

/*
==============================  SECTION 06  ==============================
							   TEST TRIGGER
==========================================================================
*/
--============== FOR/AFTER TRIGGER ON TABLE ============--
SELECT * FROM payment
SELECT * FROM booking

INSERT INTO payment (bookingId,amount) VALUES(1000,500)

SELECT * FROM payment
SELECT * FROM booking


/*
==============================  SECTION 07  ==============================
								  QUERY
==========================================================================
*/


--============== 7.01 A SELECT STATEMENT TO GET ALL INFO FROM A TABLE ============--

SELECT * FROM hotel
GO

--============== 7.02 A SELECT STATEMENT TO GET GUEST STAING information FROM A VIEW ============--

SELECT * FROM vGuestStayingInfo
GO

--============== 7.03 SELECT INTO > SAVE RESULT SET TO A NEW TEMPORARY TABLE ============--

SELECT * INTO #tmpPayment
FROM payment
GO

SELECT * FROM #tmpPayment
GO

--============== 7.04 INNER JOIN WITH GROUP BY CLAUSE ============--

SELECT  g.name,h.hotelName,b.check_inDate,b.check_outDate,r.pricePerNight,DATEDIFF(DAY,b.check_inDate,b.check_outDate)*r.pricePerNight AS 'Total Bill' FROM hotel h
JOIN room r ON r.hotelId=h.hotelId
JOIN booking b ON b.roomNumber=r.roomNumber
JOIN guests g ON g.guestId=b.guestId
GROUP BY g.name,h.hotelName,b.check_inDate,b.check_outDate,r.pricePerNight
GO

--============== 7.05 TOP CLAUSE WITH TIES ============--

SELECT TOP 4 WITH TIES g.guestId,g.name,h.hotelName,b.check_inDate,b.check_outDate FROM hotel h
JOIN room r ON r.hotelId=h.hotelId
JOIN booking b ON b.roomNumber=r.roomNumber
JOIN guests g ON g.guestId=b.guestId
ORDER BY guestId
GO

--============== 7.06 DISTINCT ============--
SELECT DISTINCT * FROM guests

--============== 7.07 COMPARISON, LOGICAL(AND OR NOT) & BETWEEN OPERATOR ============--
SELECT * FROM guests
WHERE address = 'Joypurhat'
AND dateOfBirth BETWEEN '1955-01-01' AND '1997-12-10'
AND NOT guestId= 12
AND NID > 122362
OR phone LIKE '%154'
GO

--============== 7.08 LIKE, IN, NOT IN, OPERATOR & IS NULL CLAUSE ============--
SELECT * FROM hotel
WHERE hotelName LIKE '%K%'
AND stars NOT IN ('1' ,'2')
AND email IS NULL
GO

--============== 7.09 OFFSET FETCH ============--
SELECT * FROM hotel
ORDER BY stars
OFFSET 2 ROWS
FETCH NEXT 2 ROWS ONLY
GO

--============== 7.10 UNION ============--
SELECT * FROM hotel
WHERE hotelId IN ('1', '2')

UNION

SELECT * FROM hotel
WHERE hotelId IN ('3', '5')
GO

--============== 7.11 EXCEPT INTERSECT ============--
-- EXCEPT
SELECT * FROM hotel

EXCEPT

SELECT * FROM hotel
WHERE stars = 5
GO

--INTERSECT
SELECT * FROM hotel
WHERE stars > 2

INTERSECT

SELECT * FROM hotel
WHERE stars <4
GO

--============== 7.12 AGGREGATE FUNCTION ============--

SELECT	COUNT(*) 'Total payment Count',
		SUM(amount) 'Total payment',
		AVG(amount) 'Average payment',
		MIN(amount) 'MIN payment',
		(MAX(discount))*100 'MAX Discount %'
FROM payment
GO

--============== 7.13 AGGREGATE FUNCTION WITH GROUP BY & HAVING CLAUSE ============--

SELECT  g.name,h.hotelName,b.check_inDate,b.check_outDate,r.pricePerNight,DATEDIFF(DAY,b.check_inDate,b.check_outDate)*r.pricePerNight AS 'Total Bill' FROM hotel h
JOIN room r ON r.hotelId=h.hotelId
JOIN booking b ON b.roomNumber=r.roomNumber
JOIN guests g ON g.guestId=b.guestId
GROUP BY g.name,h.hotelName,b.check_inDate,b.check_outDate,r.pricePerNight
HAVING (DATEDIFF(DAY,b.check_inDate,b.check_outDate)*r.pricePerNight)>12000
GO

--============== 7.14 ROLLUP & CUBE OPERATOR ============--

--ROLLUP
SELECT  g.name,h.hotelName,b.check_inDate,b.check_outDate,r.pricePerNight,DATEDIFF(DAY,b.check_inDate,b.check_outDate)*r.pricePerNight AS 'Total Bill' FROM hotel h
JOIN room r ON r.hotelId=h.hotelId
JOIN booking b ON b.roomNumber=r.roomNumber
JOIN guests g ON g.guestId=b.guestId
GROUP BY ROLLUP(g.name,h.hotelName,b.check_inDate,b.check_outDate,r.pricePerNight)
ORDER BY check_inDate Desc
GO

-- CUBE
SELECT  g.name,h.hotelName,b.check_inDate,b.check_outDate,r.pricePerNight,DATEDIFF(DAY,b.check_inDate,b.check_outDate)*r.pricePerNight AS 'Total Bill' FROM hotel h
JOIN room r ON r.hotelId=h.hotelId
JOIN booking b ON b.roomNumber=r.roomNumber
JOIN guests g ON g.guestId=b.guestId
GROUP BY CUBE(g.name,h.hotelName,b.check_inDate,b.check_outDate,r.pricePerNight)
ORDER BY check_inDate Desc
GO

--============== 7.15 GROUPING SETS ============--
SELECT  g.name,h.hotelName,b.check_inDate,b.check_outDate,r.pricePerNight,DATEDIFF(DAY,b.check_inDate,b.check_outDate)*r.pricePerNight AS 'Total Bill' FROM hotel h
JOIN room r ON r.hotelId=h.hotelId
JOIN booking b ON b.roomNumber=r.roomNumber
JOIN guests g ON g.guestId=b.guestId
GROUP BY GROUPING SETS(g.name,h.hotelName,b.check_inDate,b.check_outDate,r.pricePerNight)
ORDER BY name Desc
GO

--============== 7.16 SUB-QUERIES============--

--A subquery to findout trainees who have not enrolled yet

SELECT [name], dateOfBirth, nid, email, phone, [address] FROM guests
WHERE guestId NOT IN (SELECT guestId FROM booking)
GO

--A correlated subquery

SELECT p.bookingId,p.amount, SUM(p.amount) 'Total payment' FROM payment p
GROUP BY  p.bookingId,p.amount
HAVING SUM(p.amount) > (SELECT b.totalPrice FROM booking b WHERE b.bookingId= p.bookingId)
GO

--============== 7.17 EXISTS ============--

DELETE FROM payment WHERE NOT EXISTS (SELECT * FROM booking WHERE booking.bookingId=payment.bookingId)
GO

--============== 7.18 CTE ============--

WITH 
GuestInfo 
AS
(
	SELECT * FROM guests
),
bookimgInfo AS
(
	SELECT * FROM booking
)
SELECT g.GuestId,g.name,b.roomNumber,b.check_inDate,b.check_outDate FROM GuestInfo g
JOIN bookimgInfo b ON b.guestId=g.GuestId
GO

--============== 7.19 MERGE ============--

SELECT * FROM feedbackDetails
SELECT * FROM feedback
GO

MERGE feedbackDetails AS SOURCE
USING feedback AS TARGET
ON SOURCE.id = TARGET.id
WHEN MATCHED THEN
				UPDATE SET
				id         = SOURCE.id,
				description=SOURCE.description;
GO

--============== 7.20 BUILT IN FUNCTION ============--

-- Get current date and time
SELECT GETDATE()
GO

-- GET STRING LENGTH
SELECT guestId, LEN([name]) 'Name Length' FROM guests
GO

-- CONVERT DATA USING CAST()
SELECT CAST(1500 AS decimal(17,2)) AS DecimalNumber
GO

-- CONVERT DATA USING CONVERT()
DECLARE @currentTime DATETIME = GETDATE()
SELECT CONVERT(VARCHAR, @currentTime, 108) AS ConvertToTime
GO

-- CONVERT DATA USING TRY_CONVERT()
SELECT TRY_CONVERT(FLOAT, 'HELLO', 1) AS ReturnNull
GO

-- GET DIFFERENCE OF DATES
SELECT DATEDIFF(DAY, '2021-01-01', '2022-01-01') AS DAYinYear
GO

-- GET A MONTH NAME
SELECT DATENAME(MONTH, GETDATE()) AS 'Month'
GO

--============== 7.21 IF,ELSE,PRINT,ANY,ALL,SOME ============--


--ANY
IF 12000<ANY(SELECT amount FROM payment)
PRINT 'TRUE'ELSE PRINT 'FALSE'
--The query returns true because 12000 is less than ANY of the value in the table.

--ALL
IF 12000<ALL(SELECT amount FROM payment)
PRINT 'TRUE'ELSE PRINT 'FALSE'
--The query returns FALSE because 12000 is not less than ALL of the value in the table.

--SOME
IF 12000<SOME(SELECT amount FROM payment)
PRINT 'TRUE'ELSE PRINT 'FALSE'
--The query returns true because 12000 is less than SOME of the value in the table.

--==========================================================================--