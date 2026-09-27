select
	date_trunc('month', o.order_purchase_timestamp::timestamp) as mon,
	sum(p.product_weight_g / 1000.0) as product_weight_kg,
	s.seller_state,
	sum(p.product_height_cm * p.product_width_cm * p.product_length_cm) as volume
	from products p
	join order_items oi
		on p.product_id = oi.product_id
	join sellers s
		on oi.seller_id = s.seller_id
	join orders o
		on oi.order_id = o.order_id
	group by s.seller_state, mon
	order by mon