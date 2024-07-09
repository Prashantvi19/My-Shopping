package dot.java.moldel;

import java.sql.*;

public class UserTable {

	public static int usertable() {
		try {
//			ALTER TABLE `orderbill` ADD `billPaid` VARCHAR(255) NULL DEFAULT NULL AFTER `payment`, ADD `discountPer` VARCHAR(255) NULL DEFAULT NULL AFTER `billPaid`, ADD `discount` VARCHAR(255) NULL DEFAULT NULL AFTER `discountPer`, ADD `shippingCharge` VARCHAR(255) NULL DEFAULT NULL AFTER `discount`;
			String productTable = "CREATE TABLE `onlineshoppingdb`.`products` (`id` INT(10) NULL DEFAULT NULL AUTO_INCREMENT , `productName` VARCHAR(255) NULL DEFAULT NULL , `category` VARCHAR(255) NULL DEFAULT NULL , `price` INT(10) NULL DEFAULT NULL , `activeStatus` VARCHAR(255) NULL DEFAULT NULL , `imageAddress` TEXT NULL DEFAULT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;";
			String AddressTable = "CREATE TABLE `onlineshoppingdb`.`addressusers` (`id` INT(10) NULL DEFAULT NULL AUTO_INCREMENT , `address` TEXT NULL DEFAULT NULL , `city` VARCHAR(100) NULL DEFAULT NULL , `state` VARCHAR(100) NULL DEFAULT NULL , `country` VARCHAR(255) NULL DEFAULT NULL , `mobileNumber` VARCHAR(12) NULL DEFAULT NULL , `email` VARCHAR(255) NULL DEFAULT NULL , `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP , PRIMARY KEY (`id`)) ENGINE = InnoDB;;";
			String CardTable = "CREATE TABLE `onlineshoppingdb`.`usercards` (`id` INT(10) NOT NULL , `email` VARCHAR(100) NOT NULL , `product_id` INT(10) NOT NULL , `quantity` VARCHAR(30) NOT NULL , `price` VARCHAR(40) NOT NULL , `total` VARCHAR(255) NOT NULL , `address_id` INT(10) NOT NULL , `orderedDate` DATE NOT NULL , `deliveryDate` DATE NOT NULL , `paymentMethod` VARCHAR(50) NOT NULL , `transactionID` VARCHAR(255) NOT NULL , `status` VARCHAR(20) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;;";
			String OrderTable = "CREATE TABLE `onlineshoppingdb`.`orderbill` (`id` INT(10) NULL DEFAULT NULL AUTO_INCREMENT , `email` VARCHAR(255) NULL DEFAULT NULL , `orderDate` DATE NULL DEFAULT NULL , `delivaryDate` DATE NULL DEFAULT NULL , `payment` VARCHAR(255) NULL DEFAULT NULL , `transactionId` VARCHAR(255) NULL DEFAULT NULL , `status` VARCHAR(255) NULL DEFAULT NULL , `addressId` VARCHAR(20) NULL DEFAULT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;;";

			String userTable = "CREATE TABLE `user` (`id` INT NULL DEFAULT NULL , `name` VARCHAR(40) NULL DEFAULT NULL , `email` VARCHAR(100) NULL DEFAULT NULL , `mobileNumber` VARCHAR(12) NULL DEFAULT NULL , `answer` VARCHAR(255) NULL DEFAULT NULL , `password` VARCHAR(100) NULL DEFAULT NULL );";
			String messageBody ="CREATE TABLE `onlineshoppingdb`.`contactus` (`id` INT(10) NULL DEFAULT NULL , `email` VARCHAR(255) NULL DEFAULT NULL , `subject` VARCHAR(255) NULL DEFAULT NULL , `message` TEXT NULL DEFAULT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;";
			String feedBack ="CREATE TABLE `onlineshoppingdb`.`feedback` (`id` INT(10) NULL DEFAULT NULL , `email` VARCHAR(255) NOT NULL , `feedback` TEXT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;";
			
			PreparedStatement ps = DB_Connection.getDBConPs(userTable);
			ps.execute();
			System.out.println(productTable);
			System.out.println(userTable);

			return 1;

		} catch (Exception e) {
			System.out.println(e);
			return 0;
		}
	}

}
