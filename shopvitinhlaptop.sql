-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 28, 2023 lúc 06:54 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `vitinhshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `accessory`
--

CREATE TABLE `accessory` (
  `id_accessory` int(11) NOT NULL,
  `name_products` varchar(150) NOT NULL,
  `cat_accessory` varchar(50) NOT NULL COMMENT 'phím, chuột, usb...'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `accessory`
--

INSERT INTO `accessory` (`id_accessory`, `name_products`, `cat_accessory`) VALUES
(1, 'Chuột Fuhlen G3', 'Chuột'),
(2, 'Chuột Logitech B175', 'Chuột'),
(3, 'Phím Fuhlen Destroyer', 'Phím'),
(4, 'Phím Logitech K270', 'Phím'),
(5, 'Tai Nghe Logitech H111', 'Tai nghe');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discount`
--

CREATE TABLE `discount` (
  `id_discount` varchar(50) NOT NULL COMMENT 'giam100k, giam200k, giam300k ',
  `describes` varchar(255) DEFAULT NULL,
  `reduced_price` double NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `discount`
--

INSERT INTO `discount` (`id_discount`, `describes`, `reduced_price`, `start_date`, `end_date`) VALUES
('giam100k', 'Giam100k', 100000, '2023-06-28', '2023-08-22'),
('giam200k', 'Giảm 200k', 200000, '2023-06-28', '2023-08-30'),
('giam500k', 'giamgia 500k sinh nhat cua web', 500000, '2023-06-29', '2023-07-31'),
('giam50k', 'Giam50k', 50000, '2023-06-28', '2023-08-01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `feedback`
--

CREATE TABLE `feedback` (
  `id_feedback` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0 là chưa đọc, 1 là đã đọc',
  `id_users` int(11) NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `feedback`
--

INSERT INTO `feedback` (`id_feedback`, `content`, `status`, `id_users`, `date_created`) VALUES
(13, 'Tôi cần tư vấn laptop xịn', 1, 38, '2023-06-28 22:01:42');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gift`
--

CREATE TABLE `gift` (
  `id_gift` int(11) NOT NULL,
  `name_products` varchar(150) NOT NULL,
  `id_products_1` int(11) DEFAULT NULL,
  `id_products_2` int(11) DEFAULT NULL,
  `id_products_3` int(11) DEFAULT NULL,
  `id_products_4` int(11) DEFAULT NULL,
  `id_products_5` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `gift`
--

INSERT INTO `gift` (`id_gift`, `name_products`, `id_products_1`, `id_products_2`, `id_products_3`, `id_products_4`, `id_products_5`) VALUES
(1, 'Chuột Fuhlen G3', NULL, NULL, NULL, NULL, NULL),
(2, 'Chuột Logitech B175', NULL, NULL, NULL, NULL, NULL),
(3, 'Phím Fuhlen Destroyer', NULL, NULL, NULL, NULL, NULL),
(4, 'Phím Logitech K270', NULL, NULL, NULL, NULL, NULL),
(5, 'Tai Nghe Logitech H111', NULL, NULL, NULL, NULL, NULL),
(6, 'Laptop Acer Aspire 3', 2, NULL, NULL, NULL, NULL),
(7, 'Laptop Acer Swift 4', 2, 5, NULL, NULL, NULL),
(8, 'Laptop Asus VivoBook 14', 2, 4, 5, NULL, NULL),
(9, 'Laptop Asus Vivobook Pro', 2, 4, 5, NULL, NULL),
(10, 'Laptop Dell G15', 1, 3, NULL, NULL, NULL),
(11, 'Laptop HP Pavilion 15', 2, NULL, NULL, NULL, NULL),
(12, 'Laptop Msi Alpha 15', 1, 3, 5, NULL, NULL),
(13, 'Laptop HP ProBook 450', 2, 4, 5, NULL, NULL),
(14, 'Laptop Msi Bravo 15', 1, NULL, NULL, NULL, NULL),
(16, 'Laptop Asus Zenbook UX3402ZA-KM218W', 1, 2, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoice`
--

CREATE TABLE `invoice` (
  `id_invoice` int(11) NOT NULL,
  `name_receiver` varchar(50) NOT NULL,
  `phone_receiver` varchar(10) NOT NULL COMMENT 'chỉ chứa ký tự là số, 10 ký tự, ký tự đầu là 0',
  `address_receiver` varchar(255) NOT NULL,
  `id_users` int(11) NOT NULL,
  `id_discount` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `total_money` double NOT NULL COMMENT '(VND)',
  `delivery_status` tinyint(4) NOT NULL COMMENT '0 là đã hủy, 1 là chờ xác nhận,\r\n2 là đang chuẩn bị hàng, 3 là đang giao, 4 là đã giao thành công',
  `payments` tinyint(4) NOT NULL COMMENT '0 là tiền mặt, 1 là chuyển khoản, 2 là momo',
  `debt` double NOT NULL COMMENT '0 là đã thanh toán, !=0 là công nợ',
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `invoice`
--

INSERT INTO `invoice` (`id_invoice`, `name_receiver`, `phone_receiver`, `address_receiver`, `id_users`, `id_discount`, `note`, `total_money`, `delivery_status`, `payments`, `debt`, `date_created`) VALUES
(29, 'Tú Vinh', '0349521973', 'Tiền Giang', 38, NULL, NULL, 25650000, 4, 0, 0, '2023-06-28 21:43:31'),
(30, 'Test mot', '0907301577', 'Test', 37, NULL, 'tezst', 1000000, 4, 0, 0, '2023-06-28 23:00:50'),
(31, 'Test mot', '0907301577', 'Test', 37, NULL, NULL, 67000000, 4, 0, 0, '2023-06-28 23:07:39'),
(33, 'Test hai', '0907301579', 'Tiền Gian', 39, NULL, 'dasdasdd', 21790000, 4, 0, 0, '2023-06-29 11:18:30'),
(34, 'Test ba', '0907301576', 'Bến Tre', 40, NULL, 'Test', 115000000, 4, 0, 0, '2023-06-29 11:19:05'),
(35, 'Test Một', '0909936621', 'TpHCM', 41, NULL, 'dasdadada', 23240000, 4, 0, 0, '2023-06-29 11:54:57'),
(36, 'Test Một', '0909936621', 'TpHCM', 41, NULL, NULL, 18000000, 4, 0, 0, '2023-06-29 11:58:19'),
(37, 'TEst Muoi', '0909936628', 'Tien Giang', 42, 'giam500k', 'asdadadasda', 13000000, 4, 0, 0, '2023-06-29 12:19:16'),
(38, 'Test Mười', '0349521970', 'Tiền Giang', 43, 'giam500k', 'dasdadas', 43560000, 4, 0, 0, '2023-06-29 12:27:11'),
(39, 'Tú Vinh', '0349521973', 'Tiền Giang', 38, 'giam500k', 'dadadadsd', 23000000, 4, 0, 0, '2023-06-29 12:42:51'),
(40, 'test mười một', '0909912344', 'Test mười một', 44, NULL, 'dadasd', 23000000, 4, 0, 0, '2023-07-14 20:22:50'),
(41, 'fefe', '0689589493', 'grgrfcd', 46, NULL, NULL, 14750000, 4, 2, 0, '2023-07-15 16:05:02'),
(42, 'Thanh Thiên', '0349521979', 'Tiền Giang', 47, NULL, 'dasdadasd', 57300000, 4, 0, 0, '2023-07-25 10:26:28'),
(43, 'Test Mười Hai', '0964532140', 'Tiền Giang', 48, NULL, 'dasdadd', 338000000, 4, 0, 0, '2023-07-27 19:59:10'),
(44, 'Test mười bốn', '0969874125', 'Thái Nguyên', 49, NULL, 'dasdadasdsad', 250000000, 4, 0, 0, '2023-07-27 20:01:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoice_details`
--

CREATE TABLE `invoice_details` (
  `id_invoice_details` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_products` int(11) NOT NULL,
  `guarantee` tinyint(4) NOT NULL COMMENT '	3, 6, 12...(tháng)',
  `qty` int(11) NOT NULL COMMENT '(cái)',
  `dongia` double NOT NULL COMMENT '(VND)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `invoice_details`
--

INSERT INTO `invoice_details` (`id_invoice_details`, `id_invoice`, `id_products`, `guarantee`, `qty`, `dongia`) VALUES
(248, 31, 1, 3, 1, 0),
(249, 31, 3, 6, 1, 0),
(250, 31, 5, 1, 1, 0),
(251, 31, 12, 12, 1, 23000000),
(252, 31, 2, 3, 1, 0),
(253, 31, 6, 12, 1, 10500000),
(254, 31, 1, 3, 1, 0),
(255, 31, 3, 6, 1, 0),
(256, 31, 5, 1, 1, 0),
(257, 31, 12, 12, 1, 23000000),
(258, 31, 2, 3, 1, 0),
(259, 31, 6, 12, 1, 10500000),
(281, 35, 1, 3, 1, 0),
(282, 35, 3, 6, 1, 0),
(283, 35, 4, 3, 1, 240000),
(284, 35, 5, 1, 1, 0),
(285, 35, 12, 12, 1, 23000000),
(300, 39, 1, 3, 1, 0),
(301, 39, 3, 6, 1, 0),
(302, 39, 5, 1, 1, 0),
(303, 39, 12, 12, 1, 23000000),
(308, 40, 1, 3, 1, 0),
(309, 40, 3, 6, 1, 0),
(310, 40, 5, 1, 1, 0),
(311, 40, 12, 12, 1, 23000000),
(312, 37, 2, 3, 1, 0),
(313, 37, 11, 3, 1, 13000000),
(314, 41, 3, 6, 1, 850000),
(315, 41, 2, 3, 1, 0),
(316, 41, 4, 3, 1, 0),
(317, 41, 5, 1, 1, 0),
(318, 41, 8, 3, 1, 15000000),
(319, 30, 14, 0, 1, 1000000),
(320, 33, 1, 3, 1, 0),
(321, 33, 3, 6, 1, 0),
(322, 33, 10, 24, 1, 21790000),
(323, 34, 1, 3, 5, 0),
(324, 34, 3, 6, 5, 0),
(325, 34, 5, 1, 5, 0),
(326, 34, 12, 12, 5, 23000000),
(327, 36, 1, 3, 1, 0),
(328, 36, 14, 3, 1, 18000000),
(329, 29, 2, 3, 1, 0),
(330, 29, 2, 3, 1, 0),
(331, 29, 5, 1, 1, 0),
(332, 29, 6, 12, 1, 10500000),
(333, 29, 7, 12, 1, 15150000),
(342, 42, 1, 3, 1, 0),
(343, 42, 2, 3, 1, 0),
(344, 42, 2, 3, 1, 0),
(345, 42, 2, 3, 1, 0),
(346, 42, 5, 1, 1, 0),
(347, 42, 6, 12, 1, 10500000),
(348, 42, 11, 3, 1, 13000000),
(349, 42, 16, 24, 1, 33800000),
(350, 38, 1, 3, 2, 0),
(351, 38, 3, 6, 2, 0),
(352, 38, 10, 24, 2, 21780000),
(357, 43, 1, 3, 10, 0),
(358, 43, 2, 3, 10, 0),
(359, 43, 5, 1, 10, 0),
(360, 43, 16, 24, 10, 33800000),
(365, 44, 2, 3, 20, 0),
(366, 44, 4, 3, 20, 0),
(367, 44, 5, 1, 20, 0),
(368, 44, 9, 12, 20, 12500000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `laptop`
--

CREATE TABLE `laptop` (
  `id_laptop` int(11) NOT NULL,
  `name_products` varchar(150) NOT NULL,
  `cpu` varchar(50) NOT NULL COMMENT 'core i3, core i5, core i7...',
  `ram` tinyint(4) NOT NULL COMMENT '4, 8, 16...(GB)',
  `card_laptop` tinyint(4) NOT NULL COMMENT '0 là onboard, 1 là nvidia, 2 là amd',
  `disk_laptop` smallint(6) NOT NULL COMMENT '128, 256, 512...(GB)',
  `screen` float NOT NULL COMMENT '13.3, 14.0, 15.6...(inch)',
  `demand` varchar(50) NOT NULL COMMENT 'sinh viên, đồ họa, gaming',
  `status` tinyint(4) NOT NULL COMMENT '0 là mới, 1 là cũ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `laptop`
--

INSERT INTO `laptop` (`id_laptop`, `name_products`, `cpu`, `ram`, `card_laptop`, `disk_laptop`, `screen`, `demand`, `status`) VALUES
(1, 'Laptop Acer Aspire 3', 'Intel Core i3-1005G1', 4, 0, 128, 15.6, 'Sinh Viên', 0),
(2, 'Laptop Acer Swift 4', 'Intel Core i5-1135G7', 8, 0, 256, 15.6, 'Sinh Viên', 0),
(3, 'Laptop Asus VivoBook 14', 'Intel Core i5-1240P', 8, 1, 256, 14, 'Đồ Họa', 1),
(4, 'Laptop Asus Vivobook Pro', 'Amd Ryzen 7-5800H', 8, 2, 512, 14, 'Đồ Họa', 0),
(5, 'Laptop Dell G15', 'Amd Ryzen 7-5800H', 8, 1, 512, 15.6, 'Gaming', 0),
(6, 'Laptop HP Pavilion 15', 'Amd Ryzen 5-5600H', 8, 2, 512, 15.6, 'Đồ Họa', 1),
(7, 'Laptop Msi Alpha 15', 'Amd Ryzen 7-5800H', 16, 2, 512, 15.6, 'Gaming', 0),
(8, 'Laptop HP ProBook 450', 'Intel Core i5-1135G7', 8, 0, 256, 13.4, 'Sinh Viên', 1),
(9, 'Laptop Msi Bravo 15', 'Amd Ryzen 5-5600H', 16, 2, 512, 15.6, 'Gaming', 1),
(10, 'Laptop Asus Zenbook UX3402ZA-KM218W', 'Intel Core i5 1240P', 8, 0, 512, 14, 'Đồ Họa', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `manufacturer`
--

CREATE TABLE `manufacturer` (
  `id_mfg` int(11) NOT NULL,
  `name_mfg` varchar(50) NOT NULL COMMENT 'asus, acer, dell...',
  `cat_mfg` tinyint(4) NOT NULL COMMENT '0 là hãng của laptop, 1 là hãng của phụ kiện'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `manufacturer`
--

INSERT INTO `manufacturer` (`id_mfg`, `name_mfg`, `cat_mfg`) VALUES
(1, 'ASUS', 0),
(2, 'ACER', 0),
(3, 'DELL', 0),
(4, 'HP', 0),
(5, 'MSI', 0),
(6, 'LOGITECH', 1),
(7, 'FUHLEN', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `photo`
--

CREATE TABLE `photo` (
  `id_photo` int(11) NOT NULL,
  `name_products` varchar(150) NOT NULL,
  `photo_1` varchar(255) NOT NULL COMMENT 'laptop.jpg, phim.png, chuot.jpeg...',
  `photo_2` varchar(255) DEFAULT NULL,
  `photo_3` varchar(255) DEFAULT NULL,
  `photo_4` varchar(255) DEFAULT NULL,
  `photo_5` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `photo`
--

INSERT INTO `photo` (`id_photo`, `name_products`, `photo_1`, `photo_2`, `photo_3`, `photo_4`, `photo_5`) VALUES
(1, 'Fuhlen G3 RGB Gaming', 'Fuhlen G3 RGB Gaming-1655543426-0.jpg', 'Fuhlen G3 RGB Gaming-1655543426-1.jpg', 'Fuhlen G3 RGB Gaming-1655543426-2.jpg', 'Fuhlen G3 RGB Gaming-1655543426-3.jpg', 'Fuhlen G3 RGB Gaming-1655543426-4.jpg'),
(2, 'Logitech B175 Optical Wireless', 'Logitech B175 Optical Wireless-1655543512-0.jpg', 'Logitech B175 Optical Wireless-1655543512-1.jpg', 'Logitech B175 Optical Wireless-1655543512-2.jpg', 'Logitech B175 Optical Wireless-1655543512-3.jpg', NULL),
(3, 'Fuhlen Destroyer RGB Gaming', 'Fuhlen Destroyer RGB Gaming-1655543599-0.jpg', 'Fuhlen Destroyer RGB Gaming-1655543599-1.jpg', 'Fuhlen Destroyer RGB Gaming-1655543599-2.jpg', 'Fuhlen Destroyer RGB Gaming-1655543599-3.jpg', 'Fuhlen Destroyer RGB Gaming-1655543599-4.jpg'),
(4, 'Logitech K270 Optical Wireless', 'Logitech K270 Optical Wireless-1655543665-0.jpg', 'Logitech K270 Optical Wireless-1655543665-1.jpg', 'Logitech K270 Optical Wireless-1655543665-2.jpg', 'Logitech K270 Optical Wireless-1655543665-3.jpg', NULL),
(5, 'Logitech H111 Stereo Headset', 'Logitech H111 Stereo Headset-1655543814-0.jpg', 'Logitech H111 Stereo Headset-1655543814-1.jpg', 'Logitech H111 Stereo Headset-1655543814-2.jpg', 'Logitech H111 Stereo Headset-1655543814-3.jpg', 'Logitech H111 Stereo Headset-1655543814-4.jpg'),
(6, 'Laptop Acer Aspire 3 A315 56 37DV', 'Laptop Acer Aspire 3 A315 56 37DV-1655646705-0.jpg', 'Laptop Acer Aspire 3 A315 56 37DV-1655646705-1.jpg', 'Laptop Acer Aspire 3 A315 56 37DV-1655646705-2.jpg', 'Laptop Acer Aspire 3 A315 56 37DV-1655646705-3.jpg', NULL),
(7, 'Laptop Acer Aspire 3 A315 58 53S6', 'Laptop Acer Aspire 3 A315 58 53S6-1655647280-0.png', 'Laptop Acer Aspire 3 A315 58 53S6-1655647280-1.png', 'Laptop Acer Aspire 3 A315 58 53S6-1655647280-2.png', 'Laptop Acer Aspire 3 A315 58 53S6-1655647280-3.png', 'Laptop Acer Aspire 3 A315 58 53S6-1655647280-4.png'),
(8, 'Laptop Asus VivoBook 14 X1402ZA EK084W', 'Laptop Asus VivoBook 14 X1402ZA EK084W-1655647401-0.png', 'Laptop Asus VivoBook 14 X1402ZA EK084W-1655647401-1.png', 'Laptop Asus VivoBook 14 X1402ZA EK084W-1655647401-2.png', 'Laptop Asus VivoBook 14 X1402ZA EK084W-1655647401-3.png', 'Laptop Asus VivoBook 14 X1402ZA EK084W-1655647401-4.png'),
(9, 'Laptop Asus Vivobook Pro M3401QA KM040W', 'Laptop Asus Vivobook Pro M3401QA KM040W-1655647504-0.jpg', 'Laptop Asus Vivobook Pro M3401QA KM040W-1655647504-1.jpg', 'Laptop Asus Vivobook Pro M3401QA KM040W-1655647504-2.jpg', 'Laptop Asus Vivobook Pro M3401QA KM040W-1655647504-3.jpg', 'Laptop Asus Vivobook Pro M3401QA KM040W-1655647504-4.jpg'),
(10, 'Laptop Dell G15 5515 P105F004 70266674', 'Laptop Dell G15 5515 P105F004 70266674-1655647638-0.png', 'Laptop Dell G15 5515 P105F004 70266674-1655647638-1.png', 'Laptop Dell G15 5515 P105F004 70266674-1655647638-2.png', 'Laptop Dell G15 5515 P105F004 70266674-1655647638-3.png', 'Laptop Dell G15 5515 P105F004 70266674-1655647638-4.png'),
(11, 'Laptop HP Pavilion 15 EG0513TU 46M12PA', 'Laptop HP Pavilion 15 EG0513TU 46M12PA-1655647795-0.jpg', 'Laptop HP Pavilion 15 EG0513TU 46M12PA-1655647795-1.jpg', 'Laptop HP Pavilion 15 EG0513TU 46M12PA-1655647795-2.jpg', 'Laptop HP Pavilion 15 EG0513TU 46M12PA-1655647795-3.jpg', 'Laptop HP Pavilion 15 EG0513TU 46M12PA-1655647795-4.jpg'),
(12, 'Laptop Msi Alpha 15 B5EEK 205VN', 'Laptop Msi Alpha 15 B5EEK 205VN-1655647902-0.png', 'Laptop Msi Alpha 15 B5EEK 205VN-1655647902-1.png', 'Laptop Msi Alpha 15 B5EEK 205VN-1655647902-2.png', 'Laptop Msi Alpha 15 B5EEK 205VN-1655647902-3.png', 'Laptop Msi Alpha 15 B5EEK 205VN-1655647902-4.png'),
(13, 'Laptop HP ProBook 450 G8 614K3PA', 'Laptop HP ProBook 450 G8 614K3PA-1655648017-0.jpg', 'Laptop HP ProBook 450 G8 614K3PA-1655648017-1.jpg', 'Laptop HP ProBook 450 G8 614K3PA-1655648017-2.jpg', 'Laptop HP ProBook 450 G8 614K3PA-1655648017-3.jpg', NULL),
(14, 'Laptop Msi Bravo 15 B5DD 276VN', 'Laptop Msi Bravo 15 B5DD 276VN-1655648098-0.jpg', 'Laptop Msi Bravo 15 B5DD 276VN-1655648098-1.jpg', 'Laptop Msi Bravo 15 B5DD 276VN-1655648098-2.jpg', 'Laptop Msi Bravo 15 B5DD 276VN-1655648098-3.jpg', 'Laptop Msi Bravo 15 B5DD 276VN-1655648098-4.jpg'),
(16, 'Laptop Asus Zenbook UX3402ZA-KM218W', 'Laptop Asus Zenbook UX3402ZA-KM218W-1689344262-0.png', 'Laptop Asus Zenbook UX3402ZA-KM218W-1689344262-1.png', 'Laptop Asus Zenbook UX3402ZA-KM218W-1689344262-2.png', 'Laptop Asus Zenbook UX3402ZA-KM218W-1689344262-3.png', 'Laptop Asus Zenbook UX3402ZA-KM218W-1689344262-4.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id_products` int(11) NOT NULL,
  `name_products` varchar(150) NOT NULL COMMENT 'vivobook, swift, thinkpad...',
  `guarantee` tinyint(4) NOT NULL COMMENT '3, 6, 12...(tháng)',
  `describes` varchar(1024) DEFAULT NULL,
  `qty` int(11) NOT NULL COMMENT '12, 35, 0...(cái)',
  `entry_price` double NOT NULL COMMENT 'giá nhập hàng (VND)',
  `sale_price` double NOT NULL COMMENT 'giá bán cho khách (VND)',
  `promotional_price` double DEFAULT NULL COMMENT 'giá khuyến mãi nếu có sản phẩm sẽ dc bán theo giá này (VND)',
  `id_photo` int(11) DEFAULT NULL,
  `id_mfg` int(11) DEFAULT NULL,
  `id_gift` int(11) DEFAULT NULL,
  `id_laptop` int(11) DEFAULT NULL,
  `id_accessory` int(11) DEFAULT NULL,
  `cat_products` tinyint(4) NOT NULL COMMENT '0 là laptop, 1 là phụ kiện',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id_products`, `name_products`, `guarantee`, `describes`, `qty`, `entry_price`, `sale_price`, `promotional_price`, `id_photo`, `id_mfg`, `id_gift`, `id_laptop`, `id_accessory`, `cat_products`, `date_created`) VALUES
(1, 'Chuột Fuhlen G3', 3, 'Chuột Fuhlen G3 gaming dành cho game thủ. Bảo hành 3 tháng', 25, 100000, 350000, 320000, 1, 7, 1, NULL, 1, 1, '2022-06-18 16:10:26'),
(2, 'Chuột Logitech B175', 3, 'Chuột Logitech B175 văn phòng không dây bảo hành 3 tháng', 11, 100000, 130000, NULL, 2, 6, 2, NULL, 2, 1, '2022-06-18 16:11:52'),
(3, 'Phím Fuhlen Destroyer', 6, 'bàn phím Fuhlen Destroyer cơ gaming dành cho game thủ. bảo hành 6 tháng', 36, 100000, 850000, NULL, 3, 7, 3, NULL, 3, 1, '2022-06-18 16:13:19'),
(4, 'Phím Logitech K270', 3, 'phím văn phòng không dây. Bàn Phím Logitech K270\r\nbảo hành 3 tháng', 28, 100000, 240000, NULL, 4, 6, 4, NULL, 4, 1, '2022-06-18 16:14:25'),
(5, 'Tai Nghe Logitech H111', 1, 'tai nghe thích hợp cho việc học online có mic đàm thoại\r\nTai Nghe Logitech H111\r\nbảo hành 1 tháng', 27, 100000, 130000, 113000, 5, 6, 5, NULL, 5, 1, '2022-06-18 16:16:13'),
(6, 'Laptop Acer Aspire 3', 12, 'Trang bị bộ vi xử lý Intel thế hệ thứ 10 Ice Lake mới nhất, ổ cứng SSD siêu tốc và màn hình Full HD tuyệt đẹp, Acer Aspire 3 A315 56 37DV là chiếc laptop đáp ứng tốt công việc và giải trí của bạn trong tầm giá hấp dẫn.\r\nBảo hành 12 tháng. CPU Intel Core i3-1005G1. RAM 4 GB. Nhu cầu sinh viên. Tình trạng mới. Ổ cứng 128 GB. Màn hình 15,6 15.6 inch. Card đồ hoạ Onboard.', 46, 10000000, 12000000, 10500000, 6, 2, 6, 1, NULL, 0, '2022-06-19 20:51:45'),
(7, 'Laptop Acer Swift 4', 12, 'Nổi tiếng trong dòng laptop văn phòng với thiết kế mỏng nhẹ đi cùng giá thành hợp lý, Acer Aspire 3 luôn là lựa chọn hàng đầu dành cho người dùng. A315 58 53S6 sở hữu chip Intel Gen 11 mới nhất hiện nay cùng nhiều tính năng vượt trội.\r\nBảo hành 12 tháng. CPU Intel Core i5-1135G7. RAM 8GB. Nhu cầu sinh viên. Tình trạng mới. Ổ cứng 256 GB. Màn hình 15,6 15.6 inch. Card đồ hoạ Onboard.', 49, 10000000, 16000000, 15150000, 7, 2, 7, 2, NULL, 0, '2022-06-19 21:01:20'),
(8, 'Laptop Asus VivoBook 14', 3, 'Một trong những sản phẩm laptop cho sinh viên được đánh giá cao là Asus VivoBook X1402ZA EK084W. Thiết kế nhỏ gọn, cấu hình mạnh đáp ứng mọi yêu cầu từ học tập đến làm việc hay giải trí.\r\nBảo hành 3 tháng. CPU Intel Core i5-1240P. RAM 8GB. Nhu cầu đồ hoạ. Tình trạng cũ. Ổ cứng 256 GB. Màn hình 14 inch. Card đồ hoạ Nviadia.', 49, 10000000, 15000000, 13900000, 8, 1, 8, 3, NULL, 0, '2022-06-19 21:03:21'),
(9, 'Laptop Asus Vivobook Pro', 12, 'Laptop Asus Vivobook Pro M3401QA KM040W là chiếc laptop văn phòng thiết kế mỏng nhẹ nhưng lại sở hữu cấu hình cực mạng và đạt hiệu suất làm việc cao. Màn hình OLED được thiết kế sinh động mang đến những trải nghiệm tốt nhất cho người dùng.\r\nBảo hành 12 tháng. CPU Amd Ryzen 7-5800H. RAM 8GB. Nhu cầu đồ hoạ. Tình trạng mới. Ổ cứng 512 GB. Màn hình 14 inch. Card đồ hoạ Amd.', 30, 10000000, 13000000, 12500000, 9, 1, 9, 4, NULL, 0, '2022-06-19 21:05:04'),
(10, 'Laptop Dell G15', 24, 'Dell G15 5515 P105F004 70266674 nằm trong phân khúc laptop gaming 20 đến 25 triệu. Thiết kế kiểu dáng đẹp mắt với những tính năng vượt trội đây sẽ là một lựa chọn hoàn hảo dành riêng cho các game thủ.\r\nBảo hành 24 tháng. CPU Amd Ryzen 7-5800H. RAM 8 GB. Nhu cầu đồ hoạ. Tình trạng mới. Ổ cứng 512 GB. Màn hình 15,6 15.6 inch. Card đồ hoạ Nvidia.', 47, 10000000, 22000000, 21780000, 10, 3, 10, 5, NULL, 0, '2022-06-19 21:07:06'),
(11, 'Laptop HP Pavilion 15', 3, 'Laptop HP Pavilion 15 EG0513TU 46M12PA là mẫu laptop cho sinh viên, nhân viên văn phòng tầm trung rất được chú ý bởi thiết kế và hiệu năng mạnh mẽ của mình.\r\nBảo hành 3 tháng. CPU Amd Ryzen 5-5600H. RAM 8 GB. Nhu cầu đồ hoạ. Tình trạng cũ. Ổ cứng 512 GB. Màn hình 15,6 15.6 inch. Card đồ hoạ Amd.', 48, 10000000, 13000000, NULL, 11, 4, 11, 6, NULL, 0, '2022-06-19 21:09:55'),
(12, 'Laptop Msi Alpha 15', 12, 'Laptop MSI Alpha 15 B5EEK 205VN là dòng laptop gaming luôn được các game thủ tin tưởng và yêu thích bởi sức mạnh không ngừng được cải thiện và thông số kỹ thuật tuyệt vời. MSI Alpha 15 là sự lựa chọn hợp lý cho các game thủ chuyên nghiệp.\r\nBảo hành 12 tháng. CPU Amd Ryzen 7-5800H. RAM 16 GB. Nhu cầu gaming game. Tình trạng mới. Ổ cứng 512 GB. Màn hình 15,6 15.6 inch. Card đồ hoạ Amd.', 40, 10000000, 23000000, NULL, 12, 5, 12, 7, NULL, 0, '2022-06-19 21:11:42'),
(13, 'Laptop HP ProBook 450', 3, 'Laptop HP ProBook 450 có kiểu dáng bắt mắt với thân máy siêu mỏng, hoàn thiện từ vỏ nhôm nguyên khối sang trọng. Phiên bản màu bạc thời trang, logo HP nổi bật bóng bẩy cùng viền màn hình mỏng hai cạnh thể hiện sự hiện đại và thời thượng.\r\nBảo hành 3 tháng. CPU Intel Core i5-1135G7. RAM 8 GB. Nhu cầu sinh viên. Tình trạng cũ. Ổ cứng 256 GB. Màn hình 13,4 13.4 inch. Card đồ hoạ Onboard.', 50, 10000000, 13000000, NULL, 13, 4, 13, 8, NULL, 0, '2022-06-19 21:13:37'),
(14, 'Laptop Msi Bravo 15', 3, 'Phục kích ở nơi hiểm yếu, quan sát kĩ càng kẻ địch trước khi xuất trận mạnh mẽ, MSI Bravo 15 B5DD 276VN đã sẵn sàng cho chiến trường game rực lửa. Kết hợp hoàn hảo giữa vi xử lí AMD Ryzen 5 5600H và card đồ họa AMD Radeon RX 5500M. \r\nBảo hành 3 tháng. CPU Amd Ryzen 5-5600H. RAM 16 GB. Nhu cầu gaming game. Tình trạng cũ. Ổ cứng 516 GB. Màn hình 15,6 15.6 inch. Card đồ hoạ Amd.', 48, 10000000, 18000000, NULL, 14, 5, 14, 9, NULL, 0, '2022-06-19 21:14:58'),
(16, 'Laptop Asus Zenbook UX3402ZA-KM218W', 24, 'ASUS Zenbook UX3402ZA-KM218W là CPU Intel Core i5 1240P.RAM 8GB. Ổ cứng 512GB. Card đồ hoạ onboard.Một chiếc Zenbook đầy đột phá so với những gì bạn từng biết trước đây.  Bảo hành 24 tháng. CPU Intel Core i5 1240P. RAM 8GB. Nhu cầu đồ hoạ. Tình trạng mới. Ổ cứng 512 GB. Màn hình 14 inch. Card đồ hoạ Onboard.', 9, 26000000, 33800000, NULL, 16, 1, 16, 10, NULL, 0, '2023-07-14 21:17:42');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `purchase_order`
--

CREATE TABLE `purchase_order` (
  `id_purchase_order` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `total_money` double NOT NULL COMMENT '(VND)',
  `debt` double NOT NULL COMMENT '0 là đã thanh toán, !=0 là công nợ',
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `purchase_order`
--

INSERT INTO `purchase_order` (`id_purchase_order`, `id_users`, `note`, `total_money`, `debt`, `date_created`) VALUES
(4, 3, 'NHập laptop', 4500000000, 0, '2023-06-29 11:30:38'),
(5, 3, 'Nhập phụ kiện', 27000000, 0, '2023-06-29 11:41:01'),
(6, 45, 'đã thanh toán', 520000000, 0, '2023-07-14 21:19:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `purchase_order_details`
--

CREATE TABLE `purchase_order_details` (
  `id_purchase_order_details` int(11) NOT NULL,
  `id_purchase_order` int(11) NOT NULL,
  `id_products` int(11) NOT NULL,
  `qty` int(11) NOT NULL COMMENT '(cái)',
  `dongia` double NOT NULL COMMENT '(VND)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `purchase_order_details`
--

INSERT INTO `purchase_order_details` (`id_purchase_order_details`, `id_purchase_order`, `id_products`, `qty`, `dongia`) VALUES
(57, 4, 14, 50, 10000000),
(58, 4, 13, 50, 10000000),
(59, 4, 12, 50, 10000000),
(60, 4, 11, 50, 10000000),
(61, 4, 10, 50, 10000000),
(62, 4, 9, 50, 10000000),
(63, 4, 8, 50, 10000000),
(64, 4, 7, 50, 10000000),
(65, 4, 6, 50, 10000000),
(71, 6, 16, 20, 26000000),
(82, 5, 1, 50, 100000),
(83, 5, 2, 50, 100000),
(84, 5, 3, 50, 100000),
(85, 5, 4, 50, 100000),
(86, 5, 5, 70, 100000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id_users` int(11) NOT NULL,
  `name_users` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL COMMENT '10 ký tự, có số 0 ở ký tự đầu',
  `address` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0 là bị khóa, 1 là đang hoạt động',
  `roles` tinyint(4) NOT NULL COMMENT '0 là khách hàng, 1 là đối tác, 2 là nhân viên',
  `email` varchar(150) DEFAULT NULL COMMENT 'phải chứa @',
  `password` varchar(60) DEFAULT NULL COMMENT '8-32 ký tự, gồm chữ thường, chữ hoa và số (mã hóa kiểu bcrypt)',
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id_users`, `name_users`, `phone`, `address`, `status`, `roles`, `email`, `password`, `date_created`) VALUES
(1, 'Nguyễn Võ Duy Tú Vinh', '0967087508', '41 đường 232 Cao Lỗ phường 4 Quận 8 TpHCM', 1, 2, 'tuvinh0106@gmail.com', '$2y$10$bYUnHAGch.tOj.lCY6IjMO8f8hvaCMETE5Fcy8pyT.EJrrulvmH9i', '2022-06-22 09:12:34'),
(2, 'Nguyễn Thanh Quân', '0907301573', 'TpHCM', 1, 0, 'quan@gmail.com', '$2y$10$bYUnHAGch.tOj.lCY6IjMO8f8hvaCMETE5Fcy8pyT.EJrrulvmH9i', '2022-06-22 09:13:09'),
(3, 'Shop Vi Tính', '0909123456', 'TpHCM', 1, 1, NULL, NULL, '2022-06-22 15:50:53'),
(4, 'Trường Đại Học STU', '0880123456', '180 Cao Lỗ, P4, Q8, HCM', 1, 0, NULL, NULL, '2022-06-22 15:51:37'),
(20, 'Admin Vi Tính Shop', '0123123123', '41 đường 232 Cao Lỗ phường 4 Quận 8 TpHCM', 1, 2, 'admin@gmail.com', '$2y$10$bYUnHAGch.tOj.lCY6IjMO8f8hvaCMETE5Fcy8pyT.EJrrulvmH9i', '2022-07-04 03:07:37'),
(37, 'Test mot', '0907301577', 'Test', 1, 0, 'test1@gmail.com', '$2y$10$UD7nX59sfI6kOc8smlXdHOlNjkt2Xkifbbn6Y.366Jx4XZrhViZte', '2023-06-28 21:12:32'),
(38, 'Tú Vinh', '0349521973', 'Tiền Giang', 1, 0, 'vinh@gmail.com', '$2y$10$3HXmAQg5qLgx/McYjBbo5eqnYujc6bi1Bd4ohThmFzRKr7xXt53uK', '2023-06-28 21:43:13'),
(39, 'Test hai', '0907301579', 'Tiền Gian', 1, 0, NULL, NULL, '2023-06-29 11:18:30'),
(40, 'Test ba', '0907301576', 'Bến Tre', 1, 0, NULL, NULL, '2023-06-29 11:19:05'),
(41, 'Test Một', '0909936621', 'TpHCM', 1, 0, 'test10@gmail.com', '$2y$10$Qswlm.F0UVfP2VLXdQvfVOl.MW/ZmDqnwAvWPEDq.amEL2.9CxlMi', '2023-06-29 11:53:55'),
(42, 'TEst Muoi', '0909936628', 'Tien Giang', 1, 0, NULL, NULL, '2023-06-29 12:19:16'),
(43, 'Test Mười', '0349521970', 'Tiền Giang', 1, 0, NULL, NULL, '2023-06-29 12:27:11'),
(44, 'test mười một', '0909912344', 'Test mười một', 1, 0, NULL, NULL, '2023-07-14 20:22:50'),
(45, 'Shop Vi Tính Hai', '0907301572', 'Tiền Giang', 1, 1, NULL, NULL, '2023-07-14 21:18:59'),
(46, 'fefe', '0689589493', 'grgrfcd', 1, 0, NULL, NULL, '2023-07-15 16:05:02'),
(47, 'Thanh Thiên', '0349521979', 'Tiền Giang', 1, 0, NULL, NULL, '2023-07-25 10:26:28'),
(48, 'Test Mười Hai', '0964532140', 'Tiền Giang', 1, 0, NULL, NULL, '2023-07-27 19:59:10'),
(49, 'Test mười bốn', '0969874125', 'Thái Nguyên', 1, 0, NULL, NULL, '2023-07-27 20:01:07');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `accessory`
--
ALTER TABLE `accessory`
  ADD PRIMARY KEY (`id_accessory`);

--
-- Chỉ mục cho bảng `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id_discount`);

--
-- Chỉ mục cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id_feedback`),
  ADD KEY `id_users` (`id_users`);

--
-- Chỉ mục cho bảng `gift`
--
ALTER TABLE `gift`
  ADD PRIMARY KEY (`id_gift`);

--
-- Chỉ mục cho bảng `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id_invoice`),
  ADD KEY `id_users` (`id_users`,`id_discount`),
  ADD KEY `makhuyenmai` (`id_discount`);

--
-- Chỉ mục cho bảng `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD PRIMARY KEY (`id_invoice_details`),
  ADD KEY `madonhang` (`id_invoice`,`id_products`),
  ADD KEY `id_products` (`id_products`);

--
-- Chỉ mục cho bảng `laptop`
--
ALTER TABLE `laptop`
  ADD PRIMARY KEY (`id_laptop`);

--
-- Chỉ mục cho bảng `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`id_mfg`);

--
-- Chỉ mục cho bảng `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`id_photo`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_products`),
  ADD KEY `id_mfg` (`id_mfg`),
  ADD KEY `id_gift` (`id_gift`),
  ADD KEY `mahinh` (`id_photo`),
  ADD KEY `id_laptop` (`id_laptop`),
  ADD KEY `id_accessory` (`id_accessory`);

--
-- Chỉ mục cho bảng `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD PRIMARY KEY (`id_purchase_order`),
  ADD KEY `id_users` (`id_users`);

--
-- Chỉ mục cho bảng `purchase_order_details`
--
ALTER TABLE `purchase_order_details`
  ADD PRIMARY KEY (`id_purchase_order_details`),
  ADD KEY `id_purchase_order` (`id_purchase_order`,`id_products`),
  ADD KEY `id_products` (`id_products`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_users`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `accessory`
--
ALTER TABLE `accessory`
  MODIFY `id_accessory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id_feedback` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `gift`
--
ALTER TABLE `gift`
  MODIFY `id_gift` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id_invoice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT cho bảng `invoice_details`
--
ALTER TABLE `invoice_details`
  MODIFY `id_invoice_details` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=369;

--
-- AUTO_INCREMENT cho bảng `laptop`
--
ALTER TABLE `laptop`
  MODIFY `id_laptop` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `id_mfg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `photo`
--
ALTER TABLE `photo`
  MODIFY `id_photo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id_products` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `purchase_order`
--
ALTER TABLE `purchase_order`
  MODIFY `id_purchase_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `purchase_order_details`
--
ALTER TABLE `purchase_order_details`
  MODIFY `id_purchase_order_details` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`);

--
-- Các ràng buộc cho bảng `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`id_discount`) REFERENCES `discount` (`id_discount`);

--
-- Các ràng buộc cho bảng `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD CONSTRAINT `invoice_details_ibfk_1` FOREIGN KEY (`id_invoice`) REFERENCES `invoice` (`id_invoice`),
  ADD CONSTRAINT `invoice_details_ibfk_2` FOREIGN KEY (`id_products`) REFERENCES `products` (`id_products`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_mfg`) REFERENCES `manufacturer` (`id_mfg`),
  ADD CONSTRAINT `products_ibfk_3` FOREIGN KEY (`id_gift`) REFERENCES `gift` (`id_gift`),
  ADD CONSTRAINT `products_ibfk_4` FOREIGN KEY (`id_photo`) REFERENCES `photo` (`id_photo`),
  ADD CONSTRAINT `products_ibfk_5` FOREIGN KEY (`id_laptop`) REFERENCES `laptop` (`id_laptop`),
  ADD CONSTRAINT `products_ibfk_6` FOREIGN KEY (`id_accessory`) REFERENCES `accessory` (`id_accessory`);

--
-- Các ràng buộc cho bảng `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD CONSTRAINT `purchase_order_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`);

--
-- Các ràng buộc cho bảng `purchase_order_details`
--
ALTER TABLE `purchase_order_details`
  ADD CONSTRAINT `purchase_order_details_ibfk_1` FOREIGN KEY (`id_purchase_order`) REFERENCES `purchase_order` (`id_purchase_order`),
  ADD CONSTRAINT `purchase_order_details_ibfk_2` FOREIGN KEY (`id_products`) REFERENCES `products` (`id_products`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
