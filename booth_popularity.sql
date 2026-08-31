-- Booth Popularity Analysis (2026)
-- Combines core package bookings (Items_Booked) with add-on booth bookings (Add_Ons_Booked)
-- so that total demand per booth type is captured in one clean result.
-- Uses CASE/LIKE matching to group inconsistent label variants (e.g. "Selfie Booth rental",
-- "Digital Selfie Booth") under one standardized booth name.

WITH items AS (
  SELECT
    CASE
      WHEN LOWER(item) LIKE '%selfie booth%' THEN 'Selfie Booth'
      WHEN LOWER(item) LIKE '%luxe 360%' THEN 'Luxe 360'
      WHEN LOWER(item) LIKE '%manual 360%' THEN 'Manual 360'
      WHEN LOWER(item) LIKE '%deluxe 360%' THEN 'Deluxe 360'
      WHEN LOWER(item) LIKE '%360 photobooth%' THEN '360 Photobooth'
      ELSE TRIM(item)
    END AS Item_Name
  FROM `Photobooth_magik26.Booked_Clients`,
  UNNEST(SPLIT(Items_Booked, ',')) AS item
),

addon_booths AS (
  SELECT
    CASE
      WHEN LOWER(addon) LIKE '%selfie booth%' THEN 'Selfie Booth'
      WHEN LOWER(addon) LIKE '%luxe 360%' THEN 'Luxe 360'
      WHEN LOWER(addon) LIKE '%manual 360%' THEN 'Manual 360'
      WHEN LOWER(addon) LIKE '%deluxe 360%' THEN 'Deluxe 360'
      WHEN LOWER(addon) LIKE '%360 photobooth%' THEN '360 Photobooth'
      ELSE NULL
    END AS Item_Name
  FROM `Photobooth_magik26.Booked_Clients`,
  UNNEST(SPLIT(Add_Ons_Booked, ',')) AS addon
),

combined AS (
  SELECT Item_Name FROM items
  UNION ALL
  SELECT Item_Name FROM addon_booths WHERE Item_Name IS NOT NULL
)

SELECT
  Item_Name,
  COUNT(*) AS Times_Booked
FROM combined
GROUP BY Item_Name
ORDER BY Times_Booked DESC;
