CREATE DATABASE foodwastemanagementsystem
USE foodwastemanagementsystem

--foodprovider table : stores the details of food donors.
CREATE TABLE foodprovider(
    providerid INT PRIMARY KEY IDENTITY(1,1),
	providername varchar(100),
	providercontactnumber BIGINT,
	provideraddress VARCHAR(100),
	providercity VARCHAR(30),
	providerpincode INT,
	CONSTRAINT checkprovidercontactnumber CHECK (providercontactnumber >=6000000000 AND providercontactnumber<= 9999999999),
	CONSTRAINT checkproviderpincode CHECK (providerpincode BETWEEN 100000 AND 999999)
);

--NGO Table: Stores information about organizations that will receive food donations.
CREATE TABLE NGO(
    ngoid INT PRIMARY KEY IDENTITY(1,1),
	ngoname VARCHAR(100),
	ngocontactnumber BIGINT,
	ngoaddress VARCHAR(100),
	ngocity VARCHAR(30),
	ngopincode INT,
	CONSTRAINT checkngocontactnumber CHECK (ngocontactnumber >=6000000000 AND ngocontactnumber<= 9999999999),
	CONSTRAINT checkngopincode CHECK (ngopincode BETWEEN 100000 AND 999999)
);

--donation cordinator table :Stores the intermediary details that facilitate communication between donors and NGOs.
CREATE TABLE DonationCoordinator(
    donationcoordinatorid INT PRIMARY KEY IDENTITY(1,1),
	donationcoordinatorname VARCHAR(100),
	donationcoordinatormail VARCHAR(255),
	CONSTRAINT checkdonationcoordinatormail check (donationcoordinatormail LIKE '%_@__%.__%')
);

--foodwaste data table: Stores information about the food waste donated.
CREATE TABLE fooddata(
    foodid INT PRIMARY KEY IDENTITY(1,1),
	providerid INT,
	foodtype VARCHAR(50),
	foodquantity FLOAT, --in kilograms
	Expirydate DATE,
	CONSTRAINT fkproviderid FOREIGN KEY (providerid) REFERENCES foodprovider(providerid)
);

-- donationrequest table : Stores the donation requests made by NGOs.
CREATE TABLE donationrequest(
    requestid INT PRIMARY KEY IDENTITY(1,1),
	ngoid INT,
	foodtype VARCHAR(50),
	requiredquantity FLOAT, --in kilograms
	requestdate DATE,
	CONSTRAINT fkngoid FOREIGN KEY (ngoid) REFERENCES NGO(ngoid)
);

--captures the transaction between food providers, NGO and donationcoordinator.
CREATE TABLE donationtransaction(
    transactionid INT PRIMARY KEY IDENTITY(1,1),
	foodid INT,
	requestid INT,
	donationcoordinatorid INT,
	transactiondate DATE,
	deliveredquantity FLOAT,
	CONSTRAINT fkfoodid FOREIGN KEY (foodid) REFERENCES fooddata(foodid),
	CONSTRAINT fkrequestid FOREIGN KEY (requestid) REFERENCES donationrequest(requestid),
	CONSTRAINT fkdonationcoordinatorid FOREIGN KEY (donationcoordinatorid) REFERENCES DonationCoordinator(donationcoordinatorid)
);

/*INPUT VALUES*/
--foodprovider table
insert into foodprovider (providername,providercontactnumber,provideraddress,providercity,providerpincode)
 values ('Kota Ravi',7383181533,'PNo270 Shreenatji soc-4, Niligiri,Udhna Yard','Surat',395010),
        ('Margham Ganesh',9173356481,'B-346 Suman Siddhi Society, Gododara','Surat',395010),
		('Shrinista Koyalkar',7876551533,'151-4 Rauji Sochpal Building,Dadar','Mumbai',400028),
		('Chanthu S',8734259037,'Pno109,Demonte Colony,Varkala','Thiruvandhapuram',695143),
		('Shiva Venkatesh',9386526222,'D-546 Bhagya Nagar','Ongole',523001),
		('Ishita Sharma',7845382538,'324-C, Brundhavan Colony','Phagwara',144411),
		('Tanishta',8745386457,'78-D, Chaura Bazar','Ludhiana',141001),
	    ('Mahendra Singh',7802914165,'PNo104,Beautiful Society','Jalandhar',144001),
		('Vamshi Anabattulu',9546372826,'434-2,Suman Prahar','Ludhiana',141001),
		('Rakesh Sharma',8764573903,'A-718, Kalpana Society','Jalandhar',144001)

