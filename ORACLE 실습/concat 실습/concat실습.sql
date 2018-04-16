select * from kopo_channel_seasonality_new;

select * from kopo_product_master;


select
  concat(regionid, concat('_',product)) as keycol,
  A.REGIONID,
  A.PRODUCT,
  A.YEARWEEK,
  A.QTY,
  B.PRODUCT_NAME
  from kopo_channel_seasonality_new A
  LEFT JOIN KOPO_PRODUCT_MST B
  ON A.PRODUCT=B.PRODUCT_ID