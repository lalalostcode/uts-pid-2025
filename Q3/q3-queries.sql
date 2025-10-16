-- Query untuk Soal 3: detect temperature anomalies (>10°C) dan klasifikasi
WITH temperature_analysis AS (
  SELECT
    sensor_id,
    truck_id,
    temperature AS current_temp,
    LAG(temperature) OVER (PARTITION BY sensor_id ORDER BY recorded_at) AS prev_temp,
    recorded_at
  FROM sensor_readings_hist
),
anomaly_calc AS (
  SELECT
    sensor_id,
    truck_id,
    current_temp,
    prev_temp,
    recorded_at,
    CASE WHEN prev_temp IS NULL THEN NULL ELSE ABS(current_temp - prev_temp) END AS temp_diff
  FROM temperature_analysis
)

SELECT
  sensor_id,
  truck_id,
  current_temp AS current_temp,
  prev_temp AS prev_temp,
  temp_diff AS temperature_diff,
  CASE
    WHEN temp_diff IS NULL THEN 'NO_PREV'
    WHEN temp_diff > 20 THEN 'HIGH'
    WHEN temp_diff > 10 THEN 'MEDIUM'
    ELSE 'LOW'
  END AS anomaly_level,
  recorded_at
FROM anomaly_calc
WHERE temp_diff > 10
ORDER BY temp_diff DESC;


-- Verification queries untuk mahasiswa
SELECT COUNT(*) as total_records FROM sensor_readings_hist;
SELECT truck_id, COUNT(*) as reading_count FROM sensor_readings_hist GROUP BY truck_id;
SELECT DATE(recorded_at) as date, COUNT(*) as daily_count FROM sensor_readings_hist GROUP BY DATE(recorded_at) ORDER BY date;

-- Sample query untuk testing anomaly detection
SELECT 
    truck_id,
    sensor_id,
    temperature,
    recorded_at,
    LAG(temperature) OVER (PARTITION BY sensor_id ORDER BY recorded_at) as prev_temp,
    ABS(temperature - LAG(temperature) OVER (PARTITION BY sensor_id ORDER BY recorded_at)) as temp_diff
FROM sensor_readings_hist 
WHERE truck_id IN ('TRK001', 'TRK003')
ORDER BY sensor_id, recorded_at;