--NGO table
insert into NGO (ngoname,ngocontactnumber,ngoaddress,ngocity,ngopincode)
values ('Goonj Foundation',8745363809,'Jangpura','New Delhi',110014),
       ('FoodBank India',7645370098,'1st Floor, Jivdani Apartment, Mhatre Nagar, Dadar West','Mumbai',400028),
	   ('Akshaya Patra Foundation',9845096021,'2nd Floor, Sukh Sagar, 40, Banshankar Marg, Basavanagudi','Bengaluru',560004),
	   ('Robin Hood Army',8065748535,'F-41, 2nd Floor, Opp. Radha Swami Satsang Beas','New Delhi', 110015),
	   ('Gujarat Food Bank',7864509203,'3rd Floor, Nirmal Residency, Near Shreyas School, Maninagar','Ahmedabad',110052),
	   ('Food for All',6378063468,'Plot 49, Opp. Indian Oil Petrol Pump, 60 Feet Road, Ashok Vihar Phase 3','New Delhi',110052),
	   ('Sewa Punjab',8976453087,'56, Krishna Nagar','Jalandhar',144001),
	   ('The Midday Meal Scheme',8745620701,'Room No. 201, 2nd Floor, State Project Office, Near Jalandhar Bye-pass','Ludhiana',141008),
	   ('Food for Change Punjab',6754309803,'H.No. 82, Street No. 4, Shankar Garden, Near Guru Teg Bahadur School','Patiala',147001),
	   ('Sankalp Trust',9084536078,'501, Dev Ashish Complex, Opp. Vishwakarma Engineering College','Ahmedabad',382426)

--DonationCoordinator table
insert into DonationCoordinator (donationcoordinatorname,donationcoordinatormail)
values ('Rakesh Kamuni','rakeshkamuni2002@gamil.com'),
       ('Srinath Mittakola','mittakolasrinath98@gamil.com'),
	   ('Rashmitha S','rashmitha123@gmail.com'),
	   ('Neha Allam','nehaallam87@gmail.com'),
	   ('Sirisha Guttula','sirishaguttula56@gmail.com'),
	   ('Dhananjay Chitturi','chitturidhananjay@gmail.com'),
	   ('Charan Boggavarapu','boggavarapucharam@gmail.com'),
	   ('Abhinaya S','abhinaya789@gmail.com'),
	   ('Ankna Chaudhary','anknachaudhary@gmail.com'),
	   ('Sanjana Sherawat','sanjanasherawat@gmail.com')

--fooddata table
insert into fooddata(providerid,foodtype,foodquantity,Expirydate)
values (1,'Puri and Chana',10.5,'11-27-2024'),
       (2,'Rice and Dal',15,'11-27-2024'),
	   (3,'Roti and Aloocurry',20,'11-27-2024'),
	   (4,'Veg Biriyani',20,'11-27-2024'),
	   (5,'Chole Kulche',15,'11-27-2024'),
	   (6,'Rice and Dal',25.5,'11-27-2024'),
	   (7,'Chana Puri',10.5,'11-27-2024'),
	   (8,'Roti and Aloocurry',12,'11-27-2024'),
	   (9,'Pav Bhaji',15,'11-27-2024'),
	   (10,'Chole Kulche',20,'11-27-2024')

--donationrequest table
insert into donationrequest(ngoid,foodtype,requiredquantity,requestdate)
values (1,'Puri and Chana',10,'11-26-2024'),
       (2,'Veg Biroyani',15,'11-26-2024'),
	   (3,'Chole kulche',10.5,'11-26-2024'),
	   (4,'Pav Bhaji',12,'11-26-2024'),
	   (5,'Puri and Chana',12.5,'11-26-2024'),
	   (6,'Rice and Dal',20,'11-26-2024'),
	   (7,'Chana Puri',10,'11-26-2024'),
	   (8,'Roti and Aloocurry',15,'11-26-2024'),
	   (9,'Rice and Dal',20,'11-26-2024'),
	   (10,'Chole Kulche',15.5,'11-26-2024')

