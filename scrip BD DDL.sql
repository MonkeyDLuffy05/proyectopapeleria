create database BDTic;
use BDTic;

create table tripulante(
id_tripulante int not null,
nombre varchar(45) not null,
email varchar(45) not null,
telefono varchar(45) not null,
primary key (id_tripulante)
);

create table soporte(
id_soporte int not null,
nombre varchar(45) not null,
email varchar(45) not null,
primary key (id_soporte)
);

create table area(
id_area int not null,
nombre varchar(45) not null,
descripcion varchar(45) not null,
primary key (id_area)
);

create table formador(
id_formador int not null,
nombre varchar(45) not null,
email varchar(45) not null,
area int,
primary key (id_formador),
constraint formador_area_fk foreign key (area) references area(id_area)
);

create table grupo(
id_grupo int not null,
horario varchar (45) not null,
soporte int,
primary key(id_grupo),
constraint grupo_soporte_fk foreign key (soporte) references soporte (id_soporte)
);

create table curso(
id_curso int not null,
grupo int not null,
formador int not null,
area int,
primary key (id_curso),
constraint curso_grupo_fk foreign key (grupo) references grupo(id_grupo),
constraint curso_formador_fk foreign key (formador) references formador(id_formador)
);

create table nota(
id_nota int not null,
curso int not null,
calificacion float not null,
tripulante int not null,
primary key (id_nota),
constraint nota_curso_fk foreign key (curso)references curso(id_curso),
constraint nota_trip_fk foreign key(tripulante) references tripulante(id_tripulante)
);