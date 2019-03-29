-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 29, 2019 at 04:43 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_things`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_favourites`
--

CREATE TABLE `tbl_favourites` (
  `id` int(11) NOT NULL,
  `title` varchar(120) NOT NULL,
  `description` text NOT NULL,
  `heading` varchar(250) NOT NULL,
  `image` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_favourites`
--

INSERT INTO `tbl_favourites` (`id`, `title`, `description`, `heading`, `image`) VALUES
(1, 'Dog', 'This is Mariah\'s german shepherd, Maxie. They have been together for 1.5 years and love to nap, eat, and adventure together. Take a look at all these pictures and you can fall in love with her too', 'Best Pal German Shepherd', 'dog-1.jpg'),
(2, 'Food', 'Mariah\'s favourite food is easily pasta. She has talked her boyfriend into making every Monday night spaghetti night and has no regrets about this change. A good bowl of spaghetti is a 10/10 way to end the day, don\'t try to argue about it.', 'Pasta, Specifically Spaghetti', 'pasta-1.jpg'),
(3, 'Coffee', 'Mariah\'s favourite beverage is coffee. Like most college students, she needs her awake juice to properly function through multiple assignments, work, and her other work. Some days all it takes is a drop of that sweet, golden, liquid to turn a horrible day into a just okay day. Always totally worth it. ', 'The Sweet Nectar of the Gods', 'coffee-1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_images`
--

CREATE TABLE `tbl_images` (
  `id` int(11) NOT NULL,
  `image` varchar(250) NOT NULL,
  `thing_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_images`
--

INSERT INTO `tbl_images` (`id`, `image`, `thing_id`) VALUES
(1, 'dog-1.jpg', 1),
(2, 'dog-2.jpg', 1),
(3, 'dog-3.jpg', 1),
(4, 'dog-4.jpg', 1),
(5, 'dog-5.jpg', 1),
(6, 'dog-6.jpg', 1),
(7, 'pasta-1.jpg', 2),
(8, 'pasta-2.jpg', 2),
(9, 'pasta-3.jpg', 2),
(10, 'pasta-4.jpg', 2),
(11, 'pasta-5.jpg', 2),
(12, 'pasta-6.jpg', 2),
(13, 'coffee-1.jpg', 3),
(14, 'coffee-2.jpg', 3),
(15, 'coffee-3.jpg', 3),
(16, 'coffee-4.jpg', 3),
(17, 'coffee-5.jpg', 3),
(18, 'coffee-6.jpg', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_favourites`
--
ALTER TABLE `tbl_favourites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_images`
--
ALTER TABLE `tbl_images`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_favourites`
--
ALTER TABLE `tbl_favourites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_images`
--
ALTER TABLE `tbl_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
