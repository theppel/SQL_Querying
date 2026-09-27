-- add primary keys
alter table orders
	add primary key (order_id);

alter table customers
	add primary key (customer_id);

alter table products
	add primary key (product_id);

alter table sellers
	add primary key (seller_id);

alter table category_name
	add primary key (product_category_name);

-- add foreign keys
alter table orders
	add constraint fk_Customer
		foreign key (customer_id)
		references customers(customer_id);

alter table order_reviews
	add constraint fk_Order_Review
		foreign key (order_id)
		references orders(order_id);

alter table order_payments
	add constraint fk_Orders
		foreign key (order_id)
		references orders(order_id);

alter table order_items
	add constraint fk_Orders
		foreign key (order_id)
		references orders(order_id),
	add constraint fk_Products
		foreign key (product_id)
		references products(product_id),
	add constraint fk_Sellers
		foreign key (seller_id)
		references sellers(seller_id);

select *
	from products
	where product_category_name = '';

update products
	set product_category_name = null
	where product_category_name ='';

insert into category_name
	values 
		('pc_gamer', 'pc_games'),
		('portateis_cozinha_e_preparadores_de_alimentos', 'kitchen_appliances_and_food_prep');

alter table products
	add constraint fk_Category_Name
		foreign key (product_category_name)
		references category_name(product_category_name);


