CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  email VARCHAR(100) NOT NULL UNIQUE,
  creation_date TIMESTAMP,
  is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE categories ( 
  category_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  creation_date TIMESTAMP
);

CREATE TABLE posts (
  post_id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  category_id INTEGER NOT NULL,
  title VARCHAR(50) NOT NULL,
  content TEXT NOT NULL,
  view_count INTEGER DEFAULT 0,
  creation_date TIMESTAMP,
  is_published BOOLEAN,
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (category_id) REFERENCES categories (category_id)
);

CREATE TABLE comments (
  comment_id SERIAL PRIMARY KEY,
  post_id INTEGER  NOT NULL,
  user_id INTEGER,
  comment TEXT NOT NULL,
  creation_date TIMESTAMP,
  is_confirmed BOOLEAN 
  );