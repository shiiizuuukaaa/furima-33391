# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| last-name          | string              | null: false             |
| first-name         | string              | null: false             |
| last-name-kana     | string              | null: false             |
| first-name-kana    | string              | null: false             |
| birth-date         | date                | null: false             |
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |

### Association

* has_many :items
* has_many :orders

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| item-name                           | string     | null: false       |
| item-info                           | text       | null: false       |
| item-category                       | integer    | null: false       |
| item-sales-status                   | integer    | null: false       |
| item-shipping-fee-status            | integer    | null: false       |
| item-prefecture                     | integer    | null: false       |
| item-scheduled-delivery             | integer    | null: false       |
| item-price                          | integer    | null: false       |
| add-tax-price                       | integer    | null: false       |
| profit                              | integer    | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order

# orders table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| card-number                         | integer    | null: false       |
| card-exp-month                      | integer    | null: false       |
| card-exp-year                       | integer    | null: false       |
| postal-code                         | integer    | null: false       |
| prefecture                          | integer    | null: false       |
| city                                | string     | null: false       |
| addresses                           | string     | null: false       |
| building                            | string     | null: false       |
| phone-number                        | integer    | null: false       |
| user                                | references | foreign_key: true |
| item                                | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item