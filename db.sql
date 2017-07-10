CREATE TABLE Passengers (
    p_id int NOT NULL,
    Fname varchar(50) NOT NULL,
    Lname varchar(50) NOT NULL,
    profilePic varchar(255) NOT NULL,
    username varchar(255) UNIQUE,
    isRegistered boolean,
    register_date DATETIME default CURRENT_TIMESTAMP,
    credit int default 0,
    PRIMARY KEY (p_id)
);

CREATE TABLE PassengersLog (
    p_id int NOT NULL,
    Fname varchar(50) NOT NULL,
    Lname varchar(50) NOT NULL,
    profilePic varchar(255) NOT NULL,
    username varchar(255) UNIQUE,
    isRegistered boolean,
    credit int default 0,
    register_date DATETIME default CURRENT_TIMESTAMP,
    date_change DATETIME default CURRENT_TIMESTAMP,
    PRIMARY KEY (p_id)
);

CREATE TABLE PassengersPhoneNumber (
  phone_number varchar(20) ,
  p_id int,
  PRIMARY KEY(phone_number,p_id),
  FOREIGN KEY (p_id) REFERENCES Passengers(p_id)
);

CREATE TABLE PassengersPhoneNumberLog (
  phone_number varchar(20) ,
  p_id int,
  date_change DATETIME default CURRENT_TIMESTAMP,
  PRIMARY KEY(phone_number,p_id),
  FOREIGN KEY (p_id) REFERENCES Passengers(p_id)
);

CREATE TABLE PassengersAddress (
  address varchar(200) ,
  p_id int,
  PRIMARY KEY(address,p_id),
  FOREIGN KEY (p_id) REFERENCES Passengers(p_id)
);

CREATE TABLE PassengersAddressLog (
  address varchar(200) ,
  p_id int,
  date_change DATETIME default CURRENT_TIMESTAMP,
  PRIMARY KEY(address,p_id),
  FOREIGN KEY (p_id) REFERENCES Passengers(p_id)
);



-- Driver
CREATE TABLE Drivers (
    d_id int NOT NULL,
    Fname varchar(50) NOT NULL,
    Lname varchar(50) NOT NULL,
    profilePic varchar(255) NOT NULL,
    register_date DATETIME default CURRENT_TIMESTAMP,
    birth_date DATETIME,
    licenceYear int,
    outOfService boolean,
    state varchar(10),
    credit int default 0,
    date_change DATETIME default CURRENT_TIMESTAMP,
    PRIMARY KEY (d_id)
);

CREATE TABLE DriversLog (
    d_id int NOT NULL,
    Fname varchar(50) NOT NULL,
    Lname varchar(50) NOT NULL,
    profilePic varchar(255) NOT NULL,
    register_date DATETIME default CURRENT_TIMESTAMP,
    birth_date DATETIME,
    licenceYear int,
    outOfService boolean,
    state varchar(10),
    credit int default 0,
    PRIMARY KEY (d_id)
);

CREATE TABLE DriversPhoneNumber (
  phone_number varchar(20) ,
  d_id int,
  PRIMARY KEY(phone_number,d_id),
  FOREIGN KEY (d_id) REFERENCES Drivers(d_id)
);

CREATE TABLE DriversPhoneNumberLog (
  phone_number varchar(20) ,
  d_id int,
  date_change DATETIME default CURRENT_TIMESTAMP,
  PRIMARY KEY(phone_number,d_id),
  FOREIGN KEY (d_id) REFERENCES Drivers(d_id)
);

CREATE TABLE DriversMobNumber (
  phone_number varchar(20) ,
  d_id int,
  PRIMARY KEY(phone_number,d_id),
  FOREIGN KEY (d_id) REFERENCES Drivers(d_id)
);

CREATE TABLE DriversMobNumberLog (
  phone_number varchar(20) ,
  d_id int,
  date_change DATETIME default CURRENT_TIMESTAMP,
  PRIMARY KEY(phone_number,d_id),
  FOREIGN KEY (d_id) REFERENCES Drivers(d_id)
);

CREATE TABLE DriversBankAccount (
  bank_account varchar(20) ,
  d_id int,
  PRIMARY KEY(bank_account,d_id),
  FOREIGN KEY (d_id) REFERENCES Drivers(d_id)
);

CREATE TABLE DriversBankAccountLog (
  bank_account varchar(20) ,
  d_id int,
  PRIMARY KEY(bank_account,d_id),
  FOREIGN KEY (d_id) REFERENCES Drivers(d_id)
);

CREATE TABLE DriversDirections (
  dd_id int NOT NULL,
  d_id int NOT NULL,
  startname varchar(20) ,
  endname varchar(20) ,
  xstart int,
  ystart int,
  xend int,
  yend int,
  iscurrent boolean,
  starttime datetime,
  endtime datetime,
  PRIMARY KEY(dd_id),
  FOREIGN KEY (d_id) REFERENCES Drivers(d_id)
);

CREATE TABLE SupportTeam (
  s_id int NOT NULL,
  Fname varchar(50) ,
  Lname varchar(50) ,
  profilePic varchar(255) NOT NULL,
  isonline boolean,
  PRIMARY KEY(s_id)
);

CREATE TABLE Votes (
  d_id int NOT NULL,
  p_id int NOT NULL,
  vote int NOT NULL,
  PRIMARY KEY(p_id,d_id),
  FOREIGN KEY (d_id) REFERENCES Drivers(d_id),
  FOREIGN KEY (p_id) REFERENCES Passengers(p_id)
);

CREATE TABLE Comments (
  d_id int NOT NULL,
  p_id int NOT NULL,
  comment varchar(400),
  PRIMARY KEY(p_id,d_id),
  FOREIGN KEY (d_id) REFERENCES Drivers(d_id),
  FOREIGN KEY (p_id) REFERENCES Passengers(p_id)
);

CREATE TABLE RequestTour (
  r_id int NOT NULL,
  d_id int NOT NULL,
  p_id int NOT NULL,
  isAcceptedDriver boolean,
  isAcceptedPassenger boolean,
  SpassengerX int not Null,
  SpassengerY int not Null,
  DpassengerX int not Null,
  DpassengerY int not Null,
  cost int,
  PRIMARY KEY(r_id),
  FOREIGN KEY (d_id) REFERENCES Drivers(d_id),
  FOREIGN KEY (p_id) REFERENCES Passengers(p_id)
);

CREATE TABLE RequestMoney (
  rm_id int NOT NULL,
  d_id int NOT NULL,
  s_id int,
  date_request DATETIME default CURRENT_TIMESTAMP,
  isPayed boolean,
  description varchar(400),
  cost int,
  PRIMARY KEY(rm_id),
  FOREIGN KEY (d_id) REFERENCES Drivers(d_id),
  FOREIGN KEY (s_id) REFERENCES SupportTeam(s_id)
);
