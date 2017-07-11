--1
select *
from(
    select fname as Firstname , lname as Lastname  ,  registerDate as registerDate , isAvailable as isAvailable ,'Passenger' as role ,username as Username
    from Passenger
    Union
    select fname as Firstname , lname as Lastname , registerDate as registerDate ,isAvailable as isAvailable ,'Driver' as role , d_id as username
    from Driver
    )

-- —2
select Driver.lname , Driver.fname , Driver.state , Direction.startTime
from direction  natural join Driver
where date(Direction.startTime) = GetDate()

-- —3
select Passenger.id , comment.comment, (select  sum(vote) /count(vote) as ave
from votes natural join driver
where driver.d_id = "A") as average rank
from  passnegr natural join comment natural join Driver
where  driver.lanme ="A"


-- —4
not handled

-- —5

select *
from Passengers,RequestTour
where Passengers.p_id = RequestTour.p_id and Passengers.isRegistered = False;

-- —6
select  driver.d_id as DriverID , Driver.fname as driverFirstName , Driver.lanme as DriverLastname, request.rname as rideName , Passenger.username as PassengerUserName , Passenger.fname as PassengerFirstName , Passenger.lname as passengerLastName
from  request natural join passneger natural join Driver
where driver.state = "inService" and isAcceptedP = true  and isAcceptedD = true

-- —7
select sum(cost*0.3)
from RequestTour
where data_request >='2012-12-25 00:00:00'
AND data_request <'2012-12-26 00:00:00';


-- —8
select passneger.p_id as ID , passneger.username As Username
from passneger natural join request
where request.d_id = "A" and request.isAcceptedD = false

-- —9
select driver.d_id as ID , driver.lname as LastName
from Driver natural join request
where request.p_id = "B" and request.isAcceptedP = false

-- —10
select
from
where

-- 12


-- 13
select p_id,s_id,description,date_complaint,date_request
from Complaint
