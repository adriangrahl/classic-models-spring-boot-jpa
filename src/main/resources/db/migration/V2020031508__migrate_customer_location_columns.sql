alter table customers
	add column cityCode bigint not null;
	
update customers cu
join cities c on c.name = cu.city
set cu.cityCode = c.id
where cu.id > 0;

alter table customers 
   add constraint FK_Customer_City 
   foreign key (cityCode) 
   references cities (id); 

alter table customers
	drop column city;
	
alter table customers
	drop column state;
	
alter table customers
	drop column country;