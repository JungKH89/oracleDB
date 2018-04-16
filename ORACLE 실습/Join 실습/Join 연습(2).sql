select * from lefttable;
select * from righttable;
select * from promotiontable;


create table lefttable 
(
    regionid varchar2(20),
    productgroup varchar2(20),
    yearweek varchar2(20),
    qty number
);

create table righttable
(
    productid varchar2(20),
    productname varchar2(20)
);

create table promotiontable
(
    promotiongroup varchar2(20),
    promotion_week varchar2(20),
    promotion_ratio varchar2(20)
);


edit LEFTTABLE;
edit promotiontable;
edit righttable;

---INNER JOIN--- A¶û B¶û
SELECT A.REGIONID, A.productgroup, B.productname, A.YEARWEEK, A.QTY
FROM lefttable A
INNER JOIN righttable B
ON A.productgroup = B.productid;


---LEFT JOIN--- A¶û B¶û
SELECT A.REGIONID, A.productgroup, B.productname, A.YEARWEEK, A.QTY
FROM lefttable A
LEFT JOIN righttable B
ON A.productgroup = B.productid;


---INNER JOIN--- A¶û C¶û
SELECT A.REGIONID, A.productgroup, A.YEARWEEK, A.QTY,c.promotion_ratio
FROM lefttable A
INNER JOIN promotiontable c
ON A.productgroup = C.promotiongroup;

---LEFT JOIN--- A¶û C¶û
SELECT A.REGIONID, A.productgroup, A.YEARWEEK, A.QTY,c.promotion_ratio
FROM lefttable A
LEFT JOIN promotiontable c
ON A.productgroup = C.promotiongroup;



---INNER JOIN 3°³ (1)--- A¶û B¶û C¶û
SELECT A.*, B.PRODUCTNAME, C.PROMOTION_RATIO
FROM lefttable A
INNER JOIN righttable B
ON A.PRODUCTGROUP=B.PRODUCTID
INNER JOIN PROMOTIONTABLE C
ON A.PRODUCTGROUP=C.PROMOTIONGROUP
AND A.YEARWEEK = C.PROMOTION_WEEK;

---INNER JOIN 3°³ (2)--- A¶û B¶û C¶û
SELECT A.* , B.PRODUCTNAME, C.PROMOTION_RATIO
FROM LEFTTABLE A, RIGHTTABLE B, PROMOTIONTABLE C
WHERE 1=1
AND A.PRODUCTGROUP = B.PRODUCTID 
AND A.PRODUCTGROUP = C.PROMOTIONGROUP
AND A.YEARWEEK = C.PROMOTION_WEEK;



---LEFT JOIN 3°³ (1)--- A¶û B¶û C¶û
SELECT A.*, B.PRODUCTNAME, C.PROMOTION_RATIO
FROM lefttable A
LEFT JOIN righttable B
ON A.PRODUCTGROUP=B.PRODUCTID
LEFT JOIN PROMOTIONTABLE C
ON A.PRODUCTGROUP=C.PROMOTIONGROUP
AND A.YEARWEEK = C.PROMOTION_WEEK;

---LEFT JOIN 3°³ (2)--- A¶û B¶û C¶û
SELECT A.* , B.PRODUCTNAME, C.PROMOTION_RATIO
FROM LEFTTABLE A, RIGHTTABLE B, PROMOTIONTABLE C
WHERE 1=1
AND A.PRODUCTGROUP = B.PRODUCTID (+)
AND A.PRODUCTGROUP = C.PROMOTIONGROUP (+)
AND A.YEARWEEK = C.PROMOTION_WEEK (+)