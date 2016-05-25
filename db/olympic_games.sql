DROP TABLE eventreg;
DROP TABLE events;
DROP TABLE athletes;
DROP TABLE nations;

CREATE TABLE nations (
  id SERIAL4 primary key,
  name VARCHAR(255),
  flag VARCHAR(255)
);

CREATE TABLE athletes (
  id SERIAL4 primary key,
  name VARCHAR(255),
  nation_id INT4 REFERENCES nations(id) ON DELETE cascade
);

CREATE TABLE events (
  id SERIAL4 primary key,
  type VARCHAR(255),
  gold_winner INT4 REFERENCES athletes(id) ON DELETE cascade,
  silver_winner INT4 REFERENCES athletes(id) ON DELETE cascade,
  bronze_winner INT4 REFERENCES athletes(id) ON DELETE cascade
);

CREATE TABLE eventreg (
  id SERIAL4 primary key,
  athlete_id INT4 REFERENCES athletes(id) ON DELETE cascade,
  event_id INT4 REFERENCES events(id) ON DELETE cascade
);