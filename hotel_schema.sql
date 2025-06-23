-- Create Database
CREATE DATABASE IF NOT EXISTS hotel_db;
USE hotel_db;

-- Guests table
CREATE TABLE Guests (
    guest_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    address TEXT
);

-- Rooms table
CREATE TABLE Rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) UNIQUE NOT NULL,
    room_type VARCHAR(50) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'Available' -- Available, Occupied
);

-- Bookings table
CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    booking_date DATE DEFAULT CURRENT_DATE,
    status VARCHAR(20) DEFAULT 'Confirmed', -- Confirmed, Cancelled, Completed
    FOREIGN KEY (guest_id) REFERENCES Guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

-- Payments table
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    payment_date DATE DEFAULT CURRENT_DATE,
    amount DECIMAL(10,2) NOT NULL,
    method VARCHAR(50) NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

-- Services table
CREATE TABLE Services (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- Booking_Service table
CREATE TABLE Booking_Service (
    bs_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    service_id INT NOT NULL,
    quantity INT DEFAULT 1,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
);
