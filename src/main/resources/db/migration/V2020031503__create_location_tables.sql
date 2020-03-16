create table cities (
   id bigint not null auto_increment,
    name varchar(255),
    stateCode bigint,
    primary key (id)
) engine=InnoDB;

create table countries (
   id bigint not null auto_increment,
    name varchar(255),
    primary key (id)
) engine=InnoDB; 

create table states (
   id bigint not null auto_increment,
    name varchar(255),
    countryCode bigint,
    primary key (id)
) engine=InnoDB;

alter table cities 
   add constraint FK_City_State 
   foreign key (stateCode) 
   references states (id);

alter table states 
   add constraint FK_State_Country 
   foreign key (countryCode) 
   references countries (id);