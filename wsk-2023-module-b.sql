-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 23 2023 г., 15:07
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `wsk-2023-module-b`
--

-- --------------------------------------------------------

--
-- Структура таблицы `api_tokens`
--

CREATE TABLE `api_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `workspace_id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  `revoked_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `api_tokens`
--

INSERT INTO `api_tokens` (`id`, `workspace_id`, `name`, `token`, `created_at`, `revoked_at`) VALUES
(1, 1, 'production', 'XBfpmD2mHY9HHWYABRsoZDMQYrsqx4ay1r34aqtr', '2023-11-23 12:06:32', NULL),
(2, 1, 'development', '003enxaNVoNWbdhJg38XfyGQtrPUTGWnTZkCNN3K', '2023-11-23 09:00:57', NULL),
(3, 1, 'gsfdgdfs', 'cinLSERfg9Vn983gIy6cM6IeDkH7w0cG2xTCYGDh', '2023-11-23 09:02:08', NULL),
(4, 1, 'dsffdsdfs', 'RasaBJpHopCleebRmX9ZMHi3bwJLhHJvNQDunFPt', '2023-11-23 09:05:30', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `bills`
--

CREATE TABLE `bills` (
  `id` bigint UNSIGNED NOT NULL,
  `workspace_id` bigint UNSIGNED NOT NULL,
  `service_id` bigint UNSIGNED NOT NULL,
  `api_token_id` bigint UNSIGNED NOT NULL,
  `usage_service_per_sec` double(11,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `bills`
--

INSERT INTO `bills` (`id`, `workspace_id`, `service_id`, `api_token_id`, `usage_service_per_sec`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 24.000, '2023-11-23 09:00:57', '2023-11-23 09:00:57');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2023_11_23_083534_create_workspaces_table', 1),
(4, '2023_11_23_084112_create_service_usages_table', 1),
(5, '2023_11_23_091555_create_api_tokens_table', 1),
(6, '2023_11_23_094823_create_quotas_table', 1),
(7, '2023_11_23_100356_create_services_table', 1),
(8, '2023_11_23_100411_create_bills_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `quotas`
--

CREATE TABLE `quotas` (
  `id` bigint UNSIGNED NOT NULL,
  `workspace_id` bigint UNSIGNED NOT NULL,
  `limit` double(11,6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `quotas`
--

INSERT INTO `quotas` (`id`, `workspace_id`, `limit`, `created_at`, `updated_at`) VALUES
(2, 1, 32.000000, '2023-11-23 09:05:55', '2023-11-23 09:05:55');

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE `services` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_cost_per_sec` double(11,7) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`id`, `name`, `service_cost_per_sec`, `created_at`, `updated_at`) VALUES
(1, 'Service #1', 0.0015000, '2023-11-23 09:00:57', '2023-11-23 09:00:57');

-- --------------------------------------------------------

--
-- Структура таблицы `service_usages`
--

