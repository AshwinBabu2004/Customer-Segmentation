-- Query 4: Monthly revenue trend per segment
SELECT
    STRFTIME('%Y-%m', t.InvoiceDate)         AS month,
    s.Segment,
    ROUND(SUM(t.Quantity * t.Price), 2)      AS monthly_revenue
FROM transactions t
JOIN segments s ON t."Customer ID" = s."Customer ID"
GROUP BY month, s.Segment
ORDER BY month, s.Segment;
