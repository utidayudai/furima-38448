# README


## usersテーブル

| colum              | types  | option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| kana_last_name     | string | null: false               |
| kana_first_name    | string | null: false               |
| birthday           | date   | null: false               |


## Association

- has_many :sells
- has_many :buy_records





## sellsテーブル

| colum             | types      | option                         |
| ----------------- | ---------- | ------------------------------ |
| title             | string     | null: false                    |
| title_content     | text       | null: false                    |
| price             | integer    | null: false                    |
| category_id       | integer    | null: false                    |
| condition_id      | integer    | null: false                    |
| derivery_price_id | integer    | null: false                    |
| place_id          | integer    | null: false                    |
| delively_id       | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

## Association

  
- belongs_to :user
- has_many :buy_records





## buysテーブル

| colum          | types      | option                         |
| -------------- | ---------- | ------------------------------ |
| country_id     | integer    | null: false                    |
| city           | string     | null: false                    |
| address_number | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| buy_record     | references | null: false, foreign_key: true |


## Association


- belongs_to :buy_record


## buy_recordsテーブル

| colum | types      | option                         |
| ----- | ---------- | ------------------------------ |
| user  | references | null: false, foreign_key: true |
| sell  | references | null: false, foreign_key: true |

## Association


- belongs_to :user
- has_one :buy
- belongs_to :sell