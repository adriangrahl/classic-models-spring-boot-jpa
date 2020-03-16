alter table offices
	add column cityCode bigint not null;
	
update offices o
join cities c on c.name = o.city
set o.cityCode = c.id
where o.id > 0;

alter table offices 
   add constraint FK_Office_City 
   foreign key (cityCode) 
   references cities (id); 

alter table offices
	drop column city;
	
alter table offices
	drop column state;
	
alter table offices
	drop column country;