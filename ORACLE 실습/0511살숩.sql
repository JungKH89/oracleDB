select
    regionid
    , product
    , substr(yearweek,5,6) as week
    , avg(qty) as average
from (
    select * from kopo_channel_seasonality_new
    where regionid='A01'
    and substr(yearweek,5,6) not in ('53')
    and product = 'PRODUCT1'
)
group by regionid, product, substr(yearweek,5,6)
