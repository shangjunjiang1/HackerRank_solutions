SELECT c.hacker_id, H.NAME, COUNT(C.challenge_id) AS TOTAL FROM 
Hackers as h
join Challenges as c on c.hacker_id = h.hacker_id
GROUP BY 1,2
having 
TOTAL IN (select max(TEMP.C) from (select count(*) AS C from Challenges group by hacker_id) AS TEMP)
or 
TOTAL in (select TEMP1.c from /* here should selcet the number to be count, instead of selecting the number of the count */
(select count(*) as c from Challenges group by hacker_id) AS TEMP1 group by TEMP1.c HAVING count(c) = 1)
order by TOTAL desc, c.hacker_id 
