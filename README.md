# How to find nearby cities within radius from a zipcode

One day I was just wondering how to find nearby cities without X miles from my house. So, I just found an easy way to do this. I just wanted to share so it might be solve somebody else's problem in the future. 

# What you need?
1. MySQL

# Getting started
- You need a database of all the zipcodes with latitude, longtitude within the US or anywhere in the world. The best place to get this is at ![Geonames](http://download.geonames.org/export/zip/). Download the country that you want. The file is tab delimited which you can just import that to your MySQL database. I have also included that in the github repo, which I have converted to CSV file 

- Import your data to your database by running. Make sure you create a database already by running
``` 
create database postal_code_us;
```

- Run 
```
mysql -u<your_username> -p --local-infile=1 postal_code_us < import.sql
```

- Then connect to your mysql with
```
mysql -u<your_username> -p
```

- Select your database
```
use postal_code_us;
```

- This is the SQL you're going to run
```
SELECT admin2, ( 3959 * acos( cos( radians(40.7152000) ) * cos( radians( latitude ) ) * cos( radians( longtitude ) - radians(-73.9877000) ) + sin( radians(40.7152000) ) * sin( radians( latitude ) ) ) ) AS distance FROM postal_code HAVING distance > 100 ORDER BY distance LIMIT 0 , 20;

```

This SQL will find any cities within 100 miles around 40.7152000, -73.9877000.

# Reference
- ![Google PHP Sql search](https://developers.google.com/maps/articles/phpsqlsearch_v3)
