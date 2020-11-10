# テーブル設計

## users テーブル

| Column                    | Type      | Options                        |
| ------------------------- | --------- | ------------------------------ |
| nickname                  | string    | null: false                    |
| email                     | string    | null: false                    |
| encrypted_password        | string    | null: false                    |
| first_name                | string    | null: false                    |
| last_name                 | string    | null: false                    |
| first_name_kana           | string    | null: false                    |
| last_name_kana            | string    | null: false                    |
| birthday                  | date      | null: false                    |

### Association

- has_many :items
- has_many :purchaserecords

## items テーブル

| Column                    | Type      | Options                        |
| ------------------------- | --------- | ------------------------------ |
| name                      | string    | null: false                    |
| text                      | text      | null: false                    |
| categoryid                | integer   | null: false                    |
| conditionid               | integer   | null: false                    |
| deliverycharge_id         | integer   | null: false                    |
| deliveryarea_id           | integer   | null: false                    |
| deliverydays_id           | integer   | null: false                    |
| price                     | integer   | null: false                    |
| user                      | references| null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :purchaserecord


## shippingaddress テーブル

| Column                    | Type      | Options                        |
| ------------------------- | --------- | ------------------------------ |
| postal_code               | string    | null: false                    |
| prefectures_id            | integer   | null: false                    |
| municipality              | string    | null: false                    |
| address                   | string    | null: false                    |
| building_name             | string    |                                |
| phone_number              | string    | null: false                    |
| purchaserecord            | references| null: false, foreign_key: true |


### Association

- belongs_to :purchaserecord



## purchaserecord テーブル

| Column                    | Type      | Options                        |
| ------------------------- | --------- | ------------------------------ |
| user                      | references| null: false, foreign_key: true |
| item                      | references| null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :shippingaddress