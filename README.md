# テーブル設計

## users テーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| familyname            | string | null: false               |
| firstname             | string | null: false               |
| familynamekana        | string | null: false               |
| firstnamekana         | string | null: false               |
| date                  | date   | null: false               |

### Association

- has_many :items
- has_many :comments
- has_many :buyers

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| price         | integer    | null: false                    |
| text          | text       | null: false                    |
| user          | references | null: false, foreign_key: true | 
| category_id   | string     | null: false                    |
| state_id      | string     | null: false                    |
| cost_id       | string     | null: false                    |
| prefecture_id | string     | null: false                    |
| day_id        | string     | null: false                    |

### Association

- belongs_to :user
- has_many :comments
- has_one :buyer

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## buyers テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :send

## sends テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| numbering     | string     | null: false                    |
| building      | string     |                                |
| phone         | string     | null: false                    |
| buyer         | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer