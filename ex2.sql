/*
You are given two tables describing theater plays and reservations for these plays in specific theaters.
*/
create table plays (		
	id integer not null, 	
	title varchar(40) not null, 	
	writer varchar(40) not null, 	
	unique(id)	
);		
		
create table reservations ( 		
id integer not null,		
playid integer not null,		
number_of_tickets integer not null,		
theater varchar(40) not null,		
unique(id)		
);	

INSERT INTO `udemy_course`.`plays` (`id`, `title`, `writer`) VALUES ('109', 'Queens and Kings of Madagascar |', 'Paul Sat');
INSERT INTO `udemy_course`.`plays` (`id`, `title`, `writer`) VALUES ('123', 'Merlin', 'Lee Roy');
INSERT INTO `udemy_course`.`plays` (`id`, `title`, `writer`) VALUES ('142', 'Key of the tea', 'Max Rogers');
INSERT INTO `udemy_course`.`plays` (`id`, `title`, `writer`) VALUES ('144', 'ROMEance Comedy', 'Bohring Ashell');
INSERT INTO `udemy_course`.`plays` (`id`, `title`, `writer`) VALUES ('145', 'Nameless.', 'Note Null');

INSERT INTO `udemy_course`.`reservations` (`id`, `playid`, `number_of_tickets`, `theater`) VALUES ('13', '109', '12', 'Me Rayleigh Theater');
INSERT INTO `udemy_course`.`reservations` (`id`, `playid`, `number_of_tickets`, `theater`) VALUES ('24', '109', '34', 'Me Rayleigh Theater');
INSERT INTO `udemy_course`.`reservations` (`id`, `playid`, `number_of_tickets`, `theater`) VALUES ('37', '145', '84', 'Me Rayleigh Theater');
INSERT INTO `udemy_course`.`reservations` (`id`, `playid`, `number_of_tickets`, `theater`) VALUES ('49', '145', '45', 'Me Rayleigh Theater');
INSERT INTO `udemy_course`.`reservations` (`id`, `playid`, `number_of_tickets`, `theater`) VALUES ('51', '145', '41', 'Me Rayleigh Theater');
INSERT INTO `udemy_course`.`reservations` (`id`, `playid`, `number_of_tickets`, `theater`) VALUES ('68', '123', '3', 'Me Rayleigh Theater');
INSERT INTO `udemy_course`.`reservations` (`id`, `playid`, `number_of_tickets`, `theater`) VALUES ('83', '142', '46', 'Me Rayleigh Theater');
	

/*Write an SQL query that counts the total number of tickets reserved for each play. 						
The table of results should contain three columns: 						
id (id of play), title (title of play) and reserved-tickets (total number of reserved tickets for play). 						
*/

select p.id, p.title, coalesce( sum(r.number_of_tickets), 0) as 'reserved-tickets' from plays as p
left join reservations as r
on r.playid = p.id
group by p.id
order by 'reserved-tickets' desc, p.id asc



