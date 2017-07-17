DROP TABLE IF EXISTS `agency`;
CREATE TABLE `agency` (
  `agency_id` int(11) PRIMARY KEY,
  `agency_name` varchar(50) DEFAULT NULL,
  `agency_url` varchar(225) DEFAULT NULL,
  `agency_timezone` varchar(50) DEFAULT NULL,
  `agency_lang` varchar(100) DEFAULT NULL,
  `agency_phone` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `calendar`;
CREATE TABLE `calendar` (
  `service_id` int(11) DEFAULT NULL,
  `monday` int(11) DEFAULT NULL,
  `tuesday` int(11) DEFAULT NULL,
  `wednesday` int(11) DEFAULT NULL,
  `thursday` int(11) DEFAULT NULL,
  `friday` int(11) DEFAULT NULL,
  `saturday` int(11) DEFAULT NULL,
  `sunday` int(11) DEFAULT NULL,
  `start_date` int(11) DEFAULT NULL,
  `end_date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `calendar_dates`;
CREATE TABLE `calendar_dates` (
  `service_id` int(11) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `exception_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `fare_attributes`;
CREATE TABLE `fare_attributes` (
  `fare_id` varchar(25) DEFAULT NULL,
  `price` decimal(3,2) DEFAULT NULL,
  `currency_type` varchar(10) DEFAULT NULL,
  `payment_method` int(11) DEFAULT NULL,
  `transfers` int(11) DEFAULT NULL,
  `transfer_duration` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `fare_rules`;
CREATE TABLE `fare_rules` (
  `fare_id` varchar(20) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `origin_id` int(11) DEFAULT NULL,
  `destination_id` int(11) DEFAULT NULL,
  `contains_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `routes`;
CREATE TABLE `routes` (
  `route_id` int(11) PRIMARY KEY,
  `agency_id` int(11) DEFAULT NULL,
  `route_short_name` varchar(80) DEFAULT NULL,
  `route_long_name` varchar(225) DEFAULT NULL,
  `route_desc` varchar(500) DEFAULT NULL,
  `route_type` int(11) DEFAULT NULL,
  `route_url` varchar(225) DEFAULT NULL,
  `route_color` varchar(10) DEFAULT NULL,
  `route_text_color` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `shapes`;
CREATE TABLE `shapes` (
  `shape_id` int(11) DEFAULT NULL,
  `shape_pt_lat` decimal(9,6) DEFAULT NULL,
  `shape_pt_lon` decimal(9,6) DEFAULT NULL,
  `shape_pt_sequence` int(11) DEFAULT NULL,
  `shape_dist_traveled` decimal(7,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `stop_times`;
CREATE TABLE `stop_times` (
  `trip_id` varchar(20) DEFAULT NULL,
  `arrival_time` varchar(8) DEFAULT NULL,
  `departure_time` varchar(8) DEFAULT NULL,
  `stop_id` int(11) DEFAULT NULL,
  `stop_sequence` int(11) DEFAULT NULL,
  `stop_headsign` int(11) DEFAULT NULL,
  `pickup_type` int(11) DEFAULT NULL,
  `drop_off_type` int(11) DEFAULT NULL,
  `shape_dist_traveled` decimal(8,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `stops`;
CREATE TABLE `stops` (
  `stop_id` int(11) PRIMARY KEY,
  `stop_code` int(11) DEFAULT NULL,
  `stop_name` varchar(225) DEFAULT NULL,
  `stop_desc` varchar(225) DEFAULT NULL,
  `stop_lat` decimal(9,6) DEFAULT NULL,
  `stop_lon` decimal(9,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `trips`;
CREATE TABLE `trips` (
  `route_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `trip_id` varchar(20) PRIMARY KEY,
  `trip_headsign` varchar(225) DEFAULT NULL,
  `direction_id` int(11) DEFAULT NULL,
  `block_id` int(11) DEFAULT NULL,
  `shape_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOAD DATA LOCAL INFILE './gtfs/agency.txt' INTO TABLE agency FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './gtfs/calendar.txt' INTO TABLE calendar FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './gtfs/calendar_dates.txt' INTO TABLE calendar_dates FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './gtfs/fare_attributes.txt' INTO TABLE fare_attributes FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './gtfs/fare_rules.txt' INTO TABLE fare_rules FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './gtfs/routes.txt' INTO TABLE routes FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './gtfs/shapes.txt' INTO TABLE shapes FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './gtfs/stop_times.txt' INTO TABLE stop_times FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './gtfs/stops.txt' INTO TABLE stops FIELDS TERMINATED BY ',' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './gtfs/trips.txt' INTO TABLE trips FIELDS TERMINATED BY ',' IGNORE 1 LINES;
