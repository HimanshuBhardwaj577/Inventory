create database Repair

-- Table Structure & Triggers --

create table Login_ (Email_Id nvarchar(33) Primary key , Otp nvarchar(10) , Password nvarchar(10) , Name nvarchar(10))

create Table Receiving (Service_Center nvarchar(13) , Customer nvarchar(10) , Location nvarchar(15) , Receiving_Date datetime , Received_Courier_Name nvarchar(14),
Received_AWB_Number nvarchar(19) , Receiving_Gtr nvarchar(15) , Asset_Type nvarchar(10) , Upload nvarchar(50) Primary key )

create trigger insertinReceivingTerminal
on Receiving
After insert
as
begin

insert into Receiving_Terminal (Service_Center , Customer , Location , Receiving_Date , ETM_Number , Ptid , Received_Courier_Name , Received_Awb_Number , Receiving_Gtr , Asset_Type)
select Service_Center , Customer , Location , Receiving_Date, Left(Upload,CHARINDEX(',',Upload)-1),RIGHT(Upload,len(Upload) - CHARINDEX(',',Upload)) , Received_Courier_Name , Received_AWB_Number,
Receiving_Gtr , Asset_Type  from Receiving

end

create table Receiving_Terminal (Service_Center nvarchar(13) , Customer nvarchar(10) , Location nvarchar(15) , Receiving_Date datetime , 
ETM_Number nvarchar(15) , Ptid nvarchar(9) , Received_Courier_Name nvarchar(14) , Received_AWB_Number nvarchar(19) , Receiving_Gtr nvarchar(15),
Asset_Type nvarchar(10) , ETM_Count int , Days_Count int , Primary key (ETM_Number , Ptid))

create trigger truncatetableReceiving
on Receiving_Terminal
After insert
as
begin

Truncate table Receiving

end

create table Dispatch_Terminal (ETM_Number nvarchar(15) , Received_AWB nvarchar(19) , Dispatch_Courier nvarchar(14) , Dispatch_AWB nvarchar(19),
Dispatch_Date datetime , Terminal_Remark nvarchar(20) , Primary key (ETM_Number ,Received_AWB ) )

create trigger dispatchtoscan
on Dispatch_Terminal
after insert
as
begin

insert into Scan (Service_Center , Customer , Location , Receiving_Date , ETM_Number , Ptid , Received_Courier_Name , Received_AWB_No , Receiving_Gtr ,Asset_Type , Dispatch_Courier_Name , Dispatch_AWB , Dispatch_Date , Terminal_Remark)
select Receiving_Terminal.Service_Center , Receiving_Terminal.Customer , Receiving_Terminal.Location ,
Receiving_Terminal.Receiving_Date , Dispatch_Terminal.ETM_Number , Receiving_Terminal.Ptid , 
Receiving_Terminal.Received_Courier_Name , Receiving_Terminal.Received_Awb_Number , Receiving_Terminal.Receiving_Gtr , Receiving_Terminal.Asset_Type ,
Dispatch_Terminal.Dispatch_Courier , Dispatch_Terminal.Dispatch_AWB , Dispatch_Terminal.Dispatch_Date , Dispatch_Terminal.Terminal_Remark from Receiving_Terminal , Dispatch_Terminal
where Dispatch_Terminal.ETM_Number = Receiving_Terminal.ETM_Number and Dispatch_Terminal.Received_AWB = Receiving_Terminal.Received_Awb_Number

end

create table Inout (Service_Center nvarchar(13) , Customer nvarchar(10) , Location nvarchar(15) , Receiving_Date datetime , ETM_Number nvarchar(15),
Ptid nvarchar(9) , Received_Courier_Name nvarchar(14) , Received_AWB_No nvarchar(19) , Receiving_Gtr nvarchar(15) , Asset_Type nvarchar(10) ,
Dispatch_Courier_Name nvarchar(14) , Dispatch_AWB nvarchar(19) , Dispatch_Date datetime , Terminal_Remark nvarchar(20) , ETM_Count int , Days_Count int ,
Primary key (ETM_Number , Received_AWB_No) )

