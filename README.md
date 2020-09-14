# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| nickname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| full_name | string | null: false |
| kana_name | string | null: false |
| birthday  | date   | null: false |

### Association

- has_many   :items
- belongs_to :purchase


## items テーブル

| Column          | Type    | Options     |
| --------------- | ------  | ----------- |
| seller_name     | string  | null: false |
| image           | text    | null: false |
| item_name       | string  | null: false |
| comment         | text    | null: false |
| category        | string  | null: false |
| status          | string  | null: false |
| shipping_cost   | string  | null: false |
| shipment_source | string  | null: false |
| shipping_days   | string  | null: false |
| price           | integer | null: false |

### Association

- belongs_to :user


## purchase テーブル

| Column        | Type    | Options     |
| ------------- | ------  | ----------- |
| buyer_name    | string  | null: false |
| card_number   | integer | null: false |
| expiration_on | date    | null: false |
| security_code | integer | null: false |

### Association

- belongs_to :user
- belongs_to :shipping_on


## shipping_on テーブル

| Column        | Type    | Options     |
| ------------- | ------  | ----------- |
| postal_code   | integer | null: false |
| municipality  | string  | null: false |
| address       | string  | null: false |
| building_name | string  |             |
| phone_number  | integer | null: false |

### Association

- has_one :purchase