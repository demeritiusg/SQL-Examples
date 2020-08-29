select 
con.contest_id,
con.hacker_id,
con.name,
sum(sub.total_submissions) as total_sub,
sum(sub.total_accepted_submissions) as total_acc,
sum(vw.total_views) as total_vw,
sum(vw.total_unique_views) as total_uni
from contests con
    inner join Colleges col on con.contest_id = col.contest_id
    inner join challenges cha on col.college_id = cha.college_id
left join (select 
           challenge_id,
           sum(total_views) as total_views,
           sum(total_unique_views) as total_unique_views
           from View_Stats
           group by
           challenge_id) vw
    on cha.challenge_id = vw.challenge_id
left join (select 
           challenge_id,
           sum(total_submissions) as total_submissions,
           sum(total_accepted_submissions) as total_accepted_submissions
           from Submission_Stats
           group by
           challenge_id) sub
    on cha.challenge_id = sub.challenge_id
group by
con.contest_id,
con.hacker_id,
con.name
having
total_sub != 0 or total_acc != 0 or total_vw != 0 or total_uni != 0
order by
con.contest_id;
