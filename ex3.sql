/*John is a chef in a restaurant and he has recently bought a new cookbook. 					
The cookbook has so many recipes that John has to store information about them in a database.					
Each recipe is described on exactly one page. 					
No two recipes share the same page. 					
Some pages have no recipe and are empty.					
You are given a non-empty table recipes with the following structure:					
*/

create table recipes (		
	page_no integer not null,	
	title varchar(30) not null,	
	unique(page_no)	
);		

INSERT INTO `udemy_course`.`recipes` (`page_no`, `title`) VALUES ('1', 'Scrambled eggs');
INSERT INTO `udemy_course`.`recipes` (`page_no`, `title`) VALUES ('2', 'Fondue');
INSERT INTO `udemy_course`.`recipes` (`page_no`, `title`) VALUES ('3 ', 'Sandwich');
INSERT INTO `udemy_course`.`recipes` (`page_no`, `title`) VALUES ('4', 'Tomato soup');
INSERT INTO `udemy_course`.`recipes` (`page_no`, `title`) VALUES ('6', 'Liver');

-- Forma 1
with original as (select * , if(page_no % 2 = 0, title, null) as left_title, if(page_no % 2 <> 0, title, null) as right_title, if (page_no % 2 = 0, (page_no * 2) -1, page_no) as c_value
from recipes
order by page_no)
select max(left_title) as left_title,
max(right_title) as right_title
from original
group by c_value

-- Forma 2
with recursive maxid as ( select max(page_no) as page_no
from recipes),
cte as (
select 0 as rid 
union all -- recursividad
select rid + 1
from cte
cross join maxid
where(rid +1)*2 <=maxid.page_no)
select c.rid, r.page_no,
max(case when page_no % 2 = 0 then title end),
max(case when page_no % 2 =1 then title end)
from cte c
left join recipes r
on floor(r.page_no / 2) = c.rid
group by c.rid
order by c.rid;