DROP DATABASE IF EXISTS `primal_code`;
CREATE DATABASE `primal_code` CHARACTER SET utf8 COLLATE utf8_general_ci;

USE `primal_code`;

CREATE TABLE `authors` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL UNIQUE,
  `password` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `users` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL UNIQUE,
  `password` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `categories` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE `posts` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `title` VARCHAR(255) NOT NULL,
  `content` MEDIUMTEXT NOT NULL,
  `slug` VARCHAR(255) UNIQUE NOT NULL,
  `number_of_comments` INT NOT NULL DEFAULT 0,
  `status` ENUM('visible', 'hidden') DEFAULT 'visible' NOT NULL,
  `author_id` INT NOT NULL,
  `image_url` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`author_id`) REFERENCES `authors`(`id`)
);

CREATE TABLE `post_categories` (
  `post_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`post_id`, `category_id`),
  FOREIGN KEY (`post_id`) REFERENCES `posts`(`id`),
  FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`)
);

CREATE TABLE `comments` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `content` TEXT NOT NULL,
  `post_id` INT NOT NULL,
  FOREIGN KEY (`post_id`) REFERENCES `posts`(`id`)
);

-- INSERT CATEGORIES

INSERT INTO `categories` (`name`) VALUE ("Web Development"), 
                                        ("Programming"), 
                                        ("Technology"), 
                                        ("Software Development"), 
                                        ("Mobile"), 
                                        ("Database"),
                                        ("Career in Technology"),
                                        ("Information Security"),
                                        ("Data Analysis"),
                                        ("Tutorials and Guides"),
                                        ("News and Trends"),
                                        ("Open Source");

-- INSERT AUTHOR      
-- Password: S]r>7n&b!*6F~s5op7?F

INSERT INTO `authors` (`name`, `email`, `password`) VALUE ("Adriano", "adriano@email.com", "$2y$10$1oLBXW.Qs.H043t1QBblA.7HNmP3TYtuejKQqlZslRRb4zL2Un0/K");
