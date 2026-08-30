# CLT Photobooth Magik — Business Performance Analysis & Power BI Dashboard

**SQL (BigQuery) • Power BI • Data Cleaning • KPI Development • Year-over-Year Analysis**

## Overview

An end-to-end data analytics project built for CLT Photobooth Magik, a Charlotte, NC-based photo booth rental company. As the company's Data & Growth Analyst, I designed the business's first data infrastructure, analyzed two years of booking, revenue, and lead-source data, and delivered a 4-page interactive Power BI dashboard to guide pricing and marketing decisions.

## Business Problem

The business had five years of operational data spread across Squarespace and HoneyBook exports with no unified structure, no historical 2023 comparison available for benchmarking, and no way to answer basic questions like: Which packages are actually most profitable? Which lead sources drive the highest-value bookings? How has customer booking behavior changed over time?

## Tools & Skills

- **SQL (Google BigQuery):** multi-table JOINs, CASE statements, SPLIT/UNNEST, window functions, subqueries, aggregations
- **Power BI:** interactive dashboards, DAX measures, Power Query (Group By, Replace Values), custom KPI cards, treemaps, donut charts
- **Data Cleaning:** consolidated 5+ disconnected spreadsheets into a unified, joinable structure using a custom Project ID system
- **Analysis:** revenue-per-hour analysis, lead-source conversion, year-over-year (2023 vs. 2026) comparison, cross-dimensional analysis (event type × lead source)

## Data & Methodology

1. Cleaned and standardized booking, payment, and lead data from Squarespace and HoneyBook exports
2. Designed a consistent Project ID system to join tables that previously had no shared key
3. Migrated cleaned data into Google BigQuery for SQL-based analysis
4. Wrote SQL queries to calculate booking popularity, revenue-per-hour by package length, lead-source performance, repeat client value, and booking timeline behavior
5. Rebuilt a historical 2023 dataset from HoneyBook exports to enable direct year-over-year comparison against 2026 performance
6. Designed and built a 4-page Power BI dashboard translating the SQL analysis into executive-ready visuals

## Key Findings

- **Pricing insight:** 2-hour booking packages generate the highest revenue-per-hour of any package length, outperforming longer bookings by up to 2x — directly informing pricing strategy.
- **Demand vs. profitability:** 3-hour packages drive the highest overall booking volume, but shorter packages are quietly more profitable per hour — a distinction the business hadn't previously measured.
- **Hidden growth channel:** Instagram-driven bookings outperformed Google in average revenue across three major event categories (Birthday, Corporate, Wedding) in 2023, despite the channel showing zero tracked bookings in 2026 — surfacing a reactivation opportunity.
- **Customer behavior shift:** Average time to book increased from 2.8 to 5.6 days between 2023 and 2026, while the average inquiry-to-event window shrank from 74.1 to 55.7 days — a meaningful shift for marketing timing and staffing.
- **Repeat client value:** The top 3 repeat clients alone generated over $6,400 in revenue, reinforcing the value of a retention-focused strategy.

## Dashboard

The Power BI dashboard includes four pages:

1. **Executive Dashboard** — revenue snapshot, KPI cards, booth popularity, and revenue-share comparison (2023 vs. 2026 YTD)
2. **Customer & Booking Insights** — booking volume and revenue by lead source, compared year-over-year
3. **Booking Timeline** — average days to book and average inquiry-to-event window, then vs. now
4. **Growth Opportunities** — repeat client analysis, booking-length popularity, revenue-per-hour trends, and the event-type × lead-source profitability breakdown

*(Dashboard screenshots included in `/screenshots`. Full .pbix file available on request due to client data privacy.)*

## Files in This Repo

```
├── README.md
├── sql_queries/
│   ├── booth_popularity.sql
│   ├── revenue_by_hours_booked.sql
│   ├── conversion_by_lead_source.sql
│   ├── repeat_clients.sql
│   └── event_type_by_lead_source.sql
├── screenshots/
│   ├── executive_dashboard.png
│   ├── customer_booking_insights.png
│   ├── booking_timeline.png
│   └── growth_opportunities.png
└── reports/
    ├── 2023_vs_2026_performance_report.docx
    └── 2023_business_insights_opportunities.docx
```

## Note on Data Privacy

Client names and identifying details have been removed or anonymized where necessary. Revenue figures and business metrics are shared with the business owner's permission as part of a professional portfolio.

---
**Nya Obiefuna** | Data & Growth Analyst | [LinkedIn] | [GitHub](https://github.com/NyaObiefuna)
