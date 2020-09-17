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
| user_name | string     | null: false                    |
| email     | string     | null: false                    |
| password  | string     | null: false                    |
| user_id   | references | null: false, foreign_key: true |

### Association

- has_one :items

## items テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| image     | string     | null: false                    |
| item_name | string     | null: false                    |
| price     | string     | null: false                    |
| category  | string     | null: false                    |
| items_id  | references | null: false, foreign_key: true |

- belongs_to :users