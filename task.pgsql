

CREATE TABLE accounts (
    id serial PRIMARY KEY,
    created_at timestamp DEFAULT current_timestamp,
    updated_at timestamp DEFAULT current_timestamp
);

CREATE TABLE students (
    id serial PRIMARY KEY, 
    created_at timestamp DEFAULT current_timestamp, 
    updated_at timestamp DEFAULT current_timestamp,  
    first_name varchar(255) NOT NULL, 
    last_name varchar(255) NOT NULL,  
    birth_date date, 
    gender varchar(10) CHECK (gender IN ('Male', 'Female')), 
    is_active boolean DEFAULT TRUE,  
    account_id INT UNIQUE,
    CONSTRAINT fk_account_id FOREIGN KEY (account_id) REFERENCES accounts(id) ON DELETE CASCADE
);

CREATE TABLE teachers (
    id serial PRIMARY KEY,
    created_at timestamp DEFAULT current_timestamp,
    updated_at timestamp DEFAULT current_timestamp,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    birth_date date,
    gender varchar(10) CHECK (gender IN ('Male', 'Female')), 
    is_active boolean DEFAULT TRUE,
    account_id INT UNIQUE,
    CONSTRAINT fk_account_id FOREIGN KEY (account_id) REFERENCES accounts(id) ON DELETE CASCADE
);

CREATE TABLE courses (
    id serial PRIMARY KEY,
    created_at timestamp DEFAULT current_timestamp,
    updated_at timestamp DEFAULT current_timestamp,
    course_name varchar(255) NOT NULL,
    course_description text,
    start_date date,
    end_date date,
    teacher_id INT REFERENCES teachers(id) ON DELETE SET NULL
);

CREATE TABLE courses_students (
    course_id INT REFERENCES courses(id) ON DELETE CASCADE,
    student_id INT REFERENCES students(id) ON DELETE CASCADE,
    PRIMARY KEY (course_id, student_id)
);

CREATE TABLE settings (
    id serial PRIMARY KEY,
    enable_notifications boolean CHECK (enable_notifications IN (true, false)), 
    theme varchar(32)
);