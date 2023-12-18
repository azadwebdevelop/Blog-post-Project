-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 28, 2022 at 06:31 AM
-- Server version: 8.0.30
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog21_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `image`, `status`) VALUES
(1, 'Mr. Admin', 'admin@mail.com', '$2y$10$r8kwVHU8BN5my8IAEtbG/.geS8UyPP63xmhykdaITIZb6CmSXJOwe', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `slug`) VALUES
(3, 'সর্বশেষ', 'সর্বশেষ'),
(4, 'রাজনীতি', 'রাজনীতি'),
(5, 'জীবনযাপন', 'জীবনযাপন'),
(6, 'বিনোদন', 'বিনোদন');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` bigint NOT NULL,
  `admin_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_published` enum('Published','Draft') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Draft',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `admin_id`, `category_id`, `title`, `slug`, `description`, `image`, `is_published`, `created_at`, `updated_at`) VALUES
(3, 1, 6, 'যে গল্প কাঁদিয়েছে মেসি ও আন্তোনেলাকে', 'যে-গল্প-কাঁদিয়েছে-মেসি-ও-আন্তোনেলাকে', '<p>স্বপ্নপূরণের গল্পগুলো খুব সম্ভবত এমনই! হাঁটি হাঁটি পায়ে সেগুলো ধরা দেয় না খুব সহজে। লিওনেল মেসির চূড়ায় ওঠার গল্পটাও এর ব্যতিক্রম নয়। রোজারিও থেকে বার্সেলোনা হয়ে বিশ্বকাপের পোডিয়ামে ওঠার যাত্রাটা ছিল কাঁটা বিছানো। মেসির সেই গল্পটা ‘মেসি ও তাঁর স্যুটকেস’ নামের গল্পে তুলে ধরেছেন আর্জেন্টিনার প্রখ্যাত লেখক হারনান কাসসিয়ারি।</p><p><br></p><p>যেখানে নিজের শিকড় না ভুলে একজন সাধারণ মানুষের অসাধারণ হয়ে ওঠার গল্পটা তুলে ধরেছেন কাসসিয়ারি। ‘ওরসাই’ ম্যাগাজিনে প্রকাশিতব্য কাসসিয়ারির সেই গল্পটির অডিও সংস্করণ প্রচারিত হয় আর্জেন্টাইন রেডিও ‘পেরোস দে লা চালে’তে। যেটি শুনে আপ্লুত হয়েছেন মেসি নিজেও, ভিজেছে তাঁর এবং আন্তোনেলার চোখও।</p><p><br></p><p>এই গল্প মেসিকে এতটাই আপ্লুত করেছে যে আর্জেন্টাইন মহাতারকা নিজেই বার্তা পাঠিয়ে ধন্যবাদ জানিয়েছেন গল্পের লেখক কাসসিয়ারি এবং রেডিও অনুষ্ঠানের উপস্থাপক অ্যান্ডি কুসনেজফকে। সেই বার্তায় মেসি বলেছেন, কুসনেজফের অনুষ্ঠানে ৯ মিনিট ধরে কাসিয়ারির গল্পটা শুনে তিনি এবং আন্তোনেলা কেঁদেছেন।</p><p><br></p><p>মেসির ভাষ্য, ‘হারনান যা বলেছে, যা সে তুলে ধরেছে, তা শুনে আমরা কাঁদতে শুরু করেছি। কারণ, সে যা বলেছে সব সত্যি। তোমাদের শুভেচ্ছা জানাতে চাই। দুজনকেই ধন্যবাদ। আমি ও আন্তোনেলা রোজারিওতে এটা শুনেছি এবং আমরা তাড়িত হয়েছি। এটা আমি তোমাদের জানাতে চেয়েছি। তোমাদের জন্য বড় একটি আলিঙ্গন। আবারও ধন্যবাদ।’</p><p><br></p><p>মেসির এই বার্তা পেয়ে রেডিরও স্টেশনে উপস্থিত সবার চোখই আর্দ্র হয়েছে। কাসসিয়ারি বলেছেন, ‘লিওনেলের (মেসি) বার্তাটি ছিল অসাধারণ। সে বলেছে, গল্পটি শুনতে শুনতে সে আর তার স্ত্রী কেঁদেছে। যদি তারা আমাকে বেছে নেওয়ার সুযোগ দেয় যে: সাহিত্যে নোবেল পুরস্কার, সেরভান্তেস পুরস্কার কিংবা আমার গল্পে মেসির তাড়িত হওয়া। আমি আজ যা ঘটেছে, সেটিকেই বেছে নেব।’</p>', 'uploads/post/63a9260687df541692.webp', 'Published', '2022-12-26 04:41:42', NULL),
(4, 1, 6, 'কোন ব্যাংকে টাকা রাখবেন', 'কোন-ব্যাংকে-টাকা-রাখবেন', '                                       <p>কোন ব্যাংকে টাকা রাখবেন, এ নিয়ে সাম্প্রতিক সময়ে দুশ্চিন্তা মানুষের মনে। এ নিয়ে বেশ আলোচনাও চলছে। উদ্বিগ্ন গ্রাহকদের অনেকে এক ব্যাংক থেকে টাকা তুলে অন্য ব্যাংকে জমা করছেন। আবার ব্যাংক থেকে টাকা তুলে নিজের কাছেও রাখছেন কেউ কেউ। ফলে ব্যাংকের বাইরে নগদ টাকার পরিমাণ দিন দিন বাড়ছে। কে চাইবে নিজের কষ্টের জমানো টাকা বেহাত হোক? তাই হয়তো গ্রাহকদের এমন আচরণ।</p><p><span style=\"color: rgb(122, 122, 122); font-family: Roboto, sans-serif; font-size: 15px;\">টাকা&nbsp;</span><br></p><p>ব্যাংকে টাকা রেখে টাকা ফেরত না পাওয়ার ঘটনা রয়েছে এ দেশে। আইসিবি ইসলামিক ব্যাংকে (সাবেক ওরিয়েন্টাল ব্যাংক) টাকা রেখে এখনো অনেক গ্রাহক টাকা ফেরত পাননি। কয়েক বছর আগেও পদ্মা ব্যাংকে (সাবেক ফারমার্স) টাকা রেখে সেই টাকা ফেরত পেতে ভোগান্তি পোহাতে হয়েছে গ্রাহকদের। দেশের প্রায় এক ডজন আর্থিক প্রতিষ্ঠানে জমানো টাকা ফেরত না পাওয়ার ঘটনাও কারও অজানা নয়।</p><p><br></p><p>একসময় ব্যাংকের বিভিন্ন সূচক তথা ক্রেডিট রেটিং, ক্যামেলস রেটিং, মূলধন পরিস্থিতি, খেলাপি ঋণের হারসহ নানা বিষয় বিবেচনা করা হতো। তবে সময়ের সঙ্গে সঙ্গে টাকার নিরাপত্তায় এসব সূচক গুরুত্ব হারিয়েছে। কারণ, দেশে রেটিং প্রতিষ্ঠানগুলোর স্বচ্ছতা নিয়ে নানা প্রশ্ন রয়েছে। ফলে খারাপ ও দুর্বল ব্যাংকগুলোও ভালো রেটিং পাচ্ছে। আবার নানা সুযোগ-সুবিধার কারণে আদায় না হলেও অনেক ঋণকে খেলাপি হিসেবে দেখাচ্ছে না কিছু ব্যাংক। ফলে কোন ব্যাংক ভালো, আর কোন ব্যাংক খারাপ, তা সহজে বলা খুব কঠিন। এদিকে দুর্বল ১৪টি ব্যাংকে পর্যবেক্ষক ও সমন্বয়ক নিয়োগ দিয়েছে কেন্দ্রীয় ব্যাংক। এই ১৪ ব্যাংকের বাইরে সব ব্যাংক যে ভালো, তা-ও বলা যাবে না।</p><p><br></p><p>কোন ব্যাংকে টাকা রাখবেন, তা বাছাইয়ে কয়েকটি পরামর্শ দিয়েছেন কয়েক ব্যাংকার। তাঁরা বলছেন, গ্রাহকেরা টাকা জমানোর সময় সংশ্লিষ্ট ব্যাংকের পরিচালনা পর্ষদের দিকে খেয়াল রাখতে পারেন। যেই ব্যাংকের পরিচালনা পর্ষদের ভাবমূর্তি যত বেশি স্বচ্ছ, সেই ব্যাংক ততটাই নিরাপদ। প্রতিটি ব্যাংকের ওয়েবসাইটে পরিচালকদের নাম ও পরিচয় দেওয়া থাকে। পাশাপাশি কোন ব্যাংকের বড় গ্রাহক কারা, অর্থাৎ আমানতের টাকা ব্যাংক কাকে দিচ্ছে, তারও খোঁজ নিতে হবে।</p><p><br></p><p>আরও পড়ুন</p><p>দীর্ঘমেয়াদি ঝুঁকিতে ন্যাশনাল ব্যাংক</p><p>দীর্ঘমেয়াদি ঝুঁকিতে ন্যাশনাল ব্যাংক</p><p>ব্যাংকগুলো প্রতিবছর যে বার্ষিক প্রতিবেদন তৈরি করে, সেই প্রতিবেদনে কয়েকজন শীর্ষ গ্রাহকের নাম ও ঋণের পরিমাণ উল্লেখ থাকে। পাশাপাশি যেই ব্যাংকের কর্মকর্তা-কর্মচারী নিয়োগ যতটা স্বচ্ছ, সেই ব্যাংকও ততটা ভালো। কারণ, দিন শেষে ব্যাংকের কর্মকর্তারাই পারে ব্যাংকটিকে ভালো রাখতে। আবার ব্যাংকটির শীর্ষ কর্মকর্তাদের পেশাদারত্ব গুরুত্বপূর্ণ বিষয়। এসব বিষয় বিবেচনায় নিলে জমানো টাকা নিরাপদ থাকতে পারে।</p><p><br></p><p>আর গ্রাহকদের মনে রাখা প্রয়োজন, যেই ব্যাংক আমানতে যত বেশি সুদ দেয়, সেই ব্যাংক ততটা দুর্বল। সেই ব্যাংক বেশি তারল্যসংকটে ভুগছে। এ কারণেই বেশি সুদ দিয়ে গ্রাহক থেকে টাকা আনার চেষ্টা করছে। এসব ব্যাংক বেশি সুদ দেবে ঠিকই, তবে একটা সময় পর আসল ফেরত পাওয়া নিয়ে ভোগান্তিতে পড়তে হতে পারে।</p>                                        ', 'uploads/post/63a926376bb0242423.webp', 'Published', '2022-12-26 04:42:31', '2022-12-28 12:21:17'),
(5, 1, 5, 'কৃষিকাজ করতে করতেই ইংরেজিতে ভ্লগ বানান দয়াল', 'কৃষিকাজ-করতে-করতেই-ইংরেজিতে-ভ্লগ-বানান-দয়াল', '                                                                              <p>ফসলি জমিতে কাজ করছেন এক তরুণ। নাম দয়াল চন্দ্র বর্মন। কখনো পাওয়ার টিলার চালাচ্ছেন, কখনো ফসল নিয়ে বাড়ি ফিরছেন। আর অনর্গল কথা বলছেন ইংরেজিতে। উচ্চারণও এত চমৎকার, শুনে চমকে যেতে হয়। এই চমকের কারণেই কি না কে জানে, দয়ালের ভিডিও দেখেন লাখো মানুষ। পঞ্চগড়ের আটোয়ারী উপজেলার বাসিন্দা দয়াল কখনো নামী স্কুল-কলেজ-বিশ্ববিদ্যালয়ে পড়েননি। এমনকি কলেজে উঠে পড়ালেখা ছেড়েই দিয়েছিলেন। পরে উচ্চমাধ্যমিক পরীক্ষা দিয়েছেন উন্মুক্ত বিশ্ববিদ্যালয়ের অধীনে। ইংরেজিতে কনটেন্ট বানানোর আত্মবিশ্বাস তিনি কীভাবে পেলেন? কেনই-বা ভালো ইংরেজি শেখার প্রতি তাঁর আগ্রহ হলো?</p><p><b>বাবার চাওয়া</b></p><p>ছেলে চিকিৎসক, প্রকৌশলী বা বড় চাকরিজীবী হোক, সন্তানকে নিয়ে এমন কোনো প্রত্যাশা ছিল না পুলিন চন্দ্র বর্মনের। তাঁর চাওয়াটা ছিল খুব সরল, যেন ইংরেজিতে সুন্দর করে কথা বলতে পারে। পুলিন চন্দ্র বর্মন পেশায় কৃষক। ছেলে দয়ালকে সঙ্গে নিয়ে ফসল বুনতে বুনতেই এক ফাঁকে স্বপ্নটাও বুনে দিয়েছিলেন মনে—ইংরেজি শিখতে হবে। বন্ধুরা যখন প্রাইভেট পড়ায় ব্যস্ত, দয়াল তখন ব্যস্ত ছিলেন ইংরেজির ভিতটাকে আরও মজবুত করার কাজে। পঞ্চগড় বিষ্ণুপ্রসাদ সরকারি উচ্চবিদ্যালয়ে পড়তেন তখন। কিন্তু পাশের গ্রামের প্রামাণিক পাড়া প্রাথমিক বিদ্যালয়ের প্রধান শিক্ষক মো. আজগর আলীর ইংরেজি পড়ানোটা তাঁর ভালো লাগত। সেই শিক্ষকের তত্ত্বাবধানেই চলত ইংরেজির চর্চা।</p><p><span style=\"font-size: 1rem;\">মাধ্যমিক পেরোনোর পর শিক্ষাজীবন কিছুটা এলোমেলো হয়ে যায়। স্বজনদের অনেকে থাকে ভারতে। পরিবার চাইছিল, দয়াল যেন ভারতে গিয়ে উচ্চশিক্ষা নেন। কিন্তু দয়ালের আবার দেশেই একটা কিছু করার ইচ্ছা। এই দোটানায় একসময় পড়ালেখাই বন্ধ হয়ে যায়।</span><br></p><p><span style=\"font-size: 1rem;\">প্রায় দুই বছর এক রকম হতাশায় কেটেছে। করোনাকাল যখন ‘নতুন স্বাভাবিক’–এর সঙ্গে পরিচয় করাল, তখন নতুন করে ভাবতে শুরু করলেন দয়াল। ঘুরে দাঁড়ানোর শুরুটা তখন থেকেই।</span><br></p><p><span style=\"font-size: 1rem;\">অনলাইনের শক্তি</span><br></p><p>করোনার ঘরবন্দী সময়ে নিজের আত্মবিশ্বাস বাড়াতে ইউটিউবে বিভিন্ন অনুপ্রেরণাদায়ী বক্তাদের ভিডিও দেখতে শুরু করেন দয়াল চন্দ্র। বেশির ভাগ ভিডিওর ভাষা ইংরেজি। ইংরেজির ভিতটা যেহেতু মজবুত, কথা বুঝতে দয়ালের সমস্যা হতো না। ভিডিও দেখে দেখে নিজেও ইংরেজি বলার চেষ্টা করতে শুরু করেন তিনি। নিজের আগ্রহ তো ছিলই, সঙ্গে প্রেরণা দিয়েছে বাবার ইচ্ছাপূরণের তাগিদ।</p><p>একসময় দয়ালের মনে হলো, ইংরেজিটা ভালোই বলতে পারছেন তিনি। ফোনে নিজের ভিডিও ধারণ করে ভুলগুলো শোধরানোর চেষ্টা শুরু করলেন। এরই মধ্যে যুক্ত হলেন অনলাইনে ইংরেজি চর্চার প্ল্যাটফর্ম, ‘সার্চ ইংলিশ’ নামের একটি ফেসবুক গ্রুপে। দয়াল দেখলেন, গ্রুপে অনেকেই ইংরেজিতে কথা বলার ভিডিও পোস্ট করছেন। এমন একটা প্ল্যাটফর্মই তো তিনি মনে মনে খুঁজছিলেন! অন্যদের ভিডিও দেখে অনুপ্রাণিত হয়ে দয়ালও নিজের ভিডিও গ্রুপে আপলোড করতে শুরু করেন। মন্তব্যের ঘরে মানুষের প্রশংসা পেয়ে বড় হতে থাকে তাঁর চিন্তার পরিসর।</p>                                                                                ', 'uploads/post/63a9266bf1a9662998.webp', 'Published', '2022-12-26 04:43:23', '2022-12-26 05:33:11'),
(6, 1, 5, 'যে পুরস্কার ওয়ার্ন জিতেছিলেন, সেটি এখন তাঁর নামে', 'যে-পুরস্কার-ওয়ার্ন-জিতেছিলেন,-সেটি-এখন-তাঁর-নামে', '                                       <p>মেলবোর্নে আজ শুরু হয়েছে অস্ট্রেলিয়া-দক্ষিণ আফ্রিকা বক্সিং ডে টেস্ট। শেন ওয়ার্নের প্রিয় ভেন্যুতে তাঁর মৃত্যুর পর এই প্রথম বক্সিং ডে টেস্ট হচ্ছে। এমন একটি উপলক্ষে কিংবদন্তি ক্রিকেটারকে নানা আয়োজনে স্মরণ করেছে ক্রিকেট অস্ট্রেলিয়া (সিএ)। ওয়ার্নের নামে একটি পুরস্কারের নামকরণের ঘোষণা দিয়েছে তারা। এখন থেকে অস্ট্রেলিয়ার বর্ষসেরা টেস্ট ক্রিকেটার পুরস্কারের নাম শেন ওয়ার্ন অ্যাওয়ার্ড।</p><p><span style=\"font-size: 1rem;\">এ বছরের মার্চে ৫২ বছর বয়সে মারা যান ওয়ার্ন। দুই মাস পর এমসিজির সাউদার্ন গ্যালারির নাম দেওয়া হয় ‘শেন ওয়ার্ন স্ট্যান্ড’। কিংবদন্তি এই লেগ স্পিনারকে স্মরণ করতে বক্সিং ডে টেস্ট ঘিরে নানান উদ্যোগ নেয় ক্রিকেট অস্ট্রেলিয়া। এর একটি ছিল ওয়ার্নের বিখ্যাত হ্যাট পরে তাঁকে স্মরণ করা। খেলা শুরুর আগে অস্ট্রেলিয়া ও দক্ষিণ আফ্রিকার ক্রিকেটাররা ওয়ার্নের ‘ফ্লপি হ্যাট’ পরেন। গ্যালারিতে দর্শকের মাথায়ও ছিল একই হ্যাট।</span><br></p><p><span style=\"font-size: 1rem;\">আরও পড়ুন</span><br></p><p>‘শুভ জন্মদিন...আমাদের হৃদয়ে থাকবে’, ওয়ার্নের জন্মদিনে তাঁর অ্যাকাউন্ট থেকে টুইট</p><p>শেন ওয়ার্ন (১৯৬৯–২০২২)</p><p>ওয়ার্নের নামে পুরস্কারের নামকরণের ঘোষণা দিয়ে সিএর প্রধান নির্বাহী নিক হকলি বলেন, ‘অস্ট্রেলিয়ার ইতিহাসের সর্বকালের সেরাদের একজন হিসেবে এবং টেস্ট ক্রিকেটে অসাধারণ অবদানের স্বীকৃতি দিতে টেস্ট পুরস্কারের সঙ্গে তাঁর নাম জুড়ে দেওয়াটা মানানসই। ওয়ার্ন টেস্ট ক্রিকেটের একজন গর্বিত প্রতিনিধি ছিলেন। তাঁর মতো হ্যাট পরে এসে এমসিজির দর্শকরাও বুঝিয়ে দিয়েছে, এই খেলাটায় কী পরিমাণ প্রভাব রেখেছিলেন তিনি।’</p>                                        ', 'uploads/post/63a9269841e8e33665.webp', 'Published', '2022-12-26 04:44:08', '2022-12-26 05:24:35'),
(7, 1, 5, 'কঠোর অনুশাসনের ইরানে স্বাধীনতার দাবিতে নারীর বিদ্রোহ', 'কঠোর-অনুশাসনের-ইরানে-স্বাধীনতার-দাবিতে-নারীর-বিদ্রোহ', '                                                                              <p>ইরানের ডিসেম্বরের মাঝামাঝি সময়ের একটি তথ্য দিয়ে শুরু করা যেতে পারে। দেশটির রাজধানী তেহরানসহ এর আশপাশের শহরগুলোয় বায়ুদূষণ এমন মাত্রায় পৌঁছেছে যে বাধ্য হয়ে সেখানকার প্রাথমিক ও মাধ্যমিক বিদ্যালয়গুলো বন্ধ রাখতে হয়েছে।</p><p><span style=\"font-size: 1rem;\">এর সঙ্গে ইরানের আরও দুটি চিত্র যোগ করা যেতে পারে—দেশটির তরুণদের মধ্যে বেকারত্বের হার ৩০–এর কাছাকাছি এবং মূল্যস্ফীতি প্রায় ৪০ শতাংশ। যেন এক বিষণ্ন দেশ। কিন্তু এ দেশের নারী, তরুণ-তরুণীরা জেগে উঠেছেন। তাঁরা সংস্কার চাইছেন। দমন-পীড়নেও তাঁদের কাবু করা যায়নি।</span></p><p><span style=\"color: rgb(122, 122, 122); font-family: Roboto, sans-serif; font-size: 15px;\">টাকা&nbsp;</span><br></p><p><span style=\"font-size: 1rem;\">ইরানে সম্প্রতি তারুণ্যের উত্থানের পেছনের ঘটনাটি মোটামুটি এখন সবারই জানা। গত ১৩ সেপ্টেম্বর রাজধানী তেহরানে কুর্দিস্তান অঞ্চলের তরুণী মাসা আমিনিকে গ্রেপ্তার করা হয়। অভিযোগ, তাঁর বেশভূষা আইন অনুসারে সঠিক ছিল না। নীতি পুলিশের হাতে গ্রেপ্তারের পর ১৬ সেপ্টেম্বর তাঁর মৃত্যু হয়। পরদিন তাঁর দাফনের সময় থেকে বিক্ষোভ শুরু হয়।</span><br></p>                                                                                ', 'uploads/post/63a9341f9a7c435152.webp', 'Published', '2022-12-26 11:41:51', '2022-12-28 12:21:09');

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `post_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `post_tag`
--

INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES
(3, 5),
(3, 7),
(6, 4),
(5, 5),
(5, 6),
(7, 5),
(4, 5),
(4, 7);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `name`, `slug`) VALUES
(3, 'আর্জেন্টিনা ফুটবল দল', 'আর্জেন্টিনা-ফুটবল-দল'),
(4, 'কাতার বিশ্বকাপ ২০২২', 'কাতার-বিশ্বকাপ-২০২২'),
(5, 'পরীক্ষা', 'পরীক্ষা'),
(6, 'ছাত্রলীগ', 'ছাত্রলীগ'),
(7, 'রংপুর বিভাগ', 'রংপুর-বিভাগ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD KEY `post_id` (`post_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `post_tag_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_tag_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
