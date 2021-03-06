DROP TABLE IF EXISTS weathers, yelps, movies, trails, locations;

CREATE TABLE IF NOT EXISTS locations ( 
  id SERIAL PRIMARY KEY, 
  search_query VARCHAR(255), 
  formatted_query VARCHAR(255), 
  latitude NUMERIC(10, 7), 
  longitude NUMERIC(10, 7)
  );

CREATE TABLE IF NOT EXISTS weathers ( 
  id SERIAL PRIMARY KEY, 
  forecast VARCHAR(255), 
  time VARCHAR(255),
  location_id INTEGER NOT NULL REFERENCES locations(id) 
  );

CREATE TABLE IF NOT EXISTS events (
  id SERIAL PRIMARY KEY, 
  link VARCHAR(255), 
  name VARCHAR(255), 
  summary VARCHAR(1000),
  event_date CHAR(15), 
  location_id INTEGER NOT NULL REFERENCES locations(id) 
);

CREATE TABLE IF NOT EXISTS movies (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  overview VARCHAR(255),
  average_votes NUMERIC(2,1),
  image_url VARCHAR(255),
  popularity NUMERIC(6,3),
  released_on CHAR(15),
  location_id INTEGER NOT NULL REFERENCES locations(id)
);

CREATE TABLE IF NOT EXISTS yelps(
  id SERIAL PRIMARY KEY,
  restaurant_name VARCHAR(255),
  image_url VARCHAR(255),
  price NUMERIC(5,2),
  rating NUMERIC(3,1),
  url VARCHAR(255),
  location_id INTEGER NOT NULL REFERENCES locations(id)
);
