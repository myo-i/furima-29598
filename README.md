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
# テーブル設計

## usersテーブル

### Association
- has_many :items
- has_many :orders

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| first_name          | string | null: false |
| last_name           | string | null: false |
| first_name_kana     | string | null: false |
| last_name_kana      | string | null: false |
| birth_date          | date   | null: false |
| email               | string | null: false |
| password            | string | null: false |




## itemsテーブル

### Association
- belongs_to :user
- has_many :orders


| Column              | Type   | Options                         |
| ------------------- | ------ | ------------------------------- |
| user_id             | integer | null: false, foreign_key: true |
| name                | string | null: false                     |
| description         | text   | null: false                     |
| category_id         | integer | null: false                    |
| product_state_id    | integer | null: false                    |
| payment_burden_id   | integer | null: false                    |
| area_id             | integer | null: false                    |
| delivery_days_id    | integer | null: false                    |
| price               | integer | null: false                    |



## ordersテーブル

### Association
- has_one :delivery
- belongs_to :user
- belongs_to :item

| Column              | Type   | Options                         |
| ------------------- | ------ | ------------------------------- |
| user_id             | integer | null: false, foreign_key: true |
| item_id             | integer | null: false, foreign_key: true |



## deliveriesテーブル

### Association
- belongs_to :purchase

| Column              | Type   | Options                         |
| ------------------- | ------ | ------------------------------- |
| order_id        | integer | null: false, foreign_key: true |
| postal_code         | string | null: false                     |
| prefecture_id      | integer | null: false                    |
| city                | string | null: false                     |
| block               | string | null: false                     |
| building_name       | string |                                 |
| phone_number        | string | null: false                     |