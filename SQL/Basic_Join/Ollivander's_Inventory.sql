question link: https://www.hackerrank.com/challenges/harry-potter-and-wands/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

select id, age, A.coins_needed, A.power
FROM 
(select code, power, min(coins_needed) as coins_needed
from Wands 
group by code, power) A 
join Wands AS B
ON A.code = B.code and A.power = B.power and A.coins_needed = B.coins_needed
JOIN Wands_Property AS P ON P.code = A.code
Where P.is_evil = 0 
ORDER BY A.power DESC, AGE DESC
