WITH cleaned AS (
    SELECT geolocation_zip_code_prefix AS zip_code,
    geolocation_lat,
    geolocation_lng,
    strip_accents(LOWER(TRIM(geolocation_city))) AS city,
    geolocation_state AS state_code
    FROM {{ ref('bronze_geolocation') }}
)
SELECT zip_code, 
MEDIAN(geolocation_lat) AS  median_geolocation_lat,
MEDIAN(geolocation_lng) AS  median_geolocation_lng,
MODE(city),
MODE(state_code)
FROM cleaned
GROUP BY zip_code