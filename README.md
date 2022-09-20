# README


## usersテーブル

| colum              | types  | option                     |
| ------------------ | ------ | -------------------------- |
| nickname           | string | null: false                |
| email              | string | null: false, uniqure: true |
| encrypted_password | string | null: false                |
| last_name          | string | null: false                |
| first_name         | string | null: false                |
| kana_last_name     | string | null: false                |
| kana_first_name    | string | null: false                |
| birthday           | date   | null: false                |


## Association

- has_many :sells
- has_many :buys





## sellsテーブル

| colum          | types      | option                         |
| -------------- | ---------- | ------------------------------ |
| nickname       | string     | null: false                    |
| title          | string     | null: false                    |
| price          | string     | null: false                    |
| category       | string     | null: false                    |
| condition      | string     | null: false                    |
| derivery_price | string     | null: false                    |
| place          | text       | null: false                    |
| delively       | date       | null: false                    |
| user           | references | null: false, foreign_key: true |

## Association

  
- belongs_to :users
- has_many :buys





## buysテーブル

| colum          | types      | option                         |
| -------------- | ---------- | ------------------------------ |
| country        | string     | null: false                    |
| city           | string     | null: false                    |
| address_number | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     | null: false                    |
| phone_number   | string     | null: false                    |
| user           | references | null: false, foreign_key: true |

## Association


- belongs_to :sells
- belongs_to :users