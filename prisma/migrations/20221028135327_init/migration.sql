-- CreateTable
CREATE TABLE `accesses` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER UNSIGNED NOT NULL,
    `datetime` DATETIME(0) NOT NULL,

    INDEX `accesses_user_id_foreign`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `calendars` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `date_start` DATE NOT NULL,
    `date_finish` DATE NOT NULL,
    `label` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `categories` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `url` VARCHAR(100) NOT NULL,
    `description` TEXT NOT NULL,
    `color` VARCHAR(191) NOT NULL,
    `video` VARCHAR(200) NULL,
    `image` VARCHAR(200) NULL,
    `img_social` VARCHAR(200) NULL,
    `deleted_at` TIMESTAMP(0) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `categories_name_unique`(`name`),
    UNIQUE INDEX `categories_url_unique`(`url`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `category_course` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `category_id` INTEGER UNSIGNED NOT NULL,
    `course_id` INTEGER UNSIGNED NOT NULL,

    INDEX `category_course_category_id_foreign`(`category_id`),
    INDEX `category_course_course_id_foreign`(`course_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `certificates` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER UNSIGNED NOT NULL,
    `course_id` INTEGER UNSIGNED NOT NULL,
    `identify` VARCHAR(191) NOT NULL,
    `date_started` DATE NOT NULL,
    `date_finished` DATE NOT NULL,
    `available` BOOLEAN NOT NULL DEFAULT true,
    `deleted_at` TIMESTAMP(0) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `certificates_identify_unique`(`identify`),
    INDEX `certificates_course_id_foreign`(`course_id`),
    INDEX `certificates_user_id_foreign`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `course_evaluation` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER UNSIGNED NOT NULL,
    `course_id` INTEGER UNSIGNED NOT NULL,
    `stars` INTEGER NOT NULL,
    `date` DATE NOT NULL,
    `testimony` TEXT NULL,
    `visible` BOOLEAN NOT NULL DEFAULT true,

    INDEX `course_evaluation_course_id_foreign`(`course_id`),
    INDEX `course_evaluation_user_id_foreign`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `course_requisite` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `course_id` INTEGER UNSIGNED NOT NULL,
    `requisite_course_id` INTEGER UNSIGNED NOT NULL,

    INDEX `course_requisite_course_id_foreign`(`course_id`),
    INDEX `course_requisite_requisite_course_id_foreign`(`requisite_course_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `courses` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER UNSIGNED NOT NULL,
    `category_id` INTEGER UNSIGNED NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `url` VARCHAR(100) NOT NULL,
    `description` TEXT NOT NULL,
    `date` DATE NOT NULL,
    `certificate_time` TIME(0) NOT NULL,
    `color` VARCHAR(191) NOT NULL,
    `origin` ENUM('vimeo', 'youtube', 'video') NOT NULL DEFAULT 'vimeo',
    `video` VARCHAR(200) NULL,
    `image` VARCHAR(200) NULL,
    `img_social` VARCHAR(200) NULL,
    `level` ENUM('beginner', 'intermediary', 'hard', 'specialist') NOT NULL DEFAULT 'beginner',
    `status` ENUM('scheduled', 'progressing', 'paused', 'finalized') NOT NULL DEFAULT 'progressing',
    `free` BOOLEAN NOT NULL DEFAULT false,
    `single_sale` BOOLEAN NOT NULL DEFAULT false,
    `identify_gateway` INTEGER NULL,
    `price` DOUBLE NULL,
    `old_price` DOUBLE NULL,
    `total_plots` INTEGER NULL,
    `plot_price` DOUBLE NULL,
    `sale_link` VARCHAR(191) NULL,
    `discount_sales_link` VARCHAR(191) NULL,
    `is_promotional` BOOLEAN NOT NULL DEFAULT false,
    `deleted_at` TIMESTAMP(0) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `courses_name_unique`(`name`),
    UNIQUE INDEX `courses_url_unique`(`url`),
    INDEX `courses_category_id_foreign`(`category_id`),
    INDEX `courses_user_id_foreign`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `enrollment` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER UNSIGNED NOT NULL,
    `course_id` INTEGER UNSIGNED NOT NULL,
    `transaction` VARCHAR(191) NOT NULL,
    `purchase_date` DATE NOT NULL,
    `status` ENUM('started', 'approved', 'canceled', 'pending_analysis', 'billet_printed', 'refunded', 'dispute', 'completed', 'blocked', 'chargeback', 'delayed', 'expired') NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `enrollment_course_id_foreign`(`course_id`),
    INDEX `enrollment_user_id_foreign`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `lessons` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `module_id` INTEGER UNSIGNED NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `url` VARCHAR(100) NOT NULL,
    `video` VARCHAR(200) NOT NULL,
    `published` BOOLEAN NOT NULL DEFAULT true,
    `description` TEXT NULL,
    `date` DATE NULL,
    `duration` VARCHAR(8) NULL,
    `origin` ENUM('vimeo', 'youtube', 'video') NOT NULL DEFAULT 'vimeo',
    `free` BOOLEAN NOT NULL DEFAULT false,
    `deleted_at` TIMESTAMP(0) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `lessons_name_unique`(`name`),
    UNIQUE INDEX `lessons_url_unique`(`url`),
    INDEX `lessons_module_id_foreign`(`module_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `migrations` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `migration` VARCHAR(191) NOT NULL,
    `batch` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `modules` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `course_id` INTEGER UNSIGNED NOT NULL,
    `description` TEXT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `modules_name_unique`(`name`),
    INDEX `modules_course_id_foreign`(`course_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `password_resets` (
    `email` VARCHAR(150) NOT NULL,
    `token` VARCHAR(191) NOT NULL,
    `created_at` TIMESTAMP(0) NULL,

    INDEX `password_resets_email_index`(`email`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `permission_profile` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `permission_id` INTEGER UNSIGNED NOT NULL,
    `profile_id` INTEGER UNSIGNED NOT NULL,

    INDEX `permission_profile_permission_id_foreign`(`permission_id`),
    INDEX `permission_profile_profile_id_foreign`(`profile_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `permissions` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(60) NOT NULL,
    `label` VARCHAR(200) NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `permissions_name_unique`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `plans` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `description` VARCHAR(191) NOT NULL,
    `recommended` BOOLEAN NOT NULL DEFAULT false,
    `time_access` INTEGER NOT NULL,
    `recurrence` ENUM('monthly', 'quarterly', 'yearly') NOT NULL,
    `price` DOUBLE NOT NULL,
    `total_plots` INTEGER NOT NULL,
    `plot_price` DOUBLE NOT NULL,
    `visible` BOOLEAN NOT NULL DEFAULT true,
    `text_percent_off` VARCHAR(191) NULL,
    `identify_gateway` VARCHAR(191) NULL,
    `trial_days` INTEGER NOT NULL DEFAULT 0,
    `charges` INTEGER NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `plans_name_unique`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `profile_user` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `profile_id` INTEGER UNSIGNED NOT NULL,
    `user_id` INTEGER UNSIGNED NOT NULL,

    INDEX `profile_user_profile_id_foreign`(`profile_id`),
    INDEX `profile_user_user_id_foreign`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `profiles` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(60) NOT NULL,
    `label` VARCHAR(200) NOT NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `profiles_name_unique`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `replies_support` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER UNSIGNED NOT NULL,
    `support_id` INTEGER UNSIGNED NOT NULL,
    `text` TEXT NOT NULL,
    `date` DATE NOT NULL,
    `visible` BOOLEAN NOT NULL DEFAULT true,
    `likes` INTEGER NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `replies_support_support_id_foreign`(`support_id`),
    INDEX `replies_support_user_id_foreign`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sales` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER UNSIGNED NOT NULL,
    `plan_id` INTEGER UNSIGNED NOT NULL,
    `date` DATE NOT NULL,
    `old_status` VARCHAR(191) NULL,
    `status` VARCHAR(191) NOT NULL,
    `fingerprint` VARCHAR(191) NULL,
    `subscription_at` DATE NULL,
    `expires_at` DATE NULL,
    `subscription_id` VARCHAR(255) NULL,
    `subscription_active` BOOLEAN NOT NULL DEFAULT true,
    `subscription_suspended` BOOLEAN NOT NULL DEFAULT false,
    `subscription_method` VARCHAR(191) NULL,
    `url_billet` VARCHAR(191) NULL,

    INDEX `sales_plan_id_foreign`(`plan_id`),
    INDEX `sales_user_id_foreign`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `specialization_course` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `specialization_id` INTEGER UNSIGNED NOT NULL,
    `course_id` INTEGER UNSIGNED NOT NULL,
    `position` INTEGER NOT NULL,

    INDEX `specialization_course_course_id_foreign`(`course_id`),
    INDEX `specialization_course_specialization_id_foreign`(`specialization_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `specializations` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `url` VARCHAR(100) NOT NULL,
    `description` TEXT NOT NULL,
    `date` DATE NOT NULL,
    `color` VARCHAR(191) NOT NULL,
    `video` VARCHAR(200) NULL,
    `image` VARCHAR(200) NULL,
    `img_social` VARCHAR(200) NULL,
    `deleted_at` TIMESTAMP(0) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `specializations_name_unique`(`name`),
    UNIQUE INDEX `specializations_url_unique`(`url`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `supports` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER UNSIGNED NOT NULL,
    `supportable_id` INTEGER UNSIGNED NOT NULL,
    `supportable_type` VARCHAR(191) NOT NULL,
    `subject` VARCHAR(200) NOT NULL,
    `url` VARCHAR(80) NOT NULL,
    `text` TEXT NOT NULL,
    `date` DATE NOT NULL,
    `date_last_modification` DATE NULL,
    `visible` BOOLEAN NOT NULL DEFAULT true,
    `status` ENUM('P', 'W', 'F', 'C') NOT NULL DEFAULT 'P',
    `likes` INTEGER NULL,
    `owner_unread` BOOLEAN NOT NULL DEFAULT false,
    `manager_unread` BOOLEAN NOT NULL DEFAULT false,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `supports_url_unique`(`url`),
    INDEX `supports_supportable_id_supportable_type_index`(`supportable_id`, `supportable_type`),
    INDEX `supports_user_id_foreign`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `users` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `url` VARCHAR(40) NOT NULL,
    `email` VARCHAR(150) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `image` VARCHAR(100) NULL,
    `bibliography` TEXT NULL,
    `facebook` VARCHAR(30) NULL,
    `twitter` VARCHAR(30) NULL,
    `instagran` VARCHAR(30) NULL,
    `linkedin` VARCHAR(100) NULL,
    `google_plus` VARCHAR(100) NULL,
    `snapchat` VARCHAR(100) NULL,
    `github` VARCHAR(100) NULL,
    `status` ENUM('A', 'I') NOT NULL DEFAULT 'A',
    `blocked` BOOLEAN NOT NULL DEFAULT false,
    `type` ENUM('U', 'T', 'M') NOT NULL DEFAULT 'U',
    `token_activation` VARCHAR(191) NULL,
    `token_access` VARCHAR(255) NULL,
    `subscription` DATE NULL,
    `expires_at` DATE NULL,
    `subscription_id` VARCHAR(255) NULL,
    `subscription_plan` INTEGER NULL,
    `subscription_active` BOOLEAN NOT NULL DEFAULT false,
    `subscription_suspended` BOOLEAN NOT NULL DEFAULT false,
    `remember_token` VARCHAR(100) NULL,
    `deleted_at` TIMESTAMP(0) NULL,
    `created_at` TIMESTAMP(0) NULL,
    `updated_at` TIMESTAMP(0) NULL,

    UNIQUE INDEX `users_url_unique`(`url`),
    UNIQUE INDEX `users_email_unique`(`email`),
    UNIQUE INDEX `users_facebook_unique`(`facebook`),
    UNIQUE INDEX `users_twitter_unique`(`twitter`),
    UNIQUE INDEX `users_instagran_unique`(`instagran`),
    UNIQUE INDEX `users_linkedin_unique`(`linkedin`),
    UNIQUE INDEX `users_google_plus_unique`(`google_plus`),
    UNIQUE INDEX `users_snapchat_unique`(`snapchat`),
    UNIQUE INDEX `users_github_unique`(`github`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `views` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `lesson_id` INTEGER UNSIGNED NOT NULL,
    `user_id` INTEGER UNSIGNED NOT NULL,
    `qty` INTEGER NOT NULL DEFAULT 1,
    `date` DATE NULL,
    `ip` VARCHAR(45) NULL,

    INDEX `views_lesson_id_foreign`(`lesson_id`),
    INDEX `views_user_id_foreign`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `accesses` ADD CONSTRAINT `accesses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `category_course` ADD CONSTRAINT `category_course_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `category_course` ADD CONSTRAINT `category_course_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `certificates` ADD CONSTRAINT `certificates_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `certificates` ADD CONSTRAINT `certificates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `course_evaluation` ADD CONSTRAINT `course_evaluation_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `course_evaluation` ADD CONSTRAINT `course_evaluation_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `course_requisite` ADD CONSTRAINT `course_requisite_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `course_requisite` ADD CONSTRAINT `course_requisite_requisite_course_id_foreign` FOREIGN KEY (`requisite_course_id`) REFERENCES `courses`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `courses` ADD CONSTRAINT `courses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `courses` ADD CONSTRAINT `courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `enrollment` ADD CONSTRAINT `enrollment_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `enrollment` ADD CONSTRAINT `enrollment_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `lessons` ADD CONSTRAINT `lessons_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `modules` ADD CONSTRAINT `modules_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `permission_profile` ADD CONSTRAINT `permission_profile_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `permission_profile` ADD CONSTRAINT `permission_profile_profile_id_foreign` FOREIGN KEY (`profile_id`) REFERENCES `profiles`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `profile_user` ADD CONSTRAINT `profile_user_profile_id_foreign` FOREIGN KEY (`profile_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `profile_user` ADD CONSTRAINT `profile_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `replies_support` ADD CONSTRAINT `replies_support_support_id_foreign` FOREIGN KEY (`support_id`) REFERENCES `supports`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `replies_support` ADD CONSTRAINT `replies_support_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `sales` ADD CONSTRAINT `sales_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `sales` ADD CONSTRAINT `sales_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `specialization_course` ADD CONSTRAINT `specialization_course_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `specialization_course` ADD CONSTRAINT `specialization_course_specialization_id_foreign` FOREIGN KEY (`specialization_id`) REFERENCES `specializations`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `supports` ADD CONSTRAINT `supports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `views` ADD CONSTRAINT `views_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `views` ADD CONSTRAINT `views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
