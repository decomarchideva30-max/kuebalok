-- db_init.sql for Kue Balok
CREATE DATABASE IF NOT EXISTS kuebalok DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE kuebalok;

CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  description TEXT,
  price DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  image VARCHAR(255) NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  customer_name VARCHAR(150) NOT NULL,
  phone VARCHAR(30) NOT NULL,
  gps_lat DOUBLE NULL,
  gps_lng DOUBLE NULL,
  total DECIMAL(12,2) NOT NULL,
  status ENUM('pending','paid','failed') DEFAULT 'pending',
  qris_shown TINYINT(1) DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  qty INT NOT NULL DEFAULT 1,
  price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products(id)
);

-- sample products
INSERT INTO products (name, description, price, image) VALUES
('Kue Balok Original', 'Kue balok rasa original, lembut dan manis',15000.00,'public/assets/img/kue1.jpg'),
('Kue Balok Coklat', 'Kue balok coklat lumer',17000.00,'public/assets/img/kue2.jpg');
