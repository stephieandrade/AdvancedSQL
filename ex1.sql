/* You are presented with a table of data detailing people queueing for an elevator. 			
All the people want to enter the elevator, but it can only hold a maximum weight of 1000 lbs. 			
Your task is to find the last person who will fit without exceeding the weight restriction.			
You are given a non-empty table line with the structure described by the query:		*/	

CREATE TABLE `line` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `weight` int NOT NULL,
  `turn` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `turn` (`turn`),
  CONSTRAINT `line_chk_1` CHECK ((`weight` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `line` VALUES (1,'James Elephant',500,6),(2,'Will Johnliams',200,4),(3,'John Adamas ',350,2),(4,'Thomas Jefferson',175,5),(5,'George Washington',250,1),(6,'Thomas Jefferson',400,3);

with peso_acumulado as (
select *, sum(weight) over (order by turn asc) as acumulado
from line 
order by turn)

select name
from peso_acumulado
where acumulado <= 1000
order by acumulado desc
limit 1

