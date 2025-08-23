-- SQL Questions: 


-- 1. Retrieve all successful bookings:

SELECT * FROM booking
WHERE Booking_Status = "Success";

-- 2.  Find the average ride distance for each vehicle type:

SELECT 
	Vehicle_Type,
    AVG(Ride_Distance) AS Avg_RideDistance
FROM booking
GROUP BY  Vehicle_Type;

-- 3. Get the total number of cancelled rides by customers:

SELECT * FROM booking
WHERE Canceled_Rides_by_Customer IS NOT NULL;

-- 4. List the top 5 customers who booked the highest number of rides:

SELECT 
	Customer_ID,
    COUNT(Booking_ID) AS Number_of_Rides
FROM booking
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:


SELECT COUNT(*) FROM booking
WHERE Canceled_Rides_by_Driver = "Personal & Car related issue";


-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:


SELECT 
    MAX(Driver_Ratings) AS Maximum_Rating,
    MIN(Driver_Ratings) AS Minimum_Rating 
FROM booking
WHERE Vehicle_Type = "Prime Sedan";


-- 7. Retrieve all rides where payment was made using UPI:

SELECT * FROM booking
WHERE Payment_Method = "UPI";


-- 8. Find the average customer rating per vehicle type:

SELECT 
	Vehicle_Type,
    AVG(Customer_Rating) AS Avg_Customer_Rating
FROM booking
GROUP BY 1;

-- 9. Calculate the total booking value of rides completed successfully:

SELECT 
	SUM(Booking_Value) AS Total_Revenue
FROM booking
WHERE Booking_Status = "Success";



-- 10. List all incomplete rides along with the reason:


SELECT 
		Booking_ID,
        Incomplete_Rides_Reason
FROM booking
WHERE Incomplete_Rides = "Yes";

