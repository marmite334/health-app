# README
### Health App
アプリURL：health-app334.herokuapp.com


# usersテーブル
| Column             | Type   | Options                  |
|--------------------|--------|--------------------------|
| nickname           | string | null:false               |
| email              | string | null:false, unique: true |
| encrypted_password | string | null:false               |
| birth_date         | date   | null:false               |

### Association
* _ has_many :posts
* _ has_many :chat_users
* _ has_many :comments

# postsテーブル
| Column      | Type       | Options                       |
|-------------|------------|-------------------------------|
| title       | string     | null:false                    |
| content     | text       | null:false                    |
| category_id | integer    | null:false                    |
| user_id     | references | null:false, foreign_key: true |

### Association
* _ belongs_to :user
* _ has_many :comments

# commentsテーブル
| Column  | Type       | Options                       |
|---------|------------|-------------------------------|
| content | text       | null:false                    |
| user_id | references | null:false, foreign_key: true |
| post_id | references | null:false, foreign_key: true |

### Association
* _ belongs_to :user
* _ belongs_to :post

# chat_usersテーブル
| Column      | Type       | Options                       |
|-------------|------------|-------------------------------|
| user_id     | references | null:false, foreign_key: true |
| chat_id     | references | null:false, foreign_key: true |
| category_id | integer    | null:false                    |

### Association
* _ belongs_to :user
* _ belongs_to :chat

# chatsテーブル
| Column | Type    | Options    |
|--------|---------|------------|
| name   | string  | null:false |

### Association
* _ has_many :users, through: chat_users
* _ has_many :messages


# messagesテーブル
| Column  | Type       | Options                       |
|---------|------------|-------------------------------|
| content | text       | null:false                    |
| chat_id | references | null:false, foreign_key: true |
| user_id | references | null:false, foreign_key: true |

### Association
* _ belongs_to :chat
* _ belongs_to :user
