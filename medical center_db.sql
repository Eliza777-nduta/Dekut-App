-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2024 at 05:41 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edoc`
--
CREATE DATABASE IF NOT EXISTS `edoc` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `edoc`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `aemail` varchar(255) NOT NULL,
  `apassword` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`aemail`, `apassword`) VALUES
('admin@edoc.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appoid` int(11) NOT NULL,
  `pid` int(10) DEFAULT NULL,
  `apponum` int(3) DEFAULT NULL,
  `scheduleid` int(10) DEFAULT NULL,
  `appodate` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appoid`, `pid`, `apponum`, `scheduleid`, `appodate`) VALUES
(1, 1, 1, 1, '2022-06-03');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `docid` int(11) NOT NULL,
  `docemail` varchar(255) DEFAULT NULL,
  `docname` varchar(255) DEFAULT NULL,
  `docpassword` varchar(255) DEFAULT NULL,
  `docnic` varchar(15) DEFAULT NULL,
  `doctel` varchar(15) DEFAULT NULL,
  `specialties` int(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`docid`, `docemail`, `docname`, `docpassword`, `docnic`, `doctel`, `specialties`) VALUES
(1, 'doctor@edoc.com', 'Test Doctor', '123', '000000000', '0110000000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `pid` int(11) NOT NULL,
  `pemail` varchar(255) DEFAULT NULL,
  `pname` varchar(255) DEFAULT NULL,
  `ppassword` varchar(255) DEFAULT NULL,
  `paddress` varchar(255) DEFAULT NULL,
  `pnic` varchar(15) DEFAULT NULL,
  `pdob` date DEFAULT NULL,
  `ptel` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`pid`, `pemail`, `pname`, `ppassword`, `paddress`, `pnic`, `pdob`, `ptel`) VALUES
(1, 'patient@edoc.com', 'Test Patient', '123', 'Sri Lanka', '0000000000', '2000-01-01', '0120000000'),
(2, 'emhashenudara@gmail.com', 'Hashen Udara', '123', 'Sri Lanka', '0110000000', '2022-06-03', '0700000000');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `scheduleid` int(11) NOT NULL,
  `docid` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `scheduledate` date DEFAULT NULL,
  `scheduletime` time DEFAULT NULL,
  `nop` int(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`scheduleid`, `docid`, `title`, `scheduledate`, `scheduletime`, `nop`) VALUES
(1, '1', 'Test Session', '2050-01-01', '18:00:00', 50),
(2, '1', '1', '2022-06-10', '20:36:00', 1),
(3, '1', '12', '2022-06-10', '20:33:00', 1),
(4, '1', '1', '2022-06-10', '12:32:00', 1),
(5, '1', '1', '2022-06-10', '20:35:00', 1),
(6, '1', '12', '2022-06-10', '20:35:00', 1),
(7, '1', '1', '2022-06-24', '20:36:00', 1),
(8, '1', '12', '2022-06-10', '13:33:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `specialties`
--

CREATE TABLE `specialties` (
  `id` int(2) NOT NULL,
  `sname` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `specialties`
--

INSERT INTO `specialties` (`id`, `sname`) VALUES
(1, 'Accident and emergency medicine'),
(2, 'Allergology'),
(3, 'Anaesthetics'),
(4, 'Biological hematology'),
(5, 'Cardiology'),
(6, 'Child psychiatry'),
(7, 'Clinical biology'),
(8, 'Clinical chemistry'),
(9, 'Clinical neurophysiology'),
(10, 'Clinical radiology'),
(11, 'Dental, oral and maxillo-facial surgery'),
(12, 'Dermato-venerology'),
(13, 'Dermatology'),
(14, 'Endocrinology'),
(15, 'Gastro-enterologic surgery'),
(16, 'Gastroenterology'),
(17, 'General hematology'),
(18, 'General Practice'),
(19, 'General surgery'),
(20, 'Geriatrics'),
(21, 'Immunology'),
(22, 'Infectious diseases'),
(23, 'Internal medicine'),
(24, 'Laboratory medicine'),
(25, 'Maxillo-facial surgery'),
(26, 'Microbiology'),
(27, 'Nephrology'),
(28, 'Neuro-psychiatry'),
(29, 'Neurology'),
(30, 'Neurosurgery'),
(31, 'Nuclear medicine'),
(32, 'Obstetrics and gynecology'),
(33, 'Occupational medicine'),
(34, 'Ophthalmology'),
(35, 'Orthopaedics'),
(36, 'Otorhinolaryngology'),
(37, 'Paediatric surgery'),
(38, 'Paediatrics'),
(39, 'Pathology'),
(40, 'Pharmacology'),
(41, 'Physical medicine and rehabilitation'),
(42, 'Plastic surgery'),
(43, 'Podiatric Medicine'),
(44, 'Podiatric Surgery'),
(45, 'Psychiatry'),
(46, 'Public health and Preventive Medicine'),
(47, 'Radiology'),
(48, 'Radiotherapy'),
(49, 'Respiratory medicine'),
(50, 'Rheumatology'),
(51, 'Stomatology'),
(52, 'Thoracic surgery'),
(53, 'Tropical medicine'),
(54, 'Urology'),
(55, 'Vascular surgery'),
(56, 'Venereology');

-- --------------------------------------------------------

--
-- Table structure for table `webuser`
--

CREATE TABLE `webuser` (
  `email` varchar(255) NOT NULL,
  `usertype` char(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `webuser`
--

INSERT INTO `webuser` (`email`, `usertype`) VALUES
('admin@edoc.com', 'a'),
('doctor@edoc.com', 'd'),
('patient@edoc.com', 'p'),
('emhashenudara@gmail.com', 'p');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`aemail`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appoid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `scheduleid` (`scheduleid`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`docid`),
  ADD KEY `specialties` (`specialties`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`scheduleid`),
  ADD KEY `docid` (`docid`);

--
-- Indexes for table `specialties`
--
ALTER TABLE `specialties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `webuser`
--
ALTER TABLE `webuser`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `docid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `scheduleid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Database: `hmisphp`
--
CREATE DATABASE IF NOT EXISTS `hmisphp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hmisphp`;

-- --------------------------------------------------------

--
-- Table structure for table `his_accounts`
--

