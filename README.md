# テーブル設計

## users テーブル

| Column                    | Type      | Options                        |
| ------------------------- | --------- | ------------------------------ |
| nickname                  | string    | null: false                    |
| email                     | string    | null: false                    |
| password                  | string    | null: false                    |
| first_name                | string    | null: false                    |
| last_name                 | string    | null: false                    |
| first_name_kana           | string    | null: false                    |
| last_name_kana            | string    | null: false                    |
| birthday                  | date      | null: false                    |

### Association

- has_many :items
- has_many :shipping_addresss
- has_many :purchase_records

## item テーブル

| Column                    | Type      | Options                        |
| ------------------------- | --------- | ------------------------------ |
| name                      | string    | null: false                    |
| text                      | text      | null: false                    |
| category                  | integer   | null: false                    |
| condition                 | integer   | null: false                    |
| delivery_charge           | integer   | null: false                    |
| delivery_area             | integer   | null: false                    |
| delivery_days             | integer   | null: false                    |
| price                     | integer   | null: false                    |
| user                      | references| null: false, foreign_key: true |
| shipping_address          | references| null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :shipping_address


## shipping_address テーブル

| Column                    | Type      | Options                        |
| ------------------------- | --------- | ------------------------------ |
| postal_code               | string    | null: false                    |
| prefectures-id            | integer   | null: false                    |
| municipality              | string    | null: false                    |
| address                   | string    | null: false                    |
| building_name             | string    |                                |
| phone_number              | string    | null: false                    |
| purchase_record           | references| null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- belongs_to :purchase_record



## purchase_record テーブル

| Column                    | Type      | Options                        |
| ------------------------- | --------- | ------------------------------ |
| user                      | references| null: false, foreign_key: true |
| item                      | references| null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address