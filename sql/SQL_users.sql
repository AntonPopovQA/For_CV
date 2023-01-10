
Описание: 
1) Таблица "user", которая содержит информацию о пользователях. Она содержит поля:
"id" - уникальный индентификатор пользователя;
"user_name" - имя пользователя;
"level_id" - идентификатор уровня пользователя;
"skill" - количество очков набранных пользователем.

2) Таблица "level", которая содержит информацию об уровнях пользователя. Она содержит поля:
"id" - уникальный индентификатор уровня пользователя;
"level_name" - наименование уровня пользователя.

Необходимо составить следующие запросы к базе данных:
1. Отобрать из таблицы user всех пользователей, у которых level_id=1, skill > 799000 и в имени встречается буква "а"								
2. Удалить всех пользователей, у которых skill меньше 100000								
3. Вывести все данные из таблицы user в порядке убывания по полю skill 								
4. Добавить в таблицу user нового пользователя по имени Oleg, с уровнем 4 и skill =10								
5. Обновить данные в таблице user -  для пользователей с level_id меньше 2 проставить skill 2000000								
6. Выбрать user_name всех пользователей уровня admin используя подзапрос								
7. Выбрать user_name всех пользователей уровня admin используя join								


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
