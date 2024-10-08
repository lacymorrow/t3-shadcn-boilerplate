CREATE TABLE `todo-today_account` (
	`user_id` text(255) NOT NULL,
	`type` text(255) NOT NULL,
	`provider` text(255) NOT NULL,
	`provider_account_id` text(255) NOT NULL,
	`refresh_token` text,
	`access_token` text,
	`expires_at` integer,
	`token_type` text(255),
	`scope` text(255),
	`id_token` text,
	`session_state` text(255),
	PRIMARY KEY(`provider`, `provider_account_id`),
	FOREIGN KEY (`user_id`) REFERENCES `todo-today_user`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `todo-today_post` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`name` text(256),
	`created_by` text(255) NOT NULL,
	`created_at` integer DEFAULT (unixepoch()) NOT NULL,
	`updatedAt` integer,
	FOREIGN KEY (`created_by`) REFERENCES `todo-today_user`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `todo-today_session` (
	`session_token` text(255) PRIMARY KEY NOT NULL,
	`userId` text(255) NOT NULL,
	`expires` integer NOT NULL,
	FOREIGN KEY (`userId`) REFERENCES `todo-today_user`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `todo-today_user` (
	`id` text(255) PRIMARY KEY NOT NULL,
	`display_name` text(255),
	`primary_email` text(255) NOT NULL,
	`primary_email_verified` integer DEFAULT (unixepoch()),
	`profile_image_url` text(255),
	`signed_up_at` integer DEFAULT (unixepoch())
);
--> statement-breakpoint
CREATE TABLE `todo-today_verification_token` (
	`identifier` text(255) NOT NULL,
	`token` text(255) NOT NULL,
	`expires` integer NOT NULL,
	PRIMARY KEY(`identifier`, `token`)
);
--> statement-breakpoint
CREATE INDEX `account_user_id_idx` ON `todo-today_account` (`user_id`);--> statement-breakpoint
CREATE INDEX `created_by_idx` ON `todo-today_post` (`created_by`);--> statement-breakpoint
CREATE INDEX `name_idx` ON `todo-today_post` (`name`);--> statement-breakpoint
CREATE INDEX `session_userId_idx` ON `todo-today_session` (`userId`);