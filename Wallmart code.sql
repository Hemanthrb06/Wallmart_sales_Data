create DATABASE if not exists Wallmartsales;

create table Sales(
	Invoice_ID Varchar(30),
    Branch Varchar(10),
    City Varchar(30),
    Customer_type Varchar(30),
    Gender varchar(10),
    Product_line Varchar(100),
    Unit_price decimal(10,2),
    Quantity int,
    Vat float(6,4),
    Total decimal(12,5),
    Date datetime,
    Time time,
    Payment_method Varchar(15),
    Cogs decimal(10,2),
    Gross_margin float(11,9),
    Gross_income decimal(12,4),
    Rating Float(2,1)
    );
    
ALter table Sales
add primary key (Invoice_ID);

Alter table sales Add column Time_of_date Varchar(15);

update sales
set Time_of_date =
(
Case
WHEN `time` between "00:00:00" and "12:00:00" then 'Morning'
when `time` between "12:01:00" and "16:00:00" then 'Afternoon'
Else 'Evening'
End
);

Select Date, dayname(Date) Day
from sales;

alter Table sales add column Day Varchar(10);
update sales
set Day = dayname(Date);

alter Table sales add column Month Varchar(15);
update sales
set Month = monthname(date);

select*
from wallmartsales.sales;

