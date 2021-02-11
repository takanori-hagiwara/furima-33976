# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| encrypted_password | string              | null: false             |
| name               | string              | null: false             |
| last_name          | string              | null: false             |
| first_name         | string              | null: false             |
| 苗字_フリガナ        | string              | null: false             |
| 名前_フリガナ        | string              | null: false             |

### Association

- has_many :items
- has_one  :order

## items table

| Column                         | Type       | Options              |
|--------------------------------|------------|----------------------|
| title                          | string     | null: false          |
| price                          | integer    | null: false          |
| user                           | references | foreign_key: true    |
| category_id                    | string     | null: false       |
| condition_id                   | integer    | null: false          |
| delivery_fee_id                | integer    | null: false          |
| shipment_area_id               | integer    | null: false          |
| shipment_date_id               | integer    | null: false          |
| image                          | Active Storage                    |


### Association

- belongs_to :user
- has_one :order

## orders table

| Column        | Type       | Options           |
|---------------|------------|-------------------|
| price         | integer    | null: false       |
| PostalCode    | integer    | null: false       |
| Prefectures   | string     | null: false       |
| security      | integer    | null: false       |
| city          | string     | null: false       |
| streetAddress | string     | null: false       |
| building      | string     | null: false       |
| phone         | string     | null: false       |
| image         |         Active Storage         |

### Association

- belongs_to :item
- belongs_to :user

