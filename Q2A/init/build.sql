-- Tabel Truk dan Sensor
CREATE TABLE trucks (
    truck_id VARCHAR(10) PRIMARY KEY,
    model VARCHAR(50),
    year INT
);

CREATE TABLE sensors (
    sensor_id VARCHAR(10) PRIMARY KEY,
    truck_id VARCHAR(10),
    sensor_type VARCHAR(20),
    FOREIGN KEY (truck_id) REFERENCES trucks(truck_id)
);

-- Insert Data

INSERT INTO trucks (truck_id, model, year) VALUES
('TRK011', 'ESEMKA', 2023),
('TRK012', 'Isuzu Elf', 2021),
('TRK013', 'EMBEGE', 2019);

INSERT INTO sensors (sensor_id, truck_id, sensor_type) VALUES
('SNS011', 'TRK011', 'Temperature'),
('SNS012', 'TRK012', 'Humidity'),
('SNS013', 'TRK013', 'Humidity'),
('SNS014', 'TRK011', 'Temperature'),
('SNS015', 'TRK012', 'Temperature');