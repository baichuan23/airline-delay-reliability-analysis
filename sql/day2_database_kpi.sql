CREATE DATABASE IF NOT EXISTS airline_reliability
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE airline_reliability;

SELECT DATABASE();

USE airline_reliability;

CREATE TABLE IF NOT EXISTS flights_2025 (
    flight_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,

    flight_year SMALLINT UNSIGNED NOT NULL,
    flight_month TINYINT UNSIGNED NOT NULL,
    day_of_month TINYINT UNSIGNED NOT NULL,
    day_of_week TINYINT UNSIGNED NOT NULL,
    flight_date DATE NOT NULL,

    marketing_airline_network CHAR(2) NOT NULL,
    operating_airline CHAR(2),
    tail_number VARCHAR(10),
    flight_number_operating_airline INT UNSIGNED,

    origin CHAR(3) NOT NULL,
    origin_city_name VARCHAR(100),
    origin_state CHAR(2),

    dest CHAR(3) NOT NULL,
    dest_city_name VARCHAR(100),
    dest_state CHAR(2),

    distance DECIMAL(8,1),

    crs_dep_time SMALLINT UNSIGNED,
    dep_time SMALLINT UNSIGNED,
    dep_delay_minutes DECIMAL(8,2),
    dep_del15 TINYINT UNSIGNED,

    taxi_out DECIMAL(8,2),
    wheels_off SMALLINT UNSIGNED,
    wheels_on SMALLINT UNSIGNED,
    taxi_in DECIMAL(8,2),

    crs_arr_time SMALLINT UNSIGNED,
    arr_time SMALLINT UNSIGNED,
    arr_delay_minutes DECIMAL(8,2),
    arr_del15 TINYINT UNSIGNED,

    crs_elapsed_time DECIMAL(8,2),
    actual_elapsed_time DECIMAL(8,2),
    air_time DECIMAL(8,2),

    cancelled TINYINT UNSIGNED NOT NULL,
    cancellation_code CHAR(1),
    diverted TINYINT UNSIGNED NOT NULL,

    carrier_delay DECIMAL(8,2),
    weather_delay DECIMAL(8,2),
    nas_delay DECIMAL(8,2),
    security_delay DECIMAL(8,2),
    late_aircraft_delay DECIMAL(8,2),

    PRIMARY KEY (flight_id)
);


ALTER USER 'root'@'localhost'
IDENTIFIED BY 'Sbc33445566!';

USE airline_reliability;

DROP TABLE IF EXISTS flights_2025_test;

CREATE TABLE flights_2025_test LIKE flights_2025;

SELECT COUNT(*) AS test_rows
FROM flights_2025_test;

USE airline_reliability;

SELECT
    COUNT(*) AS total_rows,
    MIN(flight_date) AS min_date,
    MAX(flight_date) AS max_date,
    COUNT(DISTINCT marketing_airline_network) AS airline_count,
    SUM(arr_del15 IS NULL) AS arrdel15_nulls,
    SUM(cancelled = 1) AS cancelled_flights,
    SUM(diverted = 1) AS diverted_flights
FROM flights_2025_test;





SELECT
    flight_id,
    flight_date,
    marketing_airline_network,
    operating_airline,
    origin,
    dest,
    crs_dep_time,
    dep_delay_minutes,
    arr_delay_minutes,
    arr_del15,
    cancelled,
    diverted
FROM flights_2025_test
LIMIT 10;




USE airline_reliability;

DROP TABLE IF EXISTS flights_2025_test;

SELECT COUNT(*) AS production_rows
FROM flights_2025;

USE airline_reliability;

SELECT
    COUNT(*) AS total_rows,
    MIN(flight_date) AS min_date,
    MAX(flight_date) AS max_date,
    COUNT(DISTINCT marketing_airline_network) AS airline_count
FROM flights_2025;

USE airline_reliability;

TRUNCATE TABLE flights_2025;

SELECT COUNT(*) AS total_rows
FROM flights_2025;

USE airline_reliability;

SELECT
    COUNT(*) AS total_rows,
    MIN(flight_date) AS min_date,
    MAX(flight_date) AS max_date,
    COUNT(DISTINCT flight_month) AS month_count,
    COUNT(DISTINCT marketing_airline_network) AS airline_count
FROM flights_2025;

USE airline_reliability;

SELECT
    flight_month,
    COUNT(*) AS flight_rows
FROM flights_2025
GROUP BY flight_month
ORDER BY flight_month;

