## Domain 
Transportation

## Schema
User
- email
- first_name
- last_name

Trip
- origin
- destination
- trip_date
- fare
- active

Booking
- created_on
- user_id
- trip_id

## Relationship
User has many trips through booking
Trip has many user through booking

User belong to a Trip
Trip has many user

## User Stories

As a user, I want to make a booking (Create)
As a user, I want to delete one of my booking (Delete)
As a User, I should be able to edit my personal information (Update)
As a User, I want to see all my trips (Read)
As a User, I want to see all trips(Read)
As a User, I want to see all my bookings (Read)


