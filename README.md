# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| family_name_kana | string  | null: false |
| first_name_kana  | string  | null: false |
| birthday_year    | integer | null: false |
| birthday_month   | integer | null: false |
| birthday_day     | integer | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| price        | integer    | null: false                    |
| category     | integer    | null: false                    |
| status       | integer    | null: false                    |
| delivery_fee | integer    | null: false                    |
| area         | integer    | null: false                    |
| date         | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |
| explanation  | references | foreign_key: true              |

### Association
- belongs_to :user
- has_one :purchase
- has_one :explanation

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| items  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery

## delivery テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post          | string     | null: false                    |
| prefectures   | integer    | null: false                    |
| cities        | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase

## explanation テーブル

| Column      | Type   | Options |
| ----------- | ------ | ------- |
| explanation | string |         |

### Association
- belongs_to :item