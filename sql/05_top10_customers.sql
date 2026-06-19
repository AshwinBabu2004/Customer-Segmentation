-- Query 5: Top 10 customers by total revenue (with segment label)
SELECT
    s."Customer ID",
    s.Segment,
    s.Recency,
    s.Frequency,
    ROUND(s.Monetary, 2)                     AS total_spent
FROM segments s
ORDER BY s.Monetary DESC
LIMIT 10;
