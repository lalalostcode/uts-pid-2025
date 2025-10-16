-- Queri untuk menggunakan database yang sudah dibuat

use database_truck_sensor;

-- Queri untuk menampilkan tabel yang ada di database

show tables;

-- Queri untuk menampilkan struktur tabel trucks

describe trucks;

-- Queri untuk menampilkan struktur tabel sensors

describe sensors;

-- semua data dari tabel trucks
SELECT * FROM trucks;

-- semua data dari tabel sensors

SELECT * FROM sensors;

-- Query Join

SELECT * 
FROM trucks AS t
JOIN sensors AS s
ON t.truck_id = s.truck_id;