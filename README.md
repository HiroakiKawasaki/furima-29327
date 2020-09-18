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

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| nickname  | string     | null: false                    |
| email     | string     | null: false                    |
| password  | string     | null: false                    |
| name      | string     | null: false                    |
| kananame  | string     | null: false                    |
| birthday  | string     | null:,false                    |
| user_id   | references | null: false, foreign_key: true |

### Association

- has_many :items
- has_many :purchases

## items テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| price        | string     | null: false                    |
| category     | string     | null: false                    |
| items_id     | references | null: false, foreign_key: true |
| status       | string     | null: false                    |
| delivery_fee | string     | null: false                    |
| area         | string     | null: false                    |
| date         | string     | null: false                    |

### Association
- belongs_to :users
- has_one :purchases

## purchases テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| items_id | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items
- has_one :delivery

## delivery テーブル
| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| post          | string | null: false |
| prefectures   | string | null: false |
| cities        | string | null: false |
| address       | string | null: false |
| building_name | string |             |
| phone_number  | string | null: false |

### Association
- belongs_to :purchases