CREATE TABLE `his_accounts` (
  `acc_id` int(200) NOT NULL,
  `acc_name` varchar(200) DEFAULT NULL,
  `acc_desc` text DEFAULT NULL,
  `acc_type` varchar(200) DEFAULT NULL,
  `acc_number` varchar(200) DEFAULT NULL,
  `acc_amount` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `his_accounts`
--

INSERT INTO `his_accounts` (`acc_id`, `acc_name`, `acc_desc`, `acc_type`, `acc_number`, `acc_amount`) VALUES
(1, 'Individual Retirement Account', '<p>IRA&rsquo;s are simply an account where you stash your money for retirement. The concept is pretty simple, your account balance is not taxed UNTIL you withdraw, at which point you pay the taxes there. This allows you to grow your account with interest without taxes taking away from the balance. The net result is you earn more money.</p>', 'Payable Account', '518703294', '25000'),
(2, 'Equity Bank', '<p>Find <em>bank account</em> stock <em>images</em> in HD and millions of other royalty-free stock photos, illustrations and vectors in the Shutterstock collection. Thousands of new</p>', 'Receivable Account', '753680912', '12566'),
(3, 'Test Account Name', '<p>This is a demo test</p>', 'Payable Account', '620157843', '1100');

-- --------------------------------------------------------

--
-- Table structure for table `his_admin`
--

CREATE TABLE `his_admin` (
  `ad_id` int(20) NOT NULL,
  `ad_fname` varchar(200) DEFAULT NULL,
  `ad_lname` varchar(200) DEFAULT NULL,
  `ad_email` varchar(200) DEFAULT NULL,
  `ad_pwd` varchar(200) DEFAULT NULL,
  `ad_dpic` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `his_admin`
--

INSERT INTO `his_admin` (`ad_id`, `ad_fname`, `ad_lname`, `ad_email`, `ad_pwd`, `ad_dpic`) VALUES
(1, 'System', 'Administrator', 'admin@mail.com', '4c7f5919e957f354d57243d37f223cf31e9e7181', 'doc-icon.png');

-- --------------------------------------------------------

--
-- Table structure for table `his_assets`
--

CREATE TABLE `his_assets` (
  `asst_id` int(20) NOT NULL,
  `asst_name` varchar(200) DEFAULT NULL,
  `asst_desc` longtext DEFAULT NULL,
  `asst_vendor` varchar(200) DEFAULT NULL,
  `asst_status` varchar(200) DEFAULT NULL,
  `asst_dept` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `his_docs`
--

CREATE TABLE `his_docs` (
  `doc_id` int(20) NOT NULL,
  `doc_fname` varchar(200) DEFAULT NULL,
  `doc_lname` varchar(200) DEFAULT NULL,
  `doc_email` varchar(200) DEFAULT NULL,
  `doc_pwd` varchar(200) DEFAULT NULL,
  `doc_dept` varchar(200) DEFAULT NULL,
  `doc_number` varchar(200) DEFAULT NULL,
  `doc_dpic` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `his_docs`
--

INSERT INTO `his_docs` (`doc_id`, `doc_fname`, `doc_lname`, `doc_email`, `doc_pwd`, `doc_dept`, `doc_number`, `doc_dpic`) VALUES
(5, 'Aletha', 'White', 'aletha@mail.com', 'dce0b27ba675df41e9cc07af80ec59c475810824', 'Laboratory', 'BKTWQ', 'defaultimg.jpg'),
(6, 'Bryan', 'Arreola', 'bryan@mail.com', '55c3b5386c486feb662a0785f340938f518d547f', 'Surgery | Theatre', 'YDS7L', 'user-default-2-min.png'),
(12, 'Jessica', 'Spencer', 'jessica@mail.com', 'dce0b27ba675df41e9cc07af80ec59c475810824', 'Accounting', '5VIFT', 'usric.png');

-- --------------------------------------------------------

--
-- Table structure for table `his_equipments`
--

CREATE TABLE `his_equipments` (
  `eqp_id` int(20) NOT NULL,
  `eqp_code` varchar(200) DEFAULT NULL,
  `eqp_name` varchar(200) DEFAULT NULL,
  `eqp_vendor` varchar(200) DEFAULT NULL,
  `eqp_desc` longtext DEFAULT NULL,
  `eqp_dept` varchar(200) DEFAULT NULL,
  `eqp_status` varchar(200) DEFAULT NULL,
  `eqp_qty` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `his_equipments`
--

INSERT INTO `his_equipments` (`eqp_id`, `eqp_code`, `eqp_name`, `eqp_vendor`, `eqp_desc`, `eqp_dept`, `eqp_status`, `eqp_qty`) VALUES
(2, '178640239', 'TestTubes', 'Casio', '<p>Testtubes are used to perform lab tests--</p>', 'Laboratory', 'Functioning', '700000'),
(3, '052367981', 'Surgical Robot', 'Nexus', '<p>Surgical Robots aid in surgey process.</p>', 'Surgical | Theatre', 'Functioning', '100');

-- --------------------------------------------------------

--
-- Table structure for table `his_laboratory`
--

CREATE TABLE `his_laboratory` (
  `lab_id` int(20) NOT NULL,
  `lab_pat_name` varchar(200) DEFAULT NULL,
  `lab_pat_ailment` varchar(200) DEFAULT NULL,
  `lab_pat_number` varchar(200) DEFAULT NULL,
  `lab_pat_tests` longtext DEFAULT NULL,
  `lab_pat_results` longtext DEFAULT NULL,
  `lab_number` varchar(200) DEFAULT NULL,
  `lab_date_rec` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `his_laboratory`
--

INSERT INTO `his_laboratory` (`lab_id`, `lab_pat_name`, `lab_pat_ailment`, `lab_pat_number`, `lab_pat_tests`, `lab_pat_results`, `lab_number`, `lab_date_rec`) VALUES
(1, 'Lorem Ipsum ', 'Flu', '7EW0L', '<ul><li><a href=\"https://www.medicalnewstoday.com/articles/179211.php\">Non-steroidal anti-inflammatory drugs</a> (NSAIDs) such as <a href=\"https://www.medicalnewstoday.com/articles/161255.php\">aspirin</a> or ibuprofen can help bring a fever down. These are available to purchase over-the-counter or <a target=\"_blank\" href=\"https://amzn.to/2qp3d0b\">online</a>. However, a mild fever may be helping combat the bacterium or virus that is causing the infection. It may not be ideal to bring it down.</li><li>If the fever has been caused by a bacterial infection, the doctor may prescribe an <a href=\"https://www.medicalnewstoday.com/articles/10278.php\">antibiotic</a>.</li><li>If a fever has been caused by a cold, which is caused by a viral infection, NSAIDs may be used to relieve uncomfortable symptoms. Antibiotics have no effect against viruses and will not be prescribed by your doctor for a viral infection.</li></ul>', '<ul><li>If the fever has been caused by a bacterial infection, the doctor may prescribe an <a href=\"https://www.medicalnewstoday.com/articles/10278.php\">antibiotic</a>.</li><li>If a fever has been caused by a cold, which is caused by a viral infection, NSAIDs may be used to relieve uncomfortable symptoms. Antibiotics have no effect against viruses and will not be prescribed by your doctor for a viral infection.</li></ul>', 'K67PL', '2020-01-12 13:32:07'),
(2, 'Mart Developers', 'Fever', '6P8HJ', '<ul><li>Body temperature</li><li>Blood</li><li>Stool</li><li>Urine</li></ul>', '<ul><li>Body Temperature 67 Degree Celcious(Abnormal)</li><li>Blood - Malaria Bacterial Tested Postive</li><li>Stool - Mucus tested postive</li><li>Urine -Urea Level were 20% higher than normal</li></ul><p><strong>Fever Tested Positive</strong></p>', '9DMN5', '2020-01-12 13:41:07'),
(3, 'John Doe', 'Malaria', 'RAV6C', '<p><strong>Pain areas: </strong>in the abdomen or muscles</p><p><strong>Whole body: </strong>chills, fatigue, fever, night sweats, shivering, or sweating</p><p><strong>Gastrointestinal: </strong>diarrhoea, nausea, or vomiting</p><p><strong>Also common: </strong>fast heart rate, headache, mental confusion, or pallor</p>', '<p><strong>Pain areas: </strong>in the abdomen or muscles -Tested Positive</p><p><strong>Whole body: </strong>chills, fatigue, fever, night sweats, shivering, or sweating - Tested Positive</p><p><strong>Gastrointestinal: </strong>diarrhoea, nausea, or vomiting - Tested Positive</p><p>&nbsp;</p>', '90ZNX', '2020-01-13 12:31:48'),
(4, 'Cynthia Connolly', 'Demo Test', '3Z14K', '<p>demo demo demo demo</p>', '<p>54545</p>', 'G0VZU', '2022-10-20 17:48:05'),
(5, 'Christine Moore', 'Demo Test', '4TLG0', '<ol><li>Test One</li><li>Test Two</li><li>Test Three</li><li>Test Four</li><li>Test Five</li></ol>', '<ol><li>Result One</li><li>Result Two</li><li>Result Three</li></ol>', 'RA4UM', '2022-10-22 11:01:11');

-- --------------------------------------------------------

--
-- Table structure for table `his_medical_records`
--

CREATE TABLE `his_medical_records` (
  `mdr_id` int(20) NOT NULL,
  `mdr_number` varchar(200) DEFAULT NULL,
  `mdr_pat_name` varchar(200) DEFAULT NULL,
  `mdr_pat_adr` varchar(200) DEFAULT NULL,
  `mdr_pat_age` varchar(200) DEFAULT NULL,
  `mdr_pat_ailment` varchar(200) DEFAULT NULL,
  `mdr_pat_number` varchar(200) DEFAULT NULL,
  `mdr_pat_prescr` longtext DEFAULT NULL,
  `mdr_date_rec` timestamp(4) NOT NULL DEFAULT current_timestamp(4) ON UPDATE current_timestamp(4)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `his_medical_records`
--

INSERT INTO `his_medical_records` (`mdr_id`, `mdr_number`, `mdr_pat_name`, `mdr_pat_adr`, `mdr_pat_age`, `mdr_pat_ailment`, `mdr_pat_number`, `mdr_pat_prescr`, `mdr_date_rec`) VALUES
(1, 'ZNXI4', 'John Doe', '12 900 Los Angeles', '35', 'Malaria', 'RAV6C', '<ul><li>Combination of atovaquone and proguanil (Malarone)</li><li>Quinine sulfate (Qualaquin) with doxycycline (Vibramycin, Monodox, others)</li><li>Mefloquine.</li><li>Primaquine phosphate.</li></ul>', '2020-01-11 15:03:05.9839'),
(2, 'MIA9P', 'Cynthia Connolly', '9 Hill Haven Drive', '22', 'Demo Test', '3Z14K', NULL, '2022-10-18 17:07:46.7306'),
(3, 'F1ZHQ', 'Michael White', '60 Radford Street', '30', 'Demo Test', 'DCRI8', NULL, '2022-10-18 17:08:35.7938'),
(4, 'ZLN0Q', 'Lawrence Bischof', '82 Bryan Street', '32', 'Demo Test', 'ISL1E', '<ol><li>sample</li><li>sampl</li><li>sample</li><li>sample</li></ol>', '2022-10-20 17:22:15.7034');

-- --------------------------------------------------------

--
-- Table structure for table `his_patients`
--

CREATE TABLE `his_patients` (
  `pat_id` int(20) NOT NULL,
  `pat_fname` varchar(200) DEFAULT NULL,
  `pat_lname` varchar(200) DEFAULT NULL,
  `pat_dob` varchar(200) DEFAULT NULL,
  `pat_age` varchar(200) DEFAULT NULL,
  `pat_number` varchar(200) DEFAULT NULL,
  `pat_addr` varchar(200) DEFAULT NULL,
  `pat_phone` varchar(200) DEFAULT NULL,
  `pat_type` varchar(200) DEFAULT NULL,
  `pat_date_joined` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `pat_ailment` varchar(200) DEFAULT NULL,
  `pat_discharge_status` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `his_patients`
--

INSERT INTO `his_patients` (`pat_id`, `pat_fname`, `pat_lname`, `pat_dob`, `pat_age`, `pat_number`, `pat_addr`, `pat_phone`, `pat_type`, `pat_date_joined`, `pat_ailment`, `pat_discharge_status`) VALUES
(8, 'Michael', 'White', '02/02/1992', '30', 'DCRI8', '60 Radford Street', '1458887854', 'InPatient', '2022-10-18 16:28:51.469431', 'Demo Test', NULL),
(9, 'Lawrence', 'Bischof', '01/19/1990', '32', 'ISL1E', '82 Bryan Street', '7412225698', 'InPatient', '2022-10-18 16:53:26.210951', 'Demo Test', NULL),
(10, 'Cynthia', 'Connolly', '10/11/2000', '22', '3Z14K', '9 Hill Haven Drive', '1478885458', 'InPatient', '2022-10-18 16:54:53.104490', 'Demo Test', NULL),
(11, 'Helen', 'Macdougall', '01/01/1980', '42', 'KU8W4', '28 Holly Street', '1458889655', 'OutPatient', '2022-10-20 17:26:45.256878', 'Test Test', NULL),
(12, 'Christine', 'Moore', '11/06/1994', '28', '4TLG0', '117 Bleecker Street', '7412569698', 'InPatient', '2022-10-22 10:38:30.937516', 'Demo Test', NULL),
(13, 'Elizabeth', 'Njoki', '23122000', '23', 'MU7OP', '672', '0795882261', 'InPatient', '2024-01-15 06:41:01.194488', 'flu', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `his_patient_transfers`
--

CREATE TABLE `his_patient_transfers` (
  `t_id` int(20) NOT NULL,
  `t_hospital` varchar(200) DEFAULT NULL,
  `t_date` varchar(200) DEFAULT NULL,
  `t_pat_name` varchar(200) DEFAULT NULL,
  `t_pat_number` varchar(200) DEFAULT NULL,
  `t_status` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `his_patient_transfers`
--

INSERT INTO `his_patient_transfers` (`t_id`, `t_hospital`, `t_date`, `t_pat_name`, `t_pat_number`, `t_status`) VALUES
(1, 'Kenyatta National Hospital', '2020-01-11', 'Mart Developers', '9KXPM', 'Success');

-- --------------------------------------------------------

--
-- Table structure for table `his_payrolls`
--

CREATE TABLE `his_payrolls` (
  `pay_id` int(20) NOT NULL,
  `pay_number` varchar(200) DEFAULT NULL,
  `pay_doc_name` varchar(200) DEFAULT NULL,
  `pay_doc_number` varchar(200) DEFAULT NULL,
  `pay_doc_email` varchar(200) DEFAULT NULL,
  `pay_emp_salary` varchar(200) DEFAULT NULL,
  `pay_date_generated` timestamp(4) NOT NULL DEFAULT current_timestamp(4) ON UPDATE current_timestamp(4),
  `pay_status` varchar(200) DEFAULT NULL,
  `pay_descr` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `his_payrolls`
--

INSERT INTO `his_payrolls` (`pay_id`, `pay_number`, `pay_doc_name`, `pay_doc_number`, `pay_doc_email`, `pay_emp_salary`, `pay_date_generated`, `pay_status`, `pay_descr`) VALUES
(2, 'HUT1B', 'Henry Doe', 'N8TI0', 'henryd@hms.org', '7555', '2022-10-20 17:14:18.3708', 'Paid', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a,</p>'),
(3, 'T294L', 'Bryan Arreola', 'YDS7L', 'bryan@mail.com', '15500', '2022-10-20 17:14:50.5588', NULL, '<p>demo demo demo demo demo</p>'),
(4, '3UOXY', 'Jessica Spencer', '5VIFT', 'jessica@mail.com', '4150', '2022-10-22 11:04:36.9626', NULL, '<p>This is a demo payroll description for test!!</p>');

-- --------------------------------------------------------

--
-- Table structure for table `his_pharmaceuticals`
--

CREATE TABLE `his_pharmaceuticals` (
  `phar_id` int(20) NOT NULL,
  `phar_name` varchar(200) DEFAULT NULL,
  `phar_bcode` varchar(200) DEFAULT NULL,
  `phar_desc` longtext DEFAULT NULL,
  `phar_qty` varchar(200) DEFAULT NULL,
  `phar_cat` varchar(200) DEFAULT NULL,
  `phar_vendor` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `his_pharmaceuticals`
--

INSERT INTO `his_pharmaceuticals` (`phar_id`, `phar_name`, `phar_bcode`, `phar_desc`, `phar_qty`, `phar_cat`, `phar_vendor`) VALUES
(1, 'Paracetamol', '134057629', '<ul><li><strong>Paracetamol</strong>, also known as <strong>acetaminophen</strong> and <strong>APAP</strong>, is a medication used to treat <a href=\"https://en.wikipedia.org/wiki/Pain\">pain</a> and <a href=\"https://en.wikipedia.org/wiki/Fever\">fever</a>. It is typically used for mild to moderate pain relief. There is mixed evidence for its use to relieve fever in children.&nbsp; It is often sold in combination with other medications, such as in many <a href=\"https://en.wikipedia.org/wiki/Cold_medication\">cold medications</a> Paracetamol is also used for severe pain, such as <a href=\"https://en.wikipedia.org/wiki/Cancer_pain\">cancer pain</a> and pain after surgery, in combination with <a href=\"https://en.wikipedia.org/wiki/Opioid_analgesic\">opioid pain medication</a>. It is typically used either by mouth or <a href=\"https://en.wikipedia.org/wiki/Rectally\">rectally</a>, but is also available by <a href=\"https://en.wikipedia.org/wiki/Intravenous\">injection into a vein</a>. Effects last between two and four hours.</li><li>Paracetamol is generally safe at recommended doses.The recommended maximum daily dose for an adult is three to four grams. Higher doses may lead to toxicity, including <a href=\"https://en.wikipedia.org/wiki/Liver_failure\">liver failure</a> Serious skin rashes may rarely occur. It appears to be safe during <a href=\"https://en.wikipedia.org/wiki/Pregnancy\">pregnancy</a> and when <a href=\"https://en.wikipedia.org/wiki/Breastfeeding\">breastfeeding</a>.In those with liver disease, it may still be used, but in lower doses. It is classified as a mild <a href=\"https://en.wikipedia.org/wiki/Analgesic\">analgesic</a>. It does not have significant <a href=\"https://en.wikipedia.org/wiki/Anti-inflammatory\">anti-inflammatory</a> activity. How it works is not entirely clear.</li><li>Paracetamol was first made in 1877. It is the most commonly used medication for pain and fever in both the United States and Europe. It is on the <a href=\"https://en.wikipedia.org/wiki/World_Health_Organization%27s_List_of_Essential_Medicines\">World Health Organization&#39;s List of Essential Medicines</a>, the safest and most effective medicines needed in a <a href=\"https://en.wikipedia.org/wiki/Health_system\">health system</a>.<a href=\"https://en.wikipedia.org/wiki/Paracetamol#cite_note-WHO21st-24\">[24]</a> Paracetamol is available as a <a href=\"https://en.wikipedia.org/wiki/Generic_medication\">generic medication</a> with trade names including <a href=\"https://en.wikipedia.org/wiki/Tylenol_(brand)\">Tylenol</a> and <a href=\"https://en.wikipedia.org/wiki/Panadol_(brand)\">Panadol</a>, among others.The wholesale price in the <a href=\"https://en.wikipedia.org/wiki/Developing_world\">developing world</a> is less than US$0.01 per dose. In the United States, it costs about US$0.04 per dose. In 2019, it was the 17th most prescribed medication in the United States, with more than 29&nbsp;million prescriptions.</li></ul>', '500', 'Antipyretics', 'Dawa Limited Kenya'),
(2, 'Aspirin', '452760813', '<ul><li><strong>Aspirin</strong>, also known as <strong>acetylsalicylic acid</strong> (<strong>ASA</strong>), is a <a href=\"https://en.wikipedia.org/wiki/Medication\">medication</a> used to reduce <a href=\"https://en.wikipedia.org/wiki/Pain\">pain</a>, <a href=\"https://en.wikipedia.org/wiki/Fever\">fever</a>, or <a href=\"https://en.wikipedia.org/wiki/Inflammation\">inflammation</a>.<a href=\"https://en.wikipedia.org/wiki/Aspirin#cite_note-AHSF2016-5\">[5]</a> Specific inflammatory conditions which aspirin is used to treat include <a href=\"https://en.wikipedia.org/wiki/Kawasaki_disease\">Kawasaki disease</a>, <a href=\"https://en.wikipedia.org/wiki/Pericarditis\">pericarditis</a>, and <a href=\"https://en.wikipedia.org/wiki/Rheumatic_fever\">rheumatic fever</a>.<a href=\"https://en.wikipedia.org/wiki/Aspirin#cite_note-AHSF2016-5\">[5]</a> Aspirin given shortly after a <a href=\"https://en.wikipedia.org/wiki/Myocardial_infarction\">heart attack</a> decreases the risk of death.<a href=\"https://en.wikipedia.org/wiki/Aspirin#cite_note-AHSF2016-5\">[5]</a> Aspirin is also used long-term to help prevent further heart attacks, <a href=\"https://en.wikipedia.org/wiki/Ischaemic_stroke\">ischaemic strokes</a>, and <a href=\"https://en.wikipedia.org/wiki/Thrombus\">blood clots</a> in people at high risk.<a href=\"https://en.wikipedia.org/wiki/Aspirin#cite_note-AHSF2016-5\">[5]</a> It may also decrease the risk of certain types of <a href=\"https://en.wikipedia.org/wiki/Cancer\">cancer</a>, particularly <a href=\"https://en.wikipedia.org/wiki/Colorectal_cancer\">colorectal cancer</a>.<a href=\"https://en.wikipedia.org/wiki/Aspirin#cite_note-6\">[6]</a> For pain or fever, effects typically begin within 30 minutes.<a href=\"https://en.wikipedia.org/wiki/Aspirin#cite_note-AHSF2016-5\">[5]</a> Aspirin is a <a href=\"https://en.wikipedia.org/wiki/Nonsteroidal_anti-inflammatory_drug\">nonsteroidal anti-inflammatory drug</a> (NSAID) and works similarly to other NSAIDs but also suppresses the normal functioning of <a href=\"https://en.wikipedia.org/wiki/Platelet\">platelets</a>.<a href=\"https://en.wikipedia.org/wiki/Aspirin#cite_note-AHSF2016-5\">[5]</a></li><li>One common <a href=\"https://en.wikipedia.org/wiki/Adverse_effect\">adverse effect</a> is an <a href=\"https://en.wikipedia.org/wiki/Upset_stomach\">upset stomach</a>.<a href=\"https://en.wikipedia.org/wiki/Aspirin#cite_note-AHSF2016-5\">[5]</a> More significant side effects include <a href=\"https://en.wikipedia.org/wiki/Stomach_ulcer\">stomach ulcers</a>, <a href=\"https://en.wikipedia.org/wiki/Stomach_bleeding\">stomach bleeding</a>, and worsening <a href=\"https://en.wikipedia.org/wiki/Asthma\">asthma</a>.<a href=\"https://en.wikipedia.org/wiki/Aspirin#cite_note-AHSF2016-5\">[5]</a> Bleeding risk is greater among those who are older, drink <a href=\"https://en.wikipedia.org/wiki/Alcohol_(drug)\">alcohol</a>, take other NSAIDs, or are on other <a href=\"https://en.wikipedia.org/wiki/Anticoagulants\">blood thinners</a>.<a href=\"https://en.wikipedia.org/wiki/Aspirin#cite_note-AHSF2016-5\">[5]</a> Aspirin is not recommended in the last part of <a href=\"https://en.wikipedia.org/wiki/Pregnancy\">pregnancy</a>.<a href=\"https://en.wikipedia.org/wiki/Aspirin#cite_note-AHSF2016-5\">[5]</a> It is not generally recommended in children with <a href=\"https://en.wikipedia.org/wiki/Infection\">infections</a> because of the risk of <a href=\"https://en.wikipedia.org/wiki/Reye_syndrome\">Reye syndrome</a>.<a href=\"https://en.wikipedia.org/wiki/Aspirin#cite_note-AHSF2016-5\">[5]</a> High doses may result in <a href=\"https://en.wikipedia.org/wiki/Tinnitus\">ringing in the ears</a>.<a href=\"https://en.wikipedia.org/wiki/Aspirin#cite_note-AHSF2016-5\">[5]</a></li></ul>', '500', 'Analgesics', 'Cosmos Kenya Limited'),
(3, 'Test Pharma', '465931288', '<p>This is a demo test.&nbsp;This is a demo test.&nbsp;This is a demo test.</p>', '36', 'Antibiotics', 'Cosmos Pharmaceutical Limited');

-- --------------------------------------------------------

--
-- Table structure for table `his_pharmaceuticals_categories`
--

CREATE TABLE `his_pharmaceuticals_categories` (
  `pharm_cat_id` int(20) NOT NULL,
  `pharm_cat_name` varchar(200) DEFAULT NULL,
  `pharm_cat_vendor` varchar(200) DEFAULT NULL,
  `pharm_cat_desc` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `his_pharmaceuticals_categories`
--

INSERT INTO `his_pharmaceuticals_categories` (`pharm_cat_id`, `pharm_cat_name`, `pharm_cat_vendor`, `pharm_cat_desc`) VALUES
(1, 'Antipyretics', 'Cosmos Kenya Limited', '<ul><li>An <strong>antipyretic</strong> (<a href=\"https://en.wikipedia.org/wiki/Help:IPA/English\">/ËŒ&aelig;ntipaÉªËˆrÉ›tÉªk/</a>, from <em>anti-</em> &#39;against&#39; and <em><a href=\"https://en.wiktionary.org/wiki/pyretic\">pyretic</a></em> &#39;feverish&#39;) is a substance that reduces <a href=\"https://en.wikipedia.org/wiki/Fever\">fever</a>. Antipyretics cause the <a href=\"https://en.wikipedia.org/wiki/Hypothalamus\">hypothalamus</a> to override a <a href=\"https://en.wikipedia.org/wiki/Prostaglandin\">prostaglandin</a>-induced increase in <a href=\"https://en.wikipedia.org/wiki/Thermoregulation\">temperature</a>. The body then works to lower the temperature, which results in a reduction in fever.</li><li>Most antipyretic medications have other purposes. The most common antipyretics in the United States are <a href=\"https://en.wikipedia.org/wiki/Ibuprofen\">ibuprofen</a> and <a href=\"https://en.wikipedia.org/wiki/Aspirin\">aspirin</a>, which are <a href=\"https://en.wikipedia.org/wiki/Nonsteroidal_anti-inflammatory_drugs\">nonsteroidal anti-inflammatory drugs</a> (NSAIDs) used primarily as <a href=\"https://en.wikipedia.org/wiki/Analgesics\">analgesics</a> (pain relievers), but which also have antipyretic properties; and <a href=\"https://en.wikipedia.org/wiki/Acetaminophen\">acetaminophen</a> (paracetamol), an analgesic with weak anti-inflammatory properties.<a href=\"https://en.wikipedia.org/wiki/Antipyretic#cite_note-2\">[2]</a></li></ul>'),
(2, 'Analgesics', 'Dawa Limited Kenya', '<ul><li><p>An <strong>analgesic</strong> or <strong>painkiller</strong> is any member of the group of <a href=\"https://en.wikipedia.org/wiki/Pharmaceutical_drug\">drugs</a> used to achieve analgesia, relief from <a href=\"https://en.wikipedia.org/wiki/Pain\">pain</a>.</p><p>Analgesic drugs act in various ways on the <a href=\"https://en.wikipedia.org/wiki/Peripheral_nervous_system\">peripheral</a> and <a href=\"https://en.wikipedia.org/wiki/Central_nervous_system\">central</a> nervous systems. They are distinct from <a href=\"https://en.wikipedia.org/wiki/Anesthetic\">anesthetics</a>, which temporarily affect, and in some instances completely eliminate, <a href=\"https://en.wikipedia.org/wiki/Sense\">sensation</a>. Analgesics include <a href=\"https://en.wikipedia.org/wiki/Paracetamol\">paracetamol</a> (known in North America as <a href=\"https://en.wikipedia.org/wiki/Acetaminophen\">acetaminophen</a> or simply APAP), the <a href=\"https://en.wikipedia.org/wiki/Nonsteroidal_anti-inflammatory_drug\">nonsteroidal anti-inflammatory drugs</a> (NSAIDs) such as the <a href=\"https://en.wikipedia.org/wiki/Salicylate\">salicylates</a>, and <a href=\"https://en.wikipedia.org/wiki/Opioid\">opioid</a> drugs such as <a href=\"https://en.wikipedia.org/wiki/Morphine\">morphine</a> and <a href=\"https://en.wikipedia.org/wiki/Oxycodone\">oxycodone</a>.</p></li></ul>'),
(3, 'Antibiotics', 'Cosmos Kenya Limited', '<p>Antibiotics</p>');

-- --------------------------------------------------------

--
-- Table structure for table `his_prescriptions`
--

CREATE TABLE `his_prescriptions` (
  `pres_id` int(200) NOT NULL,
  `pres_pat_name` varchar(200) DEFAULT NULL,
  `pres_pat_age` varchar(200) DEFAULT NULL,
  `pres_pat_number` varchar(200) DEFAULT NULL,
  `pres_number` varchar(200) DEFAULT NULL,
  `pres_pat_addr` varchar(200) DEFAULT NULL,
  `pres_pat_type` varchar(200) DEFAULT NULL,
  `pres_date` timestamp(4) NOT NULL DEFAULT current_timestamp(4) ON UPDATE current_timestamp(4),
  `pres_pat_ailment` varchar(200) DEFAULT NULL,
  `pres_ins` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `his_prescriptions`
--

INSERT INTO `his_prescriptions` (`pres_id`, `pres_pat_name`, `pres_pat_age`, `pres_pat_number`, `pres_number`, `pres_pat_addr`, `pres_pat_type`, `pres_date`, `pres_pat_ailment`, `pres_ins`) VALUES
(3, 'Mart Developers', '23', '6P8HJ', 'J9DC6', '127001 LocalHost', 'InPatient', '2020-01-11 12:32:39.6963', 'Fever', '<ul><li><a href=\"https://www.medicalnewstoday.com/articles/179211.php\">Non-steroidal anti-inflammatory drugs</a> (NSAIDs) such as <a href=\"https://www.medicalnewstoday.com/articles/161255.php\">aspirin</a> or ibuprofen can help bring a fever down. These are available to purchase over-the-counter or <a target=\"_blank\" href=\"https://amzn.to/2qp3d0b\">online</a>. However, a mild fever may be helping combat the bacterium or virus that is causing the infection. It may not be ideal to bring it down.</li><li>If the fever has been caused by a bacterial infection, the doctor may prescribe an <a href=\"https://www.medicalnewstoday.com/articles/10278.php\">antibiotic</a>.</li><li>If a fever has been caused by a cold, which is caused by a viral infection, NSAIDs may be used to relieve uncomfortable symptoms. Antibiotics have no effect against viruses and will not be prescribed by your doctor for a viral infection.</li></ul>'),
(4, 'John Doe', '30', 'RAV6C', 'HZQ8J', '12 900 NYE', 'OutPatient', '2020-01-11 13:08:46.7368', 'Malaria', '<ul><li>Combination of atovaquone and proguanil (Malarone)</li><li>Quinine sulfate (Qualaquin) with doxycycline (Vibramycin, Monodox, others)</li><li>Mefloquine.</li><li>Primaquine phosphate.</li></ul>'),
(5, 'Lorem Ipsum', '10', '7EW0L', 'HQC3D', '12 9001 Machakos', 'OutPatient', '2020-01-13 12:19:30.3702', 'Flu', '<ul><li><a href=\"https://www.google.com/search?client=firefox-b-e&amp;sxsrf=ACYBGNRW3vlJoag6iJInWVOTtTG_HUTedA:1578917913108&amp;q=flu+decongestant&amp;stick=H4sIAAAAAAAAAOMQFeLQz9U3SK5MTlbiBLGMktNzcnYxMRosYhVIyylVSElNzs9LTy0uScwrAQBMMnd5LgAAAA&amp;sa=X&amp;ved=2ahUKEwjRhNzKx4DnAhUcBGMBHYs1A24Q0EAwFnoECAwQHw\">Decongestant</a></li><li>Relieves nasal congestion, swelling and runny nose.</li><li><a href=\"https://www.google.com/search?client=firefox-b-e&amp;sxsrf=ACYBGNRW3vlJoag6iJInWVOTtTG_HUTedA:1578917913108&amp;q=flu+cough+medicine&amp;stick=H4sIAAAAAAAAAOMQFeLQz9U3SK5MTlbiBLEM89IsLHYxMRosYhVKyylVSM4vTc9QyE1NyUzOzEsFAA_gu9IwAAAA&amp;sa=X&amp;ved=2ahUKEwjRhNzKx4DnAhUcBGMBHYs1A24Q0EAwFnoECAwQIA\">Cough medicine</a></li><li>Blocks the cough reflex. Some may thin and loosen mucus, making it easier to clear from the airways.</li><li><a href=\"https://www.google.com/search?client=firefox-b-e&amp;sxsrf=ACYBGNRW3vlJoag6iJInWVOTtTG_HUTedA:1578917913108&amp;q=flu+nonsteroidal+anti-inflammatory+drug&amp;stick=H4sIAAAAAAAAAOMQFeLQz9U3SK5MTlYCs0yzCit3MTEaLGJVT8spVcjLzysuSS3Kz0xJzFFIzCvJ1M3MS8tJzM1NLMkvqlRIKSpNBwByUiYhRAAAAA&amp;sa=X&amp;ved=2ahUKEwjRhNzKx4DnAhUcBGMBHYs1A24Q0EAwFnoECAwQIQ\">Nonsteroidal anti-inflammatory drug</a></li><li>Relieves pain, decreases inflammation and reduces fever.</li><li><a href=\"https://www.google.com/search?client=firefox-b-e&amp;sxsrf=ACYBGNRW3vlJoag6iJInWVOTtTG_HUTedA:1578917913108&amp;q=flu+analgesic&amp;stick=H4sIAAAAAAAAAOMQFeLQz9U3SK5MTlZiB7EqDSx3MTEaLGLlTcspVUjMS8xJTy3OTAYAbecS9ikAAAA&amp;sa=X&amp;ved=2ahUKEwjRhNzKx4DnAhUcBGMBHYs1A24Q0EAwFnoECAwQIg\">Analgesic</a></li><li>Relieves pain.</li><li><a href=\"https://www.google.com/search?client=firefox-b-e&amp;sxsrf=ACYBGNRW3vlJoag6iJInWVOTtTG_HUTedA:1578917913108&amp;q=flu+antiviral+drug&amp;stick=H4sIAAAAAAAAAOMQFeLQz9U3SK5MTlYCs1KMC0x2MTEaLGIVSsspVUjMK8ksyyxKzFFIKSpNBwDBFxlOLwAAAA&amp;sa=X&amp;ved=2ahUKEwjRhNzKx4DnAhUcBGMBHYs1A24Q0EAwFnoECAwQIw\">Antiviral drug</a></li><li>Reduces viruses&#39; ability to replicate.</li></ul>'),
(6, 'Christine Moore', '28', '4TLG0', '09Y2P', '117 Bleecker Street', 'InPatient', '2022-10-22 10:57:10.7496', 'Demo Test', '<ol><li>This is a demo prescription.</li><li>This is a second demo prescription.</li><li>And this one&#39;s third!</li></ol>');

-- --------------------------------------------------------

--
-- Table structure for table `his_pwdresets`
--

CREATE TABLE `his_pwdresets` (
  `id` int(20) NOT NULL,
  `email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `his_surgery`
--

CREATE TABLE `his_surgery` (
  `s_id` int(200) NOT NULL,
  `s_number` varchar(200) DEFAULT NULL,
  `s_doc` varchar(200) DEFAULT NULL,
  `s_pat_number` varchar(200) DEFAULT NULL,
  `s_pat_name` varchar(200) DEFAULT NULL,
  `s_pat_ailment` varchar(200) DEFAULT NULL,
  `s_pat_date` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `s_pat_status` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `his_surgery`
--

INSERT INTO `his_surgery` (`s_id`, `s_number`, `s_doc`, `s_pat_number`, `s_pat_name`, `s_pat_ailment`, `s_pat_date`, `s_pat_status`) VALUES
(2, '8KQWD', 'Martin Mbithi', 'RAV6C', 'John Doe', 'Malaria', '2020-01-13 08:50:10.649889', 'Successful'),
(3, '7K18R', 'Bryan Arreola', '3Z14K', 'Cynthia Connolly', 'Demo Test', '2022-10-18 17:26:44.053571', 'Successful'),
(4, 'ECF62', 'Bryan Arreola', '4TLG0', 'Christine Moore', 'Demo Test', '2022-10-22 11:03:33.765255', 'Successful');

-- --------------------------------------------------------

--
-- Table structure for table `his_vendor`
--

CREATE TABLE `his_vendor` (
  `v_id` int(20) NOT NULL,
  `v_number` varchar(200) DEFAULT NULL,
  `v_name` varchar(200) DEFAULT NULL,
  `v_adr` varchar(200) DEFAULT NULL,
  `v_mobile` varchar(200) DEFAULT NULL,
  `v_email` varchar(200) DEFAULT NULL,
  `v_phone` varchar(200) DEFAULT NULL,
  `v_desc` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `his_vendor`
--

INSERT INTO `his_vendor` (`v_id`, `v_number`, `v_name`, `v_adr`, `v_mobile`, `v_email`, `v_phone`, `v_desc`) VALUES
(1, '6ISKC', 'Cosmos Pharmaceutical Limited', 'P.O. Box 41433, GPO 00100 Nairobi, Kenya', '', 'info@cosmospharmaceuticallimited.com', '+254(20)550700-9', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,</p>');

-- --------------------------------------------------------

--
-- Table structure for table `his_vitals`
--

CREATE TABLE `his_vitals` (
  `vit_id` int(20) NOT NULL,
  `vit_number` varchar(200) DEFAULT NULL,
  `vit_pat_number` varchar(200) DEFAULT NULL,
  `vit_bodytemp` varchar(200) DEFAULT NULL,
  `vit_heartpulse` varchar(200) DEFAULT NULL,
  `vit_resprate` varchar(200) DEFAULT NULL,
  `vit_bloodpress` varchar(200) DEFAULT NULL,
  `vit_daterec` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `his_vitals`
--

INSERT INTO `his_vitals` (`vit_id`, `vit_number`, `vit_pat_number`, `vit_bodytemp`, `vit_heartpulse`, `vit_resprate`, `vit_bloodpress`, `vit_daterec`) VALUES
(3, '1KB9V', '3Z14K', '38', '77', '12', '90/60', '2022-10-18 17:10:16.904915'),
(4, 'ELYOM', 'BKTWQ', '38', '88', '12', '110/80', '2022-10-18 01:49:55.814783'),
(5, 'AL0J8', 'YDS7L', '36', '72', '15', '90/60', '2022-10-18 17:42:17.500662'),
(6, 'MS2OJ', '4TLG0', '37', '70', '15', '120/80', '2022-10-22 11:01:52.148658');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `his_accounts`
--
ALTER TABLE `his_accounts`
  ADD PRIMARY KEY (`acc_id`);

--
-- Indexes for table `his_admin`
--
ALTER TABLE `his_admin`
  ADD PRIMARY KEY (`ad_id`);

--
-- Indexes for table `his_assets`
--
ALTER TABLE `his_assets`
  ADD PRIMARY KEY (`asst_id`);

--
-- Indexes for table `his_docs`
--
ALTER TABLE `his_docs`
  ADD PRIMARY KEY (`doc_id`);

--
-- Indexes for table `his_equipments`
--
ALTER TABLE `his_equipments`
  ADD PRIMARY KEY (`eqp_id`);

--
-- Indexes for table `his_laboratory`
--
ALTER TABLE `his_laboratory`
  ADD PRIMARY KEY (`lab_id`);

--
-- Indexes for table `his_medical_records`
--
ALTER TABLE `his_medical_records`
  ADD PRIMARY KEY (`mdr_id`);

--
-- Indexes for table `his_patients`
--
ALTER TABLE `his_patients`
  ADD PRIMARY KEY (`pat_id`);

--
-- Indexes for table `his_patient_transfers`
--
ALTER TABLE `his_patient_transfers`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `his_payrolls`
--
ALTER TABLE `his_payrolls`
  ADD PRIMARY KEY (`pay_id`);

--
-- Indexes for table `his_pharmaceuticals`
--
ALTER TABLE `his_pharmaceuticals`
  ADD PRIMARY KEY (`phar_id`);

--
-- Indexes for table `his_pharmaceuticals_categories`
--
ALTER TABLE `his_pharmaceuticals_categories`
  ADD PRIMARY KEY (`pharm_cat_id`);

--
-- Indexes for table `his_prescriptions`
--
ALTER TABLE `his_prescriptions`
  ADD PRIMARY KEY (`pres_id`);

--
-- Indexes for table `his_pwdresets`
--
ALTER TABLE `his_pwdresets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `his_surgery`
--
ALTER TABLE `his_surgery`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `his_vendor`
--
ALTER TABLE `his_vendor`
  ADD PRIMARY KEY (`v_id`);

--
-- Indexes for table `his_vitals`
--
ALTER TABLE `his_vitals`
  ADD PRIMARY KEY (`vit_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `his_accounts`
--
ALTER TABLE `his_accounts`
  MODIFY `acc_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `his_admin`
--
ALTER TABLE `his_admin`
  MODIFY `ad_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `his_assets`
--
ALTER TABLE `his_assets`
  MODIFY `asst_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `his_docs`
--
ALTER TABLE `his_docs`
  MODIFY `doc_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `his_equipments`
--
ALTER TABLE `his_equipments`
  MODIFY `eqp_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `his_laboratory`
--
ALTER TABLE `his_laboratory`
  MODIFY `lab_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `his_medical_records`
--
ALTER TABLE `his_medical_records`
  MODIFY `mdr_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `his_patients`
--
ALTER TABLE `his_patients`
  MODIFY `pat_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `his_patient_transfers`
--
ALTER TABLE `his_patient_transfers`
  MODIFY `t_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `his_payrolls`
--
ALTER TABLE `his_payrolls`
  MODIFY `pay_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `his_pharmaceuticals`
--
ALTER TABLE `his_pharmaceuticals`
  MODIFY `phar_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `his_pharmaceuticals_categories`
--
ALTER TABLE `his_pharmaceuticals_categories`
  MODIFY `pharm_cat_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `his_prescriptions`
--
ALTER TABLE `his_prescriptions`
  MODIFY `pres_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `his_pwdresets`
--
ALTER TABLE `his_pwdresets`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `his_surgery`
--
ALTER TABLE `his_surgery`
  MODIFY `s_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `his_vendor`
--
ALTER TABLE `his_vendor`
  MODIFY `v_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `his_vitals`
--
ALTER TABLE `his_vitals`
  MODIFY `vit_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Database: `medical`
--
CREATE DATABASE IF NOT EXISTS `medical` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `medical`;

-- --------------------------------------------------------

--
-- Table structure for table `adminlogin`
--

CREATE TABLE `adminlogin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adminlogin`
--

INSERT INTO `adminlogin` (`username`, `password`) VALUES
('admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `doctorlogin`
--

CREATE TABLE `doctorlogin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctorlogin`
--

INSERT INTO `doctorlogin` (`username`, `password`) VALUES
('John2024', 'john123');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('C026/0693', '12345678');
--
-- Database: `medical center_db`
--
CREATE DATABASE IF NOT EXISTS `medical center_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `medical center_db`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'admin', 'admin12345', '26-01-2024 10:50:39 AM');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `doctorSpecialization` varchar(255) DEFAULT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `consultancyFees` int(11) DEFAULT NULL,
  `appointmentDate` varchar(255) DEFAULT NULL,
  `appointmentTime` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `userStatus` int(11) DEFAULT NULL,
  `doctorStatus` int(11) DEFAULT NULL,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(20) NOT NULL,
  `school_id` int(20) NOT NULL,
  `course` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `school_id`, `course`) VALUES
(1, 0, 'BBA'),
(2, 0, 'Civil '),
(3, 0, 'computer science');

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis`
--

CREATE TABLE `diagnosis` (
  `id` int(20) NOT NULL,
  `diagnosis` varchar(20) NOT NULL,
  `creation date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `diagnosis`
--

INSERT INTO `diagnosis` (`id`, `diagnosis`, `creation date`) VALUES
(1, 'Malaria', '2024-01-25'),
(2, 'Tuberculosis', '2024-01-25'),
(3, 'HIV', '2024-03-11');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `specilization` varchar(255) DEFAULT NULL,
  `doctorName` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `docEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `specilization`, `doctorName`, `address`, `contactno`, `docEmail`, `password`, `creationDate`, `updationDate`) VALUES
(24, 'Dental Care', 'John Kamau', 'JX46+R5G, Nyeri', 789654312, 'johnkamau@gmail.com', '6e0b7076126a29d5dfcbd54835387b7b', '2024-01-25 08:48:13', NULL),
(25, 'ENT', 'David', 'mathari,nyeri', 789654312, 'david@gmail.com', '55fc5b709962876903785fd64a6961e5', '2024-01-31 11:49:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctorslog`
--

CREATE TABLE `doctorslog` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doctorslog`
--

INSERT INTO `doctorslog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(2, 25, 'david@gmail.com', 0x3a3a3100000000000000000000000000, '2024-04-11 08:42:27', NULL, 1),
(3, 24, 'johnkamau@gmail.com', 0x3a3a3100000000000000000000000000, '2024-04-11 08:50:20', NULL, 1),
(4, 24, 'johnkamau@gmail.com', 0x3a3a3100000000000000000000000000, '2024-04-16 09:08:41', NULL, 1),
(5, 24, 'johnkamau@gmail.com', 0x3a3a3100000000000000000000000000, '2024-04-16 11:21:48', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `doctorspecilization`
--

CREATE TABLE `doctorspecilization` (
  `id` int(11) NOT NULL,
  `specilization` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doctorspecilization`
--

INSERT INTO `doctorspecilization` (`id`, `specilization`, `creationDate`, `updationDate`) VALUES
(18, 'ENT', '2024-02-01 07:01:59', NULL),
(19, 'Dental care', '2024-02-01 07:02:11', NULL),
(20, 'General Doctor', '2024-02-01 07:02:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dosageform`
--

CREATE TABLE `dosageform` (
  `id` int(20) NOT NULL,
  `dosageform` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosageform`
--

INSERT INTO `dosageform` (`id`, `dosageform`) VALUES
(1, 'tablet'),
(2, 'capsule'),
(3, 'syrup'),
(4, 'suspension'),
(5, 'cream'),
(6, 'ointment'),
(7, 'injection'),
(8, 'inhaler'),
(9, 'drops'),
(10, 'patch');

-- --------------------------------------------------------

--
-- Table structure for table `druginventory`
--

CREATE TABLE `druginventory` (
  `id` int(20) NOT NULL,
  `drugname` varchar(50) NOT NULL,
  `form` varchar(50) NOT NULL,
  `strength` varchar(50) NOT NULL,
  `quantity` varchar(50) NOT NULL,
  `unitOfMeasure` varchar(50) NOT NULL,
  `expirydate` date NOT NULL,
  `creationdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `druginventory`
--

INSERT INTO `druginventory` (`id`, `drugname`, `form`, `strength`, `quantity`, `unitOfMeasure`, `expirydate`, `creationdate`) VALUES
(1, 'amoxicillin', '', '30mg', '30', 'tablet', '2024-08-09', '2024-03-28');

-- --------------------------------------------------------

--
-- Table structure for table `drugname`
--

CREATE TABLE `drugname` (
  `id` int(255) NOT NULL,
  `drugname` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drugname`
--

INSERT INTO `drugname` (`id`, `drugname`, `amount`) VALUES
(1, 'antibiotics', 200),
(2, 'amoxicillin', 500),
(3, 'promethazine 20mg', 200);

-- --------------------------------------------------------

--
-- Table structure for table `frequency`
--

CREATE TABLE `frequency` (
  `id` int(255) NOT NULL,
  `frequency` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `frequency`
--

INSERT INTO `frequency` (`id`, `frequency`) VALUES
(1, 'daily'),
(2, 'every other day'),
(3, 'BID'),
(4, 'TID'),
(5, 'QID'),
(6, 'QHS'),
(7, 'Q4H'),
(8, 'Q4-6h'),
(9, 'QWK');

-- --------------------------------------------------------

--
-- Table structure for table `imaging`
--

CREATE TABLE `imaging` (
  `id` int(11) NOT NULL,
  `imaging` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `imaging`
--

INSERT INTO `imaging` (`id`, `imaging`) VALUES
(1, 'X-rays(Radiography)'),
(2, 'computer tomography (CT scans)'),
(3, 'MRI (magnetic  resonance imagi'),
(4, 'Ultrasound');

-- --------------------------------------------------------

--
-- Table structure for table `labtest`
--

CREATE TABLE `labtest` (
  `id` int(20) NOT NULL,
  `test` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `labtest`
--

INSERT INTO `labtest` (`id`, `test`) VALUES
(1, 'Complete blood count'),
(2, 'Basic Metabolic panel'),
(3, 'urinalysis'),
(4, 'liver function test'),
(5, 'cardiac enzyme tests');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0,
  `from` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nursing`
--

CREATE TABLE `nursing` (
  `id` int(11) NOT NULL,
  `services` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nursing`
--

INSERT INTO `nursing` (`id`, `services`) VALUES
(1, 'dressing'),
(2, 'injections'),
(3, 'stitches'),
(4, 'triage');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `id` int(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `registrationno` varchar(50) NOT NULL,
  `school` varchar(50) NOT NULL,
  `course` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `patientID` int(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `registrationno` varchar(50) NOT NULL,
  `email` varchar(20) NOT NULL,
  `school` varchar(50) NOT NULL,
  `course` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phoneNo` int(11) NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(30) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `patientID`, `name`, `registrationno`, `email`, `school`, `course`, `address`, `phoneNo`, `dob`, `gender`, `password`, `regDate`, `updationDate`) VALUES
(1, 0, 'Elizabeth ', 'E028-01-1262/2020', 'njokielizabeth637@gm', 'Computer Science&IT', 'computer science', '672', 795882261, '2000-01-03', 'female', '963d4fb65bbd02973d8000fbed235032', '2024-04-16 10:31:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pending appointment`
--

CREATE TABLE `pending appointment` (
  `PatientName` varchar(20) NOT NULL,
  `specialization` varchar(20) NOT NULL,
  `AppointmentDate/Time` datetime(6) NOT NULL,
  `AppointmentCreationDate` datetime(6) NOT NULL,
  `Action` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pharmacist`
--

CREATE TABLE `pharmacist` (
  `id` int(255) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(8) NOT NULL,
  `updationDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pharmacist`
--

INSERT INTO `pharmacist` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'pharm', 'pharm123', '2024-02-11'),
(1, 'pharm', 'pharm123', '2024-02-11');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `id` int(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `drugname` varchar(30) NOT NULL,
  `quantity` int(20) NOT NULL,
  `route` varchar(20) NOT NULL,
  `frequency` varchar(20) NOT NULL,
  `howmany` int(20) NOT NULL,
  `refill` int(20) NOT NULL,
  `creation date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`id`, `name`, `drugname`, `quantity`, `route`, `frequency`, `howmany`, `refill`, `creation date`) VALUES
(12, 'Elizabeth Njoki', 'promethazine 20mg', 1, 'PO', 'every other day', 20, 2, '2024-02-12'),
(13, 'mary', 'antibiotics', 0, 'PO', 'daily', 20, 2, '2024-02-26'),
(14, 'mary', 'antibiotics', 0, 'PO', 'daily', 20, 2, '2024-02-26'),
(15, 'mary', 'antibiotics', 0, 'PO', 'daily', 20, 2, '2024-02-26'),
(16, 'mary', 'antibiotics', 0, 'PO', 'daily', 20, 2, '2024-02-26');

-- --------------------------------------------------------

--
-- Table structure for table `pusher`
--

CREATE TABLE `pusher` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `regno` varchar(30) NOT NULL,
  `creationdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pusher`
--

INSERT INTO `pusher` (`id`, `user_id`, `name`, `regno`, `creationdate`) VALUES
(1, 1, 'james', 'E028-01-1262/2020', '2024-04-11 08:48:58'),
(2, 1, 'james', 'E028-01-1262/2020', '2024-04-16 08:54:36'),
(3, 1, 'james', 'E028-01-1262/2020', '2024-04-16 09:07:25'),
(4, 1, 'james', 'E028-01-1262/2020', '2024-04-16 09:11:20'),
(5, 1, 'james', 'E028-01-1262/2020', '2024-04-16 09:14:25'),
(6, 0, 'Elizabeth', 'E028-01-1262/2020', '2024-04-16 10:54:07'),
(7, 0, 'Elizabeth', 'E028-01-1262/2020', '2024-04-16 11:01:45'),
(8, 0, 'Elizabeth', 'E028-01-1262/2020', '2024-04-16 11:22:30'),
(9, 0, 'Elizabeth', 'E028-01-1262/2020', '2024-04-16 14:33:13');

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `id` int(255) NOT NULL,
  `route` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`id`, `route`) VALUES
(1, 'PO'),
(2, 'PR'),
(3, 'IM'),
(4, 'IV'),
(5, 'ID'),
(6, 'IN');

-- --------------------------------------------------------

--
-- Table structure for table `sample`
--

CREATE TABLE `sample` (
  `id` int(11) NOT NULL,
  `sample` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sample`
--

INSERT INTO `sample` (`id`, `sample`) VALUES
(1, 'stool'),
(2, 'blood'),
(3, 'urine'),
(4, 'tissue biopsy'),
(5, 'sputum');

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE `school` (
  `school_id` int(20) NOT NULL,
  `school` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `school`
--

INSERT INTO `school` (`school_id`, `school`) VALUES
(1, 'Engineering'),
(2, 'Business'),
(3, 'Computer Science&IT'),
(4, 'Nursing'),
(5, 'Tourism&Hospitality Management'),
(6, 'GEGIS/GIS'),
(7, 'Food Science');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id` int(30) NOT NULL,
  `drug_name` varchar(50) NOT NULL,
  `date_supplied` date NOT NULL,
  `unitMeasure` varchar(50) NOT NULL,
  `supplier` varchar(255) NOT NULL,
  `quantity` int(255) NOT NULL,
  `cost` int(255) NOT NULL,
  `availabilty` varchar(255) NOT NULL,
  `creationdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactus`
--

CREATE TABLE `tblcontactus` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(12) DEFAULT NULL,
  `message` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `AdminRemark` mediumtext DEFAULT NULL,
  `LastupdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `IsRead` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcontactus`
--

INSERT INTO `tblcontactus` (`id`, `fullname`, `email`, `contactno`, `message`, `PostingDate`, `AdminRemark`, `LastupdationDate`, `IsRead`) VALUES
(3, 'Elizabeth Nduta Njoki ', 'njoki@gmail.com', 795882261, 'Hello', '2024-01-31 12:43:39', 'hello, how may i assist you', '2024-01-31 12:45:54', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblmedicalhistory`
--

CREATE TABLE `tblmedicalhistory` (
  `ID` int(10) NOT NULL,
  `PatientID` int(10) DEFAULT NULL,
  `complain` varchar(500) DEFAULT NULL,
  `illnesshistory` varchar(500) NOT NULL,
  `physicalexam` varchar(500) DEFAULT NULL,
  `diagnosis` varchar(200) DEFAULT NULL,
  `investigation` varchar(100) NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblpage`
--

CREATE TABLE `tblpage` (
  `ID` int(10) NOT NULL,
  `PageType` varchar(200) DEFAULT NULL,
  `PageTitle` varchar(200) DEFAULT NULL,
  `PageDescription` mediumtext DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT current_timestamp(),
  `OpenningTime` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblpage`
--

INSERT INTO `tblpage` (`ID`, `PageType`, `PageTitle`, `PageDescription`, `Email`, `MobileNumber`, `UpdationDate`, `OpenningTime`) VALUES
(3, 'contactus', 'Contact Details', 'Dedan Kimathi University\r\nJX46+R5G, Nyeri', 'medicalofficer@dkut.ac.ke', 724721258, '2024-05-24 08:59:00', '8 am to 9 pm Weekdays\r\n8 am to 5 pm weekends');

-- --------------------------------------------------------

--
-- Table structure for table `tblpatient`
--

CREATE TABLE `tblpatient` (
  `ID` int(10) NOT NULL,
  `Docid` int(10) DEFAULT NULL,
  `PatientName` varchar(200) DEFAULT NULL,
  `PatientContno` bigint(10) DEFAULT NULL,
  `PatientEmail` varchar(200) DEFAULT NULL,
  `PatientGender` varchar(50) DEFAULT NULL,
  `PatientAdd` mediumtext DEFAULT NULL,
  `PatientAge` int(10) DEFAULT NULL,
  `PatientMedhis` mediumtext DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unitofmeasure`
--

CREATE TABLE `unitofmeasure` (
  `id` int(20) NOT NULL,
  `unitOfMeasure` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unitofmeasure`
--

INSERT INTO `unitofmeasure` (`id`, `unitOfMeasure`) VALUES
(1, 'tablet'),
(2, 'capsule'),
(3, 'millilitre(ml)'),
(4, 'gram(g)'),
(5, 'microgram(mcg)');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(57, 17, 'njenga@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-09 07:40:04', NULL, 1),
(58, 16, 'njokielizabeth637@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-09 08:11:56', NULL, 1),
(59, 16, 'njokielizabeth637@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-09 10:13:53', NULL, 1),
(60, NULL, 'joy@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-10 23:19:04', NULL, 0),
(61, 17, 'njenga@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-10 23:20:10', NULL, 1),
(62, NULL, 'phillip@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-12 11:56:36', NULL, 0),
(63, 19, 'phillip1@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-12 12:00:53', NULL, 1),
(64, 16, 'njokielizabeth637@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-12 18:33:38', NULL, 1),
(65, NULL, 'admin', 0x3a3a3100000000000000000000000000, '2024-02-21 11:49:48', NULL, 0),
(66, NULL, 'admin', 0x3a3a3100000000000000000000000000, '2024-02-21 11:50:23', NULL, 0),
(67, 1, 'njokielizabeth637@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-21 12:01:51', '27-03-2024 08:14:12 PM', 1),
(68, 6, 'jmwangi@gmail.com', 0x3a3a3100000000000000000000000000, '2024-02-26 10:08:49', NULL, 1),
(69, NULL, 'njokielizabeth637@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-05 10:49:26', NULL, 0),
(70, NULL, 'njokielizabeth637@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-05 10:50:25', NULL, 0),
(71, 2, 'mary@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-05 10:51:39', NULL, 1),
(72, NULL, 'njokielizabeth637@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-11 07:53:26', NULL, 0),
(73, NULL, 'njokielizabeth637@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-11 10:22:18', NULL, 0),
(74, NULL, 'njokielizabeth637@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-11 10:22:33', NULL, 0),
(75, 2, 'mary@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-11 10:23:04', NULL, 1),
(76, 10, 'eliza@gmail.com', 0x3a3a3100000000000000000000000000, '2024-03-11 16:25:33', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `role_id` int(11) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `webuser`
--

CREATE TABLE `webuser` (
  `Email` varchar(255) NOT NULL,
  `usertype` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `webuser`
--

INSERT INTO `webuser` (`Email`, `usertype`) VALUES
('username', 'a'),
('email', 'p'),
('docEmail', 'd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctorslog`
--
ALTER TABLE `doctorslog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctorspecilization`
--
ALTER TABLE `doctorspecilization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dosageform`
--
ALTER TABLE `dosageform`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `druginventory`
--
ALTER TABLE `druginventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frequency`
--
ALTER TABLE `frequency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_2` (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `pusher`
--
ALTER TABLE `pusher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`school_id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactus`
--
ALTER TABLE `tblcontactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblmedicalhistory`
--
ALTER TABLE `tblmedicalhistory`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblpage`
--
ALTER TABLE `tblpage`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblpatient`
--
ALTER TABLE `tblpatient`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `unitofmeasure`
--
ALTER TABLE `unitofmeasure`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
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
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `diagnosis`
--
ALTER TABLE `diagnosis`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `doctorslog`
--
ALTER TABLE `doctorslog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `doctorspecilization`
--
ALTER TABLE `doctorspecilization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `dosageform`
--
ALTER TABLE `dosageform`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `druginventory`
--
ALTER TABLE `druginventory`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `frequency`
--
ALTER TABLE `frequency`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pusher`
--
ALTER TABLE `pusher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblcontactus`
--
ALTER TABLE `tblcontactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblmedicalhistory`
--
ALTER TABLE `tblmedicalhistory`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblpage`
--
ALTER TABLE `tblpage`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblpatient`
--
ALTER TABLE `tblpatient`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `unitofmeasure`
--
ALTER TABLE `unitofmeasure`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `myhmsdb`
--
CREATE DATABASE IF NOT EXISTS `myhmsdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `myhmsdb`;

-- --------------------------------------------------------

--
-- Table structure for table `admintb`
--

CREATE TABLE `admintb` (
  `username` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admintb`
--

INSERT INTO `admintb` (`username`, `password`) VALUES
('admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `appointmenttb`
--

CREATE TABLE `appointmenttb` (
  `pid` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `doctor` varchar(30) NOT NULL,
  `docFees` int(5) NOT NULL,
  `appdate` date NOT NULL,
  `apptime` time NOT NULL,
  `userStatus` int(5) NOT NULL,
  `doctorStatus` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `appointmenttb`
--

INSERT INTO `appointmenttb` (`pid`, `ID`, `fname`, `lname`, `gender`, `email`, `contact`, `doctor`, `docFees`, `appdate`, `apptime`, `userStatus`, `doctorStatus`) VALUES
(4, 1, 'Kishan', 'Lal', 'Male', 'kishansmart0@gmail.com', '8838489464', 'Ganesh', 550, '2020-02-14', '10:00:00', 1, 0),
(4, 2, 'Kishan', 'Lal', 'Male', 'kishansmart0@gmail.com', '8838489464', 'Dinesh', 700, '2020-02-28', '10:00:00', 0, 1),
(4, 3, 'Kishan', 'Lal', 'Male', 'kishansmart0@gmail.com', '8838489464', 'Amit', 1000, '2020-02-19', '03:00:00', 0, 1),
(11, 4, 'Shraddha', 'Kapoor', 'Female', 'shraddha@gmail.com', '9768946252', 'ashok', 500, '2020-02-29', '20:00:00', 1, 1),
(4, 5, 'Kishan', 'Lal', 'Male', 'kishansmart0@gmail.com', '8838489464', 'Dinesh', 700, '2020-02-28', '12:00:00', 1, 1),
(4, 6, 'Kishan', 'Lal', 'Male', 'kishansmart0@gmail.com', '8838489464', 'Ganesh', 550, '2020-02-26', '15:00:00', 0, 1),
(2, 8, 'Alia', 'Bhatt', 'Female', 'alia@gmail.com', '8976897689', 'Ganesh', 550, '2020-03-21', '10:00:00', 1, 1),
(5, 9, 'Gautam', 'Shankararam', 'Male', 'gautam@gmail.com', '9070897653', 'Ganesh', 550, '2020-03-19', '20:00:00', 1, 0),
(4, 10, 'Kishan', 'Lal', 'Male', 'kishansmart0@gmail.com', '8838489464', 'Ganesh', 550, '0000-00-00', '14:00:00', 1, 0),
(4, 11, 'Kishan', 'Lal', 'Male', 'kishansmart0@gmail.com', '8838489464', 'Dinesh', 700, '2020-03-27', '15:00:00', 1, 1),
(9, 12, 'William', 'Blake', 'Male', 'william@gmail.com', '8683619153', 'Kumar', 800, '2020-03-26', '12:00:00', 1, 1),
(9, 13, 'William', 'Blake', 'Male', 'william@gmail.com', '8683619153', 'Tiwary', 450, '2020-03-26', '14:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `name` varchar(30) NOT NULL,
  `email` text NOT NULL,
  `contact` varchar(10) NOT NULL,
  `message` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`name`, `email`, `contact`, `message`) VALUES
('Anu', 'anu@gmail.com', '7896677554', 'Hey Admin'),
(' Viki', 'viki@gmail.com', '9899778865', 'Good Job, Pal'),
('Ananya', 'ananya@gmail.com', '9997888879', 'How can I reach you?'),
('Aakash', 'aakash@gmail.com', '8788979967', 'Love your site'),
('Mani', 'mani@gmail.com', '8977768978', 'Want some coffee?'),
('Karthick', 'karthi@gmail.com', '9898989898', 'Good service'),
('Abbis', 'abbis@gmail.com', '8979776868', 'Love your service'),
('Asiq', 'asiq@gmail.com', '9087897564', 'Love your service. Thank you!'),
('Jane', 'jane@gmail.com', '7869869757', 'I love your service!');

-- --------------------------------------------------------

--
-- Table structure for table `doctb`
--

CREATE TABLE `doctb` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `spec` varchar(50) NOT NULL,
  `docFees` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doctb`
--

INSERT INTO `doctb` (`username`, `password`, `email`, `spec`, `docFees`) VALUES
('ashok', 'ashok123', 'ashok@gmail.com', 'General', 500),
('arun', 'arun123', 'arun@gmail.com', 'Cardiologist', 600),
('Dinesh', 'dinesh123', 'dinesh@gmail.com', 'General', 700),
('Ganesh', 'ganesh123', 'ganesh@gmail.com', 'Pediatrician', 550),
('Kumar', 'kumar123', 'kumar@gmail.com', 'Pediatrician', 800),
('Amit', 'amit123', 'amit@gmail.com', 'Cardiologist', 1000),
('Abbis', 'abbis123', 'abbis@gmail.com', 'Neurologist', 1500),
('Tiwary', 'tiwary123', 'tiwary@gmail.com', 'Pediatrician', 450);

-- --------------------------------------------------------

--
-- Table structure for table `patreg`
--

CREATE TABLE `patreg` (
  `pid` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `password` varchar(30) NOT NULL,
  `cpassword` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `patreg`
--

INSERT INTO `patreg` (`pid`, `fname`, `lname`, `gender`, `email`, `contact`, `password`, `cpassword`) VALUES
(1, 'Ram', 'Kumar', 'Male', 'ram@gmail.com', '9876543210', 'ram123', 'ram123'),
(2, 'Alia', 'Bhatt', 'Female', 'alia@gmail.com', '8976897689', 'alia123', 'alia123'),
(3, 'Shahrukh', 'khan', 'Male', 'shahrukh@gmail.com', '8976898463', 'shahrukh123', 'shahrukh123'),
(4, 'Kishan', 'Lal', 'Male', 'kishansmart0@gmail.com', '8838489464', 'kishan123', 'kishan123'),
(5, 'Gautam', 'Shankararam', 'Male', 'gautam@gmail.com', '9070897653', 'gautam123', 'gautam123'),
(6, 'Sushant', 'Singh', 'Male', 'sushant@gmail.com', '9059986865', 'sushant123', 'sushant123'),
(7, 'Nancy', 'Deborah', 'Female', 'nancy@gmail.com', '9128972454', 'nancy123', 'nancy123'),
(8, 'Kenny', 'Sebastian', 'Male', 'kenny@gmail.com', '9809879868', 'kenny123', 'kenny123'),
(9, 'William', 'Blake', 'Male', 'william@gmail.com', '8683619153', 'william123', 'william123'),
(10, 'Peter', 'Norvig', 'Male', 'peter@gmail.com', '9609362815', 'peter123', 'peter123'),
(11, 'Shraddha', 'Kapoor', 'Female', 'shraddha@gmail.com', '9768946252', 'shraddha123', 'shraddha123'),
(12, 'Eliza', 'Njoki', 'Male', 'njokielizabeth637@gmail.com', '0795882261', '12345678', '12345678'),
(13, 'Eliza', 'Njoki', 'Female', 'njokielizabeth637@gmail.com', '0795882261', '12345678', '12345678'),
(14, 'Eliza', 'Njoki', 'Male', 'njokielizabeth637@gmail.com', '0795882261', '12345678', '12345678'),
(15, 'Eliza', 'Njoki', 'Male', 'njoki@gmail.com', '0795882261', 'njoki123', 'njoki123');

-- --------------------------------------------------------

--
-- Table structure for table `prestb`
--

CREATE TABLE `prestb` (
  `doctor` varchar(50) NOT NULL,
  `pid` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `appdate` date NOT NULL,
  `apptime` time NOT NULL,
  `disease` varchar(250) NOT NULL,
  `allergy` varchar(250) NOT NULL,
  `prescription` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `prestb`
--

INSERT INTO `prestb` (`doctor`, `pid`, `ID`, `fname`, `lname`, `appdate`, `apptime`, `disease`, `allergy`, `prescription`) VALUES
('Dinesh', 4, 11, 'Kishan', 'Lal', '2020-03-27', '15:00:00', 'Cough', 'Nothing', 'Just take a teaspoon of Benadryl every night'),
('Ganesh', 2, 8, 'Alia', 'Bhatt', '2020-03-21', '10:00:00', 'Severe Fever', 'Nothing', 'Take bed rest'),
('Kumar', 9, 12, 'William', 'Blake', '2020-03-26', '12:00:00', 'Sever fever', 'nothing', 'Paracetamol -> 1 every morning and night'),
('Tiwary', 9, 13, 'William', 'Blake', '2020-03-26', '14:00:00', 'Cough', 'Skin dryness', 'Intake fruits with more water content'),
('ashok', 11, 4, 'Shraddha', 'Kapoor', '2020-02-29', '20:00:00', 'flu', 'cold', 'keep warm, paracetamol twice a day after every meal');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointmenttb`
--
ALTER TABLE `appointmenttb`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `patreg`
--
ALTER TABLE `patreg`
  ADD PRIMARY KEY (`pid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointmenttb`
--
ALTER TABLE `appointmenttb`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `patreg`
--
ALTER TABLE `patreg`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Database: `ph`
--
CREATE DATABASE IF NOT EXISTS `ph` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ph`;

-- --------------------------------------------------------

--
-- Table structure for table `admin_credentials`
--

CREATE TABLE `admin_credentials` (
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `admin_credentials`
--

INSERT INTO `admin_credentials` (`USERNAME`, `PASSWORD`) VALUES
('Admin', 'Admin123');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `CONTACT_NUMBER` varchar(10) NOT NULL,
  `ADDRESS` varchar(100) NOT NULL,
  `DOCTOR_NAME` varchar(20) NOT NULL,
  `DOCTOR_ADDRESS` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`ID`, `NAME`, `CONTACT_NUMBER`, `ADDRESS`, `DOCTOR_NAME`, `DOCTOR_ADDRESS`) VALUES
(4, 'Kiran Suthar', '1234567690', 'Andheri East', 'Anshari', 'Andheri East'),
(6, 'Aditya', '7365687269', 'Virar West', 'Xyz', 'Virar West'),
(11, 'Shivam Tiwari', '6862369896', 'Dadar West', 'Dr Kapoor', 'Dadar East'),
(13, 'Varsha Suthar', '7622369694', 'Rani Station', 'Dr Ramesh', 'Rani Station'),
(14, 'Prakash Bhattarai', '9802851472', 'Pokhara-16, Dhikidada', 'Hari Bahadur', 'Matepani-12');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `INVOICE_ID` int(11) NOT NULL,
  `NET_TOTAL` double NOT NULL DEFAULT 0,
  `INVOICE_DATE` date NOT NULL DEFAULT current_timestamp(),
  `CUSTOMER_ID` int(11) NOT NULL,
  `TOTAL_AMOUNT` double NOT NULL,
  `TOTAL_DISCOUNT` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`INVOICE_ID`, `NET_TOTAL`, `INVOICE_DATE`, `CUSTOMER_ID`, `TOTAL_AMOUNT`, `TOTAL_DISCOUNT`) VALUES
(1, 30, '2021-10-19', 14, 30, 0),
(2, 2626, '2021-10-19', 6, 2626, 0);

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `PACKING` varchar(20) NOT NULL,
  `GENERIC_NAME` varchar(100) NOT NULL,
  `SUPPLIER_NAME` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `medicines`
--

INSERT INTO `medicines` (`ID`, `NAME`, `PACKING`, `GENERIC_NAME`, `SUPPLIER_NAME`) VALUES
(1, 'Nicip Plus', '10tab', 'Paracetamole', 'BDPL PHARMA'),
(2, 'Crosin', '10tab', 'Hdsgvkvajkcbja', 'Kiran Pharma'),
(4, 'Dolo 650', '15tab', 'paracetamole', 'BDPL PHARMA'),
(5, 'Gelusil', '10tab', 'mint fla', 'Desai Pharma');

-- --------------------------------------------------------

--
-- Table structure for table `medicines_stock`
--

CREATE TABLE `medicines_stock` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `BATCH_ID` varchar(20) NOT NULL,
  `EXPIRY_DATE` varchar(10) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `MRP` double NOT NULL,
  `RATE` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `medicines_stock`
--

INSERT INTO `medicines_stock` (`ID`, `NAME`, `BATCH_ID`, `EXPIRY_DATE`, `QUANTITY`, `MRP`, `RATE`) VALUES
(1, 'Crosin', 'CROS12', '12/34', 2, 2626, 26),
(2, 'Gelusil', 'G327', '12/42', 0, 15, 12),
(3, 'Dolo 650', 'DOLO327', '01/23', 3, 30, 24),
(4, 'Nicip Plus', 'NI325', '05/22', 3, 32.65, 28);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `SUPPLIER_NAME` varchar(100) NOT NULL,
  `INVOICE_NUMBER` int(11) NOT NULL,
  `VOUCHER_NUMBER` int(11) NOT NULL,
  `PURCHASE_DATE` varchar(10) NOT NULL,
  `TOTAL_AMOUNT` double NOT NULL,
  `PAYMENT_STATUS` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `CONTACT_NUMBER` varchar(10) NOT NULL,
  `ADDRESS` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`ID`, `NAME`, `EMAIL`, `CONTACT_NUMBER`, `ADDRESS`) VALUES
(1, 'Desai Pharma', 'desai@gmail.com', '9948724242', 'Mahim East'),
(2, 'BDPL PHARMA', 'bdpl@gmail.com', '8645632963', 'Santacruz West'),
(9, 'Kiran Pharma', 'kiranpharma@gmail.com', '7638683637', 'Andheri East'),
(10, 'Rsrnrnrndnn', 'ydj', '3737355538', '3fndfndfndndfnfdndfn'),
(11, 'Dfnsfndfndf', 'fnsn', '5475734385', 'Ndnss4yrhrhdhrdhrh'),
(12, 'SS Distributors', 'ssdis@gamil.com', '3867868752', 'Matunga West'),
(13, 'Avceve', 'ehh', '3466626226', 'Eteh266266262'),
(14, 'Hrshrhrjher', 'dzgdg', '4636347335', 'Rhrswjrnswjn'),
(15, 'Hmrxfmgtmt', 'trmtrm gm tr', '6553838835', '38ejtdjtdxetjdt'),
(20, 'Dtdxtkmtdshrrhhsrjrs', 'trmtrm gm tr', '6553838835', '38ejtdjtdxetjdt'),
(23, 'Fndn', 'nena ena', '3462462642', 'Ebsbsdbsdndsnsdfns'),
(24, 'Fndnbrwh', 'nena ena', '3462462642', 'Ebsbsdbsdndsnsdfns'),
(25, 'Jnentjrtj', 'nena ena', '3462462642', 'Ebsbsdbsdndsnsdfns'),
(26, 'Jerthjrtjtjr', 'nena ena', '3462462642', 'Ebsbsdbsdndsnsdfns'),
(28, 'Gahgkakbvkv', 'nena ena', '3462462642', 'Ebsbsdbsdndsnsdfns'),
(29, 'Hywhwhrhdw', 'nena ena', '3462462642', 'Ebsbsdbsdndsnsdfns');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_credentials`
--
ALTER TABLE `admin_credentials`
  ADD PRIMARY KEY (`USERNAME`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`INVOICE_ID`);

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `medicines_stock`
--
ALTER TABLE `medicines_stock`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `BATCH_ID` (`BATCH_ID`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`VOUCHER_NUMBER`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `INVOICE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `medicines`
--
ALTER TABLE `medicines`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `medicines_stock`
--
ALTER TABLE `medicines_stock`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `VOUCHER_NUMBER` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- Database: `pharmacy`
--
CREATE DATABASE IF NOT EXISTS `pharmacy` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pharmacy`;

-- --------------------------------------------------------

--
-- Table structure for table `on_hold`
--

CREATE TABLE `on_hold` (
  `id` int(11) NOT NULL,
  `invoice_number` varchar(13) NOT NULL,
  `medicine_name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `expire_date` date NOT NULL,
  `qty` bigint(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `cost` bigint(11) NOT NULL,
  `amount` bigint(11) NOT NULL,
  `profit_amount` bigint(11) NOT NULL,
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `on_hold`
--

INSERT INTO `on_hold` (`id`, `invoice_number`, `medicine_name`, `category`, `expire_date`, `qty`, `type`, `cost`, `amount`, `profit_amount`, `date`) VALUES
(1, 'RS-9390009', 'Biogessic', 'Painkiller', '2020-03-31', 1, 'Stp', 500, 500, 100, '02/22/2019'),
(2, 'RS-2200239', 'Biogessic', 'Painkiller', '2020-03-31', 298, 'Stp', 500, 149000, 29800, '02/22/2019'),
(4, 'RS-2099902', 'Paracetemol', 'Painkiller', '2019-08-15', 1, 'Bot', 500, 500, 100, '02/27/2019'),
(7, 'RS-2922209', 'Paracetemol', 'Painkiller', '2019-08-15', 3, 'Bot', 500, 1500, 300, '02/27/2019'),
(17, 'RS-3920020', 'Paracetemol', 'Painkiller', '2019-02-28', 10, 'Bot', 700, 7000, 2000, '02/28/2019'),
(18, 'RS-9009003', 'Paracetemol', 'Painkiller', '2019-02-28', 3, 'Bot', 700, 2100, 600, '02/28/2019'),
(19, 'RS-9092090', 'Paracetemol', 'Painkiller', '2019-02-28', 2, 'Bot', 700, 1400, 400, '02/28/2019'),
(20, 'RS-9220309', 'Paracetemol', 'Painkiller', '2019-02-28', 2, 'Bot', 700, 1400, 400, '03/01/2019'),
(21, 'RS-0322209', 'Paracetemol', 'Painkiller', '2019-02-28', 93, 'Bot', 700, 65100, 18600, '03/01/2019'),
(22, 'RS-2990220', 'Paracetemol', 'Painkiller', '2019-02-28', 8, 'Bot', 700, 5600, 1600, '03/01/2019'),
(23, 'RS-0939993', 'Paracetemol', 'Painkiller', '2019-02-28', 1, 'Bot', 700, 700, 200, '03/02/2019'),
(24, 'RS-9900203', 'Biogessic', 'Painkiller', '2019-11-14', 1, 'Sachet', 600, 600, 100, '03/02/2019'),
(25, 'RS-9900203', 'Paracetemol', 'Painkiller', '2019-09-19', 2, 'Stp', 600, 1200, 200, '03/02/2019'),
(26, 'RS-9090000', 'Biogessic', 'Painkiller', '2019-11-14', 2, 'Sachet', 600, 1200, 200, '03/02/2019'),
(27, 'RS-2233020', 'Biogessic', 'Painkiller', '2020-03-13', 5, 'Unit', 400, 2000, 500, '03/02/2019'),
(29, 'RS-9292200', 'Biogessic', 'Painkiller', '2019-04-25', 1, 'Bot', 400, 400, 100, '03/02/2019'),
(30, 'RS-3009023', 'Paracetemol', 'Painkiller', '2019-08-14', 3, 'Unit', 400, 1200, 300, '03/02/2019'),
(35, 'RS-0900090', 'Paracetemol', 'Painkiller', '2019-08-14', 2, 'Bot', 400, 800, 200, '03/02/2019'),
(37, 'RS-2099202', 'Paracetemol', 'painkiller', '2011-12-19', 1, 'Bot', 599, 599, 100, '03/04/2019'),
(51, 'RS-9292203', 'Paracetemol', 'Painkiller', '2019-08-03', 3, 'Stp', 500, 1500, 300, '03/05/2019'),
(61, 'RS-0000032', 'Paracetemol', 'Painkiller', '2019-10-01', 5, 'Bot', 500, 2500, 500, '03/05/2019'),
(62, 'RS-0000032', 'Biogessic', 'Painkiller', '2020-03-06', 4, 'Bot', 700, 2800, 800, '03/05/2019'),
(63, 'RS-2909290', 'Paracetemol', 'Painkiller', '2019-10-01', 10, 'Bot', 500, 5000, 1000, '03/05/2019');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `invoice_number` varchar(13) NOT NULL,
  `medicines` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `total_amount` bigint(11) NOT NULL,
  `total_profit` bigint(11) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `invoice_number`, `medicines`, `quantity`, `total_amount`, `total_profit`, `Date`) VALUES
(1, 'RS-9390009', 'Biogessic', '1(Stp)', 500, 100, '2019-02-22'),
(2, 'RS-0900090', 'Biogessic', '1(Stp)', 500, 100, '2019-02-27'),
(3, 'RS-2099902', 'Paracetemol', '1(Bot)', 500, 100, '2019-02-27'),
(4, 'RS-2922209', 'Paracetemol', '3(Bot)', 1500, 300, '2019-02-27'),
(5, 'RS-3920020', 'Paracetemol', '10(Bot)', 7000, 2000, '2019-02-28'),
(6, 'RS-9009003', 'Paracetemol', '3(Bot)', 2100, 600, '2019-02-28'),
(7, 'RS-9220309', 'Paracetemol', '2(Bot)', 1400, 400, '2019-03-01'),
(8, 'RS-0322209', 'Paracetemol', '93(Bot)', 65100, 18600, '2019-03-01'),
(9, 'RS-0939993', 'Paracetemol', '1(Bot)', 700, 200, '2019-03-02'),
(10, 'RS-9900203', 'Biogessic,Paracetemol', '1(Sachet),2(Stp)', 1800, 300, '2019-03-02'),
(11, 'RS-2233020', 'Biogessic', '5(Unit)', 2000, 500, '2019-03-02'),
(12, 'RS-9292200', 'Biogessic', '1(Bot)', 400, 100, '2019-03-02'),
(13, 'RS-2099202', 'Paracetemol', '1(Bot)', 599, 100, '2019-03-04'),
(14, 'RS-9292203', 'Paracetemol', '3(Stp)', 1500, 300, '2019-03-05'),
(15, 'RS-0000032', 'Paracetemol,Biogessic', '5(Bot),4(Bot)', 5300, 1300, '2019-03-05');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id` int(100) NOT NULL,
  `bar_code` varchar(255) NOT NULL,
  `medicine_name` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `quantity` int(100) NOT NULL,
  `used_quantity` int(100) NOT NULL,
  `remain_quantity` int(100) NOT NULL,
  `act_remain_quantity` int(10) NOT NULL,
  `register_date` date NOT NULL,
  `expire_date` date NOT NULL,
  `company` varchar(100) NOT NULL,
  `sell_type` varchar(100) NOT NULL,
  `actual_price` int(100) NOT NULL,
  `selling_price` int(100) NOT NULL,
  `profit_price` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`id`, `bar_code`, `medicine_name`, `category`, `quantity`, `used_quantity`, `remain_quantity`, `act_remain_quantity`, `register_date`, `expire_date`, `company`, `sell_type`, `actual_price`, `selling_price`, `profit_price`, `status`) VALUES
(21, '8901138821852', 'Paracetemol', 'Painkiller', 20, 18, 2, 12, '2019-03-04', '2019-10-01', '', 'Bot', 400, 500, '100(25%)', 'Available'),
(23, '071661013678', 'Biogessic', 'Painkiller', 50, 4, 46, 46, '2019-03-05', '2020-03-06', '', 'Bot', 500, 700, '200(40%)', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `password`) VALUES
(1, 'someone', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `on_hold`
--
ALTER TABLE `on_hold`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `on_hold`
--
ALTER TABLE `on_hold`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- Database: `php`
--
CREATE DATABASE IF NOT EXISTS `php` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `php`;

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `doctorname` text NOT NULL,
  `disease` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `name` text NOT NULL,
  `dob` date NOT NULL,
  `mail` text NOT NULL,
  `docid` int(11) NOT NULL,
  `address` text NOT NULL,
  `phno` varchar(15) NOT NULL,
  `qualification` text NOT NULL,
  `department` text NOT NULL,
  `uname` varchar(32) NOT NULL,
  `pass` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `name` text NOT NULL,
  `feedback` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `name` text NOT NULL,
  `dob` date NOT NULL,
  `mail` text NOT NULL,
  `uname` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`name`, `dob`, `mail`, `uname`, `password`) VALUES
('Eliza', '2000-12-23', 'njoki@gmail.com', 'liza', 'liza'),
('Elizabeth ', '2000-12-24', 'liza@gmail.com', 'Eliza', 'Nduta@38595939');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `filename` varchar(1000) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"medical center_db\",\"table\":\"doctorslog\"},{\"db\":\"medical center_db\",\"table\":\"users\"},{\"db\":\"medical center_db\",\"table\":\"tblmedicalhistory\"},{\"db\":\"medical center_db\",\"table\":\"pusher\"},{\"db\":\"medical center_db\",\"table\":\"tblpatient\"},{\"db\":\"medical center_db\",\"table\":\"prescription\"},{\"db\":\"medical center_db\",\"table\":\"stock\"},{\"db\":\"medical center_db\",\"table\":\"frequency\"},{\"db\":\"medical center_db\",\"table\":\"route\"},{\"db\":\"medical center_db\",\"table\":\"drugname\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'medical center_db', 'pusher', '{\"sorted_col\":\"`pusher`.`creationdate` DESC\"}', '2024-02-19 08:59:41');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-03-06 11:31:48', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `wardadmission`
--
CREATE DATABASE IF NOT EXISTS `wardadmission` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `wardadmission`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
