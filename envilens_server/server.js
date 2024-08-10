const express = require('express');
const mysql = require('mysql2');
const dotenv = require('dotenv'); 
const app = express();
const port = 3000;


dotenv.config();

const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE,
});

db.connect((err) => {
  if (err) {
    console.error('Error connecting to database:', err);
    process.exit(1);
  }
  console.log('Connected to database');
});

app.get('/product/:barcode', (req, res) => {
  const barcode = req.params.barcode;
  const query = 'SELECT result FROM Products WHERE barcode = ?';
  db.query(query, [barcode], (err, result) => {
    if (err) {
      console.error('Error executing query:', err);
      res.status(500).json({ error: 'Internal Server Error' });
    } else {
      res.json(result.length > 0 ? result[0] : { result: 'Product not found' });
    }
  });
});

app.get('/material', (req, res) => {
  const names = req.query.names ? req.query.names.split(',') : [];
  
  if (names.length === 0) {
    return res.json({ result: 'No materials provided' });
  }
  
  const query = 'SELECT material_name, result FROM Materials WHERE material_name IN (?)';
  db.query(query, [names], (err, results) => {
    if (err) {
      console.error('Error executing query:', err);
      res.status(500).json({ error: 'Internal Server Error' });
    } else {
      if (results.length > 0) {
        const resultsMap = results.reduce((map, item) => {
          map[item.material_name] = item.result;
          return map;
        }, {});
        res.json(resultsMap);
      } else {
        res.json({ result: 'No materials found' });
      }
    }
  });
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