USE airline_reliability;

CREATE INDEX idx_flight_date
ON flights_2025 (flight_date);

CREATE INDEX idx_airline
ON flights_2025 (marketing_airline_network);

CREATE INDEX idx_origin
ON flights_2025 (origin);

CREATE INDEX idx_dest
ON flights_2025 (dest);

CREATE INDEX idx_route
ON flights_2025 (origin, dest);

CREATE INDEX idx_tail_date
ON flights_2025 (tail_number, flight_date);
SHOW INDEX FROM flights_2025;




USE airline_reliability;

SELECT
    COUNT(*) AS scheduled_flights,

    SUM(CASE
        WHEN arr_del15 IS NOT NULL THEN 1
        ELSE 0
    END) AS completed_arrival_records,

    SUM(CASE
        WHEN arr_del15 = 0 THEN 1
        ELSE 0
    END) AS on_time_arrivals,

    SUM(CASE
        WHEN arr_del15 = 1 THEN 1
        ELSE 0
    END) AS delayed_arrivals,

    ROUND(
        100.0 * SUM(CASE WHEN arr_del15 = 0 THEN 1 ELSE 0 END)
        / NULLIF(SUM(CASE WHEN arr_del15 IS NOT NULL THEN 1 ELSE 0 END), 0),
        2
    ) AS on_time_arrival_rate_pct,

    ROUND(
        100.0 * SUM(CASE WHEN arr_del15 = 1 THEN 1 ELSE 0 END)
        / NULLIF(SUM(CASE WHEN arr_del15 IS NOT NULL THEN 1 ELSE 0 END), 0),
        2
    ) AS delay_rate_pct,

    ROUND(
        AVG(arr_delay_minutes),
        2
    ) AS avg_arrival_delay_minutes,

    ROUND(
        AVG(CASE
            WHEN arr_del15 = 1 THEN arr_delay_minutes
        END),
        2
    ) AS avg_delay_minutes_delayed_flights,

    ROUND(
        100.0 * AVG(cancelled),
        2
    ) AS cancellation_rate_pct,

    ROUND(
        100.0 * AVG(diverted),
        2
    ) AS diversion_rate_pct,

    ROUND(
        SUM(arr_delay_minutes),
        0
    ) AS total_arrival_delay_minutes

FROM flights_2025;


USE airline_reliability;

SELECT
    marketing_airline_network AS airline,

    COUNT(*) AS scheduled_flights,

    SUM(CASE
        WHEN arr_del15 IS NOT NULL THEN 1
        ELSE 0
    END) AS completed_arrival_records,

    ROUND(
        100.0 * SUM(CASE WHEN arr_del15 = 0 THEN 1 ELSE 0 END)
        / NULLIF(SUM(CASE WHEN arr_del15 IS NOT NULL THEN 1 ELSE 0 END), 0),
        2
    ) AS on_time_arrival_rate_pct,

    ROUND(
        100.0 * SUM(CASE WHEN arr_del15 = 1 THEN 1 ELSE 0 END)
        
        
USE airline_reliability;

SELECT
    flight_month,

    COUNT(*) AS scheduled_flights,

    ROUND(
        100.0 * SUM(CASE WHEN arr_del15 = 0 THEN 1 ELSE 0 END)
        / NULLIF(SUM(CASE WHEN arr_del15 IS NOT NULL THEN 1 ELSE 0 END), 0),
        2
    ) AS on_time_arrival_rate_pct,

    ROUND(
        100.0 * SUM(CASE WHEN arr_del15 = 1 THEN 1 ELSE 0 END)
        / NULLIF(SUM(CASE WHEN arr_del15 IS NOT NULL THEN 1 ELSE 0 END), 0),
        2
    ) AS delay_rate_pct,

    ROUND(
        AVG(arr_delay_minutes),
        2
    ) AS avg_arrival_delay_minutes,

    ROUND(
        AVG(CASE
            WHEN arr_del15 = 1 THEN arr_delay_minutes
        END),
        2
    ) AS avg_delay_minutes_delayed_flights,

    ROUND(
        100.0 * AVG(cancelled),
        2
    ) AS cancellation_rate_pct,

    ROUND(
        SUM(arr_delay_minutes),
        0
    ) AS total_arrival_delay_minutes

FROM flights_2025

GROUP BY flight_month

ORDER BY flight_month;
        / NULLIF(SUM(CASE WHEN arr_del15 IS NOT NULL THEN 1 ELSE 0 END), 0),
        2
    ) AS delay_rate_pct,

    ROUND(
        AVG(arr_delay_minutes),
        2
    ) AS avg_arrival_delay_minutes,

    ROUND(
        AVG(CASE
            WHEN arr_del15 = 1 THEN arr_delay_minutes
        END),
        2
    ) AS avg_delay_minutes_delayed_flights,

    ROUND(
        100.0 * AVG(cancelled),
        2
    ) AS cancellation_rate_pct,

    ROUND(
        100.0 * AVG(diverted),
        2
    ) AS diversion_rate_pct,

    ROUND(
        SUM(arr_delay_minutes),
        0
    ) AS total_arrival_delay_minutes

