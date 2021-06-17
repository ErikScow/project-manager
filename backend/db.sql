-- RUN THIS FIRST TO CREATE DATABASE

CREATE DATABASE project_manager;

-- THEN CONNECT TO THE DATABASE AND RUN THIS TO CREATE THE TABLES

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(256) NOT NULL,
    last_name VARCHAR(256),
    email VARCHAR(256) NOT NULL,
    password VARCHAR(256) NOT NULL,
    theme VARCHAR(256)
);

CREATE TABLE projects(
    id SERIAL PRIMARY KEY,
    title VARCHAR(256) NOT NULL,
    status VARCHAR(256) NOT NULL,
    description VARCHAR(10000) NOT NULL
);

CREATE TABLE users_projects(
    user_id INTEGER REFERENCES users(id) 
        ON DELETE CASCADE NOT NULL,
    project_id INTEGER REFERENCES projects(id) 
        ON DELETE CASCADE NOT NULL,
    is_admin BOOLEAN NOT NULL,
    is_creator BOOLEAN NOT NULL
);

CREATE TABLE tasks(
    id SERIAL PRIMARY KEY,
    title VARCHAR(256) NOT NULL,
    status VARCHAR(256) NOT NULL,
    description VARCHAR(10000) NOT NULL,
    project_id INTEGER REFERENCES projects(id) 
        ON DELETE CASCADE NOT NULL 
);

CREATE TABLE sub_tasks(
    id SERIAL PRIMARY KEY,
    description VARCHAR(5000) NOT NULL,
    completed BOOLEAN NOT NULL,
    task_id INTEGER REFERENCES tasks(id) 
        ON DELETE CASCADE NOT NULL 
);

CREATE TABLE users_tasks(
    user_id INTEGER REFERENCES users(id) 
        ON DELETE CASCADE NOT NULL,
    task_id INTEGER REFERENCES tasks(id)
        ON DELETE CASCADE NOT NULL,
    is_creator BOOLEAN NOT NULL,
    is_assigner BOOLEAN NOT NULL,
    is_assignee BOOLEAN NOT NULL
);

CREATE TABLE users_sub_tasks(
    user_id INTEGER REFERENCES users(id) 
        ON DELETE CASCADE NOT NULL,
    sub_task_id INTEGER REFERENCES sub_tasks(id)
        ON DELETE CASCADE NOT NULL,
    is_creator BOOLEAN NOT NULL
);