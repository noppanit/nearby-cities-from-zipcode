CREATE TABLE postal_code (
	country_code varchar(2), 
	postal_code varchar(20), 
	admin1 varchar(100), 
	admin2 varchar(100), 
	admin3 varchar(100), 
	admin4 varchar(100),
	country_id varchar(100), 
	latitude DECIMAL(10,7), 
	longtitude DECIMAL(10,7), 
	accuracy tinyint(2) 
);

LOAD DATA LOCAL INFILE 'US-Postcode.csv'
INTO TABLE postal_code
CHARACTER SET 'UTF8'
FIELDS TERMINATED BY ','
(country_code, postal_code, admin1, admin2, admin3, admin4, country_id, latitude, longtitude, accuracy);
