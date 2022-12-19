create table REGIONS (
  region_id serial PRIMARY KEY,
  region_name VARCHAR ( 50 ) UNIQUE NOT NULL
);

create table COUNTRIES (
  country_id serial PRIMARY KEY,
  country_name VARCHAR ( 50 ) UNIQUE NOT null,
  region_id int not null,
  FOREIGN KEY (region_id)
  REFERENCES REGIONS (region_id) 
);

create table LOCATIONS (
  location_id serial PRIMARY KEY,
  street_address VARCHAR ( 50 ) UNIQUE NOT null,
  city VARCHAR ( 50 ) UNIQUE NOT null,
  postal_code int not null,
  country_id int not null,
  FOREIGN KEY (country_id)
  REFERENCES COUNTRIES (country_id) 
);

create table DEPARMENTS (
  deparment_id serial PRIMARY KEY,
  department_name VARCHAR ( 50 ) UNIQUE NOT null,
  manager_id int not null,
  location_id int not null,
  FOREIGN KEY (location_id)
  REFERENCES LOCATIONS (location_id) 
);

create table JOBS (
  job_id serial PRIMARY KEY,
  job_title VARCHAR ( 50 ) UNIQUE NOT null,
  min_salary int not null,
  max_salary int not null
);

CREATE SEQUENCE order_job_id
START 1000
INCREMENT 1
MINVALUE 1000
MAXVALUE 9999
OWNED BY JOBS.job_id ;

create table JOB_HISTORY (
  employee_id serial,
  stard_date date ,
  primary key(employee_id,stard_date) , 
  end_date date not null,
  job_id int not null,
  deparment_id int not null,
  FOREIGN KEY (employee_id)
  REFERENCES EMPLOYEES (employee_id), 
  FOREIGN KEY (job_id)
  REFERENCES JOBS (job_id), 
  FOREIGN KEY (deparment_id)
  REFERENCES DEPARMENTS (deparment_id)
);

create table EMPLOYEES (
  employee_id serial PRIMARY KEY,
  first_name VARCHAR ( 50 ) UNIQUE NOT null,
  last_name VARCHAR ( 50 ) UNIQUE NOT null,
  email VARCHAR ( 50 ) UNIQUE NOT null,
  phone_number int not null,
  hire_date date not null,
  job_id int not null,
  salary int not null,
  commission_pct int not null,
  manager_id int not null,
  deparment_id int not null,
  FOREIGN KEY (deparment_id)
  REFERENCES DEPARMENTS (deparment_id),
  FOREIGN KEY (job_id)
  REFERENCES JOBS (job_id)
);

insert into regions (region_name)
values ('America'),('Africa'),('Europa');

select * from countries c  

insert into countries (country_name, region_id)
values ('EEUU', 1), ('Sudafrica', 2), ('Alemania', 3);

insert into locations (street_address, city,postal_code, 
 country_id)
values
('Av. Estados Unidos 2121', 'Californi',123, 1),
('Av. Estados Unidos 2122', 'Californ',123, 2),
('Av. Estados Unidos 2123', 'Califor',123, 3);














































