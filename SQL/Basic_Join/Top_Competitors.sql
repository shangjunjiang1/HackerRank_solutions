# HackerRank_solutions

select temp.hacker_id, temp.name
from 
(select H.hacker_id, H.name, count(*) as cnt
from Hackers H, Difficulty D, Challenges C, Submissions S
WHERE D.score = S.score AND H.hacker_id = S.hacker_id AND C.challenge_id = S.challenge_id AND D.difficulty_level = C.difficulty_level 
group by 1,2
having count(*) > 1
order by cnt desc, H.hacker_id asc) as temp
