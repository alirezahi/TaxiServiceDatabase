CREATE TABLE Passengers (
    p_id int NOT NULL,
    profilePic varchar(255) NOT NULL,
    username varchar(255) UNIQUE,
    isRegistered boolean,
    credit int default 0,
    PRIMARY KEY (p_id)
);

CREATE TABLE PassengersLog (
    p_id int NOT NULL,
    profilePic varchar(255) NOT NULL,
    username varchar(255) UNIQUE,
    isRegistered boolean,
    date_change DATETIME,
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
  date_change DATETIME,
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
  date_change DATETIME,
  PRIMARY KEY(address,p_id),
  FOREIGN KEY (p_id) REFERENCES Passengers(p_id)
);
