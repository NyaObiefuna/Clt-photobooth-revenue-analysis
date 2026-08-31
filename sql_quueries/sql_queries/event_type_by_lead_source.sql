-- Event Type x Lead Source Profitability (2023)
-- Crosses event type with lead source to find which specific combinations
-- are most profitable per booking, rather than looking at either dimension
-- in isolation. Filters to combinations with at least 2 bookings to avoid
-- one-off outliers skewing the average.

SELECT
  Project_Type,
  Project_Source,
  COUNT(*) AS Bookings,
  ROUND(SUM(Total_Booked_Value), 2) AS Total_Revenue,
  ROUND(AVG(Total_Booked_Value), 2) AS Avg_Revenue_Per_Booking
FROM `Photobooth_magik26.Booked_Clients_2023`
WHERE Project_Type IS NOT NULL AND Project_Source IS NOT NULL
GROUP BY Project_Type, Project_Source
HAVING COUNT(*) >= 2
ORDER BY Avg_Revenue_Per_Booking DESC;
