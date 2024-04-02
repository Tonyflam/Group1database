CREATE TABLE Member (
    MemberID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender CHAR(1),
    DateOfBirth DATE,
    Address VARCHAR(255),
    Phone VARCHAR(15),
    Email VARCHAR(100),
   
);

CREATE TABLE Event (
    EventID INT PRIMARY KEY,
    Title VARCHAR(100),
    Description TEXT,
    Date DATE,
    Time TIME,
    Location VARCHAR(255),
    EventType VARCHAR(50)
);

CREATE TABLE Donation (
    DonationID INT PRIMARY KEY,
    MemberID INT,
    Amount DECIMAL(10, 2),
    DonationDate DATE,
    PaymentMethod VARCHAR(50),
    DonationType VARCHAR(50),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);

CREATE TABLE Preacher (
    PreacherID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

CREATE TABLE Elder (
    ElderID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

CREATE TABLE Committee (
    CommitteeID INT PRIMARY KEY,
    ChairpersonID INT,
    FOREIGN KEY (ChairpersonID) REFERENCES Elder(ElderID)
);

CREATE TABLE Service (
    ServiceID INT PRIMARY KEY,
    Title VARCHAR(100),
    Date DATE,
    Time TIME,
    SpeakerID INT,
    FOREIGN KEY (SpeakerID) REFERENCES Preacher(PreacherID)
);

-- Many-to-Many relationship between Member and Event
CREATE TABLE Member_Event (
    MemberID INT,
    EventID INT,
    PRIMARY KEY (MemberID, EventID),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);
