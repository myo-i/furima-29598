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


| Column              | Type   | Options                         |
| ------------------- | ------ | ------------------------------- |
| user_id             | integer | null: false, foreign_key: true |
| name                | string | null: false                     |
| description         | text   | null: false                     |
| category            | string | null: false                     |
| product_state       | string | null: false                     |
| payment_burden      | string | null: false                     |
| area                | string | null: false                     |
| delivery_days       | string | null: false                     |
| price               | integer | null: false                    |



## purchasesテーブル

### Association
- has_one :delivery

| Column              | Type   | Options                         |
| ------------------- | ------ | ------------------------------- |
| user_id             | integer | null: false, foreign_key: true |
| item_id             | integer | null: false, foreign_key: true |



## deliveriesテーブル

### Association
- belongs_to :purchase

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| postal_code         | string | null: false |
| prefectures         | integer| null: false |
| city                | string | null: false |
| block               | string | null: false |
| building_name       | string |             |
| phone_number        | string | null: false |