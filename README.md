# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| first_name | string | null: false |
| last_name  | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| birth_day  | DATE   | null: false |

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

## purchases テーブル

| Column        | Type         | Options                        |
| ------------- | ------------ | ------------------------------ |
| postal_code   | integer      | null: false                    |
| municipality  | string       | null: false                    |
| address       | string       | null: false                    |
| building_name | string       |                                |
| phone_num     | integer      | null: false                    |
| user          | references   | null: false, foreign_key: true |
| item          | references   | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :prototype