-- Lead-to-Booking Conversion by Source (2026)
-- Joins Leads_Report to Booked_Clients to flag whether each lead converted
-- to a paying booking, then aggregates the conversion outcome by lead source.

WITH leads_with_status AS (
  SELECT
    l.Project_Id,
    l.Lead_Source,
    CASE WHEN b.Project_Id IS NOT NULL THEN TRUE ELSE FALSE END AS Converted_To_Booking
  FROM `Photobooth_magik26.Leads_Report` l
  LEFT JOIN `Photobooth_magik26.Booked_Clients` b
    ON l.Project_Id = b.Project_Id
)

SELECT
  Lead_Source,
  Converted_To_Booking,
  COUNT(*) AS Lead_Count
FROM leads_with_status
GROUP BY Lead_Source, Converted_To_Booking
ORDER BY Lead_Source, Converted_To_Booking DESC;

-- Note: No 2023 leads/inquiries export exists (only booked clients),
-- so a true conversion rate isn't available for 2023. The 2023 comparison
-- instead reports booking volume and revenue by Project_Source directly
-- from Booked_Clients_2023 (see below).

-- 2023 Bookings & Revenue by Source (used in place of a true conversion rate)
SELECT
  Project_Source,
  COUNT(*) AS Total_Bookings,
  ROUND(SUM(Total_Booked_Value), 2) AS Total_Revenue,
  ROUND(AVG(Total_Booked_Value), 2) AS Avg_Revenue_Per_Booking,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 1) AS Pct_Of_Total_Bookings
FROM `Photobooth_magik26.Booked_Clients_2023`
WHERE Project_Source IS NOT NULL
GROUP BY Project_Source
ORDER BY Total_Bookings DESC;
