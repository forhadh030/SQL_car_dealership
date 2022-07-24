-- creating tables for customer connected to invoice and cars table
create table customer(
	customer_id SERIAL primary key,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	address VARCHAR(50),
	billing_info VARCHAR(50)
);

-- creating tables for cars connected to salesperson, mechanic, customer & service ticket tables
create table cars(
	car_id SERIAL primary key,
	make VARCHAR(50),
	model VARCHAR(50),
	car_year DATE,
	salesperson_id INTEGER,
	customer_id INTEGER,
	foreign key(salesperson_id) references salesperson(salesperson_id),
	foreign key(customer_id) references customer(customer_id)
);

-- creating invoice table connecting to mechanic, service ticket, cars table
create table invoice(
	invoice_id SERIAL primary key,
	customer_id INTEGER,
	salesperson_id INTEGER,
	mechanic_id INTEGER,
	foreign key(salesperson_id) references salesperson(salesperson_id),
	foreign key(customer_id) references customer(customer_id),
	foreign key(mechanic_id) references mechanic(mechanic_id)
);

-- creating salesperson table connecting to the cars and invoice table
create table salesperson(
	salesperson_id SERIAL primary key,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	sales_total NUMERIC(10, 2)
);


-- creating service_ticket table connecting to mechanic and cars table
create table service_ticket(
	service_ticket_id SERIAL primary key,
	mechanic_id INTEGER,
	car_id INTEGER,
	foreign key(mechanic_id) references mechanic(mechanic_id),
	foreign key(car_id) references cars(car_id)
);

-- creating mechanic table connecting to invoice, service ticket & cars table
create table mechanic(
	mechanic_id SERIAL primary key,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	parts_cost NUMERIC(8,2),
	service_cost NUMERIC(8,2),
	car_id INTEGER,
	foreign key(car_id) references cars(car_id)
);