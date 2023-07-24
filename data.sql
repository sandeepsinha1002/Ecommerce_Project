CREATE TABLE USER(
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(50) PRIMARY KEY,
    passwword PASSWORD(12),
);

CREATE TABLE ADDRESS(
    address_id INT PRIMARY KEY,
    streetAddress VARCHAR(50),
    city VARCHAR(20),
    state VARCHAR(20),
    pincode int(6),
    phoneNumber int(10),
);

CREATE TABLE SIZE(
    size_id int PRIMARY KEY,
    name varchar(50),

);
CREATE TABLE CATEGORY(
  category_id INT PRIMARY KEY,
  category_name VARCHAR(50),
  parent_id INT,
  level INT,
  FOREIGN KEY (parent_id) REFERENCES category (category_id)

);
CREATE TABLE RATING (
    rating_id INT PRIMARY KEY,
    rating int,
);
CREATE TABLE REVIEW(
    review_id INT PRIMARY KEY,
    text varchar(100),
    rating_id int
    FOREIGN KEY(rating_id) REFERENCES RATING(rating_id),
);

CREATE TABLE PRODUCT(
    ID int(5) PRIMARY KEY,
    title varchar(50),
    description varchar(200),
    price int(10),
    discountedPrice int(10),
    discountedPercentage int(3),
    quantity int(6),
    brand varchar(20),
    color varchar(10),
    size_id int,
    FOREIGN KEY(size_id) REFERENCES SIZE(size_id)
    imageUrl varchar(50),
    review_id int
    FOREIGN KEY(review_id) REFERENCES REVIEW(review_id)
    category_id INT,
    FOREIGN KEY(category_id) REFERENCES CATEGORY(category_id),
);

CREATE TABLE PAYMENTINFO(
    email varchar(12),
    FOREIGN KEY(email) REFERENCES USER(email),
    address_id INT,
    FOREIGN KEY(address_id) REFERENCES ADDRESS(address_id),
);
