-- Average Revenue by Hours Booked
-- Calculates booking volume, average revenue, and average revenue-per-hour
-- for each package length, to compare demand against profitability.

SELECT
  Hours_Booked,
  COUNT(*) AS Bookings,
  ROUND(AVG(Total_Booked_Value), 2) AS Avg_Revenue,
  ROUND(AVG(Total_Booked_Value) / Hours_Booked, 2) AS Avg_Revenue_Per_Hour
FROM `Photobooth_magik26.Booked_Clients`
WHERE Hours_Booked IS NOT NULL
GROUP BY Hours_Booked
ORDER BY Hours_Booked;

-- Note: For the 2023 comparison, the same query is run against
-- `Photobooth_magik26.Booked_Clients_2023`.
