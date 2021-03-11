# README
### Health App
このアプリケーションは健康志向の人が本や論文を読んで得た知識を共有してもらうため記事投稿機能と簡易的なチャット機能を実装しました。

アプリURL：https://health-app334.herokuapp.com

未ログインユーザーは閲覧できない仕様となっておりますので、ログインページ下部にありますゲストユーザーログインボタンよりログインしてください。
### このアプリケーションでできること

* 記事投稿機能

あなたが本や論文を読みそこから学んだ知識を共有するするための記事を投稿する事ができます。
投稿する記事をイメージする画像を追加することも可能です。
記事を投稿したユーザーのみ記事の内容の編集、削除を行う権限があります。
投稿された記事にはログインユーザーがコメントを残す事ができます。

* チャット（掲示板）機能

あなたが議論をしたいと考えたたらこの機能を利用してください。記事の投稿より早いコミュニケーションが期待できます。
この投稿は先着1000件が表示される仕様となっております。
投稿したユーザーのみ投稿内容を削除する権限があります。

* ユーザー詳細ページ

該当ユーザーが登録した情報と投稿した記事が閲覧できるようになっています。

### 開発環境
バックエンド
* Ruby 2.6.5
* Ruby on Rails 6.0.0
* MySQL2 0.4.4

フロントエンド
* HTML
* SCSS
* JavaScript

### 今後実装したい機能
* posts/indexファイルのページネーション機能
* トップページ
* 最新ニューズの取得
* 記事検索機能
* 日付フォーマットの日本時間化

# ER図
![あ] (https://user-images.githubusercontent.com/68127550/110750869-80056d80-8286-11eb-8973-0a02bb8ff9b5.png)

### usersテーブル
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

### postsテーブル
| Column      | Type       | Options                       |
|-------------|------------|-------------------------------|
| title       | string     | null:false                    |
| content     | text       | null:false                    |
| category_id | integer    | null:false                    |
| user_id     | references | null:false, foreign_key: true |

### Association
* _ belongs_to :user
* _ has_many :comments

### commentsテーブル
| Column  | Type       | Options                       |
|---------|------------|-------------------------------|
| content | text       | null:false                    |
| user_id | references | null:false, foreign_key: true |
| post_id | references | null:false, foreign_key: true |

### Association
* _ belongs_to :user
* _ belongs_to :post

### chat_usersテーブル
| Column      | Type       | Options                       |
|-------------|------------|-------------------------------|
| user_id     | references | null:false, foreign_key: true |
| chat_id     | references | null:false, foreign_key: true |
| category_id | integer    | null:false                    |

### Association
* _ belongs_to :user
* _ belongs_to :chat

### chatsテーブル
| Column | Type    | Options    |
|--------|---------|------------|
| name   | string  | null:false |

### Association
* _ has_many :users, through: chat_users
* _ has_many :messages


### messagesテーブル
| Column  | Type       | Options                       |
|---------|------------|-------------------------------|
| content | text       | null:false                    |
| chat_id | references | null:false, foreign_key: true |
| user_id | references | null:false, foreign_key: true |

### Association
* _ belongs_to :chat
* _ belongs_to :user
