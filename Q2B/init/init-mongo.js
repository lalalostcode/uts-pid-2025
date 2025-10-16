// init script for truck & sensor context (mounted to /docker-entrypoint-initdb.d)
db = db.getSiblingDB('truck_sensor_db');

try {
  db.createUser({
    user: 'truck_app',
    pwd: 'truck_pass',
    roles: [{ role: 'readWrite', db: 'truck_sensor_db' }]
  });
} catch (e) {
  // ignore if user exists
}

db.createCollection('trucks');
db.createCollection('sensors');
db.createCollection('sensor_readings');

db.trucks.insertMany([
  { truck_id: "TRK001", model: "ESEMKA", year: 2023 },
  { truck_id: "TRK002", model: "Isuzu Elf", year: 2021 },
  { truck_id: "TRK003", model: "EMBEGE", year: 2019 }
]);

db.sensors.insertMany([
  { sensor_id: "SENS001", truck_id: "TRK001", type: "temperature_humidity" },
  { sensor_id: "SENS002", truck_id: "TRK001", type: "gps" },
  { sensor_id: "SENS003", truck_id: "TRK002", type: "temperature" },
  { sensor_id: "SENS004", truck_id: "TRK003", type: "vibration" }
]);

db.sensor_readings.insertMany([
  {
    sensor_id: "SENS001",
    truck_id: "TRK001",
    timestamp: ISODate("2025-10-10T08:00:00Z"),
    readings: { temperature: 25.5, humidity: 67.2 },
    battery_level: 92,
    location: { lat: -6.2088, lng: 106.8456, place: "Depot A" },
    status: "ok",
    meta: { source: "simulator", received_at: ISODate() }
  },
  {
    sensor_id: "SENS003",
    truck_id: "TRK002",
    timestamp: ISODate("2025-10-10T08:02:00Z"),
    readings: { temperature: 30.2 },
    battery_level: 75,
    location: { place: "Route B" },
    status: "warn",
    meta: { source: "simulator", received_at: ISODate() }
  }
]);

db.sensor_readings.createIndex({ truck_id: 1, timestamp: -1 });
db.sensor_readings.createIndex({ sensor_id: 1, timestamp: -1 });

print('init/mongo.js executed');