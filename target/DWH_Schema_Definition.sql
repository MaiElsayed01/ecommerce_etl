
create table user_dim(
	user_key int constraint UserKey_CIndx primary key,
	user_id varchar(32) not null,
	user_zip_code varchar(10),
	user_city varchar(255) not null,
	user_state varchar(255) not null
);

create nonclustered index nonclustered_state on user_dim(user_state);

create table seller_dim(
    seller_key int constraint SellerKey_CIndx primary key,
    seller_id varchar(32) not null,
    seller_zip_code varchar(10),
    seller_city varchar(255) not null,
    seller_state varchar(255) not null
);

create nonclustered index nonclustered_state on seller_dim(seller_state);

create table product_dim (
    product_key int constraint ProductKey_CIndx primary key,  
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
    
create table payment_dim (
    payment_key int constraint PaymentKey_CIndx primary key,
    payment_type varchar(12),
    payment_installments int,
    payment_value float
);
    
create table date_dim (
    date_key int constraint DateKey_CIndx primary key,  
    date datetime,  
    year int,  
	quarter int,
    month int,  
    day int,  
	hour int
);
    
create table order_fact (
    order_key int constraint OrderKey_CIndx primary key,
    product_key int not null foreign key references product_dim(product_key),
    user_key int not null foreign key references user_dim(user_key),
    seller_key int not null foreign key references seller_dim(seller_key),
    payment_key int not null foreign key references payment_dim(payment_key),
    order_date_key int not null foreign key references date_dim(date_key),
    pickup_date_key int not null foreign key references date_dim(date_key),
    delivered_date_key int not null foreign key references date_dim(date_key),
    estimated_time_delivery_key int not null foreign key references date_dim(date_key),
    order_id varchar(32) not null,
    order_status varchar(10) not null,
    price float not null,
    shipping_cost float not null
);
    
    
create table feedback_dim (
	order_key int foreign key references order_fact(order_key),
    feedback_id varchar(32) not null,  
    feedback_score int,  
    feedback_form_sent_date date,  
    feedback_answer_date date
);

create clustered index clustered_order_key on feedback_dim(order_key);