-- 1. Retrieve all booking_status from uber_bookings
SELECT booking_status 
FROM uber_bookings

-- 2. Find the average ride distance for each vehicle type:
select vehicle_type, 
avg(ride_distance) avg_distance from uber_bookings
group by vehicle_type 

-- 3.Get the total number of cancelled rides by customers:
SELECT SUM(cancelled_rides_by_customer) AS total_cancelled_by_customers
FROM uber_booking

-- 4. List the top 5 customers who booked the highest number of rides:
select customer_id,count(booking_id) as total_rides
from uber_bookings
group by customer_id
order by total_rides desc limit 5

-- Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT reason_driver_cancel, COUNT(*) AS total_cancelled
FROM uber_bookings
WHERE reason_driver_cancel = 'Personal & Car related issues'
GROUP BY reason_driver_cancel;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT vehicle_type,MAX(Driver_Rating) as max_rating, MIN(Driver_Rating) as min_rating FROM
uber_bookings WHERE Vehicle_Type = 'Go Sedan'
group by vehicle_type;

-- 7. Retrieve all rides where payment was made using UPI:
select  from uber_bookings
where payment_method = 'UPI'

-- 8. Find the average customer rating per vehicle type:
select vehicle_type,AVG(customer_rating)  as average_cust_rating
from uber_bookings
group by Vehicle_type; 

-- 9. Calculate the total booking value of rides completed successfully:
SELECT SUM(booking_value) AS total_successful_value
FROM uber_bookings
WHERE TRIM(LOWER(booking_status)) = 'completed';

10-- Count rides per pickup location
SELECT pickup_location, COUNT(*) AS total_rides
FROM uber_bookings
GROUP BY pickup_location
ORDER BY total_rides DESC
LIMIT 10;

-- 11.Count rides per drop location
SELECT drop_location, COUNT(*) AS total_rides
FROM uber_bookings
GROUP BY drop_location
ORDER BY total_rides DESC
LIMIT 10;

--12.Average booking value per pickup location
SELECT pickup_location, AVG(booking_value) AS avg_booking_value
FROM uber_bookings
GROUP BY pickup_location
ORDER BY avg_booking_value DESC
LIMIT 10;

 



