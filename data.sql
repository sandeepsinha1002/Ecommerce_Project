CREATE TABLE USER(
    user_id INT PRIMARY KEY,
    email varchar(50) UNIQUE,
    password varchar(12) NOT NULL,
    phoneNumber int(10) UNIQUE,
);

CREATE TABLE ADDRESS(
    address_id INT PRIMARY KEY,
    streetAddress varchar(50) NOT NULL,
    city varchar(20) NOT NULL,
    pincode int(7) NOT NULL,
);

CREATE TABLE USER_ADDRESS(
    user_id int,
    FOREIGN KEY(user_id) REFERENCES USER(user_id),
    address_id int,
    FOREIGN KEY(address_id) REFERENCES ADDRESS(address_id),
);

CREATE TABLE PRODUCT(
    product_id int,
    category_id int,
    FOREIGN KEY(category_id) REFERENCES CATEGORY(category_id),
    product_name varchar(50),
    description varchar(100),
    imageUrl varchar(50),
)

CREATE TABLE PRODUCT_ITEM(
    product_item_id int PRIMARY KEY,
    product_id int,
    FOREIGN KEY(product_id) REFERENCES PRODUCT(product_id),
    qty_in_stock int NOT NULL,
    img varchar(50) NOT NULL UNIQUE,
    price int NOT NULL,
)

CREATE TABLE CATEGORY(
    category_id INT,
    category_name varchar(50) NOT NULL,
)
CREATE TABLE ATTRIBUTES(
    attributes_id int PRIMARY KEY,
    category_id int,
    FOREIGN KEY(category_id) REFERENCES CATEGORY(category_id),
    colour varchar(50) NOT NULL,
    size varchar(20) NOT NULL,
);

CREATE TABLE PRODUCT_CONFIGURATION(
    product_item_id int,
    FOREIGN KEY(product_item_id) REFERENCES PRODUCT_ITEM(product_item_id),
    attributes_id int,
    FOREIGN KEY(attributes_id) REFERENCES ATTRIBUTES(attributes_id),
);

CREATE TABLE CART(
    cart_id int PRIMARY KEY,
    user_id int,
    FOREIGN KEY(user_id) REFERENCES USER(user_id),
);

CREATE TABLE CART_ITEM(
    cart_item_id int PRIMARY KEY,
    cart_id int,
    FOREIGN KEY(cart_id) REFERENCES CART(cart_id),
    user_id int,
    FOREIGN KEY(user_id) REFERENCES USER(user_id),
    qty int NOT NULL,    
);

CREATE TABLE PAYMENT_METHOD(
    payment_method_id int PRIMARY KEY,
    user_id int,
    FOREIGN KEY(user_id) REFERENCES USER(user_id),
    order_total int,
    FOREIGN KEY(order_total) REFERENCES ORDER_PRODUCT(order_total),
    account_no int NOT NULL,
    expiry_date date NOT NULL,
    
)
CREATE TABLE ORDER_PRODUCT(
    order_product_id int PRIMARY KEY,
    user_id int,
    FOREIGN KEY(user_id) REFERENCES USER(user_id),
    order_date date NOT NULL,
    payment_method_id int,
    FOREIGN KEY(payment_method_id) REFERENCES PAYMENT_METHOD(payment_method_id),
    address_id int,
    FOREIGN KEY(address_id) REFERENCES ADDRESS(address_id),
    order_total int NOT NULL PRIMARY KEY,
    shipping_method_type varchar(20),
    order_status varchar(50) NOT NULL,

);

CREATE TABLE REVIEW(
    review_id int,
    user_id int,
    FOREIGN KEY(user_id) REFERENCES USER(user_id),
    order_product_id int,
    FOREIGN KEY(order_product_id) REFERENCES ORDER_PRODUCT(order_product_id),
    rating int CHECK(rating>=0 AND rating<=5) NOT NULL,
    comment varchar(100),
)

 








