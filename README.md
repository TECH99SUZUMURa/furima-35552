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

| Column   | Type         | Options                        |
| -------- | ------------ |------------------------------- |
| name     | string       | null: false                    |
| price    | integer      | null: false                    |
| text     | text         | null: false                    |
| user     | references   | null: false, foreign_key: true |
| purchase | references   | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase

#### Active_Hash
- category
- prefecture
- condition
- estimated_shipping_date

## purchases テーブル

| Column                 | Type         | Options                        |
| ---------------------- | ------------ | ------------------------------ |
| card_num               | integer      | null: false                    |
| experition_date        | string       | null: false                    |
| security_code          | string       | null: false                    |
| user                   | references   | null: false, foreign_key: true |
| item                   | references   | null: false, foreign_key: true |
| address                | references   | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column            | Type         | Options                        |
| ----------------- | ------------ | ------------------------------ |
| postal_code       | integer      | null: false                    |
| municipality      | string       | null: false                    |
| address           | string       | null: false                    |
| building_name     | string       |                                |
| phone_num         | integer      | null: false                    |
| purchase          | references   | null: false, foreign_key: true |

### Association
- belongs_to :purchase

#### Active_Hash
- prefecture