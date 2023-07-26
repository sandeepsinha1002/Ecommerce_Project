CREATE TABLE USER(
    user_id int PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(50) PRIMARY KEY,
    password PASSWORD(12) NOT NULL,
    streetAddress VARCHAR(50) NOT NULL,
    city VARCHAR(20) NOT NULL,
    state VARCHAR(20) NOT NULL,
    pincode int(6) NOT NULL,
    phoneNumber int(10) UNIQUE,
);

CREATE TABLE CATEGORY(
  category_id INT PRIMARY KEY,
  category_name VARCHAR(50) NOT NULL,
  parent_id INT,
  level INT,
  FOREIGN KEY (parent_id) REFERENCES category (category_id)

);
CREATE TABLE REVIEW(
    review_id INT PRIMARY KEY,
    text varchar(100) ,
    rating int CHECK(rating>=0 AND rating<=5) ;
);

CREATE TABLE PRODUCT(
    product_id int(5) PRIMARY KEY,
    title varchar(50) NOT NULL,
    description varchar(200) NOT NULL,
    price int(10) NOT NULL,
    quantity int(6) NOT NULL,
    brand varchar(20) NOT NULL,
    color varchar(10) NOT NULL,
    size varchar(20) NOT NULL;
    imageUrl varchar(50) NOT NULL,
    review_id int
    FOREIGN KEY(review_id) REFERENCES REVIEW(review_id)
    category_id INT,
    FOREIGN KEY(category_id) REFERENCES CATEGORY(category_id),
);

CREATE TABLE PAYMENTINFO(
    email varchar(50),
    FOREIGN KEY(email) REFERENCES USER(email),
    address_id INT,
    FOREIGN KEY(address_id) REFERENCES ADDRESS(address_id),
);

CREATE TABLE SALES_REPORT (
    sales_id INT PRIMARY KEY,
    report_date DATE ,
    total_sales DECIMAL(10, 2) NOT NULL,
);

CREATE TABLE MONTHLY_REVENUE (
    revenue_id INT PRIMARY KEY,
    revenue_month DATE ,
    total_revenue DECIMAL(10, 2) NOT NULL,
);


CREATE TABLE CART{
    cart_id int PRIMARY KEY
    email varchar(50),
    FOREIGN KEY(email) REFERENCES USER(email),
    total_price int,
    total_items int CHECK(total_items<=10),
}

CREATE TABLE TOP_SELLING_PRODUCTS (
    top_product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    total_sold INT
);

CREATE TABLE CUSTOMER_REPORT (
    user_id int,
    FOREIGN KEY(user_id) REFERENCES USER(user_id),
    report_id INT PRIMARY KEY,
    registration_month DATE ,
    new_customers INT 
);

CREATE TABLE ORDER_REPORT (
    order_id INT PRIMARY KEY,
    order_month DATE,
    total_orders INT,
    average_order_value DECIMAL(10, 2) 
);

