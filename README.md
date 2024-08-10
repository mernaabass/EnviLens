<<<<<<< HEAD
EnviLens Application
This project includes both a Flutter app and a Node.js server with a MySQL database. Follow the instructions below to set up and run the application.

Project Structure
envilens: Main project folder
envilens_server: Node.js server folder
server.js: Server entry point
.env: Environment variables for database configuration
lib: Flutter application source code
chat_page.dart: Chat page of the app
Configuration
Server Configuration
Create and Configure Database:

Open your MySQL client and execute the following commands to create the database and tables:


CREATE DATABASE envilensdb;
USE envilensdb;

CREATE TABLE Products (
  product_name VARCHAR(255),
  barcode VARCHAR(255) PRIMARY KEY,
  result TEXT
);

CREATE TABLE Materials (
  material_name VARCHAR(255) PRIMARY KEY,
  result TEXT
);

INSERT INTO Products (product_name, barcode, result) VALUES 
('Product 1', '123456789', 'Sustainable'),
('Product 2', '987654321', 'Non-sustainable');

INSERT INTO Materials (material_name, result) VALUES 
('Material 1', 'Harmful'),
('Material 2', 'Eco-friendly');
Set Up Environment Variables:

Create a .env file inside the envilens_server folder with the following content:


DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password_here
DB_NAME=envilensdb
Replace your_password_here with your MySQL password.

Flutter App Configuration
Obtain API Key:

You need an API key for your chatbot service. Replace the empty string in ChatPage class with your actual API key.

Setup API Key:

Open lib/chat_page.dart.

Locate the following line:


const apiKey = ''; // Replace with your actual API key or use an environment variable
Replace the empty string '' with your API key:


const apiKey = 'YOUR_API_KEY';
Running the Server
Navigate to the envilens_server folder:


cd envilens_server
Install dependencies:


npm install
Start the server:


node server.js
The server will run on http://localhost:3000.

Running the Flutter App
Ensure you have Flutter installed. If not, follow the Flutter installation guide.

Navigate to the root of the project:


cd path/to/envilens
Install dependencies:


flutter pub get
Run the app:


flutter run
=======
# EnviLens
>>>>>>> ced778c6614c80984e37627013b3a020f9163a8c
