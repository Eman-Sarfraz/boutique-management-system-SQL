
CREATE DATABASE boutique;
USE boutique;
CREATE TABLE boutique (
    owner_id INT,
    boutique_name VARCHAR(19),
    boutique_id INT PRIMARY KEY,
    boutique_place VARCHAR(15)
);

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(15),
    customer_phone VARCHAR(15),
    customer_email VARCHAR(30),
    customer_address VARCHAR(50)
);

CREATE TABLE designer (
    designer_id INT PRIMARY KEY,
    designer_name VARCHAR(15),
    designer_address VARCHAR(50),
    designer_ph VARCHAR(15),
    designer_email VARCHAR(30),
    boutique_id INT,
    FOREIGN KEY (boutique_id) REFERENCES boutique(boutique_id)
);

CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY,
    inventory_items INT,
    inventory_number INT,
    inventory_type VARCHAR(20),
    boutique_id INT,
    FOREIGN KEY (boutique_id) REFERENCES boutique(boutique_id)
);

CREATE TABLE staff (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(15),
    staff_email VARCHAR(30),
    staff_address VARCHAR(50),
    staff_ph VARCHAR(15),
    boutique_id INT,
    FOREIGN KEY (boutique_id) REFERENCES boutique(boutique_id)
);

CREATE TABLE sales (
    sales_id INT PRIMARY KEY,
    sales_customer INT,
    sales_amount INT,
    sales_type VARCHAR(9),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE stock (
    stock_id INT PRIMARY KEY,
    amount INT,
    quantity INT,
    stock_type VARCHAR(15),
    inventory_id INT,
    FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id)
);

CREATE TABLE product (
    product_id INT PRIMARY KEY,
    product_items INT,
    product_number INT,
    product_name VARCHAR(15),
    designer_id INT,
    FOREIGN KEY (designer_id) REFERENCES designer(designer_id),
    boutique_id INT,
    FOREIGN KEY (boutique_id) REFERENCES boutique(boutique_id),
    sales_id INT,
    FOREIGN KEY (sales_id) REFERENCES sales(sales_id)
);

INSERT INTO boutique (owner_id, boutique_name, boutique_id, boutique_place)
VALUES
    (1, 'Khaadi', 1, 'Lahore'),
    (2, 'Almirah', 2, 'Karachi'),
    (3, 'Limelight', 3, 'Islamabad'),
    (4, 'Maria B', 4, 'Peshawar'),
    (5, 'Edenrobe', 5, 'Quetta');

INSERT INTO customer (customer_id, customer_name, customer_phone, customer_email, customer_address)
VALUES
    (1, 'Ali Khan', '0300123456', 'alikhan@exp.com', '123 Street, Lahore'),
    (2, 'Sarah Ahmed', '0310321456', 'sarah@exp.com', '456 Avenue, Karachi'),
    (3, 'Umar Butt', '0330123456', 'umar@exp.com', '789 Boulevard, Islamabad'),
    (4, 'Ayesha Khan', '0340123456', 'ayesha@exp.com', '101 Road, Peshawar'),
    (5, 'Bilal Ahmed', '0350123456', 'bilal@exp.com', '202 Lane, Quetta');

INSERT INTO designer (designer_id, designer_name, designer_address, designer_ph, designer_email, boutique_id)
VALUES
    (1, 'HSY', 'Designer Street, Lahore', '0300123456', 'hsy12@exp.com', 1),
    (2, 'Zainab Chottani', 'Designer Avenue, Karachi', '0310321456', 'ZainabC@exp.com', 2),
    (3, 'Sania Maskatiya', 'Designer Boulevard, Islamabad', '0330123456', 'SaniaM@exp.com', 3),
    (4, 'Maheen khan', 'Designer Road, Peshawar', '0340123456', 'MaheenK@exp.com', 4),
    (5, 'Omer Mansoor', 'Designer Lane, Quetta', '0350123456', 'OmerM@exp.com', 5);

INSERT INTO inventory (inventory_id, inventory_items, inventory_number, inventory_type, boutique_id)
VALUES
    (1, 10, 101, 'Clothing', 1),
    (2, 20, 102, 'Accessories', 2),
    (3, 30, 103, 'Footwear', 3),
    (4, 40, 104, 'Jewelry', 4),
    (5, 50, 105, 'Handbags', 5);

INSERT INTO staff (staff_id, staff_name, staff_email, staff_address, staff_ph, boutique_id)
VALUES
    (1, 'Ali Mir', 'alimir8@exp.com', '123 Staff St, Lahore', '0300123456', 1),
    (2, 'Sadia Ashraf', 'sadia01@exp.com', '456 Staff Ave, Karachi', '0310321456', 2),
    (3, 'Amna Zain', 'amnaz1@exp.com', '789 Staff Blvd, Islamabad', '0330123456', 3),
    (4, 'Ayyan Rao', 'ayyan5@exp.com', '101 Staff Rd, Peshawar', '0340123456', 4),
    (5, 'Aliya Khan', 'aliyak9@exp.com', '202 Staff Ln, Quetta', '0350123456', 5);

INSERT INTO sales (sales_id, sales_customer, sales_amount, sales_type, customer_id)
VALUES
    (1, 1, 1000, 'Cash', 1),
    (2, 2, 2000, 'Credit', 2),
    (3, 3, 3000, 'Cash', 3),
    (4, 4, 4000, 'Credit', 4),
    (5, 5, 5000, 'Cash', 5);

INSERT INTO stock (stock_id, amount, quantity, stock_type, inventory_id)
VALUES
    (1, 100, 10, 'Clothing', 1),
    (2, 200, 20, 'Accessories', 2),
    (3, 300, 30, 'Footwear', 3),
    (4, 400, 40, 'Jewelry', 4),
    (5, 500, 50, 'Handbags', 5);

INSERT INTO product (product_id, product_items, product_number, product_name, designer_id, boutique_id, sales_id)
VALUES
    (1, 10, 101, 'Dress', 1, 1, 1),
    (2, 20, 102, 'Handbag', 2, 2, 2),
    (3, 30, 103, 'Earrings', 3, 3, 3),
    (4, 40, 104, 'Heels', 4, 4, 4),
    (5, 50, 105, 'Kurta', 5, 5, 5);
