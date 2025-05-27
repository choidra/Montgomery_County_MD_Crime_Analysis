-- Creating MD_crime_cleaned2 table
CREATE TABLE MD_crime_cleaned2(
	'Incident ID' INT,
	'Offence Code' VARCHAR(10),
	'CR Number' INT,
	'Dispatch_Date_Time' DATETIME,
	'Start_Date_Time' DATETIME,
	'End_Date_Time' DATETIME,
	'NIBRS Code' VARCHAR(10),
	'Victims' INT,
	'Crime Name1' VARCHAR(50), 
	'Crime Name2' VARCHAR(100),
	'Crime Name3' VARCHAR(200),
	'Police District Name' VARCHAR(100),
	'Block Address' VARCHAR(100),
	'City' VARCHAR(100),
	'State' VARCHAR(3),
	'Zip Code' INT,
	'Agency' VARCHAR(10),
	'Place' VARCHAR(200),
	'Sector' VARCHAR(5),
	'Beat' VARCHAR(20),
	'PRA' VARCHAR(50),
	'Address Number' INT,
	'Street Prefix' VARCHAR (5),
	'Street Name' VARCHAR(100),
	'Street Suffix' VARCHAR(100),
	'Street Type' VARCHAR(50),
	'Latitude' DECIMAL(6,6),
	'Longitude' DECIMAL(6,6),
	'Police District Number' VARCHAR(20),
	'Location' VARCHAR(100),
	'Dispatch Year-Month' VARCHAR(20),
	'Start Year-Month' VARCHAR(20),
	'Start Year' INT,
	'Start Month' VARCHAR(5),
	'End Year-Month' VARCHAR(20) ) ;



-- Checking to see if data imported correctly
SELECT *
FROM MD_crime_cleaned2 mcc ;


-- Counting total number of incident IDs
SELECT COUNT("Incident ID") as 'Total_Incidents_Reported'
FROM MD_crime_cleaned2 mcc ;  -- 443,041 total incident IDs


-- Counting unique number of incident IDs
SELECT COUNT (DISTINCT "Incident ID") as 'Unique_Incident_IDs'
FROM MD_crime_cleaned2 mcc ;  -- 406,795 unique incident IDs


-- Counting number of crimes per month
SELECT "Start Month" , COUNT("Incident ID") AS 'Number_of_Crimes'
FROM MD_crime_cleaned2 mcc 
GROUP BY "Start Month"
ORDER BY COUNT("Incident ID") DESC ;


-- Counting number of crimes per year
SELECT "Start Year" , COUNT("Incident ID") AS 'Number_of_Crimes'
FROM MD_crime_cleaned2 mcc 
GROUP BY "Start Year"
ORDER BY COUNT("Incident ID") DESC ;


-- Counting number of crimes per Crime Name 1
SELECT "Crime Name1" , COUNT("Incident ID") AS 'Number_of_Crimes'
FROM MD_crime_cleaned2 mcc 
GROUP BY "Crime Name1"
ORDER BY COUNT("Incident ID") DESC ;


-- Counting number of crimes per Crime Name 2
SELECT "Crime Name2" , COUNT("Incident ID") AS 'Number_of_Crimes'
FROM MD_crime_cleaned2 mcc 
GROUP BY "Crime Name2"
ORDER BY COUNT("Incident ID") DESC ;


-- Counting number of crimes by number of victims
SELECT "Victims" as Number_of_Victims, COUNT("Incident ID") AS 'Number_of_Crimes'
FROM MD_crime_cleaned2 mcc 
GROUP BY "Victims"
ORDER BY COUNT("Incident ID") DESC ;


-- Looking at crime that had 22 victims
SELECT *
FROM MD_crime_cleaned2 mcc 
WHERE "Victims" is 22 ; 


-- Looking at crime that had 9 victims
SELECT *
FROM MD_crime_cleaned2 mcc 
WHERE "Victims" is 9 ; 


--Looking for lat and long of 0
SELECT *
FROM MD_crime_cleaned2 mcc 
WHERE "Latitude" is 0 AND "Longitude" is 0 ; -- 14,891 entries where the latitude and longitude are 0


-- Looking at entries where the Police District Number is unknown
SELECT *
FROM MD_crime_cleaned2 mcc 
WHERE "Police District Number" is "Unknown" ; -- 1,250 entries where Police District Number is unknown


-- Looking for distinct zip codes with the correct number of digits
SELECT COUNT(DISTINCT "Zip Code") AS 'Unique_Zip_Codes_Containing_5_digits'
FROM MD_crime_cleaned2 mcc
WHERE LENGTH(CAST("Zip Code" AS INT)) = 5
ORDER BY "Zip Code" ASC ;




-- LOOKING INTO DUPLICATE INCIDENT IDS

-- Counting number of occurrences for Incident IDs that are used more than once
SELECT "Incident ID" , COUNT("Incident ID") as 'Number of Occurrences'
FROM MD_crime_cleaned2 mcc  
GROUP BY "Incident ID" 
HAVING COUNT("Incident ID") > 1 
ORDER BY COUNT("Incident ID") DESC ; -- 66,370 entries with non-unique IDs


-- Looking at entries for Incident ID 201458365
SELECT *
FROM MD_crime_cleaned2 mcc 
WHERE "Incident ID" IS 201458365 ;


-- Looking at entries for Incident ID 201168542
SELECT *
FROM MD_crime_cleaned2 mcc 
WHERE "Incident ID" IS 201168542 ;


-- Looking at entries for Incident ID 201267256
SELECT *
FROM MD_crime_cleaned2 mcc 
WHERE "Incident ID" IS 201267256 ;


-- Looking at entries for Incident ID 201504854
SELECT *
FROM MD_crime_cleaned2 mcc 
WHERE "Incident ID" IS 201504854 ;


-- Looking at entries for Incident ID 201396722
SELECT *
FROM MD_crime_cleaned2 mcc 
WHERE "Incident ID" IS 201396722 ;


-- Looking at entries for Incident ID 201460897
SELECT *
FROM MD_crime_cleaned2 mcc 
WHERE "Incident ID" IS 201460897 ; 


-- Looking at entries for Incident ID 201462128
SELECT *
FROM MD_crime_cleaned2 mcc 
WHERE "Incident ID" IS 201462128 ;


-- Looking at entries for Incident ID 201129257
SELECT *
FROM MD_crime_cleaned2 mcc 
WHERE "Incident ID" IS 201129257 ;








