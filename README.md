# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column        | Type       | Options              |
| ------------- | ---------- | -------------------- |
| item_name     | string     | null: false          |
| description   | text       | null: false          |
| category      | integer    | null: false          |
| condition     | integer    | null: false          |
| shipping_fee  | integer    | null: false          |
| prefecture    | integer    | null: false          |
| shipping_days | integer    | null: false          |
| price         | integer    | null: false          |
| user          | references | null: false, foreign |

### Association
- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type       | Options              |
| ------ | ---------- | -------------------- |
| user   | references | null: false, foreign |
| item   | references | null: false, foreign |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Option               |
| ------------- | ---------- | -------------------- |
| postal_code   | integer    | null: false          |
| prefecture    | integer    | null: false          |
| city          | string     | null: false          |
| house_number  | integer    | null: false          |
| building_name | string     |                      |
| phone_number  | integer    | null: false          |
| order         | references | null: false, foreign |

### Association
- belongs_to :order