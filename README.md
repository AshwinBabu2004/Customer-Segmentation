# Customer Segmentation & Revenue Optimization

Segmented 5,878 retail customers using K-Means clustering on RFM (Recency, Frequency, Monetary) features, then layered SQL-based revenue analysis on top to quantify business value per segment.

**Dataset:** [Online Retail II — UCI / Kaggle](https://www.kaggle.com/datasets/mashlyn/online-retail-ii-uci) | 1M+ transactions | UK-based retailer | 2009–2011

**Tools:** Python (pandas, scikit-learn, matplotlib, seaborn) · SQLite · Tableau Public

---

## Key Findings

| Segment | Customers | Total Revenue | Revenue Share |
|---|---|---|---|
| Loyal Customers | 3,841 | $11.56M | 65.1% |
| Champions | 35 | $2.91M | 16.4% |
| VIP / Wholesale | 4 | $1.75M | 9.8% |
| Churned | 1,998 | $1.53M | 8.6% |

- **39 customers** (Champions + VIP) drive **26% of total revenue**
- **Champions** average $83K in spend and purchase every 26 days
- **1,998 churned customers** generated $1.53M before disengaging — a win-back opportunity
- **4 VIP/Wholesale accounts** each spend ~$437K — losing one is a significant business risk

---

## Project Structure

```
customer-segmentation/
├── data/               # Raw dataset (not tracked — too large for GitHub)
├── notebooks/
│   ├── 01_explore_and_clean.ipynb    # Data loading, cleaning, EDA
│   ├── 02_kmeans_clustering.ipynb    # RFM features + K-Means segmentation
│   └── 03_sql_revenue_analysis.ipynb # SQL queries via SQLite
├── sql/
│   ├── 01_revenue_by_segment.sql
│   ├── 02_revenue_share.sql
│   ├── 03_orders_per_customer.sql
│   ├── 04_monthly_revenue_trend.sql
│   └── 05_top10_customers.sql
├── output/
│   ├── rfm_segments.csv              # Customer RFM scores + segment labels
│   ├── revenue_by_segment.csv
│   ├── revenue_share.csv
│   ├── orders_per_customer.csv
│   ├── monthly_revenue_trend.csv
│   ├── top10_customers.csv
│   ├── elbow_plot.png                # K selection via elbow method
│   └── segments_scatter.png          # Recency vs Revenue by segment
└── README.md
```

---

## How to Run

1. Download the [Online Retail II dataset](https://www.kaggle.com/datasets/mashlyn/online-retail-ii-uci) and place the CSV in `data/`
2. Install dependencies:
   ```
   pip3 install pandas numpy matplotlib seaborn scikit-learn
   ```
3. Run the notebooks in order:
   - `01_explore_and_clean.ipynb`
   - `02_kmeans_clustering.ipynb`
   - `03_sql_revenue_analysis.ipynb`

---

## Methodology

**RFM Feature Engineering**
Each customer is summarized into three metrics: how recently they purchased (Recency), how often (Frequency), and how much they spent (Monetary).

**K-Means Clustering**
Features are scaled with StandardScaler before clustering. The elbow method (K=2–10) was used to select K=4 as the optimal number of segments.

**SQL Revenue Analysis**
Clustered customers are joined back to transaction-level data in SQLite to compute revenue share, revenue per customer, and monthly trends per segment.
