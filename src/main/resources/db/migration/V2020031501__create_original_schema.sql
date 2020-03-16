create table customers (
   id bigint not null auto_increment,
    addressLine1 varchar(255),
    addressLine2 varchar(255),
    city varchar(255),
    country varchar(255),
    postalCode varchar(255),
    state varchar(255),
    contactFirstName varchar(255),
    contactLastName varchar(255),
    creditLimit double precision,
    customerName varchar(255),
    customerValue varchar(255),
    phone varchar(255),
    salesRepEmployeeNumber bigint,
    primary key (id)
) engine=InnoDB;

create table employees (
   id bigint not null auto_increment,
    email varchar(255),
    extension varchar(255),
    firstName varchar(255),
    jobTitle varchar(255),
    lastName varchar(255),
    officeCode bigint,
    reportsTo bigint,
    primary key (id)
) engine=InnoDB;

create table offices (
   id bigint not null auto_increment,
    addressLine1 varchar(255),
    addressLine2 varchar(255),
    city varchar(255),
    country varchar(255),
    phone varchar(255),
    postalCode varchar(255),
    state varchar(255),
    territory varchar(255),
    primary key (id)
) engine=InnoDB;

create table orderdetails (
   id bigint not null auto_increment,
    priceEach decimal(19,2),
    quantityOrdered bigint,
    orderLineNumber integer not null,
    orderNumber bigint not null,
    productCode varchar(255) not null,
    primary key (id)
) engine=InnoDB;

create table orders (
   id bigint not null auto_increment,
    comments varchar(255),
    orderDate datetime(6),
    requiredDate datetime(6),
    shippedDate datetime(6),
    status varchar(255),
    customerNumber bigint not null,
    primary key (id)
) engine=InnoDB;

create table payments (
   id bigint not null auto_increment,
    amount decimal(19,2),
    checkNumber varchar(255),
    paymentDate datetime(6),
    customerNumber bigint not null,
    primary key (id)
) engine=InnoDB;

create table productlines (
   id varchar(255) not null,
    htmlDescription VARCHAR(2000),
    image tinyblob,
    textDescription VARCHAR(2000),
    primary key (id)
) engine=InnoDB;

create table products (
   id varchar(255) not null,
    MSRP double precision,
    buyPrice decimal(19,2),
    productDescription VARCHAR(2000),
    productName varchar(255),
    productScale varchar(255),
    productVendor varchar(255),
    quantityInStock integer,
    productLine varchar(255) not null,
    primary key (id)
) engine=InnoDB;

alter table customers 
   add constraint FK_Customer_Sales_Representative 
   foreign key (salesRepEmployeeNumber) 
   references employees (id);

alter table employees 
   add constraint FK_Employee_Office 
   foreign key (officeCode) 
   references offices (id);

alter table employees 
   add constraint FK_Employee_Chief 
   foreign key (reportsTo) 
   references employees (id);

alter table orderdetails 
   add constraint FK_Order_Detail_Order 
   foreign key (orderNumber) 
   references orders (id);

alter table orderdetails 
   add constraint FK_Order_Detail_Product
   foreign key (productCode) 
   references products (id);

alter table orders 
   add constraint FK_Order_Customer
   foreign key (customerNumber) 
   references customers (id);

alter table payments 
   add constraint FK_Payment_Customer 
   foreign key (customerNumber) 
   references customers (id);

alter table products 
   add constraint FK_Product_Product_Line 
   foreign key (productLine) 
   references productlines (id);