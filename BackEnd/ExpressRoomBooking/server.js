const express = require('express');
const cors = require('cors')
const mysql = require('mysql2');
const app = express();

const roomStatuses = [
    { room: "English Room", status: "Available" },
    { room: "First Year Room", status: "Available" },
    { room: "Second Year Room", status: "Available" },
    { room: "Robotics Room", status: "Available" },
    { room: "Ethics Room", status: "Available" }
];

app.get('/room-statuses', (req, res) => {
    res.send(roomStatuses);
});


app.use(cors())
const connection = mysql.createPool({
    host: `localhost`,
    user: `root`,
    password: `GoTechMavs!`,
    database: `RoomBooking`
});

app.get('/', (request, response) => {
     response.send("")
})

app.post('/bookings', (req, res) => {
    const { roomPurpose, renterName, bookingDate, checkoutDate } = req.body;

    // Retrieve RoomID based on roomPurpose
    const roomId = getRoomIdFromPurpose(roomPurpose);

    // Insert the booking into the database
    connection.query('INSERT INTO bookings (RoomID, startTime, EndTime, Status, eventDetails) VALUES (?, ?, ?, ?, ?)',
        [roomId, bookingDate, checkoutDate, 1, ''], // Assuming Status 1 represents "Booked" status and eventDetails is empty for now
        (error, results, fields) => {
            if (error) {
                console.error('Error inserting booking:', error);
                res.status(500).send('Error inserting booking');
            } else {
                console.log('Booking inserted successfully:', results);

                // After successfully inserting the booking, update the room status to "Booked"
                const roomIndex = roomStatuses.findIndex(room => room.room === roomPurpose);
                if (roomIndex !== -1) {
                    roomStatuses[roomIndex].status = "Booked";
                } else {
                    console.error('Room not found:', roomPurpose);
                }

                // Send the updated room statuses back to the client
                res.send(roomStatuses);
            }
    });
})

.get('/rooms', (request, response) => {
     connection.query(`SELECT * FROM Rooms`, (err, results)=>{
        response.send(results)
     })
});

app.listen(3030, () => {
    console.log(`sever is Listening on 3030`);
})

// Function to retrieve RoomID based on roomPurpose
function getRoomIdFromPurpose(roomPurpose) {
    // You need to implement this function to retrieve RoomID based on roomPurpose
    // This might involve querying the database to find the RoomID associated with the provided roomPurpose
    // For demonstration purposes, let's assume a simple mapping for now
    const roomIds = {
        "English Room": 1,
        "First Year Room": 2,
        "Second Year Room": 3,
        "Robotics Room": 4,
        "Ethics Room": 5
    };
    return roomIds[roomPurpose];
}
