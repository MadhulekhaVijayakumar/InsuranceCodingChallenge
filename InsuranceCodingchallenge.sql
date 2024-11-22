--create database
create database Insurance;

--table creation
--Table for user
CREATE TABLE Users (
    userId int identity primary key ,
    username varchar(50) NOT NULL,
    [password] varchar(50) NOT NULL,
    role varchar(50) NOT NULL
);

--Table for Client
CREATE TABLE Client (
    clientId int identity PRIMARY KEY,
    clientName VARCHAR(50) NOT NULL,
    contactInfo VARCHAR(50),
    [policy] VARCHAR(50) 
);

--Table for Claim
CREATE TABLE Claim (
    claimId INT IDENTITY PRIMARY KEY,
    claimNumber VARCHAR(50) NOT NULL,
    dateFiled DATE NOT NULL,
    claimAmount decimal NOT NULL,
    status VARCHAR(50) NOT NULL,
    policy VARCHAR(255), 
    clientId INT, 
    FOREIGN KEY (clientId) REFERENCES Client(clientId)
);

--Tbale for payment
CREATE TABLE Payment (
    paymentId INT IDENTITY(1,1) PRIMARY KEY,
    paymentDate DATE NOT NULL,
    paymentAmount DECIMAL(18, 2) NOT NULL,
    clientId INT, -- Foreign key referencing Client
    FOREIGN KEY (clientId) REFERENCES Client(clientId)
);

--insert records into Users
INSERT INTO Users (username, [password], role)
VALUES 
('john_doe', 'password123', 'admin'),
('jane_smith', 'securepass', 'manager'),
('mark_jones', 'mypassword', 'user');

--insert records into Client Table
INSERT INTO Client (clientName, contactInfo, [policy])
VALUES 
('John Doe', 'john.doe@example.com', 'Health Policy A'),
('Jane Smith', 'jane.smith@example.com', 'Car Policy B'),
('Mark Jones', 'mark.jones@example.com', 'Home Policy C');

--insert records into claim
INSERT INTO Claim (claimNumber, dateFiled, claimAmount, status, policy, clientId)
VALUES 
('CLM12345', '2024-11-01', 5000.00, 'Pending', 'Health Policy A', 1),
('CLM54321', '2024-11-05', 12000.00, 'Approved', 'Car Policy B', 2),
('CLM67890', '2024-11-10', 2500.00, 'Rejected', 'Home Policy C', 3);

--insert records into Payment
INSERT INTO Payment (paymentDate, paymentAmount, clientId)
VALUES 
('2024-11-15', 5000.00, 1),
('2024-11-16', 12000.00, 2),
('2024-11-17', 2500.00, 3);



