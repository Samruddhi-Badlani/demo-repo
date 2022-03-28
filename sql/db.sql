CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	name VARCHAR(70) NOT NULL,
	email VARCHAR(70) NOT NULL,
	password VARCHAR(100) NOT NULL
	
);

CREATE TABLE states (
	state_id SERIAL PRIMARY KEY,
	state_name VARCHAR(3000) NOT NULL
);

INSERT INTO states(state_name) VALUES ('Madhya Pradesh');
CREATE TABLE district (
	district_id SERIAL PRIMARY KEY,
	district_name VARCHAR(3000) NOT NULL,
	state_id INT ,
	FOREIGN KEY (state_id)
	REFERENCES states(state_id)
);
INSERT INTO district(state_id,district_name) VALUES (1,'Indore');
CREATE TYPE gender AS enum ('Male', 'Female');
CREATE TABLE child(
	child_id SERIAL PRIMARY KEY,
	user_id INT,
	FOREIGN KEY(user_id) 
	REFERENCES users(id),
	state_id INT,
	FOREIGN KEY(state_id)
	REFERENCES states(state_id),
	district_id INT,
	FOREIGN KEY(district_id)
	REFERENCES district(district_id),
	child_name VARCHAR(1000) NOT NULL,
	sex gender NOT NULL,
	father_name VARCHAR(1000) ,
	mother_name VARCHAR(1000),
	dob DATE 
)