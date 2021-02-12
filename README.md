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

### Association

- has_many  :item 
- has_one  :address
- has_one  :order

## items table

| Column                         | Type       | Options              |
|--------------------------------|------------|----------------------|
| title                          | string     | null: false          |
| price                          | integer    | null: false          |
| description                    | string     | null: false          |
| user                           | references | foreign_key: true    |
| category_id                    | integer    | null: false          |
| condition_id                   | integer    | null: false          |
| delivery_fee_id                | integer    | null: false          |
| shipment_area_id               | integer    | null: false          |
| shipment_date_id               | integer    | null: false          |



### Association

- belongs_to :user
- has_one : order
- has_one : address

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

## order table

| Column               | Type       | Options                        |
|----------------------|------------|--------------------------------|
| user                 | references | null: false, foreign_key: true |
| item                 | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user