FROM flights_2025

GROUP BY marketing_airline_network

ORDER BY delay_rate_pct DESC;

USE airline_reliability;

SELECT
    day_of_week,

    CASE day_of_week
        WHEN 1 THEN 'Monday'
        WHEN 2 THEN 'Tuesday'
        WHEN 3 THEN 'Wednesday'
        WHEN 4 THEN 'Thursday'
        WHEN 5 THEN 'Friday'
        WHEN 6 THEN 'Saturday'
        WHEN 7 THEN 'Sunday'
    END AS weekday,

    COUNT(*) AS scheduled_flights,

    ROUND(
        100.0 * SUM(CASE WHEN arr_del15 = 0 THEN 1 ELSE 0 END)
        / NULLIF(
            SUM(CASE WHEN arr_del15 IS NOT NULL THEN 1 ELSE 0 END),
            0
        ),
        2
    ) AS on_time_arrival_rate_pct,

    ROUND(
        100.0 * SUM(CASE WHEN arr_del15 = 1 THEN 1 ELSE 0 END)
        / NULLIF(
            SUM(CASE WHEN arr_del15 IS NOT NULL THEN 1 ELSE 0 END),
            0
        ),
        2
    ) AS delay_rate_pct,

    ROUND(
        AVG(arr_delay_minutes),
        2
    ) AS avg_arrival_delay_minutes,

    ROUND(
        AVG(
            CASE
                WHEN arr_del15 = 1
                THEN arr_delay_minutes
            END
        ),
        2
    ) AS avg_delay_minutes_delayed_flights,

    ROUND(
        100.0 * AVG(cancelled),
        2
    ) AS cancellation_rate_pct

FROM flights_2025

GROUP BY
    day_of_week,
    weekday

ORDER BY day_of_week;

USE airline_reliability;

SELECT
    CASE
        WHEN crs_dep_time >= 500
             AND crs_dep_time < 800
            THEN '05:00-07:59 Early Morning'

        WHEN crs_dep_time >= 800
             AND crs_dep_time < 1100
            THEN '08:00-10:59 Morning'

        WHEN crs_dep_time >= 1100
             AND crs_dep_time < 1400
            THEN '11:00-13:59 Midday'

        WHEN crs_dep_time >= 1400
             AND crs_dep_time < 1700
            THEN '14:00-16:59 Afternoon'

        WHEN crs_dep_time >= 1700
             AND crs_dep_time < 2000
            THEN '17:00-19:59 Evening'

        ELSE '20:00-04:59 Night'
    END AS departure_time_band,

    COUNT(*) AS scheduled_flights,

    ROUND(
        100.0 * SUM(CASE WHEN arr_del15 = 0 THEN 1 ELSE 0 END)
        / NULLIF(
            SUM(CASE WHEN arr_del15 IS NOT NULL THEN 1 ELSE 0 END),
            0
        ),
        2
    ) AS on_time_arrival_rate_pct,

    ROUND(
        100.0 * SUM(CASE WHEN arr_del15 = 1 THEN 1 ELSE 0 END)
        / NULLIF(
            SUM(CASE WHEN arr_del15 IS NOT NULL THEN 1 ELSE 0 END),
            0
        ),
        2
    ) AS delay_rate_pct,

    ROUND(
        AVG(arr_delay_minutes),
        2
    ) AS avg_arrival_delay_minutes,

    ROUND(
        AVG(
            CASE
                WHEN arr_del15 = 1
                THEN arr_delay_minutes
            END
        ),
        2
    ) AS avg_delay_minutes_delayed_flights,

    ROUND(
        100.0 * AVG(cancelled),
        2
    ) AS cancellation_rate_pct

FROM flights_2025

GROUP BY departure_time_band

