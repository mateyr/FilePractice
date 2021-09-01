use Practica

create table Persona
(IdPersona int primary key identity (0,1),
Nombre varchar(80),
Apellido varchar(80),
DNI varchar(80))


--Ingresar Registros a la tabla persona
insert into Persona values ('Martin','Marquesi','26125988')
insert into Persona values ('Pablo' , 'Marquesi', '2548699')
insert into Persona values ('Roberto', 'Sanchez', '20566401')
insert into Persona values ('Estefania','Guissini','27128064')
insert into Persona values ('Ruben','Alegrato','24238975')
insert into Persona values ('Sandra','Britte','25483669')
insert into Persona values ('Melisa','Ardul','27456224')
insert into Persona values ('Soledad','Michelli','29889656')
insert into Persona values ('Betania','Musachegui','27128765')
insert into Persona values ('Juan','Serrat','28978845')


--Seleccionar Todos los registros de la tabla Persona
Select * from Persona

--Selecionar los nombre de los registros que su apellido conincida con 'Marquesi'
Select nombre 
From Persona 
where Apellido = 'Marquesi'

--Renombrar los atributos de las Relaciones
select nombre as [PRIMER_NOMBRE]
from Persona
where Apellido = 'Marquesi'

--Conector AND
Select IdPersona,Nombre, DNI
from Persona
where DNI Between 26000000 and 28000000

--Concetor LIKE
Select IdPersona,Nombre 
from Persona
where (nombre LIKE '&P') OR (Nombre LIKE 'Melisa')

--Duplas Listar todos los apellidos no repetidos de la relación Persona

select Distinct  Apellido --Que tal si quiero seleccionar la tabla y sus Id
from Persona

--Crear Tabla Jugadores

create table Jugador
(IdJugador int primary key identity (0,1),
DNI varchar(80),
Puesto varchar(80),
NRO_Camiseta int )


--Insertamos Registros en la tabla Jugador

insert into Jugador values ('26125988','Delantero','9')
insert into Jugador values ('25485699', 'Medio' , '5')
insert into Jugador values ('28978845', 'Arquero','1')
insert into Jugador values ('29789854','Defensor','3')

--Seleccionamos todos los registros de la tabla Jugador

select * from Jugador

--Obtener nombres de las personas cuyos apellidos sean = 'Marquesi' o 'Serrat' de la tabla Persona 

select Nombre,Apellido
from Persona
where Apellido = 'Marquesi'
union  --Union eliminad las duplas . Union All obtner duplicas
select Nombre,Apellido
from Persona 
where apellido = 'Serrat' 

--Obtener todos los DNI de los que juegan al fútbol y . además , que estan en la lista de la relacion Persona

select distinct  DNI
from Persona
where EXISTS(Select * 
From Jugador
where Persona.DNI = Jugador.DNI)

--También se puede hacer escrito

Select distinct Persona.DNI
from Persona inner join Jugador
on Persona.DNI = Jugador.DNI

--Enocntrar nombres de las personas que juegan al futbol
--y además se encuentran en la relacion Persona

select distinct Nombre
from Persona Where DNI
in 
(Select dni From Jugador)


--Encontrar nombres y apellidos de la relacion persona si es que en la relacion 
--jugadpr existe un jugador de dni 27128055

Select Nombre, Apellido , DNI
from Persona
Where Exists
(Select dni
From Jugador
Where dni = 26125988) --Este valor existe en la relacion jugadores

--Encontrar todos los nombres y apellido de la relacion person ay ordenar 
--Y ordenar los resultados por apellido y nombre en forma descendete

select Apellido, Nombre
From Persona
order by Apellido DESC , Nombre DESC


--Nueva relación PRO

create table PRO
(IdPRO int primary key identity (0,1),
DNI varchar(80),
años_pro int,
Club varchar (80),
Valor_Actual varchar(80))

--Insertar Datos
insert into PRO values('26125988','5','ALL BOYS','1000')
insert into PRO values('25485699','2','ALL BOYS','2500')
insert into PRO values('27126045','3','LANUS','12000')
insert into PRO values('26958644','4','LANUS','6500')
insert into PRO values('29120791','1','LANUS','450')

--Confirmar Datos
Select * from PRO

--Determine el valor total en jugadores, asi como la cantidad de jugadores en cada club en la relacion pro
select Club, SUM(valor_actual) as VALOR_TOTAL,
count (Club) as NRO_Jugador
from PRO
Group by club

--3.15 
Select club, Max(Valor_Actual) as JUG_MAS_CARO
from PRO 
Group BY Club

--3.16

Select club, Max (Valor_Actual) as JUG_MAS_CARO
from PRO
Group By Club
Having max (Valor_Actual) > 10000

--3.17
Delete From Persona 
where Apellido = 'Britte'

--3.18

insert into Persona (Nombre, Apellido , DNI)
values('Sandra','Britte','DNI')

--3.19
Update Jugador
set NRO_Camiseta = 7
where NRO_Camiseta = 5

--3.20
insert into Jugador
values(263563123,'Defensor,NULL')

--3.21

Create table Lesionado 
(Nombre varchar(50),
Apellido varchar(50),
Tiemp)


--3.22

drop table Persona