create trigger deletereceivingterminal
on InOut
after insert
as
begin

delete from Receiving_Terminal where exists (select ETM_Number  , Received_AWB_No from Scan where Scan.ETM_Number  = Receiving_Terminal.ETM_Number and Scan.Received_AWB_No  = Receiving_Terminal.Received_Awb_Number )

end


create table Inout (Service_Center nvarchar(13) , Customer nvarchar(10) , Location nvarchar(15) , Receiving_Date datetime , ETM_Number nvarchar(15),
Ptid nvarchar(9) , Received_Courier_Name nvarchar(14) , Received_AWB_No nvarchar(19) , Receiving_Gtr nvarchar(15) , Asset_Type nvarchar(10) ,
Dispatch_Courier_Name nvarchar(14) , Dispatch_AWB nvarchar(19) , Dispatch_Date datetime , Terminal_Remark nvarchar(20) , ETM_Count int , Days_Count int ,
 )

create trigger notdispatch
on scan
after insert
as
begin

update Scan set Dispatch_Courier_Name = 'Not Dispatched',Dispatch_AWB = 'Not Dispatched' , Terminal_Remark =  'Not Dispatched' where Dispatch_Date is null

end

-- Stored Procedures ---

create proc DaysCount @Received_Awb_Number nvarchar(19)
as
begin

update Receiving_Terminal set Days_Count = DATEDIFF(day,Receiving_Date,GETDATE())
where Received_Awb_Number = @Received_Awb_Number


update Receiving_Terminal set Etm_Count = (select count(ETM_Number) from Receiving_Terminal where Received_Awb_Number = @Received_Awb_Number)
where Received_Awb_Number = @Received_Awb_Number

end


create proc dispatchTerminalInsert @ETM_Number nvarchar(15) , @Received_AWB nvarchar(19) , @Dispatch_Courier nvarchar(14) ,@Dispatch_AWB nvarchar(19),
@Dispatch_Date datetime , @Terminal_Remark nvarchar(20)
as
begin

insert into Dispatch_Terminal (ETM_Number , Received_AWB , Dispatch_Courier , Dispatch_AWB , Dispatch_Date , Terminal_Remark)
values (@ETM_Number , @Received_AWB , @Dispatch_Courier , @Dispatch_AWB , @Dispatch_Date , @Terminal_Remark)

end


create Proc logoutt @Email_Id nvarchar(35)
as
begin

update Login_ set Otp = Null
where Email_Id = @Email_Id

end

create Proc Maildetail @ETM_Number nvarchar(15)
as
begin

select Location , Receiving_Date , ETM_Number ,Received_Courier_Name , Received_AWB_No , Receiving_Gtr , Asset_Type , Dispatch_Courier_Name , Dispatch_AWB , Dispatch_Date ,Terminal_Remark   from Scan where ETM_Number = @ETM_Number


end


create proc Otp @Email_Id nvarchar(35)
as
begin

update Login_ set Otp = ( SELECT LEFT(CAST(RAND()*1000000000+999999 AS INT),6) as OTP)
where Email_Id = @Email_Id

end


create  proc ReceivingPartion
as
begin

select distinct(Received_Awb_Number) , Location ,Etm_Count   , Receiving_Date  , Days_Count   from Receiving_Terminal group by Received_Awb_Number , Location,Etm_Count , Receiving_Date , Days_Count

end


create Proc ReceivingTerminalInsert  @Service_Center nvarchar(13) ,@Customer nvarchar(10) ,
@Location nvarchar(15) ,@Receiving_Date datetime ,@Received_Courier_Name nvarchar(14) ,
@Received_Awb_Number nvarchar(19) ,@Receivng_Gtr nvarchar(15) ,@Asset_Type nvarchar(10) , @Upload nvarchar(50)
as
begin

insert into Receiving (Service_Center , Customer , Location , Receiving_Date , Received_Courier_Name , Received_AWB_Number ,
Receiving_Gtr , Asset_Type , Upload) values (@Service_Center , @Customer , @Location , @Receiving_Date , @Received_Courier_Name , @Received_Awb_Number,
@Receivng_Gtr , @Asset_Type , @Upload )

end












