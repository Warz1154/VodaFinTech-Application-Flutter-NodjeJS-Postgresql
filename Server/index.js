// const { Pool } = require('pg');
// const express = require('express');
// // const cors = require('cors');

// const pool = new Pool({
//   user: 'postgres',
//   host: 'localhost',
//   database: 'vodaDB',
//   password: '0000',
//   port: 5432,
// });



// // const db = require('./db');

// const app = express();

// // app.use(cors());

// app.get('/get_data', async (req, res) => {
//   try {
//     const data = await db.query('SELECT * FROM your_table');
//     res.json(data.rows);
//   } catch (err) {
//     console.error(err.message);
//   }
// });

// app.listen(5000, () => {
//   console.log('Server has started on port 5000');
// });

// // module.exports = {
// //   query: (text, params, callback) => {
// //     return pool.query(text, params, callback);
// //   },
// // };


// // Define a query.
// // const queryText = 'SELECT * FROM your_table';

// // Run the query.
// // pool.query(queryText, (err, res) => {
// //   if (err) {
// //     console.log(err.stack);
// //   } else {
// //     console.log(res.rows);
// //   }
// // });


const express = require('express');
// const cors = require('cors');
// const db = require('./db');
const { Pool } = require('pg');
// const cors = require('cors');

const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'vodaDB',
  password: '0000',
  port: 5432,
});



const app = express();
app.use(express.json());  // This line is changed

app.post('/add_user', async (req, res) => {
    try {
        const {username, password } = req.body;
        const newUser = await pool.query(
        'INSERT INTO users ( username, password) VALUES ($1, $2) RETURNING *',
        [username, password]  // This line is changed
        );
        res.json(newUser.rows[0]);
    } catch (err) {
        console.error(err.message);
    }
});

//Authenticate user
app.post('/authenticate', async (req, res) => {
    try {
      const {username, password } = req.query; // Extract username from query parameters
      const data = await pool.query('SELECT authenticate_user($1, $2)', [username, password]);
      res.json(data.rows);
    } catch (err) {
      console.error(err.message);
    }
    console.log("request is received");
});

//Get user details

app.post('/get_user_info', async (req, res) => {

  try{
    const {user_id} = req.query;
    const data = await pool.query('SELECT get_username($1)', [user_id]);
    res.json(data.rows);
  }
  catch(err)
  {
    console.error(err.message);
  }
  console.log("get_username_query_recived");
});

//Get Balance

app.post('/get_user_balance', async (req, res) => {

  try{
    const {user_id} = req.query;
    const data = await pool.query('SELECT get_balance($1)', [user_id]);
    res.json(data.rows);
  }
  catch(err)
  {
    console.error(err.message);
  }
  console.log("get_balance_query_recived");
});

//Logout
app.post('/logout', async (req, res) => {

  try{
    const {token_id} = req.query;
    const data = await pool.query('SELECT logout($1)', [token_id]);
    res.json(data.rows);
  }
  catch(err)
  {
    console.error(err.message);
  }
  console.log("logout recived");
});

app.post('/get_cards', async (req, res) => {

  try{
    const data = await pool.query('SELECT get_cards()');
    res.json(data.rows);
  }
  catch(err)
  {
    console.error(err.message);
  }
  console.log("card_types_recived");
});


app.post('/approve_purchase', async (req, res) => {
  try {
    const {card_type, card_value, session_id, user_id } = req.query; 
    const data = await pool.query('SELECT approve_purchase($1, $2, $3, $4)', [card_type, card_value, session_id, user_id]);
    res.json(data.rows);
  } catch (err) {
    console.error(err.message);
  }
  console.log("Approve_purchase request recived");
});

app.post('/get_transactions', async (req, res) => {
  try {
    const {session_id, user_id } = req.query; 
    const data = await pool.query('SELECT get_transactions($1, $2)', [session_id, user_id]);
    res.json(data.rows);
  } catch (err) {
    console.error(err.message);
  }
  console.log("get_transactions request recived");
});


app.post('/get_stats', async (req, res) => {
  try {
    const {session_id, user_id } = req.query; 
    const data = await pool.query('SELECT get_stats($1, $2)', [session_id, user_id]);
    res.json(data.rows);
  } catch (err) {
    console.error(err.message);
  }
  console.log("get_stats request recived");
});


app.listen(5001, () => {
  console.log('Server has started on port 5001');
});