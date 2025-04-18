create database ecommerce_db;
use ecommerce_db;

create table customer_dim(
	customer_key int constraint pk_customer primary key,
	customer_id varchar(32) not null,
	customer_zip_code varchar(10),
	customer_city varchar(255) not null,
	customer_state varchar(255) not null
);

create nonclustered index ix_customer_state on customer_dim(customer_state);

create table seller_dim(
    seller_key int constraint pk_seller primary key,
    seller_id varchar(32) not null,
    seller_zip_code varchar(10),
    seller_city varchar(255) not null,
    seller_state varchar(255) not null
);

create nonclustered index ix_seller_state on seller_dim(seller_state);

create table product_dim (
    product_key int constraint pk_product primary key,  
    product_id varchar(32) not null,  
    product_category varchar(50),  
    product_name_length int,  
    product_description_length int,  
    product_photos_qty int,  
    product_weight_g float,  
    product_length_cm float,  
    product_height_cm float,  
    product_width_cm float
);
   
    
create table date_dim (
    date_key int constraint pk_date primary key,  
    full_date datetime not null,  
    year int not null,  
	quarter int not null,
    month int not null, 
	month_name varchar(10) not null,
    day int not null, 
	weekday int not null,
	day_name varchar(10) not null,
	season varchar(10) not null
);

create table time_dim (
    time_key int constraint pk_time primary key,  
	full_time time not null,
    hour int not null,  
	minute int not null,
	second int not null,
	period_of_day varchar(10) not null
);
    
create table order_fact (
    order_key int constraint pk_order primary key,
    order_id varchar(32) not null,
    customer_key int not null foreign key references customer_dim(customer_key),
    order_date_key int not null foreign key references date_dim(date_key),
	order_time_key int not null foreign key references time_dim(time_key), 
    delivered_date_key int not null foreign key references date_dim(date_key),
    delivered_time_key int not null foreign key references time_dim(time_key),
    estimated_delivery_date_key int not null foreign key references date_dim(date_key),
	payment_type varchar(12),
    payment_installments int,
    payment_value float,
	feedback_score int,  
	feedback_date_key int not null foreign key references date_dim(date_key),
	feedback_answer_date_key int not null foreign key references date_dim(date_key),
    order_status varchar(10) not null,
    total_order_value float not null,
	order_item_count int not null
);
  
create table order_item_fact(
	order_item_key int constraint pk_orderitem primary key,
	order_id varchar(32) not null,
	order_item_id int not null,
	customer_key int not null foreign key references customer_dim(customer_key),
	product_key int not null foreign key references product_dim(product_key),
	seller_key int not null foreign key references seller_dim(seller_key),
	price float,
	shipping_cost float,
	pickup_limit_date_key int not null foreign key references date_dim(date_key),
	pickup_limit_time_key int not null foreign key references time_dim(time_key)
);