-- Query 2: Revenue share — what % of total revenue does each segment drive?
WITH segment_revenue AS (
    SELECT
        s.Segment,
        ROUND(SUM(t.Quantity * t.Price), 2) AS total_revenue
    FROM transactions t
    JOIN segments s ON t."Customer ID" = s."Customer ID"
    GROUP BY s.Segment
),
grand_total AS (
    SELECT SUM(total_revenue) AS grand FROM segment_revenue
)
SELECT
    sr.Segment,
    sr.total_revenue,
    ROUND(sr.total_revenue * 100.0 / gt.grand, 1) AS revenue_pct
FROM segment_revenue sr, grand_total gt
ORDER BY sr.total_revenue DESC;
