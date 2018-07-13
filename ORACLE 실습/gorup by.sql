select * from kopo_channel_seasonality_new;

--69¸¸
select regionid, avg(qty) 
from kopo_channel_result_new
group by regionid
order by regionid;

--12¸¸
select yearweek, avg(qty)
from kopo_channel_seasonality_new
where 1=1
group by yearweek
order by yearweek;