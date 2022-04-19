Create table Account(
AccountID  Integer Primary key Identity(1,1),
UserAccount  nvarchar(200) not null,
UserPassword nvarchar(2000) not null,
UserRole nvarchar(50) not null,
)



Create table User1(
UserID  Integer Primary key Identity(1000,1),
UserEmailAddress  nvarchar(200)not null,
NickName nvarchar(50)  null,
Birthday date null,
Phone nvarchar(50)  null,
Address nvarchar(50)  null,
)

Create table Store
(
StoreID  Integer Primary key Identity(1,1),
StoreName nvarchar(50)  null,
StoreCategory  nvarchar(50)  null,
StorePhone nvarchar(50)  null,
StoreAddress nvarchar(50) null,
StoreBusinessHours nvarchar(50)  null,
Preview nvarchar(2000) null,
StoreAccount nvarchar(50) not null,
)

Create table Product(
ProductID  Integer Primary key Identity(1,1),
ProductName nvarchar(50)  null,
ProductCategory  nvarchar(50)  null,
ProductUnitPrice Integer  null,
Preview nvarchar(2000)   null,
StoreID Integer not null,
FOREIGN KEY (StoreID) REFERENCES Store (StoreID),
)

Create table ProductTaste(
StoreID Integer not null,
TasteAdjustment nvarchar(50) null,
FOREIGN KEY (StoreID) REFERENCES Store (StoreID),
)

Create table TasteAdjustment(
TasteAdjustment nvarchar(50) null,
Options nvarchar(50) null,
)
Create table OrderStatus(
OrderStatus nvarchar(50) Primary key,)

Create table ProductOrder(
OrderID Integer Primary key Identity(1,1),
StoreID Integer not null,
UserID Integer not null,
OrderDate nvarchar(1000) null,
OrderSuccessDate nvarchar(1000) null,
OrderStatus nvarchar(50) null,
Price Integer not null,
Remark nvarchar(1000) null,
Remark2 nvarchar(1000) null,
FOREIGN KEY (StoreID) REFERENCES Store (StoreID),
FOREIGN KEY (UserID) REFERENCES User1 (UserID),
FOREIGN KEY (OrderStatus) REFERENCES OrderStatus (OrderStatus),
)

Create table OrderInformation(
OrderInformationID Integer Primary key Identity(1,1),
OrderID Integer not null,
ProductName nvarchar(50) not null,
Number Integer not null,
ProductUnitPrice Integer null,
ProductPrice Integer null,
Remark nvarchar(1000) null,
FOREIGN KEY (OrderID) REFERENCES ProductOrder (OrderID),
)

