CREATE TABLE users (
 id NUMBER(19, 0) PRIMARY KEY,
 name VARCHAR2(255) NOT NULL,
 email VARCHAR2(255) UNIQUE,
 email_verified_at TIMESTAMP,
 password VARCHAR2(255),
 image_path VARCHAR2(255),
 create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE password_resets (
 id NUMBER(19, 0) PRIMARY KEY,
 email VARCHAR2(255) NOT NULL,
 token VARCHAR2(255) NOT NULL,
 create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX password_resets_email_idx ON password_resets(email);

CREATE TABLE admin_users (
 id NUMBER(19, 0) PRIMARY KEY,
 name VARCHAR2(255) NOT NULL,
 email VARCHAR2(255) UNIQUE,
 password VARCHAR2(255) NOT NULL,
 is_owner NUMBER(1, 0) DEFAULT 0,
 create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE product_categories (
 id NUMBER(19, 0) PRIMARY KEY,
 name VARCHAR2(255) NOT NULL,
 order_no NUMBER(11, 0),
 create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
 id NUMBER(19, 0) PRIMARY KEY,
 product_category_id NUMBER(19, 0) REFERENCES product_categories(id),
 name VARCHAR2(255) NOT NULL,
 price NUMBER(11, 0) NOT NULL,
 description CLOB,
 image_path VARCHAR2(255),
 create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE product_reviews (
 id NUMBER(19, 0) PRIMARY KEY,
 product_id NUMBER(19, 0) REFERENCES products(id),
 user_id NUMBER(19, 0) REFERENCES users(id),
 title VARCHAR2(255) NOT NULL,
 body VARCHAR2(255) NOT NULL,
 rank NUMBER(3, 0),
 create_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE wish_products (
 id NUMBER(19, 0) PRIMARY KEY,
 product_id NUMBER(19, 0) REFERENCES products(id),
 user_id NUMBER(19, 0) REFERENCES users(id)
);