-- Repeat Clients (2023)
-- Identifies clients with more than one booking, ranked by total spend,
-- to quantify the value of repeat/loyal customers.

SELECT
  Client_Name,
  COUNT(*) AS Times_Booked,
  ROUND(SUM(Total_Booked_Value), 2) AS Total_Spent
FROM `Photobooth_magik26.Booked_Clients_2023`
WHERE Client_Name IS NOT NULL
GROUP BY Client_Name
HAVING COUNT(*) > 1
ORDER BY Total_Spent DESC;
