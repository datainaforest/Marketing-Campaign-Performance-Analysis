/* =====================================================
   MARKETING CAMPAIGN PERFORMANCE ANALYSIS
   Author: Łukasz Trzeciak
   Dataset: Marketing Campaign Performance Dataset (Kaggle)
   ===================================================== */


/* =====================================================
   DATA EXPLORATION
   ===================================================== */

/* Total campaigns (rows) */
SELECT
    COUNT(*) AS total_campaigns
FROM marketing_campaign;

/* Date range */
SELECT
    MIN(Date) AS first_campaign_date,
    MAX(Date) AS last_campaign_date
FROM marketing_campaign;

/* Unique channels */
SELECT
    Channel_Used
FROM marketing_campaign
group by channel_used 
ORDER BY Channel_Used;

/* Unique campaign types */
SELECT
    Campaign_Type
FROM marketing_campaign
GROUP BY Campaign_Type
ORDER BY Campaign_Type;


/* =====================================================
   KPI METRICS
   ===================================================== */

/* Total clicks */
SELECT
    SUM(Clicks) AS total_clicks
FROM marketing_campaign;

/* Total impressions */
SELECT
    SUM(Impressions) AS total_impressions
FROM marketing_campaign;

/* Average engagement score */
SELECT
    ROUND(AVG(Engagement_Score), 2) AS avg_engagement_score
FROM marketing_campaign;



/* =====================================================
   CHANNEL PERFORMANCE (VOLUME METRICS)
   ===================================================== */

/* Campaign distribution by channel */
SELECT
    Channel_Used,
    COUNT(*) AS total_campaigns
FROM marketing_campaign
GROUP BY Channel_Used
ORDER BY total_campaigns DESC;

/* Total impressions by channel */
SELECT
    Channel_Used,
    SUM(Impressions) AS total_impressions
FROM marketing_campaign
GROUP BY Channel_Used
ORDER BY total_impressions DESC;

/* Total clicks by channel */
SELECT
    Channel_Used,
    SUM(Clicks) AS total_clicks
FROM marketing_campaign
GROUP BY Channel_Used
ORDER BY total_clicks DESC;

/* Campaign distribution by campaign type */
SELECT
    Campaign_Type,
    COUNT(*) AS total_campaigns
FROM marketing_campaign
GROUP BY Campaign_Type
ORDER BY total_campaigns DESC;


/* =====================================================
   MONTHLY TRENDS
   ===================================================== */

/* Monthly campaign activity */
SELECT
    DATE_FORMAT(Date, '%Y-%m') AS campaign_month,
    COUNT(*) AS total_campaigns,
    SUM(Clicks) AS total_clicks,
    SUM(Impressions) AS total_impressions,
    ROUND(AVG(Engagement_Score), 2) AS avg_engagement_score
FROM marketing_campaign
GROUP BY campaign_month
ORDER BY campaign_month;
