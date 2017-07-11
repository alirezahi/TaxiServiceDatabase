--1
select *
from(
    select Fname as Firstname , lname as Lastname  ,  register_date as register_date ,'Passenger' as role ,username as Username
    from Passengers
    Union
    select Fname as Firstname , lname as Lastname , register_date as register_date ,'Driver' as role , d_id as username
    from Drivers
  ) as B

-- —2
select Drivers.lname , Drivers.fname , Drivers.state , DriversDirections.startTime from DriversDirections , Drivers where DriversDirections.d_id = Drivers.d_id date(DriversDirections.startTime) = CURRENT_TIMESTAMP

-- —3
select Passengers.id , Comments.comment, (select  sum(vote) /count(vote) as ave
from Votes , Drivers
where Drivers.d_id = Votes.d_id and Drivers.d_id = "A") as average rank
from  Passengers , Comments , Drivers
where  Passengers.p_id = Comments.p_id and Drivers.d_id = Comments.d_id and Drivers.Lanme ="A"


-- —4
-- We don't have company so we don't have to handle this part

-- —5
select *
from Passengers,RequestTour
where Passengers.p_id = RequestTour.p_id and Passengers.isRegistered = False;

-- —6
select  Drivers.d_id as DriverID , Drivers.fname as driverFirstName , Drivers.lname as DriverLastname, RequestTour.rname as rideName , Passengers.username as PassengerUserName , Passengers.Fname as PassengerFirstName , Passengers.Lname as passengerLastName
from  RequestTour , Passengers , Drivers
where Drivers.state = "inService" and RequestTour.isAcceptedPassenger = true  and RequestTour.isAcceptedDriver = true;

-- —7
select sum(cost*0.3)
from RequestTour
where data_request >='2012-12-25 00:00:00'
AND data_request <'2012-12-26 00:00:00';


-- —8
select passnegers.p_id as ID , passnegers.username As Username
from passengers , RequestTour
where RequestTour.p_id = Passengers.p_id and RequestTour.d_id = "A" and RequestTour.isAcceptedPassenger = false

-- —9
select drivers.d_id as ID , drivers.lname as LastName
from Drivers , RequestTour
where Drivers.d_id = RequestTour.d_id and RequestTour.p_id = "B" and RequestTour.isAcceptedPassenger = false

-- —10
select *
from(
    select s_id as a
    from Complaint as A
    where s_id = '1'
    Union
    select s_id as a
    from RequestMoney as A
    where s_id = '1'
) as B


-- 11
select *
from RequestMoney,Drivers,SupportTeam,DriversBankAccount
where s_id = '1' and RequestMoney.d_id = Drivers.d_id and SupportTeams.s_id = RequestMoney.s_id and DriversBankAccount.d_id = RequestMoney.d_id;

-- 12
select *
from(
    select p_id , 'Passenger' as role
    from PassengersLog
    Union
    select d_id , 'Driver' as role
    from DriversLog
    Union
    select d_id , 'Driver' as role
    from DriversPhoneNumberLog
    Union
    select d_id , 'Driver' as role
    from DriversMobNumberLog
  ) as C

-- 13
select p_id,s_id,description,date_complaint,date_request
from Complaint
