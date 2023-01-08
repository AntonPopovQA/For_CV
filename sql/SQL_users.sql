CREATE TABLE level (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  level_name VARCHAR(30)
);

INSERT INTO level (level_name)
VALUES ('admin'),
       ('power_user'),
       ('user'),
       ('guest');

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_name VARCHAR(30),
  level_id INTEGER,
  skill INTEGER,
  FOREIGN KEY (id) REFERENCES level (id)
  );

INSERT INTO user (user_name, level_id, skill)
VALUES ('Anton', 1, 900000),
       ('Denis', 3, 4000),
       ('Petr', 2, 50000),
       ('Andrey', 4, 20),
       ('Olga', 1, 600000),
       ('Anna', 1, 1600000);


1. SELECT * FROM user
    WHERE (level_id = 1 AND skill > 799000) AND user_name LIKE "%a%";

2. DELETE FROM user
   WHERE skill < 100000;

3. SELECT * FROM user
   ORDER BY skill DESC;

4. INSERT INTO user (user_name, level_id, skill)
   VALUES (“Oleg”, 4, 10);

5. UPDATE user 
   SET skill = 2000000
   WHERE level_id = 2;

6. SELECT user_name
   FROM user
   WHERE level_id = (SELECT id
	             FROM level 
                     WHERE level_name = 'admin');

7. SELECT user_name
   FROM user INNER JOIN level ON user.level_id = level.id
   WHERE level_name = 'admin';		
