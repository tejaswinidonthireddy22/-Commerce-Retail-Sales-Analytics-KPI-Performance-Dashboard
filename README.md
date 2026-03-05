# 🛒 E-Commerce Retail Sales Analytics & KPI Performance Dashboard

> **Turkish Online Retail Platform | January 2023 – March 2024**
> 17,049 transactions · 8 product categories · 10 major Turkish cities

---

## 📋 Table of Contents
- [Business Problem](#business-problem)
- [Project Goals](#project-goals)
- [Key KPIs & Metrics](#key-kpis--metrics)
- [Key Insights](#key-insights)
- [Data Analytics Pipeline](#data-analytics-pipeline)
- [Project Structure](#project-structure)
- [Tools & Technologies](#tools--technologies)
- [How to Use](#how-to-use)

---

## 📌 Business Problem

E-commerce companies generate large volumes of transactional data but often lack structured analytics systems to convert this data into meaningful business insights. Without proper analysis, businesses struggle to understand customer purchasing behavior, product performance, and revenue trends.

**Key challenges addressed:**
- Limited visibility into sales performance across product categories
- Difficulty identifying high-value and returning customers
- Inefficient discount and pricing strategies
- Lack of insights into customer satisfaction and delivery performance
- Poor decision-making due to absence of centralized KPI monitoring

---

## 🎯 Project Goals

| # | Goal | Tool | Output |
|---|------|------|--------|
| 1 | Data Cleaning & EDA | Excel | `ecommerce_eda.xlsx` |
| 2 | SQL Business Analysis | MySQL | `sales_analysis_queries.sql` |
| 3 | Interactive Dashboard | Power BI | `ecommerce_dashboard.pbix` |
| 4 | Project Documentation | Word / Markdown | `Project_Report.docx` + `README.md` |

---

## 📊 Key KPIs & Metrics

### Revenue & Sales
| KPI | Value |
|-----|-------|
| **Total Revenue** | ₺21,779,053 |
| **Total Transactions** | 17,049 |
| **Avg Order Value (AOV)** | ₺1,277 |
| **Monthly Sales Growth** | –10.8% to +13.0% |
| **Top Category** | Electronics (48.1% of revenue) |
| **Top City** | Istanbul (25.9% of revenue) |

### Customer Behavior
| KPI | Value |
|-----|-------|
| **Returning Customer Rate** | 88.2% |
| **Avg Customer Rating** | 3.90 / 5.00 |
| **Avg Session Duration** | 14.5 minutes |
| **Avg Pages per Session** | 9.0 pages |
| **Mobile Transaction Share** | 55.97% |

### Marketing & Pricing
| KPI | Value |
|-----|-------|
| **Avg Discount %** | 5.1% |
| **Total Discounts Given** | ~₺1,186,690 |
| **Highest Discount Category** | Beauty (5.32%) |
| **Lowest Discount Category** | Books (4.99%) |

### Operational
| KPI | Value |
|-----|-------|
| **Avg Delivery Time** | 6.5 days |
| **Express Delivery Avg Rating** | 3.91 ⭐ |
| **Slow Delivery Avg Rating** | 3.86 ⭐ |

---

## 💡 Key Insights

1. **Mobile-First Platform** — 55.97% of all transactions come from mobile devices, making mobile UX the highest-priority investment.

2. **Electronics Dominance** — Electronics generates 48.1% of total revenue from only 12.2% of orders, driven by high unit prices.

3. **Exceptional Loyalty** — 88.2% returning customer rate is well above industry average (~40–60%), representing a strong retention foundation.

4. **Delivery Speed Drives Satisfaction** — Express deliveries (1–3 days) average 3.91 ⭐ vs 3.86 ⭐ for slow deliveries. Logistics investment yields direct satisfaction gains.

5. **Geographic Concentration** — Istanbul alone accounts for 25.9% of revenue. Secondary cities (Bursa, Gaziantep, Adana) show growth potential.

6. **Discount Strategy** — Beauty category has the highest average discount (5.32%). Review whether discounts are driving incremental volume or just margin erosion.

7. **High Engagement** — Average session of 14.5 min and 9 pages suggests customers are well engaged. Checkout funnel optimization could convert more sessions.

8. **Credit Card Dominant** — Credit Card accounts for 39.9% of transactions. Frictionless card checkout is critical to revenue.

---

## 🔄 Data Analytics Pipeline

```
Raw CSV Data (Kaggle)
        │
        ▼
┌──────────────────────────────────┐
│  STEP 1: Data Collection         │
│  Download from Kaggle            │
│  Import CSV into Excel           │
└──────────────┬───────────────────┘
               │
               ▼
┌──────────────────────────────────┐
│  STEP 2: Data Cleaning (Excel)   │
│  • Remove duplicates             │
│  • Verify data types             │
│  • Check missing values          │
│  • Create calculated fields:     │
│    - Revenue per Order           │
│    - Discount Percentage         │
│    - Order Month                 │
│    - Delivery Speed Bucket       │
└──────────────┬───────────────────┘
               │
               ▼
┌──────────────────────────────────┐
│  STEP 3: EDA (Excel)             │
│  • KPI Dashboard sheet           │
│  • Monthly Sales Trend sheet     │
│  • Customer Behavior sheet       │
│  • Discount & Pricing sheet      │
│  • Delivery & Satisfaction sheet │
│  • Pivot Tables + Charts         │
└──────────────┬───────────────────┘
               │
               ▼
┌──────────────────────────────────┐
│  STEP 4: SQL Analysis            │
│  12 queries covering:            │
│  • Revenue & Sales KPIs          │
│  • Monthly Trends (with MoM)     │
│  • Category & City Performance   │
│  • Returning vs New Customers    │
│  • Discount Impact               │
│  • Device Usage                  │
│  • Delivery vs Satisfaction      │
│  • Top High-Value Customers      │
└──────────────┬───────────────────┘
               │
               ▼
┌──────────────────────────────────┐
│  STEP 5: Power BI Dashboard      │
│  Page 1: Executive Overview      │
│  Page 2: Customer Insights       │
│  Page 3: Product & City Analysis │
│  Page 4: Delivery & Satisfaction │
│  Slicers: Category, City,        │
│           Device, Date, Payment  │
└──────────────┬───────────────────┘
               │
               ▼
┌──────────────────────────────────┐
│  STEP 6: Documentation           │
│  Project_Report.docx             │
│  README.md (this file)           │
└──────────────────────────────────┘
```

---

## 📁 Project Structure

```
Ecommerce-Sales-Analytics/
│
├── data/
│   └── ecommerce_sales_dataset.csv          ← Raw dataset (17,049 rows × 18 cols)
│
├── excel/
│   └── ecommerce_eda.xlsx                   ← EDA workbook (5 sheets + KPI dashboard)
│
├── sql/
│   └── sales_analysis_queries.sql           ← 12 SQL business queries
│
├── powerbi/
│   └── ecommerce_dashboard.pbix             ← Interactive Power BI dashboard
│
├── Project_Report.docx                      ← Full project report (Word)
└── README.md                                ← This file
```

---

## 🗄️ SQL Queries Overview

| # | Query | Purpose |
|---|-------|---------|
| 1 | Revenue KPIs | Total revenue, AOV, unique customers, avg delivery and rating |
| 2 | Monthly Sales Trend | MoM revenue with growth % using window function LAG() |
| 3 | Sales by Category | Revenue, transactions, avg price, rating per category |
| 4 | Revenue by City | City-level revenue, customers, delivery, ratings |
| 5 | Returning vs New | Behaviour comparison — spend, session, pages, rating |
| 6 | Avg Rating by Category | Rating distribution with high/low rating counts |
| 7 | Discount Impact | Discount %, gross vs net revenue per category |
| 8 | Device Usage | Orders, session, pages, rating split by device type |
| 9 | Delivery vs Satisfaction | Rating comparison across delivery speed buckets |
| 10 | Payment Method | Transaction share and revenue per payment method |
| 11 | Engagement Metrics | Session duration and pages by device type; session buckets |
| 12 | Top Customers | RFM-style top 20 customers by total spend |

---

## 📊 Excel EDA Workbook — Sheets

| Sheet | Contents |
|-------|----------|
| 📊 KPI Summary | KPI banner cards, category revenue table, city revenue table |
| 📈 Monthly Sales Trend | MoM revenue table + line chart |
| 👥 Customer Behavior | Returning vs New, device, payment, gender, engagement |
| 💰 Discount & Pricing | Category-level discount impact analysis |
| ⭐ Delivery & Satisfaction | Delivery speed vs rating, rating distribution, category ratings |
| 📋 EDA Pivot Tables | Full monthly aggregations as calculated pivot |

---

## 📊 Power BI Dashboard Pages

- Executive Overview**
KPI cards (Revenue, AOV, Transactions, Rating) + Monthly revenue line chart + Revenue by Category bar chart
*Filters: Date Range, Product Category, City*

 Customer Insights**
Returning vs New donut + Device type bar + Payment method bar + Gender pie + Engagement cards
*Filters: Gender, Age Group, Device Type, Is Returning*

 — Product & City Analysis**
City revenue bubble map + Category × City matrix + Unit Price vs Rating scatter
*Filters: City, Product Category, Payment Method*

 — Delivery & Satisfaction**
Rating distribution bar + Delivery speed vs Rating line + Category ratings heatmap
*Filters: Customer Rating, Delivery Speed, Date Range, Category*

> All slicers dynamically update every visual on the page. Cross-filtering enabled on all charts.

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| Microsoft Excel | Data cleaning, EDA, pivot tables, charts |
| SQL (MySQL 8.0) | Business queries, KPI calculations, trend analysis |
| Power BI Desktop | Interactive dashboard, DAX measures, slicers |

---

## 🚀 How to Use

### Excel
1. Open `excel/ecommerce_eda.xlsx`
2. Navigate between sheets using the tab bar
3. Use built-in slicers and filters on each sheet to explore data

### SQL
```sql
-- Import CSV into MySQL as table 'ecommerce_orders'
-- Then run any query from:
source sql/sales_analysis_queries.sql;
```

### Power BI
1. Open `powerbi/ecommerce_dashboard.pbix` in Power BI Desktop
2. Update the data source path to point to `data/ecommerce_sales_dataset.csv`
3. Click **Refresh** to load the data
4. Use the slicers on each page to filter and explore insights

---

## 📚 Key Business Recommendations

1. **Diversify from Electronics** — 48% revenue concentration in one category is a risk
2. **Invest in express delivery** — Proven to raise customer satisfaction scores
3. **Launch a loyalty programme** — Formalise the 88.2% returning customer base
4. **Optimise mobile checkout** — 56% of orders come from mobile devices
5. **Expand to secondary cities** — Bursa, Gaziantep, Adana show growth potential
6. **Review Beauty category discounts** — Highest discount rate (5.32%), check ROI

---

*Dataset: CC0 Public Domain (Kaggle) · Tools: Excel, SQL, Power BI*
