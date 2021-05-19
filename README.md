# テーブル設計

## users テーブル

| Column                    | Type   | Options                   |
| ------------------------- | ------ | ------------------------- |
| nickname                  | string | null: false               |
| first_name                | string | null: false               |
| last_name                 | string | null: false               |
| first_name_kana           | string | null: false               |
| last_name_kana            | string | null: false               |
| email                     | string | null: false, unique: true |
| encrypted_password        | string | null: false               |
| birth_day                 | date   | null: false               |

### Association
- has_many :items
- has_many :purchases
 
## items テーブル

| Column                        | Type         | Options                        |
| ----------------------------- | ------------ |------------------------------- |
| item_name                     | string       | null: false                    |
| price                         | integer      | null: false                    |
| text                          | text         | null: false                    |
| category_id                   | integer      | null: false                    |
| condition_id                  | integer      | null: false                    |
| shipping_charge_id            | integer      | null: false                    |
| prefecture_id                 | integer      | null: false                    |
| estimated_shipping_date_id    | integer      | null: false                    |
| user                          | references   | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_charge
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :estimated_shipping_date

## purchases テーブル

| Column                | Type         | Options                        |
| --------------------- | ------------ | ------------------------------ |
| user                  | references   | null: false, foreign_key: true |
| item                  | references   | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column              | Type          | Options                        |
| ------------------- | ------------- | ------------------------------ |
| postal_code         | string        | null: false                    |
| prefecture_id       | integer       | null: false                    |
| municipality        | string        | null: false                    |
| address             | string        | null: false                    |
| building_name       | string        |                                |
| phone_num           | string        | null: false                    |
| purchase            | references    | null: false, foreign_key: true |

### Association
- belongs_to :purchase
- belongs_to_active_hash :prefecture