CREATE SCHEMA BANK;

CREATE TABLE Bank_Branch(
Bno INT(5),
CustomerServiceEmail VARCHAR(40),
BphoneNo INT(10) UNIQUE ,
address VARCHAR(40),
CONSTRAINT BB_pk PRIMARY KEY(Bno)
);

CREATE TABLE Employe(
EID INT(10),
EName VARCHAR(10),
Eemail VARCHAR(20),
CONSTRAINT Employe_pk PRIMARY KEY(EID)
);


CREATE TABLE Client (
cID INT(10),
cName VARCHAR(10),
birthdate VARCHAR(15),
gender VARCHAR (15) CHECK (gender IN ('male','female')),
cStatue VARCHAR (15) CHECK ( cStatue IN ( 'student','employe','retirement')),
email VARCHAR (20 )UNIQUE,
CONSTRAINT client_pk PRIMARY KEY(cID)
);

CREATE TABLE ClientComunication
(
email VARCHAR (20)PRIMARY KEY,
TelephonNo INT(10),
CONSTRAINT Clientcomunication_Fk FOREIGN KEY (email) REFERENCES CLient(email) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Service (
openAcc INT(15),
payBills INT(15),
loan INT(15),
Balance INT(15),
internationalTransfer INT(15),
depositing INT(15),
localTransfer INT(15),
withdrwing INT(15),
creatElectronicC INT(15),
CONSTRAINT Service_pk PRIMARY KEY(openAcc)
);

CREATE TABLE credit_Card (
cNo INT(15),
ibanNo INT(15),
date VARCHAR(25),
type VARCHAR(15) CHECK ( type IN ('normal','diamond','black crad','platinum','visa')),
CONSTRAINT creditCard_pk PRIMARY KEY(cNo)
);

CREATE TABLE BankBranchClient(
Bno INT(15),
cID INT (10),
CONSTRAINT BankBranchClient_pk PRIMARY KEY(BNO,cID),
CONSTRAINT BankClientt_Fk FOREIGN KEY (Bno) REFERENCES Bank_Branch(Bno) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT BankClientes_Fk FOREIGN KEY (cID) REFERENCES CLient(cID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ClientCreditCards(
cNo INT(15),
cID INT (10) ,
CONSTRAINT ClientCredit_pk PRIMARY KEY(cNo,cID),
CONSTRAINT CreditClienCC_Fk FOREIGN KEY (cNo) REFERENCES credit_card(cNo) ON DELETE CASCADE ON UPDATE CASCADE ,
CONSTRAINT CreditClentCC_Fk FOREIGN KEY (cID) REFERENCES Client(cID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Credite_Service(
cNo INT(15),
openAcc INT (15),
CONSTRAINT Credite_Service_pk PRIMARY KEY(cNo,openAcc),
CONSTRAINT CreditClientcNum_Fk FOREIGN KEY (cNo) REFERENCES credit_card(cNo) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT CreditClientOpenAcc_Fk FOREIGN KEY (openAcc) REFERENCES Service(openAcc) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE client_employe(
cID INT (10) ,
EID INT(10),
CONSTRAINT ClientEmploye_pk PRIMARY KEY(cID,EID),
CONSTRAINT EmployeeClient1e_Fk FOREIGN KEY (cID) REFERENCES Client(cID) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT EmloyeeClient2e_Fk FOREIGN KEY (EID) REFERENCES Employe(EID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Employe_service (
EID INT(10),
openAcc INT (15),
CONSTRAINT EmployeService_pk PRIMARY KEY(EID,openAcc),
CONSTRAINT employeOpenAcc_Fk FOREIGN KEY (openAcc) REFERENCES Service(openAcc) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT EmloyeeEID_Fk FOREIGN KEY (EID) REFERENCES Employe(EID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE clients_service (
cID INT (10),
openAcc INT (15),
CONSTRAINT ClientServuce_pk PRIMARY KEY(cID,openAcc),
CONSTRAINT clientOpen_Fk FOREIGN KEY (openAcc) REFERENCES Service(openAcc) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT eclientCid_Fk FOREIGN KEY (cID) REFERENCES Client(cID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Bank_Branch(bno,CustomerServiceEmail,BphoneNo,address)
VALUES (012355,'contact@alahli55.com',966200100,'mohammed street');

INSERT INTO Bank_Branch(bno,CustomerServiceEmail,BphoneNo,address)
VALUES (012356,'contact@alahli56.com',0114603333,'alshrai street');

INSERT INTO Bank_Branch(bno,CustomerServiceEmail,BphoneNo,address)
VALUES (012357,'contact@alahli57.com',920028000,'azizia street');

INSERT INTO Bank_Branch(bno,CustomerServiceEmail,BphoneNo,address)
VALUES (012358,'contact@alahli58.com',0114062870,'steen street');

INSERT INTO Bank_Branch(bno,CustomerServiceEmail,BphoneNo,address)
VALUES (012359,'contact@alahli59.com',920001002,'koshak street');

SELECT *
FROM Bank_Branch;

INSERT INTO Employe(EID,EName,Eemail)
VALUES (4020113,'Raniya','Raniya@gmail.com');


INSERT INTO Employe(EID,EName,Eemail)
VALUES (4020114,'Revan','Revan@gmail.com');


INSERT INTO Employe(EID,EName,Eemail)
VALUES (4020115,'shmael','shmael@gmail.com');


INSERT INTO Employe(EID,EName,Eemail)
VALUES (4020116,'Reem','Reem@gmail.com');


INSERT INTO Employe(EID,EName,Eemail)
VALUES (4020117,'Eman','Eman@gmail.com');

SELECT *
FROM Employe;

INSERT INTO Client(cID,cName,birthdate,gender,cStatue,email)
VALUES (1010000,'jhoon','26-7-99','male','student','jhoon@gmail.com');

INSERT INTO Client(cID,cName,birthdate,gender,cStatue,email)
VALUES (1020000,'emma','21-1-98','female','student','emmal@gmail.com');

INSERT INTO Client(cID,cName,birthdate,gender,cStatue,email)
VALUES (1030000,'martin','22-9-00','male','student','martin@gmail.com');

INSERT INTO Client(cID,cName,birthdate,gender,cStatue,email)
VALUES (1040000,'jack','1-1-97','male','employe','jack@gmail.com');

INSERT INTO Client(cID,cName,birthdate,gender,cStatue,email)
VALUES (1050000,'beyol','10-7-93','female','employe','beyol@gmail.com');

SELECT *
FROM Client;

INSERT INTO ClientComunication(email,TelephonNo)
VALUES('jhoon@gmail.com',054341255);

INSERT INTO ClientComunication (email ,TelephonNo)
VALUES('emmal@gmail.com',05361385);

INSERT INTO ClientComunication (email ,TelephonNo)
VALUES('martin@gmail.com',0531385);

INSERT INTO ClientComunication(email ,TelephonNo)
VALUES('jack@gmail.com',05335272);

INSERT INTO ClientComunication(email ,TelephonNo)
VALUES('beyol@gmail.com',05569832);

SELECT *
FROM ClientComunication;

INSERT INTO  Service
VALUES (112233, null, null, null, null, null, null, null, 112233);

INSERT INTO  Service
VALUES (112244, null, null, null, null, 112244, null, null, null);

INSERT INTO Service
VALUES (112255, null, 112255, null, null, null, null, null, null);

INSERT INTO Service
VALUES (112266, null, null, null, 112266, null, null, null, null);

INSERT INTO Service
VALUES (112277, null, null, null, null, null, null, 112277, null);

SELECT *
FROM Service;

INSERT INTO credit_Card
VALUES (1537,1234214546,'24-NOV-2021','normal' );

INSERT INTO credit_Card
VALUES (1557,368426822,'12-NOV-2021','visa' );

INSERT INTO credit_Card
VALUES (2682,853528932,'6-NOV-2021', 'normal' );

INSERT INTO credit_Card
VALUES (3783,246953278,'10-NOV-2021', 'diamond' );

INSERT INTO credit_Card
VALUES (9537,246894157,'30-NOV-2021', 'platinum' );

SELECT *
FROM credit_Card;

INSERT INTO BankBranchClient
VALUES (012355, 1010000);

INSERT INTO BankBranchClient
VALUES (012356, 1020000);

INSERT INTO BankBranchClient
VALUES (012357, 1030000);

INSERT INTO BankBranchClient
VALUES (012358, 1040000);

INSERT INTO BankBranchClient
VALUES (012359, 1050000);

SELECT *
FROM BankBranchClient;

INSERT INTO ClientCreditCards
VALUES (1537, 1010000);

INSERT INTO ClientCreditCards
VALUES (1557,1020000);

INSERT INTO ClientCreditCards
VALUES (2682,1030000);

INSERT INTO ClientCreditCards
VALUES (3783, 1040000);

INSERT INTO ClientCreditCards
VALUES (9537, 1050000);

SELECT *
FROM ClientCreditCards;

INSERT INTO Credite_Service
VALUES (1537, 112233);

INSERT INTO Credite_Service
VALUES (1557, 112244);

INSERT INTO Credite_Service
VALUES (2682, 112255);

INSERT INTO Credite_Service
VALUES (3783, 112266);

INSERT INTO Credite_Service
VALUES (9537, 112277);

SELECT *
FROM Credite_Service;

INSERT INTO client_employe
VALUES (1010000, 4020113);

INSERT INTO client_employe
VALUES (1010000, 4020114);

INSERT INTO client_employe
VALUES (1010000, 4020115);

INSERT INTO client_employe
VALUES (1010000, 4020116);

INSERT INTO client_employe
VALUES (1010000, 4020117);

SELECT *
FROM client_employe;

INSERT INTO Employe_service
VALUES (4020113,112233);

INSERT INTO Employe_service
VALUES (4020114,112244);

INSERT INTO Employe_service
VALUES (4020115,112255);

INSERT INTO Employe_service
VALUES (4020116,112266);

INSERT INTO Employe_service
VALUES (4020117,112277);

SELECT *
FROM Employe_service;

INSERT INTO clients_service
VALUES (1010000,112233);

INSERT INTO clients_service
VALUES (1020000,112244);

INSERT INTO clients_service
VALUES (1030000,112255);

INSERT INTO clients_service
VALUES (1040000,112266);

INSERT INTO clients_service
VALUES (1050000,112277);

SELECT *
FROM clients_service;

-- delete all card information of the normal type
DELETE FROM credit_Card
WHERE type = 'normal';

SELECT *
FROM credit_Card;

-- return the row that satisfy the condition 
SELECT *
FROM Client 
WHERE cStatue ='employe';

-- delete all client information of the male gender
DELETE FROM Client
WHERE gender = 'male';

SELECT *
FROM Client;

-- upgrade the credit card from the platinum type to the diamond type
UPDATE credit_Card
SET type = 'diamond'
WHERE type = 'platinum';

SELECT *
FROM credit_Card;

-- change the email and address of the bank branch with the number '012355'
UPDATE Bank_Branch
SET CustomerServiceEmail = 'contact@alahli.com', address = 'juffali street'
WHERE bno = 012355;

SELECT *
FROM Bank_Branch;

-- to list Bno,customer email and Branch phone from the Bank branch table and list BNO in DESCNDING order
SELECT Bno, CustomerServiceEmail, BphoneNo, address
  FROM Bank_Branch
  ORDER BY BNO DESC;
 
 -- to list Name and birthdate and gender of the client and order the client name in an deafult order ASC
SELECT cName, birthdate, gender
FROM Client
ORDER BY cName;

-- return the row that satisfy the condition 
  SELECT * 
  FROM credit_Card
  WHERE NOT type = 'diamond' AND
  date between '10-NOV-2021' AND '30-NOV-2021';
  
  -- to group cID accourrding to the stute
  SELECT cStatue,COUNT(cID) AS count
  FROM Client
  GROUP BY cStatue
  ORDER BY cStatue desc;

-- to group cID accourding to statue and use having to return the statue that are less than 3
 SELECT cStatue,COUNT(cID) AS count
  FROM Client
  GROUP BY cStatue
  HAVING COUNT(cID)<3
  ORDER BY cStatue desc;
  
  -- to group cNO accourding to type and there exits having cluase so the row that satisfy the condition will appear
 SELECT type , COUNT(cNo) AS count 
 FROM credit_Card
 GROUP BY type 
 HAVING COUNT(cNo) > 1;
 
 SELECT gender , COUNT(cID) AS count 
 FROM Client
 GROUP BY gender 
 HAVING COUNT(cID) > 1;

SELECT * 
FROM Employe
WHERE EID = ( SELECT EID 
		      FROM Employe_service 
              WHERE EID = 4020115
              AND openAcc = 112255 ) ;

SELECT * 
FROM Bank_Branch
WHERE Bno = ( SELECT Bno 
		      FROM BankBranchClient 
              WHERE Bno = 12356
              AND cID = 1020000 ) ; 
 
 
  
  SELECT r.cNo, ibanNo
  FROM clientcreditcards c , credit_Card r
  WHERE c.cNo = r.cNo;
  
  SELECT b.bno , BphoneNo , address
  FROM Bank_Branch b , BankBranchClient c
  WHERE b.bno = c.bno;
     

    SELECT  cID, cName,TelephonNo,i.email
    FROM Client i , ClientComunication t
    WHERE i.email=t.email;