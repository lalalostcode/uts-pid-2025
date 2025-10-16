// Cari semua readings terbaru 
db.sensor_readings.find({ truck_id: "TRK001" })
  .sort({ timestamp: -1 })
  .pretty();


// Cari truck_id = TK001 dengan limit 10

db.sensor_readings.find(
  { truck_id: "TRK001" },
  { _id: 0, sensor_id: 1, timestamp: 1, readings: 1 }
).sort({ timestamp: -1 }).limit(10);

// Ambil readings terbaru

db.sensor_readings.aggregate([
  { $match: { truck_id: "TRK001" } },
  { $sort: { sensor_id: 1, timestamp: -1 } },
  { $group: { _id: "$sensor_id", latest: { $first: "$$ROOT" } } },
  { $replaceRoot: { newRoot: "$latest" } }
]);