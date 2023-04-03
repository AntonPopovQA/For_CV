Описание:

Есть две таблицы: "aircrafts" и "seats"

1) Таблица "aircrafts", которая содержит следующие поля:
"id" - уникальный индентификатор самолета;
"aircraft_code" - код самолета;
"model" - модель самолета;
"range" - максимальная дальность полета, км.

2) Таблица "seats", которая содержит следующие поля:
"id" - уникальный индентификатор места в самолете;
"aircraft_code" - код самолета;
"aircraft_id" - уникальный идентификатор самолета;
"seat_no" - номер места;
"fare_conditions" - класс обслуживания.

Суть задания: вывести количество мест в каждом конкретном самолете из моделей компании “Боинг”.
Синтаксис написания запроса - PostgreSQL.

CREATE TABLE aircrafts (
id INTEGER PRIMARY KEY AUTOINCREMENT,
aircraft_code VARCHAR(30),
model VARCHAR(30),
range VARCHAR(30)
);

INSERT INTO aircrafts (aircraft_code, model, range)
VALUES ('773', 'Боинг 777-300', 11100),
       ('763', 'Боинг 767-300', 7900),
       ('SU9', 'Сухой Суперджет-100', 3000),
       ('320', 'Аэробус A320-200', 5700),
       ('321', 'Аэробус A321-200', 5600),
       ('733', 'Боинг 737-300', 4200),
       ('CN1', 'Сессна 208 Караван ', 1200);

CREATE TABLE seats (
id INTEGER PRIMARY KEY AUTOINCREMENT,
aircraft_code VARCHAR(30),
aircraft_id integer,
seat_no VARCHAR(4),
fare_conditions Text,
FOREIGN KEY (aircraft_id) REFERENCES aircrafts (id)
);

INSERT INTO seats (aircraft_code, aircraft_id, seat_no, fare_conditions)
VALUES ('773', 1, '2A', 'Business'),
       ('773', 1, '2C', 'Business'),
       ('763', 2, '2D', 'Business'),
       ('763', 2, '2F', 'Business'),
       ('763', 2, '3A', 'Business'),
       ('763', 2, '3C', 'Business'),
       ('SU9', 3, '3D', 'Business'),
       ('SU9', 3, '3A', 'Business'),
       ('SU9', 3, '3B', 'Business'),
       ('320', 4, '4A', 'Business'),
       ('321', 5, '4B', 'Business'),
       ('733', 6, '1A', 'Business'),
       ('733', 6, '1B', 'Business'),
       ('733', 6, '1C', 'Business'),
       ('733', 6, '1D', 'Business'),
       ('CN1', 7, '1A', 'Business');

Решение: 

SELECT model, COUNT(seat_no) AS Количество_мест
FROM aircrafts INNER JOIN seats
               ON seats.aircraft_id = aircrafts.id
WHERE model LIKE 'Боинг%'
GROUP BY model

