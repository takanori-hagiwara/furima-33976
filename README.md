# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | uniqueness: true        |
| encrypted_password | string              | null: false             |
| name               | string              | null: false             |
| last_name          | string              | null: false             |
| first_name         | string              | null: false             |
| last_furigana      | string              | null: false             |
| first_furigana     | string              | null: false             |

### Association

- has_one  :items
- has_one  :addresses
- has_one  :purchases

## items table

| Column                         | Type       | Options              |
|--------------------------------|------------|----------------------|
| title                          | string     | null: false          |
| price                          | integer    | null: false          |
| user                           | references | foreign_key: true    |
| category_id                    | string     | null: false          |
| condition_id                   | integer    | null: false          |
| delivery_fee_id                | integer    | null: false          |
| shipment_area_id               | integer    | null: false          |
| shipment_date_id               | integer    | null: false          |



### Association

- belongs_to :user
- has_one : purchases
- has_one : addresses

## addresses table 

| Column        | Type           | Options      |
|---------------|----------------|--------------|
| PostalCode    | string         | null: false  |
| Prefectures   | string         | null: false  |
| city          | string         | null: false  |
| streetAddress | string         | null: false  |
| phone         | string         | null: false  |


### Association

- belongs_to :item
- belongs_to :user

## purchases table

| Column               | Type       | Options                        |
|----------------------|------------|--------------------------------|
| user                 | references | null: false, foreign_key: true |
| category_id          | references | null: false, foreign_key: true |
| condition_id         | references | null: false, foreign_key: true |
| delivery_fee_id      | references | null: false, foreign_key: true |
| shipment_area_id     | references | null: false, foreign_key: true |
| shipment_date_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
