-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2023 at 01:33 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jobboard`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(3) NOT NULL,
  `adminname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `adminname`, `email`, `password`, `created_at`) VALUES
(1, 'D', 'd@gmail.com', '$2y$10$lAJev6gkt/uhb3R.psKtye86schp61616urI5XqX9JWfER9.nvs5W', '2023-03-04 17:57:49'),
(2, 'A1', 'a1@gmail.com', '$2y$10$7InhFu3/bbyhHEH6jzpBlu74LH3N45sZszhZOBvoa8ETsOXlDlOwG', '2023-03-05 07:55:30');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(3) NOT NULL,
  `name` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`) VALUES
(1, 'Designs', '2023-03-06 06:25:58'),
(3, 'Development', '2023-03-05 12:17:08');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(3) NOT NULL,
  `job_title` varchar(200) NOT NULL,
  `job_region` varchar(200) NOT NULL,
  `job_type` varchar(200) NOT NULL,
  `vacancy` varchar(200) NOT NULL,
  `job_category` varchar(200) NOT NULL,
  `experience` varchar(200) NOT NULL,
  `salary` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `application_deadline` varchar(200) NOT NULL,
  `job_description` text NOT NULL,
  `responsibilities` text NOT NULL,
  `education_experience` text NOT NULL,
  `other_benifits` text NOT NULL,
  `company_email` varchar(200) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `company_id` int(3) NOT NULL,
  `company_image` varchar(200) DEFAULT NULL,
  `status` int(3) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `job_title`, `job_region`, `job_type`, `vacancy`, `job_category`, `experience`, `salary`, `gender`, `application_deadline`, `job_description`, `responsibilities`, `education_experience`, `other_benifits`, `company_email`, `company_name`, `company_id`, `company_image`, `status`, `created_at`) VALUES
(2, 'Full Stack Developer', 'New York', 'Part Time', '5', 'design', '3-6 years', '$70k - $100k', 'Any', '20-2-2022', 'REACT AND NORD DEVELOPER', 'FULL STACK ', 'GRADUTE', 'HOLYDAY ON SATURDAY', 'b@gmail.com', 'b', 50, 'IMG_3590.jpeg', 1, '2023-02-10 05:37:13'),
(7, 'Full Stack Developer', 'San Francisco', 'Part Time', '3', 'design', '', '', '', '', '', '', '', '', 'c@gmail.com', 'c', 51, 'wallpaperflare.com_wallpaper (3).jpg', 1, '2023-02-28 12:56:38'),
(9, 'Full Stack Developer handler', 'San Francisco', 'Part Time', '3', 'design', '1-3 years', '$50k - $70k', 'Male', ' 02-04-2023  ', 'job_category', 'job_category', 'job_category', 'job_category', 'c@gmail.com', 'c', 51, 'wallpaperflare.com_wallpaper (3).jpg', 1, '2023-03-02 08:59:17'),
(10, 'Game developer', 'San Francisco', 'Full Time', '5', 'designs', '1-3 years', '$50k - $70k', 'Female', '3-4-2023', 'Develop a job', 'Full stack', 'Must Graduated', 'Holiday on sunday', 'c@gmail.com', 'c', 51, 'wallpaperflare.com_wallpaper (3).jpg', 1, '2023-03-06 06:07:42');

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

CREATE TABLE `job_applications` (
  `id` int(3) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `cv` varchar(200) NOT NULL,
  `worker_id` int(3) NOT NULL,
  `job_id` int(3) NOT NULL,
  `job_title` varchar(200) NOT NULL,
  `company_id` int(3) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `job_applications`
--

INSERT INTO `job_applications` (`id`, `username`, `email`, `cv`, `worker_id`, `job_id`, `job_title`, `company_id`, `create_at`) VALUES
(4, 'd', 'd@gmail.com', 'aptitude_questions.pdf', 52, 9, 'Full Stack Developer handler', 51, '2023-03-02 12:08:59'),
(5, 'Rosy', 'rosy@gmail.com', '', 53, 2, 'Full Stack Developer', 50, '2023-03-05 13:32:31'),
(6, 'heet', 'heet@gmail.com', '', 54, 9, 'Full Stack Developer handler', 51, '2023-03-06 06:03:29'),
(7, 'abc', 'abc@gmail.com', '', 55, 9, 'Full Stack Developer handler', 51, '2023-03-06 06:31:58');

-- --------------------------------------------------------

--
-- Table structure for table `saved_jobs`
--

CREATE TABLE `saved_jobs` (
  `id` int(3) NOT NULL,
  `job_id` int(3) NOT NULL,
  `worker_id` int(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `saved_jobs`
--

INSERT INTO `saved_jobs` (`id`, `job_id`, `worker_id`, `created_at`) VALUES
(34, 9, 52, '2023-03-02 16:25:00'),
(35, 1, 52, '2023-03-02 16:25:07'),
(36, 2, 52, '2023-03-02 16:25:13'),
(37, 7, 52, '2023-03-02 16:25:20'),
(38, 2, 53, '2023-03-05 13:31:51'),
(39, 9, 54, '2023-03-06 06:02:58'),
(40, 7, 54, '2023-03-06 06:03:14'),
(41, 9, 55, '2023-03-06 06:30:24'),
(42, 7, 55, '2023-03-06 06:30:36');

-- --------------------------------------------------------

--
-- Table structure for table `searches`
--

CREATE TABLE `searches` (
  `id` int(3) NOT NULL,
  `keyword` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `searches`
--

INSERT INTO `searches` (`id`, `keyword`, `created_at`) VALUES
(1, 'Web Developer', '2023-03-02 20:25:00'),
(2, 'Web Developer', '2023-03-04 16:31:38'),
(3, 'Web Developer', '2023-03-04 16:36:16'),
(4, 'Web Developer ', '2023-03-04 16:39:37'),
(5, 'game developer', '2023-03-04 16:40:21'),
(6, 'Web Developer ', '2023-03-04 16:44:03'),
(7, 'web developer', '2023-03-04 16:44:18'),
(8, 'GAME DEVELOPER', '2023-03-04 16:44:31'),
(9, 'Full Stack Developer', '2023-03-04 16:46:28'),
(10, 'Full Stack Developer', '2023-03-04 16:50:19'),
(11, 'Full Stack Developer', '2023-03-04 16:51:37'),
(12, 'Full Stack Developer', '2023-03-04 16:55:54'),
(13, 'Full Stack Developer', '2023-03-04 16:57:10'),
(14, 'Full Stack Developer', '2023-03-04 16:57:38'),
(15, 'Web Developer ', '2023-03-04 16:58:03'),
(16, 'Reactjs', '2023-03-04 17:14:13'),
(17, 'Full Stack Developer', '2023-03-05 13:21:57'),
(18, ' full stack developer handler', '2023-03-05 13:22:44'),
(19, 'Full Stack Developer handler', '2023-03-05 13:23:04'),
(20, 'Full Stack Developer handler', '2023-03-06 06:05:53'),
(21, 'Full Stack Developer handler', '2023-03-06 06:06:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(3) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `img` varchar(100) NOT NULL,
  `type` varchar(200) NOT NULL,
  `cv` varchar(200) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `bio` varchar(200) DEFAULT NULL,
  `facebook` varchar(200) DEFAULT NULL,
  `twitter` varchar(200) DEFAULT NULL,
  `linkedin` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `img`, `type`, `cv`, `title`, `bio`, `facebook`, `twitter`, `linkedin`, `created_at`) VALUES
(48, 'ab', 'ab@gmail.com', '$2y$10$sNusbetZQqdWwX0cIB4H9Oc7hYqN8.7QLaVcVCvViGPFsRUDkqUvS', 'pexels-roberto-nickson-2559941.jpg', 'Worker', 'lecture_flow (1).pdf', '', '', '', '', '', '2023-02-09 07:24:22'),
(49, 'aa', 'a@gmail.com', '$2y$10$fQRK6KouLdjg6rOIywsL8e0Ua1Eu/e5qDGAYxSon39Q9IbvTWRIeW', 'wallpaperflare.com_wallpaper (3).jpg', 'Worker', 'aptitude_questions.pdf', 'web developers', 'GRADUATEs', 'fb', 'tw', 'ld', '2023-02-09 07:39:40'),
(50, 'b', 'b@gmail.com', '$2y$10$S.g2h57qF2P3Z2xXipVs8uVgetbsqqlRLK4864x/raKnWyeLGPvHe', 'pexels-roberto-nickson-2559941.jpg', 'Company', 'NULL', 'NULL', 'companys', 'Fb', 'Tww', 'Ld', '2023-02-09 17:38:51'),
(51, 'c', 'c@gmail.com', '$2y$10$vw3NBKyhLq1g55FOU9mg8.PCDfiSQO9ye.qXBdn816d0W.SkAEaCW', 'wallpaperflare.com_wallpaper (3).jpg', 'Company', 'NULL', 'NULL', 'Software Company', 'SC//fb', 'sc//tw', 'sc//ln', '2023-02-10 14:24:15'),
(52, 'd', 'd@gmail.com', '$2y$10$lAJev6gkt/uhb3R.psKtye86schp61616urI5XqX9JWfER9.nvs5W', 'wallpaperflare.com_wallpaper (7).jpg', 'Worker', 'aptitude_questions.pdf', 'Seniour Web Developer', 'Experience of 5year in Google', 'd//fb', 'd//tw', 'd//ln', '2023-02-10 14:24:37'),
(53, 'Rosy', 'rosy@gmail.com', '$2y$10$iREBUbLaKKeRLYdCYJzXWOA066hwT4ctzhTHQSxfgMCgOfW.aTmlK', 'pexels-pixabay-235621.jpg', 'Worker', 'aptitude_questions.pdf', 'Developer', 'Enthusiastic developer', 'fb', 'Tww', 'ln', '2023-03-05 13:24:10'),
(54, 'heet', 'heet@gmail.com', '$2y$10$FhlZjHX5YdgBHGuzTE4xYuM9tPaFYT2XWMlmzX262S7skBv2IbFX2', 'wallpaperflare.com_wallpaper (4).jpg', 'Worker', 'hr_interview_question.pdf', 'developer', 'Enthusiastic developer', 'fb', 'tw', 'ln', '2023-03-06 06:00:09'),
(55, 'abc', 'abc@gmail.com', '$2y$10$RGdRGMHm/tbw74fn3fWQMef4r0YI/l.ViKyWxv/syWuFGwOt/qm1q', 'pexels-jacob-colvin-1757363.jpg', 'Worker', 'lecture_flow (1).pdf', 'developer', 'developer', 'fb', 'tw', 'ln', '2023-03-06 06:29:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saved_jobs`
--
ALTER TABLE `saved_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `searches`
--
ALTER TABLE `searches`
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
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `saved_jobs`
--
ALTER TABLE `saved_jobs`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `searches`
--
ALTER TABLE `searches`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
