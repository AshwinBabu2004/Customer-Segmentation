-- Query 3: Average orders and revenue per customer by segment
SELECT
    s.Segment,
    COUNT(DISTINCT t.Invoice)                                      AS total_orders,
    COUNT(DISTINCT s."Customer ID")                                AS customers,
    ROUND(COUNT(DISTINCT t.Invoice) * 1.0 /
          COUNT(DISTINCT s."Customer ID"), 1)                      AS avg_orders_per_customer,
    ROUND(SUM(t.Quantity * t.Price) /
          COUNT(DISTINCT s."Customer ID"), 2)                      AS revenue_per_customer
FROM transactions t
JOIN segments s ON t."Customer ID" = s."Customer ID"
GROUP BY s.Segment
ORDER BY revenue_per_customer DESC;
