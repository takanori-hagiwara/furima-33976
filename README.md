# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| name               | string              | null: false             |
| last_name          | string              | null: false             |
| first_name         | string              | null: false             |

### Association

- has_many :items
- has_one  :order

## items table

| Column                         | Type       | Options              |
|--------------------------------|------------|----------------------|
| title                          | string     | null: false          |
| category                       | string     | null: false          |
| price                          | string     | null: false          |
| user                           | references | foreign_key: true    |
| category                       | string     | null: false          |
| condition                      | text       | null: false          |
| delivery_fee                   | string     | null: false          |
| shipment_area                  | string     | null: false          |
| shipment_date                  | string     | null: false          |
| image                          | Active Storage                    |


### Association

- belongs_to :user
- has_one :order

## orders table

| Column        | Type       | Options           |
|---------------|------------|-------------------|
| price         | string     | null: false       |
| card_number   | string     | null: false       |
| expiration    | integer    | null: false       |
| security      | integer    | null: false       |
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

