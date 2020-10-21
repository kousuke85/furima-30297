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
| category                  | string    | null: false                    |
| condition                 | string    | null: false                    |
| delivery_charge           | string    | null: false                    |
| delivery_area             | string    | null: false                    |
| delivery_days             | string    | null: false                    |
| price                     | integer   | null: false                    |
| Seller_id                 | references| null: false, foreign_key: true |
| shipping_address_id       | references| null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :shipping_address


## shipping_address テーブル

| Column                    | Type      | Options                        |
| ------------------------- | --------- | ------------------------------ |
| customer_id               | string    | null: false                    |
| card_id                   | string    | null: false                    |
| postal_code               | string    | null: false                    |
| prefectures               | string    | null: false                    |
| municipality              | string    | null: false                    |
| address                   | string    | null: false                    |
| building_name             | string    |                                |
| phone_number              | integer   | null: false                    |


### Association

- belongs_to :user
- belongs_to :item
- belongs_to :purchase_record



## purchase_record テーブル

| Column                    | Type      | Options                        |
| ------------------------- | --------- | ------------------------------ |
| buyer_id                  | references| null: false, foreign_key: true |
| Seller_id                 | references| null: false, foreign_key: true |
| item_id                   | references| null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address