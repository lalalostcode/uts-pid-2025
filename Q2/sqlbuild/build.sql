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
('TRK007', 'ESEMKA', 2023),
('TRK015', 'Isuzu Elf', 2021),
('TRK010', 'EMBEGE', 2019);

INSERT INTO sensors (sensor_id, truck_id, sensor_type) VALUES
('SNS001', 'TRK007', 'Temperature'),
('SNS002', 'TRK007', 'Pressure'),
('SNS003', 'TRK015', 'Humidity'),
('SNS004', 'TRK010', 'Temperature');