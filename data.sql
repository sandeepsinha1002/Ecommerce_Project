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
CREATE TABLE VARIATION(
    variation_id int PRIMARY KEY,
    category_id int,
    FOREIGN KEY(category_id) REFERENCES CATEGORY(category_id),
    name varchar(50) NOT NULL,
);
CREATE TABLE VARIATION_OPTION(
    variation_option_id int PRIMARY KEY,
    variation_id int,
    FOREIGN KEY(variation_id) REFERENCES VARIATION(variation_id),
    value int NOT NULL,
 );

CREATE TABLE PRODUCT_CONFIGURATION(
    product_item_id int,
    FOREIGN KEY(product_item_id) REFERENCES PRODUCT_ITEM(product_item_id),
    variation_option_id int,
    FOREIGN KEY(variation_option_id) REFERENCES VARIATION_OPTION(variation_option_id),+
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
    account_no int NOT NULL,
    expiry_date date NOT NULL,
    
)

CREATE TABLE SHIPPING_METHOD(
    shipping_method_id int PRIMARY KEY,
    method_type varchar(20),
)

CREATE TABLE ORDER_STATUS(
    order_status_id int,
    status varchar(50) NOT NULL,
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
    shipping_method_id int,
    FOREIGN KEY(shipping_method_id) REFERENCES SHIPPING_METHOD(shipping_method_id),
    order_total int NOT NULL,
    order_status_id int,
    FOREIGN KEY(order_status_id) REFERENCES ORDER_STATUS(order_status_id),
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
                    

