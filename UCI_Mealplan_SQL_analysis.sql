# displays transactions for a quarter
select * from mmp m 
where date(Date) > "2025-9-22";

# total number of transactions for a quarter
select count(*) as total_transactions from mmp
where date(Date) > "2025-9-22";

# total number of swipes per day for a quarter
WITH q AS (SELECT 
		        DAYNAME(Date) AS day, 
		        Amount AS transactions 
		    FROM mmp
		    WHERE DATE(Date) > '2025-09-22')
SELECT 
    COALESCE(day, 'Total') AS day_of_week,
    SUM(transactions * -1) AS swipes
FROM q
GROUP BY day WITH ROLLUP
ORDER BY FIELD(COALESCE(day, 'Total'),
               'Monday','Tuesday','Wednesday',
               'Thursday','Friday','Saturday','Sunday','Total');

# Weekly meal swipes for a quarter
select week(Date) - 37 as week, count(Date) as transactions
from mmp m 
where date(Date) > "2025-9-22"
group by week(Date) - 37
order by week asc;

