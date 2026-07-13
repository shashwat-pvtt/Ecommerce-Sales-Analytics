# Store Sales Analysis

An end-to-end sales analytics project covering data cleaning, exploratory data analysis, SQL business queries, and an interactive Power BI dashboard — built to help a retail/e-commerce business understand sales, profit, and customer behavior across India.

## Dashboard Preview

**Overview Page**
![Store Sales Dashboard - Overview](dashboard2.png)

**Detailed Sales Analysis Page**
![Store Sales Dashboard - Detailed Analysis](dashboard1.png)

## Project Structure

```
├── store_sales_data.csv       # Raw sales dataset
├── cleaned_sales_data.csv     # Cleaned dataset with engineered features
├── Sales_Analysis.ipynb       # Data cleaning, EDA & feature engineering (Python)
├── queries.sql                # 40 business-question SQL queries (PostgreSQL)
├── Sales_Analysis.pbix        # Power BI dashboard file
├── dashboard1.png             # Dashboard screenshot - Detailed Sales Analysis
├── dashboard2.png             # Dashboard screenshot - Overview
└── README.md
```

## About the Data

The dataset contains ~100,000 retail transaction records with the following key fields:

- **Customer info:** Customer ID, Name, Date of Birth, Segment
- **Order info:** Order ID, Order Date, Ship Date, Ship Mode, Sales Date
- **Product info:** Product ID, Product Name, Sub-Category, Category of Goods, Quantity, Discount
- **Location info:** State, Region, City Type, Postal Code, Country
- **Metrics:** Sales, Profit, Outlet Type, Year

After cleaning, the following features were engineered:

- `Age` and `Age Group` (derived from Date of Birth)
- `Delivery Days` (Ship Date − Order Date)
- `Profit Margin (%)`
- `Average Selling Price`
- `Year Month` and `Month` (for time-series trend analysis)

## Workflow

1. **Data Cleaning & Feature Engineering** (`Sales_Analysis.ipynb`)
   - Loaded and assessed data quality (missing values, duplicates, types)
   - Engineered age, delivery time, profit margin, and time-based features
   - Exported the cleaned dataset (`cleaned_sales_data.csv`)

2. **Exploratory Data Analysis** (`Sales_Analysis.ipynb`)
   - Sales trends by month, region, category, segment, outlet type, city type, and state
   - Profitability analysis by category, segment, and discount level
   - Customer analysis by age group and top spenders
   - Shipping performance by ship mode and delivery time

3. **SQL Analysis** (`queries.sql`)
   - 40 PostgreSQL business queries organized into 5 sections:
     - Data Exploration
     - Sales Analysis
     - Profit Analysis
     - Customer Analysis
     - Advanced SQL (CTEs, window functions — `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, running totals, percentage-of-total)

4. **Interactive Dashboard** (`Sales_Analysis.pbix`)
   - Built in Power BI with two pages: **Overview** and **Detailed Sales Analysis**
   - Filters by State, Region, Segment, Category of Goods, and Year
   - KPI cards for Total Sales, Total Orders, and Average Margin

## Business Insights

**Overall Performance**
- The business generated **₹2,508.44M** in total sales across **100,000 orders**, with a healthy average profit margin of **~15%** and no loss-making orders in the dataset — indicating consistently well-priced products.
- Sales are almost perfectly balanced across **Region** (East, South, North, West all within ~₹15M of each other) and **Segment** (Consumer 50.04% vs Corporate 49.96%). This signals a mature, diversified business with **no single point of dependency** — a strength, but also a sign that growth won't come from over-indexing on one region or segment.

**Discounting is eating into margins**
- There's a **strong negative correlation (-0.55) between discount rate and profit margin**. Orders with 0–10% discount average an **~19% profit margin**, while orders with 40–50% discount drop to just **~11%**.
- *Actionable takeaway:* Discounting above 30–40% should be tightly controlled or reserved for clearing slow-moving inventory — it's a direct lever the business is currently under-optimizing.

**Category & Product Performance**
- **Electric Appliances** and **Dairy Products** carry the highest average profit margins (~15%), while **Furniture** — despite strong revenue — has the *thinnest* margin of all categories (14.9%), likely due to higher handling/logistics costs.
- **Butter, Mops, and Burgers** lead in units sold, but **Furniture and Dairy Products** generate the most total profit — showing that **volume leaders and profit leaders aren't the same categories**, which matters for inventory and marketing budget allocation.

**Customer Behavior**
- Customers aged **46+** (46–60 and 60+ groups combined) account for over **44% of total sales** and are the two highest-spending age groups overall — this is the core, high-value customer base worth prioritizing in retention and loyalty campaigns.
- The **18–25 age group contributes the least** to both sales and profit, suggesting an opportunity to investigate whether this is a market-fit issue or an under-marketed segment.
- **Michael, James, and David** are the top individual customers by sales — a small group of high-value repeat buyers who could be strong candidates for a VIP/loyalty program.

**Operations**
- **Ship Mode** (Same Day, First/Second Class, Standard) shows **almost no difference in delivery time (~4 days) or sales performance**, suggesting the premium "Same Day" option isn't currently being leveraged as a differentiator — an opportunity to either promote it more or reprice it.
- **Outlet Type** (Large/Medium/Small) and **City Type** (Tier 1/Tier 2/Village) also show near-identical performance, reinforcing that the current sales strategy is location-agnostic — expansion into new areas is likely low-risk from a demand standpoint.

**Geography**
- **Rajasthan, Punjab, and Maharashtra** are the top-performing states by sales, though the spread between the top 5 states is narrow (within ~₹5.5M), indicating a geographically well-distributed customer base rather than a few dominant markets.

**Seasonality**
- **May, July, and March** are the strongest sales months, useful for planning inventory builds and marketing pushes ahead of these peaks.

## Tools Used

| Tool | Purpose |
|---|---|
| Python (Pandas, Matplotlib/Seaborn) | Data cleaning, feature engineering, EDA |
| PostgreSQL | Business-question SQL analysis |
| Power BI | Interactive dashboard & reporting |

## Author

**Shashwat Kumar**

Aspiring Data Analyst

LinkedIn: www.linkedin.com/in/shashwats07

GitHub: www.github.com/shashwat-pvtt
