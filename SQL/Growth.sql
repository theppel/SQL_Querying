with quarterly as (
	select
		date_trunc('quarter', o.order_purchase_timestamp::timestamp) as quarter,
		sum(oi.price - oi.freight_value) AS profit,
		sum(oi.price) AS revenue
		FROM order_items oi
		JOIN orders o ON o.order_id = oi.order_id
		GROUP BY quarter
		ORDER BY quarter
)
select
	quarter,
	revenue,
	profit,
	round(
		((revenue - lag(revenue) over (order by quarter))
        / nullif(lag(revenue) over (order by quarter), 0) * 100)::numeric, 2
	) as rev_growth,
	round(
		((profit - lag(profit) over (order by quarter))
		/ nullif(lag(profit) over (order by quarter), 0) * 100)::numeric, 2
	) as prof_growth
from quarterly;