--donationtransaction table
insert into donationtransaction(foodid,requestid,donationcoordinatorid,transactiondate,deliveredquantity)
values (1,1,1,'11-27-2024','10.2'),
       (2,2,2,'11-26-2024','15'),
	   (3,3,3,'11-27-2024','12.5'),
	   (4,4,4,'11-28-2024','20'),
	   (5,5,5,'11-25-2024','12.5'),
	   (6,6,6,'11-20-2024','15.5'),
	   (7,7,7,'11-26-2024','10'),
	   (8,8,8,'11-19-2024','10.5'),
	   (9,9,9,'11-21-2024','20'),
	   (10,10,10,'11-22-2024','15')

select * from foodprovider
select * from NGO
select * from DonationCoordinator
select * from fooddata
select * from donationrequest
select * from donationtransaction

/*Queries*/
--1.What food was donated by Transaction id =3
SELECT fd.foodtype, fd.foodquantity
FROM fooddata fd
WHERE fd.foodid = (SELECT foodid FROM donationtransaction WHERE transactionid = 3);

--2.Which provider provided 'Pav bhaji'
SELECT providername 
FROM foodprovider 
WHERE providerid = (SELECT providerid FROM fooddata WHERE foodtype = 'Pav Bhaji');

--3.Total quantity of food was donated on  2024-11-20
SELECT SUM(deliveredquantity) AS total_donated_quantity
FROM donationtransaction
WHERE transactiondate = '2024-11-20';

--4.Display Ngo with maximum amount of food donated
SELECT n.ngoname, SUM(dt.deliveredquantity) AS total_donated_quantity
FROM donationtransaction dt
JOIN donationrequest dr ON dt.requestid = dr.requestid
JOIN NGO n ON dr.ngoid = n.ngoid
GROUP BY n.ngoname
ORDER BY total_donated_quantity DESC
TOP 1;  
/*OR*/
SELECT n.ngoname, SUM(dt.deliveredquantity) AS total_delivered
FROM NGO n
JOIN donationrequest dr ON n.ngoid = dr.ngoid
JOIN donationtransaction dt ON dr.requestid = dt.requestid
GROUP BY n.ngoname
HAVING SUM(dt.deliveredquantity) = (
    SELECT MAX(total_delivered)
    FROM (
        SELECT SUM(dt2.deliveredquantity) AS total_delivered
        FROM donationrequest dr2
        JOIN donationtransaction dt2 ON dr2.requestid = dt2.requestid
        GROUP BY dr2.ngoid
    ) AS MaxDonation
);


--5.What is the total quantity of food requested by each NGO?
SELECT n.ngoname, SUM(dr.requiredquantity) AS total_requested
FROM NGO n
JOIN donationrequest dr ON n.ngoid = dr.ngoid
GROUP BY n.ngoname;

--6.What is the total quantity of food donated by each provider?
SELECT fp.providername, SUM(fd.foodquantity) AS total_quantity
FROM foodprovider fp
JOIN fooddata fd ON fp.providerid = fd.providerid
GROUP BY fp.providername;

--7.Which donation coordinators handled which donation transactions?
SELECT dc.donationcoordinatorname, dt.transactionid, dt.transactiondate, dt.deliveredquantity
FROM DonationCoordinator dc
JOIN donationtransaction dt ON dc.donationcoordinatorid = dt.donationcoordinatorid;

--8.Which food donations have an expiry date after 2024-11-26?
SELECT * FROM fooddata WHERE Expirydate > '2024-11-26';

--9.Which food types and quantities were donated by each provider?
SELECT fp.providername, fd.foodtype, fd.foodquantity
FROM foodprovider fp
JOIN fooddata fd ON fp.providerid = fd.providerid;

--10.Which NGOs requested which types of food, and what were the required quantities?
SELECT n.ngoname, dr.foodtype, dr.requiredquantity
FROM NGO n
JOIN donationrequest dr ON n.ngoid = dr.ngoid;
