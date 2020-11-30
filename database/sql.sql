ALTER TABLE `posts`
ADD COLUMN `author`  varchar(50) NOT NULL DEFAULT '' COMMENT '作者' AFTER `updated_at`;

ALTER TABLE `posts`
MODIFY COLUMN `created_at`  int(10) NULL DEFAULT NULL AFTER `replies`,
MODIFY COLUMN `updated_at`  int(10) NULL DEFAULT NULL AFTER `created_at`;

