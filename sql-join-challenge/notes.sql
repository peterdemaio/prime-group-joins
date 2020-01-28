CREATE TABLE "person" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50)

);

INSERT INTO "person" ("name")
Values('Pete'), ('Ken'), ('Nic'), ('Amber'), ('Dane');


CREATE TABLE "hobbies" (
	"id" SERIAL PRIMARY KEY,
	"description" VARCHAR(100)
);

INSERT INTO "hobbies" ("description")
VALUES ('Gator Huntin'), ('Camping'), ('Travel'), ('Hitchhiking'), ('Zorbing');

CREATE TABLE "person_hobbies" (
	"id" SERIAL PRIMARY KEY,
	"person_id" INT REFERENCES "person",
	"hobbies_id" INT REFERENCES "hobbies",
	"skill" INT
);

INSERT INTO "person_hobbies" ("person_id", "hobbies_id", "skill")
VALUES(5, 2, 3),(5,3,2),(1, 5, 10), (4, 3, 2),(2, 2, 10), (3, 5, 19), (3, 2, 1),(4, 1, 2);

SELECT * from "person_hobbies";

SELECT "person".name, "hobbies".description, "person_hobbies".skill FROM "person"
JOIN "person_hobbies" ON "person".id = "person_hobbies".person_id
JOIN "hobbies" ON "hobbies".id = "person_hobbies".hobbies_id
ORDER BY "person".name;

SELECT MIN("skill") FROM "person_hobbies";
SELECT MAX("skill") FROM "person_hobbies";
SELECT AVG("skill") FROM "person_hobbies";
SELECT MIN("skill"), MAX("skill") FROM "person_hobbies";


-- how many users have each hobby
SELECT "hobbies".description, COUNT("person_hobbies".hobbies_id)
FROM "hobbies"
JOIN "person_hobbies" ON "hobbies".id = "person_hobbies".hobbies_id
GROUP BY "hobbies".description