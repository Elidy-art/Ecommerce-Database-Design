CREATE DATABASE ecommerce_DB;

USE ecommerce_DB;

CREATE TABLE brand(
brand_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
description VARCHAR(100)
);

CREATE TABLE product_category(
category_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
description VARCHAR(100)
);

CREATE TABLE color(
color_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
hex_value VARCHAR(100)
);

CREATE TABLE size_category(
size_cat_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100)
);

CREATE TABLE attribute_category(
attr_cat_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100)
);

CREATE TABLE attribute_type(
attr_type_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100)
);

CREATE TABLE product(
product_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
base_price VARCHAR(100),
description VARCHAR(100),
brand_id INT,
category_id INT,

FOREIGN KEY(brand_id) REFERENCES brand(brand_id),
FOREIGN KEY(category_id) REFERENCES product_category(category_id)
);

CREATE TABLE product_image(
image_id INT AUTO_INCREMENT PRIMARY KEY,
image_url VARCHAR(100),
product_id INT,

FOREIGN KEY(product_id) REFERENCES product(product_id)
);

CREATE TABLE size_option(
size_id INT AUTO_INCREMENT PRIMARY KEY,
label VARCHAR(100),
size_cat_id INT,

FOREIGN KEY(size_cat_id) REFERENCES size_category(size_cat_id)
);

CREATE TABLE product_variation(
variation_id INT AUTO_INCREMENT PRIMARY KEY,
product_id INT,
color_id INT,

FOREIGN KEY(product_id) REFERENCES product(product_id),
FOREIGN KEY(color_id) REFERENCES color(color_id)
);

CREATE TABLE product_item(
item_id INT AUTO_INCREMENT PRIMARY KEY,
SKU VARCHAR(100),
price DECIMAL(6,2),
stock_quantity VARCHAR(100),
variation_id INT,
size_id INT,

FOREIGN KEY(variation_id) REFERENCES product_variation(variation_id),
FOREIGN KEY(size_id) REFERENCES size_option(size_id)
);

CREATE TABLE product_attribute(
attribute_id INT AUTO_INCREMENT PRIMARY KEY,
attribute_name VARCHAR(100),
attribute_value VARCHAR(100),
product_id INT,
attr_cat_id INT,
attr_type_id INT,

FOREIGN KEY(product_id) REFERENCES product(product_id),
FOREIGN KEY(attr_cat_id) REFERENCES attribute_category(attr_cat_id),
FOREIGN KEY(attr_type_id) REFERENCES attribute_type(attr_type_id)
);