insert into cities (name, stateCode) 
	select city, s.id
	from customers cu
	left join states s on s.name = coalesce(cu.state, cu.country)
	where city is not null
	union
	select city, s.id
	from offices o
	join states s on s.name = coalesce(o.state, o.country)
	where city is not null;