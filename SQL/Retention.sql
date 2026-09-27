SELECT
    delivery_time,
    count(*) AS num_orders,
    avg(has_later_order::int) AS pct_with_later_order
FROM (
    SELECT
        CASE
            WHEN o.order_delivered_customer_date != '' THEN
                EXTRACT(epoch FROM (
                    date_trunc('day', o.order_delivered_customer_date::timestamp)
                    - date_trunc('day', o.order_purchase_timestamp::timestamp)
                )) / 86400
            ELSE NULL
        END AS delivery_time,
        o.order_purchase_timestamp::timestamp < max(o.order_purchase_timestamp::timestamp)
            OVER (PARTITION BY c.customer_unique_id) AS has_later_order
    FROM orders o
    JOIN customers c ON c.customer_id = o.customer_id
) sub
GROUP BY delivery_time
ORDER BY delivery_time;