-- In EPL 20/21 Man city won the title , I wanna see how teams perform in this season 

-- best / worst Goals scored and assits by team 
 -- we can see that sheffield united was the worst attacing team by scoring just 19 goals and 13 assists.
  -- and ofc Man City is top Scoring team in league by scoring 82 goals and 55 assists 
select Club , sum (Goals) [Goals Scored] , SUM(Assists) [Assists]
from epl 
group by Club
order by [Goals Scored] desc --asc

-- AVG players age per club 
	-- Man United is least club In avg players age (23) and crystal can first (28)
SELECT Club, CAST(AVG(Age) AS INT) AS [Avg Players Age], COUNT(Name) AS [Number of Players]
FROM epl
GROUP BY Club
ORDER BY [Avg Players Age] ,[Number of Players] ASC --DESC 



-- Passes Completed a
	-- Ofc man city came first based on their play style followed by liverpool in second place and chelsea third
SELECT Club, SUM (Passes_Attempted) [Passes Completed] , CAST(AVG(Perc_Passes_Completed) as int ) [Percent Passes Completed Per Match]
FROM epl
GROUP BY Club
order by [Passes Completed] desc



-- Expected Goals Vs Goals Scored 
	-- what surprised me that Sheffield United came fifth in Avg Expected Goals but they only scored 19 goals in this season !!
SELECT Club, Round(AVG(xG),3) [Avg Expected Goals Per Match] , SUM (Goals) [Goals Scored] , ROUND(AVG(xA),3) [Expected Assists Per Match],
SUM(Assists) [Assits]
FROM epl
GROUP BY Club
order by [Avg Expected Goals Per Match] desc




-- Penalty and Cards statistics 
select Club , SUM(Penalty_Goals) [Penalty Goals] , SUM(Penalty_Attempted) [Penalty Given] , Round((SUM(Penalty_Goals)/SUM(Penalty_Attempted))*100,2)[Pen Accuracy %],
SUM(Yellow_Cards)[Yellow Cards Given] , SUM (Red_Cards) [Red Cards Given]
from epl 
group by Club
order by [Yellow Cards Given]desc 

  

-- I'm done with Clubs Now let's check some players statistics 

-- We can see that Hurry Kane had a great season as he finished top scorer in league by scoring (23) goals also he was top assists by (14) assists 
SELECT Name, Club, SUM(Goals) AS [Goals Scored], xG, SUM(Assists) AS [Assists],SUM(Penalty_Goals) AS [Penalty Scored], SUM(Penalty_Attempted) AS [Penalty Given],
       CASE WHEN SUM(Penalty_Attempted) > 0 THEN ROUND((SUM(Penalty_Goals) / SUM(Penalty_Attempted)) * 100, 2)
            ELSE 0
       END AS [Pen Accuracy %]
FROM epl
GROUP BY Name, Club, xG
ORDER BY [Goals Scored] DESC


 
-- Showing Matches played and Cards given
SELECT  Club, Name , Matches , SUM(Yellow_Cards)[Yellow Cards Given] , SUM(Red_Cards) [Red Cards Given]
FROM epl
GROUP BY Name, Club , Matches
order by [Yellow Cards Given] desc


-- Minutes Played in the Season 
SELECT Club, Name , Position ,  Matches , Starts [Matches Started] ,  Mins [Minutes Played]  , Age
FROM epl
GROUP BY Name, Club , Matches , Mins ,  Position , Age , Starts
order by [Minutes Played] desc 


-- Most Scored denfenders 
Select Club , Name , Position , Matches , (SUM ( Goals)+SUM(Assists) ) [Goals+Assists] , 
SUM(Goals)[Goals Scored],SUM(Assists)[Assists]
from epl
where Position  = 'DF'
group by Club , Name  , Position , Matches
order by [Goals+Assists] desc


-- Now I wanna Check How Liverpool did in this season "THEY ARE MY FAVOURITE TEAM" 
Select Club , Name , Position , SUM(Goals) [Goals Scored] , SUM(Assists)[Assists] , Mins , Matches , xG , Yellow_Cards , Red_Cards
from epl
where Club = 'Liverpool FC'
group by Club , Name , Mins , Matches , xG , Position , Yellow_Cards , Red_Cards
order by [Goals Scored] desc











 


















 

