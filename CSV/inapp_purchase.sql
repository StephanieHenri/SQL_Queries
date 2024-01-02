-- How will you calculate daily average revenue per daily active user for last three months?
select user_id, avg(purchase_value) from inapp_purchase
where activity_date > '2021-05-06'- INTERVAL 3 MONTH
group by user_id, activity_date;    

-- What is the daily average revenue per paying user year to date?
select user_id, avg(purchase_value) from inapp_purchase
where activity_date between  MAKEDATE(year(now()),1)  AND NOW()
group by user_id, activity_date; 

-- How will you calculate the daily conversion rate over the last month? 
Select T.user_id,(T.totalSessions/T1.totalPurchases) as dailyConversion from
 (select User_id, count(*) as totalSessions from Sessions S where activity_date > '2021-05-06'- INTERVAL 1 MONTH
group by S. User_id, activity_date) T,
(select User_id, count(*) as totalPurchases from  inapp_purchase P where activity_date > '2021-05-06'- INTERVAL 1 MONTH
  group by User_id,activity_date) T1
where T.user_id=T1.user_id;

-- How will you calculate Day 7 retention rate of all players acquired on 01 March 2021?
select avg(T.TotalSessions) as 'Day 7 Retention Rate' from 
(select count(*) as TotalSessions from Sessions where user_id IN 
(select  DISTINCT user_id 
from Sessions where activity_date =  '2021-03-01')
AND  activity_date between  '2021-03-01'  AND '2021-03-01' + INTERVAL 7 DAY
group by activity_date) T ;

 





select * from inapp_purchase