ORDER BY MIN(
    CASE
        WHEN crs_dep_time >= 500 AND crs_dep_time < 800 THEN 1
        WHEN crs_dep_time >= 800 AND crs_dep_time < 1100 THEN 2
        WHEN crs_dep_time >= 1100 AND crs_dep_time < 1400 THEN 3
        WHEN crs_dep_time >= 1400 AND crs_dep_time < 1700 THEN 4
        WHEN crs_dep_time >= 1700 AND crs_dep_time < 2000 THEN 5
        ELSE 6
    END
);

USE airline_reliability;

CREATE OR REPLACE VIEW vw_flight_analysis AS

SELECT
    f.*,

    CASE
        WHEN arr_del15 IS NOT NULL THEN 1
        ELSE 0
    END AS completed_arrival_flag,

    CASE
        WHEN arr_del15 = 0 THEN 1
        ELSE 0
    END AS on_time_arrival_flag,

    CASE
        WHEN arr_del15 = 1 THEN 1
        ELSE 0
    END AS delayed_arrival_flag,

    CASE
        WHEN crs_dep_time >= 500
             AND crs_dep_time < 800
            THEN 'Early Morning'

        WHEN crs_dep_time >= 800
             AND crs_dep_time < 1100
            THEN 'Morning'

        WHEN crs_dep_time >= 1100
             AND crs_dep_time < 1400
            THEN 'Midday'

        WHEN crs_dep_time >= 1400
             AND crs_dep_time < 1700
            THEN 'Afternoon'

        WHEN crs_dep_time >= 1700
             AND crs_dep_time < 2000
            THEN 'Evening'

        ELSE 'Night'
    END AS departure_time_band

FROM flights_2025 f;
SELECT
    COUNT(*) AS view_rows
FROM vw_flight_analysis;


USE airline_reliability;

SELECT
    origin AS airport,

    COUNT(*) AS scheduled_departures,

    SUM(completed_arrival_flag) AS completed_arrival_records,

    ROUND(
        100.0 * SUM(on_time_arrival_flag)
        / NULLIF(SUM(completed_arrival_flag), 0),
        2
    ) AS on_time_arrival_rate_pct,

    ROUND(
        100.0 * SUM(delayed_arrival_flag)
        / NULLIF(SUM(completed_arrival_flag), 0),
        2
    ) AS delay_rate_pct,

    ROUND(
        AVG(arr_delay_minutes),
        2
    ) AS avg_arrival_delay_minutes,

    ROUND(
        AVG(
            CASE
                WHEN delayed_arrival_flag = 1
                THEN arr_delay_minutes
            END
        ),
        2
    ) AS avg_delay_minutes_delayed_flights,

    ROUND(
        100.0 * AVG(cancelled),
        2
    ) AS cancellation_rate_pct,

    ROUND(
        SUM(arr_delay_minutes),
        0
    ) AS total_arrival_delay_minutes

FROM vw_flight_analysis

WHERE origin IN (
    'ATL', 'DFW', 'DEN', 'ORD',
    'CLT', 'MIA', 'PHX',
    'DTW', 'MSP', 'SLC',
    'JFK', 'LGA',
    'IAH', 'EWR', 'SFO', 'LAX'
)

GROUP BY origin

ORDER BY delay_rate_pct DESC;


USE airline_reliability;

SELECT
    origin,
    dest,

    CONCAT(origin, ' → ', dest) AS route,

    COUNT(*) AS scheduled_flights,

    SUM(completed_arrival_flag) AS completed_arrival_records,

    ROUND(
        100.0 * SUM(delayed_arrival_flag)
        / NULLIF(SUM(completed_arrival_flag), 0),
        2
    ) AS delay_rate_pct,

    ROUND(
        AVG(arr_delay_minutes),
        2
    ) AS avg_arrival_delay_minutes,

    ROUND(
        AVG(
            CASE
                WHEN delayed_arrival_flag = 1
                THEN arr_delay_minutes
            END
        ),
        2
    ) AS avg_delay_minutes_delayed_flights,

    ROUND(
        100.0 * AVG(cancelled),
        2
    ) AS cancellation_rate_pct,

    ROUND(
        SUM(arr_delay_minutes),
        0
    ) AS total_arrival_delay_minutes

FROM vw_flight_analysis

GROUP BY
    origin,
    dest

HAVING COUNT(*) >= 1000

ORDER BY
    delay_rate_pct DESC,
    scheduled_flights DESC

LIMIT 25;