-- DROP DATABASE
DROP DATABASE IF EXISTS ecommerce_db;

-- CREATE DATABASE
CREATE DATABASE ecommerce_db;

-- Drop foreign key constraints in producttag table
-- ALTER TABLE producttag
--   DROP FOREIGN KEY fk_product_id,
--   DROP FOREIGN KEY fk_tag_id;

-- -- Drop tables in reverse order
-- DROP TABLE IF EXISTS producttag;
-- DROP TABLE IF EXISTS product;
-- DROP TABLE IF EXISTS tag;
-- DROP TABLE IF EXISTS category;


-- Use database
USE ecommerce_db;

-- Create category table
CREATE TABLE IF NOT EXISTS category (
  id INTEGER AUTO_INCREMENT NOT NULL,
  category_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

-- Create product table
CREATE TABLE IF NOT EXISTS product (
  id INTEGER AUTO_INCREMENT NOT NULL,
  product_name VARCHAR(100) NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  stock INTEGER NOT NULL DEFAULT 10,
  category_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (category_id) REFERENCES category (id)
);

-- Create tag table
CREATE TABLE IF NOT EXISTS tag (
  id INTEGER AUTO_INCREMENT NOT NULL,
  tag_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

-- Create producttag table
CREATE TABLE IF NOT EXISTS producttag (
  id INTEGER AUTO_INCREMENT NOT NULL,
  product_id INTEGER,
  tag_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (product_id) REFERENCES product (id),
  FOREIGN KEY (tag_id) REFERENCES tag (id)
);

-- -- Add foreign key constraint on product_id in producttag table
-- ALTER TABLE producttag
--   ADD CONSTRAINT fk_product_id
--   FOREIGN KEY (product_id)
--   REFERENCES product (id)
--   ON DELETE CASCADE;

-- -- Add foreign key constraint on tag_id in producttag table
-- ALTER TABLE producttag
--   ADD CONSTRAINT fk_tag_id
--   FOREIGN KEY (tag_id)
--   REFERENCES tag (id)
--   ON DELETE CASCADE;
