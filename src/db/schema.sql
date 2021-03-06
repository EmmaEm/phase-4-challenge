CREATE TABLE albums (
  id SERIAL,
  title VARCHAR(255) NOT NULL,
  artist VARCHAR(255) NOT NULL
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  join_date DATE DEFAULT CURRENT_DATE,
  photo VARCHAR(255) DEFAULT '/pictures/profile-default.jpg'
);

CREATE TABLE reviews (
  id SERIAL,
  content TEXT NOT NULL,
  user_id INT NOT NULL,
  album_id INT NOT NULL,
  date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
