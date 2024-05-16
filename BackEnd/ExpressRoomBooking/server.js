const express = require('express');
const mysql = require('mysql2');

const app = express();

const connection = mysql.createPool({
    host: `localhost`,
    user: `root`,
    password: `GoTechMavs!`,
    database: `RoomBooking`
});

app.get('/', (request, response) => {
     response.send("bitch")
})

.get('/rooms', (request, response) => {
    // connection.query(`SELECT * FROM Rooms`, (error, results, fields) => {
    //     response.send(results)
    //     if (error){
    //         return res.status(500).send('Database query failed:' + error.message);
    //     }
    //     res.send(results);
    //  })
     connection.query(`SELECT * FROM Rooms`, (err, results)=>{
        response.send(results)
     })
});

app.listen(3030, () => {
    console.log(`sever is Listening on 3030`);
})