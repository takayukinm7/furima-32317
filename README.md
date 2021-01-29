# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| nickname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| name      | string | null: false |
| namekana  | string | null: false |
| brith     | string | null: false |

## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| price      | integer    | null: false                    |
| text       | text       | null: false                    |
| user       | references | null: false, foreign_key: true | 
| category   | string     | null: false                    |
| state　　　 | string     | null: false                    |
| cost       | string     | null: false                    |
| place      | string     | null: false                    |
| day        | string     | null: false                    |


## item_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

## buyer テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

## send テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| number | integer    | null: false                    |
| month  | integer    | null: false                    |
| year   | integer    | null: false                    |
| code   | integer    | null: false                    |
| buyer  | references | null: false, foreign_key: true |

## card テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code | integer    | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    |
| numbering   | string     | null: false                    |
| building    | string     |                                |
| phone       | integer    | null: false                    |
| buyer       | references | null: false, foreign_key: true |
