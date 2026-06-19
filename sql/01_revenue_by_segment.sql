-- Query 1: Total revenue and customer count per segment
SELECT
    s.Segment,
    COUNT(DISTINCT s."Customer ID")          AS customers,
    ROUND(SUM(t.Quantity * t.Price), 2)      AS total_revenue,
    ROUND(AVG(t.Quantity * t.Price), 2)      AS avg_order_line_value
FROM transactions t
JOIN segments s ON t."Customer ID" = s."Customer ID"
GROUP BY s.Segment
ORDER BY total_revenue DESC;
