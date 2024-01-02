use clip;


-- How will you calculate the Daily Active Users (count of unique users that start at least one session in the app on any given day) 
-- and Monthly Active Users (count of unique users that start at least one session in the app in a month) for the last three months?
-- alter table Sessions modify column activity_date date;
-- alter table inapp_purchase modify column activity_date date;
-- daily active users - no conditions
select activity_date, count( distinct user_id) from Sessions group by  activity_date  ;
-- daily active users in the last 3 months
select activity_date, count( distinct user_id) as 'daily active users' from Sessions 
 where activity_date > '2021-11-12'- INTERVAL 3 MONTH
group by  activity_date;
-- last 3 months
select MONTH(activity_date) as 'Month', YEAR(activity_date) as 'Year' ,count(distinct user_id) as 'Monthly active users' from Sessions 
 where activity_date > '2021-11-12'- INTERVAL 3 MONTH
group by MONTH(activity_date), YEAR(activity_date);

	-- How many new players joined the game in the last month?
    select count(distinct user_id) from Sessions
     where activity_date > '2021-11-12'- INTERVAL 1 MONTH;
     
      -- What is the average sessions per Daily Active user?
      select  user_id, ( count(session_id)/count(distinct activity_date)) as 'average sessions'  from Sessions
    group by  user_id;
	
    -- 	On average how much time in app does each user spend inside the game each day?
    select user_id, avg(session_length_seconds) from Sessions
    group by activity_date, user_id;
   
    
    
    
    select * from Sessions

 