CREATE TABLE `service_usages` (
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `workspace_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usage_duration_in_ms` int NOT NULL,
  `usage_started_at` timestamp NOT NULL,
  `service_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_cost_per_sec` double(11,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `service_usages`
--

INSERT INTO `service_usages` (`username`, `workspace_title`, `api_token_name`, `usage_duration_in_ms`, `usage_started_at`, `service_name`, `service_cost_per_sec`) VALUES
('demo1', 'My App', 'production', 38, '2023-07-01 09:31:48', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 36, '2023-07-01 22:43:17', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 38, '2023-07-02 09:36:12', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 36, '2023-07-02 22:54:02', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 38, '2023-07-03 05:34:24', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 39, '2023-07-03 16:21:00', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 39, '2023-07-03 21:52:59', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 36, '2023-07-04 11:54:21', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 39, '2023-07-04 15:25:28', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 38, '2023-07-05 06:47:05', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 37, '2023-07-05 07:45:33', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 37, '2023-07-05 20:18:46', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 36, '2023-07-05 22:07:11', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 37, '2023-07-06 07:03:32', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 38, '2023-07-06 18:00:55', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 38, '2023-07-06 21:46:37', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 38, '2023-07-07 11:13:47', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 39, '2023-07-08 00:31:04', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 38, '2023-07-08 07:53:46', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 36, '2023-07-08 16:25:26', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 38, '2023-07-08 17:12:54', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 36, '2023-07-08 23:40:36', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 36, '2023-07-09 00:33:45', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 35, '2023-07-09 01:15:18', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 38, '2023-07-09 09:57:03', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 37, '2023-07-09 19:32:25', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 39, '2023-07-10 10:25:13', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 37, '2023-07-10 18:01:00', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 35, '2023-07-11 05:41:27', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 37, '2023-07-11 15:09:11', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 38, '2023-07-11 23:00:39', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 38, '2023-07-12 03:40:13', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 39, '2023-07-12 13:27:25', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 39, '2023-07-13 02:38:15', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 39, '2023-07-13 03:45:52', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 38, '2023-07-13 09:23:03', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 39, '2023-07-14 00:33:35', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 35, '2023-07-14 12:21:23', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 36, '2023-07-14 21:42:34', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 37, '2023-07-15 02:08:06', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 5, '2023-07-15 03:29:00', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 21, '2023-06-30 21:46:04', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 20, '2023-07-01 16:02:15', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 20, '2023-07-01 22:53:57', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 23, '2023-07-02 02:26:37', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 22, '2023-07-02 14:41:25', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 22, '2023-07-03 00:16:59', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 22, '2023-07-03 17:12:08', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 21, '2023-07-03 18:02:06', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 22, '2023-07-03 23:21:34', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 24, '2023-07-04 06:54:53', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 20, '2023-07-04 13:28:14', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 24, '2023-07-04 13:40:11', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 21, '2023-07-04 19:33:10', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 23, '2023-07-05 05:47:03', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 22, '2023-07-05 07:25:03', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 22, '2023-07-05 19:35:58', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 20, '2023-07-06 04:22:29', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 22, '2023-07-06 14:23:32', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 23, '2023-07-07 01:41:43', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 21, '2023-07-07 20:28:06', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 22, '2023-07-08 06:57:25', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 24, '2023-07-08 10:39:33', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 21, '2023-07-08 14:15:40', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 21, '2023-07-09 10:56:12', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 22, '2023-07-10 01:57:01', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 24, '2023-07-10 02:07:02', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 24, '2023-07-10 18:50:49', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 23, '2023-07-11 13:35:38', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 20, '2023-07-11 15:16:30', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 22, '2023-07-11 18:37:35', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 22, '2023-07-12 03:47:41', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 24, '2023-07-12 18:10:36', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 1, '2023-07-13 01:07:44', 'Service #2', 0.005000),
('demo1', 'My App', 'development', 10, '2023-07-01 11:49:36', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 12, '2023-07-02 03:20:00', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 12, '2023-07-02 18:20:36', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 10, '2023-07-02 19:34:48', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 11, '2023-07-02 21:42:10', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 10, '2023-07-03 03:08:20', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 11, '2023-07-03 11:12:21', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 10, '2023-07-03 17:07:24', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 9, '2023-07-03 17:31:09', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 10, '2023-07-04 09:06:29', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 9, '2023-07-04 19:17:28', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 10, '2023-07-04 20:46:47', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 12, '2023-07-04 22:11:00', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 12, '2023-07-05 10:41:06', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 12, '2023-07-06 02:20:54', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 11, '2023-07-06 05:08:26', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 12, '2023-07-06 22:28:25', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 10, '2023-07-07 07:58:39', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 8, '2023-07-07 10:05:19', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 8, '2023-07-08 00:32:52', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 12, '2023-07-08 09:58:52', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 8, '2023-07-08 11:10:00', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 10, '2023-07-09 01:24:20', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 11, '2023-07-09 11:00:18', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 10, '2023-07-10 04:03:09', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 12, '2023-07-10 17:02:58', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 9, '2023-07-11 04:40:12', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 11, '2023-07-11 05:54:20', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 9, '2023-07-11 08:04:47', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 10, '2023-07-11 11:31:53', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 10, '2023-07-11 19:49:51', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 11, '2023-07-12 05:08:02', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 9, '2023-07-12 17:50:56', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 8, '2023-07-13 09:58:42', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 9, '2023-07-13 15:23:09', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 11, '2023-07-14 02:58:02', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 10, '2023-07-14 19:50:28', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 11, '2023-07-15 11:07:17', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 11, '2023-07-16 02:22:49', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 5, '2023-07-16 17:01:16', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 59, '2023-08-02 03:37:43', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 58, '2023-08-03 06:38:46', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 58, '2023-08-04 03:01:52', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 58, '2023-08-04 18:47:44', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 61, '2023-08-05 14:31:08', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 61, '2023-08-05 17:41:15', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 61, '2023-08-07 05:05:30', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 62, '2023-08-07 13:41:37', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 62, '2023-08-08 23:19:23', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 58, '2023-08-10 10:48:53', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 62, '2023-08-11 01:45:15', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 58, '2023-08-11 05:33:24', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 62, '2023-08-11 20:26:58', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 60, '2023-08-12 13:47:42', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 60, '2023-08-13 03:53:03', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 62, '2023-08-14 14:45:21', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 62, '2023-08-14 21:40:03', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 15, '2023-08-16 08:42:20', 'Service #1', 0.001500),
('demo1', 'My App', 'production', 35, '2023-08-01 14:25:25', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 35, '2023-08-02 07:19:34', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 35, '2023-08-03 02:06:20', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 35, '2023-08-03 21:38:11', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 32, '2023-08-05 06:11:48', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 35, '2023-08-06 07:54:57', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 33, '2023-08-06 08:51:05', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 34, '2023-08-08 04:52:41', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 32, '2023-08-09 02:57:04', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 33, '2023-08-10 09:56:36', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 36, '2023-08-11 14:54:06', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 36, '2023-08-12 18:51:08', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 33, '2023-08-13 23:19:40', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 33, '2023-08-15 11:45:57', 'Service #2', 0.005000),
('demo1', 'My App', 'production', 24, '2023-08-16 07:56:30', 'Service #2', 0.005000),
('demo1', 'My App', 'development', 6, '2023-08-01 22:14:43', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 5, '2023-08-02 23:53:32', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 7, '2023-08-03 15:21:29', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 8, '2023-08-04 16:53:18', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 8, '2023-08-05 08:25:30', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 8, '2023-08-06 04:10:20', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 6, '2023-08-06 13:26:15', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 7, '2023-08-06 14:58:22', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 7, '2023-08-07 06:44:31', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 6, '2023-08-08 05:25:03', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 7, '2023-08-08 22:55:19', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 8, '2023-08-09 16:26:31', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 5, '2023-08-09 18:04:41', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 8, '2023-08-10 00:42:46', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 8, '2023-08-10 07:57:31', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 5, '2023-08-11 02:10:14', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 4, '2023-08-11 11:32:56', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 6, '2023-08-11 15:47:10', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 6, '2023-08-12 06:32:43', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 6, '2023-08-12 17:52:12', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 8, '2023-08-13 05:31:00', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 6, '2023-08-13 22:27:34', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 5, '2023-08-15 01:44:24', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 6, '2023-08-15 04:29:27', 'Service #1', 0.001500),
('demo1', 'My App', 'development', 6, '2023-08-15 15:28:44', 'Service #1', 0.001500);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 'demo1', '$2y$10$Zwy57U7vlDEmAd7kq0Q2Ne7FgbeNTo5hr5qesZvbQ9jaH92RstZFG', '2023-11-23 09:00:56', '2023-11-23 09:00:56'),
(2, 'demo2', '$2y$10$vnPxEN/CQnfbIKXZWhneRe5YortUUrwo3Xx5qu92BxMSjRwgV1F/2', '2023-11-23 09:00:57', '2023-11-23 09:00:57');

-- --------------------------------------------------------

--
-- Структура таблицы `workspaces`
--

CREATE TABLE `workspaces` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `workspaces`
--

INSERT INTO `workspaces` (`id`, `user_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'My App', 'This is workspace 1', NULL, '2023-11-23 09:04:42'),
(2, 1, 'gdfs', NULL, '2023-11-23 09:02:33', '2023-11-23 09:02:33'),
(3, 1, 'fgds', NULL, '2023-11-23 09:02:54', '2023-11-23 09:02:54');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `api_tokens`
--
ALTER TABLE `api_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `api_tokens_workspace_id_foreign` (`workspace_id`);

--
-- Индексы таблицы `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_workspace_id_foreign` (`workspace_id`),
  ADD KEY `bills_service_id_foreign` (`service_id`),
  ADD KEY `bills_api_token_id_foreign` (`api_token_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `quotas`
--
ALTER TABLE `quotas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotas_workspace_id_foreign` (`workspace_id`);

--
-- Индексы таблицы `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `workspaces`
--
ALTER TABLE `workspaces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workspaces_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `api_tokens`
--
ALTER TABLE `api_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `bills`
--
ALTER TABLE `bills`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `quotas`
--
ALTER TABLE `quotas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `workspaces`
--
ALTER TABLE `workspaces`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `api_tokens`
--
ALTER TABLE `api_tokens`
  ADD CONSTRAINT `api_tokens_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`);

--
-- Ограничения внешнего ключа таблицы `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_api_token_id_foreign` FOREIGN KEY (`api_token_id`) REFERENCES `api_tokens` (`id`),
  ADD CONSTRAINT `bills_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `bills_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`);

--
-- Ограничения внешнего ключа таблицы `quotas`
--
ALTER TABLE `quotas`
  ADD CONSTRAINT `quotas_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`);

--
-- Ограничения внешнего ключа таблицы `workspaces`
--
ALTER TABLE `workspaces`
  ADD CONSTRAINT `workspaces_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
