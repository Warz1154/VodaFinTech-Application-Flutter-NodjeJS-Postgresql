const express = require('express');
const cors = require('cors');
// const db = require('./db');

const app = express();

app.use(cors());

app.get('/get_data',  (req, res) => {
  // try {
  //   const data = await db.query('SELECT * FROM your_table');
  //   res.json(data.rows);
  // } catch (err) {
  //   console.error(err.message);
  // }
  res.send("Hello!");
});

app.listen(5000, () => {
  console.log('Server has started on port 5000');
});