/*
	Há um fallback aqui para o caso de não haver estado informado.
	Nesse caso, irá criar um estado com o mesmo nome do país.
*/

insert into states(name, countryCode)
	select coalesce(state, country), co.id
    from customers cu
    left join countries co on co.name = cu.country
    where country is not null
    union
    select coalesce(state, country), co.id
    from offices o
    join countries co on co.name = o.country
    where country is not null;