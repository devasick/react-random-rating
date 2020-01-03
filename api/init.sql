CREATE TABLE movies_ratings (
  id SERIAL primary key,
  title VARCHAR(255),
  poster_path VARCHAR(255),
  rating INTEGER default 1,
  overview VARCHAR(348500)
);
