# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| encrypted_password    | string | null: false |
| confirmation_password | string | null: false |
| familyname            | string | null: false |
| firstname             | string | null: false |
| familynamekana        | string | null: false |
| firstnamekana         | string | null: false |
| date                  | date   | null: false |

### Association

has_many :item_users
has_many :items, through: item_users
has_many :comments
has_one :buyer

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| price       | integer    | null: false                    |
| text        | text       | null: false                    |
| user        | references | null: false, foreign_key: true | 
| category_id | string     | null: false                    |
| state_id    | string     | null: false                    |
| cost_id     | string     | null: false                    |
| place_id    | string     | null: false                    |
| day_id      | string     | null: false                    |

### Association

has_many :items_users
has_many :users, through: item_users
has_many :comments
has_one :buyer

## item_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item

## buyer テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one :send

## send テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code | integer    | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    |
| numbering   | string     | null: false                    |
| building    | string     |                                |
| phone       | integer    | null: false                    |
| buyer       | references | null: false, foreign_key: true |

### Association

belongs_to: buyer