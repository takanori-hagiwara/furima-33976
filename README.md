# DB 設計

## users table

| Column             | Type                | Options                  |
|--------------------|---------------------|--------------------------|
| email              | string              | unique: true, null: false|
| encrypted_password | string              | null: false              |
| name               | string              | null: false              |
| last_name          | string              | null: false              |
| first_name         | string              | null: false              |
| last_furigana      | string              | null: false              |
| first_furigana     | string              | null: false              |
| birth_date         | date                | null: false              |

### Association

- has_many  :items
- has_many  :orders

## items table

| Column                         | Type       | Options              |
|--------------------------------|------------|----------------------|
| user                           | references | foreign_key: true    |
| title                          | string     | null: false          |
| price                          | integer    | null: false          |
| description                    | text       | null: false          |
| category_id                    | integer    | null: false          |
| condition_id                   | integer    | null: false          |
| delivery_fee_id                | integer    | null: false          |
| shipment_area_id               | integer    | null: false          |
| shipment_date_id               | integer    | null: false          |

### Association

- belongs_to :user
- has_one : order

## addresses table 

| Column          | Type           | Options              |
|-----------------|----------------|----------------------|
| postal_code     | string         | null: false          |
| shipment_area_id| integer        | null: false          |
| city            | string         | null: false          |
| street_address  | string         | null: false          |
| building        | string         |                      |
| phone           | string         | null: false          |
| order           | references     | foreign_key: true    | 


### Association

- belongs_to :order

## orders table

| Column               | Type       | Options                        |
|----------------------|------------|--------------------------------|
| user                 | references | null: false, foreign_key: true |
| item                 | references | null: false, foreign_key: true |

### Association

- has_one : address
- belongs_to :user
- belongs_to :item