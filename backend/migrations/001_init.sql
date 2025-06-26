CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE,
  name VARCHAR(255) NOT NULL,
  role VARCHAR(20) NOT NULL,
  join_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE rehearsals (
  id SERIAL PRIMARY KEY,
  scheduled_at TIMESTAMP NOT NULL,
  location VARCHAR(255),
  created_by INTEGER REFERENCES users(id),
  notes TEXT
);
CREATE TABLE rehearsal_members (
  rehearsal_id INTEGER REFERENCES rehearsals(id),
  user_id INTEGER REFERENCES users(id),
  rsvp_status VARCHAR(10),
  attended BOOLEAN,
  PRIMARY KEY (rehearsal_id, user_id)
);
CREATE TABLE setlists (
  id SERIAL PRIMARY KEY,
  rehearsal_id INTEGER REFERENCES rehearsals(id),
  title VARCHAR(255),
  uploaded_by INTEGER REFERENCES users(id),
  file_url TEXT
);
CREATE TABLE notifications (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  rehearsal_id INTEGER REFERENCES rehearsals(id),
  type VARCHAR(50),
  sent_at TIMESTAMP,
  status VARCHAR(20)
);
