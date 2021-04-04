# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| last_name          | string              | null: false             |
| first_name         | string              | null: false             |
| last_name_kana     | string              | null: false             |
| first_name_kana    | string              | null: false             |
| birth_date         | date                | null: false             |
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |

### Association

* has_many :items
* has_many :orders


## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| name                                | string     | null: false       |
| info                                | text       | null: false       |
| item_category_id                    | integer    | null: false       |
| item_sales_status_id                | integer    | null: false       |
| item_shipping_fee_status_id         | integer    | null: false       |
| item_prefecture_id                  | integer    | null: false       |
| item_scheduled_delivery_id          | integer    | null: false       |
| price                               | integer    | null: false       |
| add-tax-price                       | integer    | null: false       |
| profit                              | integer    | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order


# orders table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| user_id                             | references | foreign_key: true |
| item_id                             | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item