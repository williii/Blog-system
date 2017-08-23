-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2017 at 04:27 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--
CREATE DATABASE IF NOT EXISTS `blog` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `blog`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `user_id`, `name`, `created_at`) VALUES
(1, 1, 'Category 1', '2017-08-21 13:11:00'),
(2, 1, 'Category 2', '2017-08-21 13:11:00'),
(3, 1, 'Category 3', '2017-08-22 04:51:07'),
(4, 1, 'Sandvich', '2017-08-22 05:14:38');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `name`, `body`, `created_at`) VALUES
(1, 7, 'hoovy', 'gg', '2017-08-22 06:15:12'),
(2, 7, 'Scout', 'will steal later', '2017-08-22 06:33:43'),
(3, 12, 'scout', 'good ipsum', '2017-08-23 16:16:37'),
(4, 12, 'Annonymus', 'I am anonymous user\r\n', '2017-08-23 16:17:04'),
(5, 9, 'Annonymus', 'wow', '2017-08-23 16:18:29'),
(6, 9, 'Annonymus', 'nice one!', '2017-08-23 16:19:14'),
(7, 12, 'user1', 'good job at ipsum!', '2017-08-23 16:19:50');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `post_image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `category_id`, `user_id`, `title`, `slug`, `body`, `post_image`, `created_at`) VALUES
(1, 1, 1, 'Post 1', 'Post-1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec aliquam sem sodales ipsum tempor laoreet. Morbi et libero risus. Aenean lacinia erat ullamcorper libero consectetur congue. Duis fermentum finibus blandit. Aliquam ornare aliquam nunc, sit amet fringilla augue aliquet a. Fusce sed mattis purus, ac porta quam. Fusce vel dictum mauris, semper bibendum sapien. Donec rhoncus iaculis dui, in fermentum justo suscipit vitae. Sed consequat vel velit at commodo. Fusce augue libero, vestibulum a lacinia eu, convallis a ipsum. Sed a convallis tellus.', 'noimage.png', '2017-08-21 06:15:37'),
(2, 2, 0, 'Post 2', 'Post-2', 'Post 2 edit', 'noimage.png', '2017-08-21 06:15:37'),
(4, 1, 0, 'Post 4', 'Post-4', '<p>Vestibulum consectetur malesuada ultrices. <strong>Sed at laoreet tellus</strong>. Vestibulum ligula lacus, lacinia eget nisi eu, congue vehicula magna. <strong>Etiam elementum tellus vel mi lobortis hendrerit.</strong> Nunc fermentum turpis at ligula euismod maximus. Maecenas non hendrerit leo. Aliquam laoreet lacus neque, ut pharetra justo consectetur eu. Aenean vel tortor nulla. Suspendisse orci <em>magna, ornare vel leo a, euismod vulputate justo. In vel dui</em> mollis magna egestas malesuada. In ac diam non orci consectetur ultricies. Pellentesque purus augue, laoreet eget metus non, lacinia elementum dui.</p>', 'noimage.png', '2017-08-21 12:45:03'),
(5, 1, 0, 'Post 5', 'Post-5', '<p>This post will try category</p>', 'noimage.png', '2017-08-21 13:33:37'),
(7, 4, 1, 'The Sandvich', 'The-Sandvich', '<p>Meet the Sandvich</p>', 'GBKD5.jpg', '2017-08-21 13:58:13'),
(9, 1, 1, 'Test post', 'Test-post', '<p>123</p>', 'noimage.png', '2017-08-23 06:20:33'),
(12, 3, 1, 'For comment tests', 'For-comment-tests', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eu massa scelerisque, dapibus libero eget, vehicula augue. Cras blandit, ipsum non fringilla accumsan, velit est mattis lacus, ut dapibus risus lacus sed lorem. Quisque cursus egestas felis, sit amet vestibulum lorem dictum et. Mauris dictum magna sit amet nisi lacinia molestie. In rhoncus augue felis, quis fringilla purus auctor in. Quisque congue nisi eu ipsum aliquet, id sodales ipsum luctus. In in ultrices urna, ut elementum mauris. Sed eget ultrices felis, et maximus mauris. Maecenas dapibus sem at interdum cursus. Vivamus consequat, nunc nec scelerisque placerat, ex lectus vulputate sem, a hendrerit turpis magna vel magna. Phasellus sodales ut tortor sed vulputate. Quisque urna libero, auctor eu venenatis sed, mattis et augue. Sed vel ex malesuada, maximus lacus vitae, fringilla eros. Etiam facilisis nisi tellus, in ultrices sapien feugiat a. Etiam eleifend commodo pulvinar. Duis ornare neque vel arcu dignissim, lacinia dapibus est bibendum.</p>', 'noimage.png', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `role`, `email`, `username`, `password`, `status`, `register_date`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', 'admin', 'f6d98d445f6789f34f82623b2b702c87', 'active', '2017-08-22 12:35:12'),
(2, 'user1', 'user', 'user1@gmail.com', 'user1', '827ccb0eea8a706c4c34a16891f84e7b', 'active', '2017-08-23 10:53:18'),
(3, 'user2', 'user', 'user2@gmail.com', 'user2', 'e10adc3949ba59abbe56e057f20f883e', 'active', '2017-08-23 11:53:43'),
(4, 'scout', 'user', 'Scout@gmail.com', 'scout', '6b34d70bee747e7d6341ff9f03b318ae', 'deactivated', '2017-08-23 12:20:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
