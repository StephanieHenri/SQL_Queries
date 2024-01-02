DROP database if exists dev;
CREATE database dev;
USE dev;
CREATE table categories (name varchar (100), uuid varchar (200) primary key);
CREATE table Itemtypes ( name varchar (100), uuid varchar (200) primary key);
CREATE table Items (discount int, itemUUID varchar (200) primary key, name varchar (100), subtotalAmount decimal (10,2), totalAmount decimal (10,2), type varchar (100),
uuid varchar (200), vatAmount decimal (10,2), vatRateEatIn int, vatRateTakeaway int, Itemtypeuuid varchar (200),
foreign key (ItemtypeUUID) references Itemtypes (UUID));
CREATE table Kitchenstation (exTenantUUID varchar (200), name varchar (100), uuid varchar (200) primary key);
CREATE table Orders (BasketUUID varchar (200) primary key, category varchar (200), description varchar (200), discount int, Itemtypes varchar (200), Kitchenstation varchar (200),
menuUUID varchar (200), name varchar (100), status varchar (100), subtotalAmount decimal (10,2), totalAmount decimal (10,2), UUID varchar (200),
Vatamount decimal (10,2), vatRateEatIn int, vateRateTakeaway int, Foreign key (category) references categories (UUID), foreign key (Itemtypes) references
Itemtypes (UUID), foreign key (Kitchenstation) references Kitchenstation (UUID));

               

