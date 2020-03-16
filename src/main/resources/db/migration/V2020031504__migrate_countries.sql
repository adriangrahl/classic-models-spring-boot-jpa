insert into countries(name)
	select country
	from customers
	where country is not null
	union
	select country
	from offices
	where country is not null;