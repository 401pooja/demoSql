create table production.products_audit1(
change_id   int identity primary key,
product_id   int not null,
product_name  varchar(255),
brand_id       int not null,
category_id    int not null,
model_year     smallint not null,
list_price     dec(10,2) not null,
updated_at     datetime not null,
operation      char(3) not null,
check(operation='ins' or operation='del')  
);

create trigger production.trg_product_audit1
on production.products
after insert,delete
as
begin
insert into  production.products_audit1(
product_id,   
product_name, 
brand_id ,    
category_id , 
model_year,   
list_price,   
updated_at,   
operation    
)
select 
i.product_id,i.product_name,i.brand_id,i.category_id,i.model_year,i.list_price,GETDATE(),'ins'
FROM
inserted i
union all
select 
d.product_id,d.product_name,d.brand_id,d.category_id,d.model_year,d.list_price,GETDATE(),'del'
FROM
deleted d;
end

insert into production.products(product_name,brand_id,category_id,model_year,list_price)
values('helmet',1,1,2019,700)

select * from production.products_audit1
delete from production.products where product_id=374

----------------------------------
create function sales.udf_order_placed(
@product_id int
)
returns int
as
begin
declare @count int=0
select @count=sum(quantity) from production.stocks
where product_id=@product_id and operation='ins'
return @count;
end;

create function sales.udf_order_cancle(
@product_id int
)
returns int
as
begin
declare @count int=0
select @count=sum(quantity) from production.stocks
where product_id=@product_id and operation='del'
return @count;
end;
(select sales.udf_order_placed(2)-sales.udf_order_cancle(2))