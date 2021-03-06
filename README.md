# DB設計

# ER図
https://app.lucidchart.com/invitations/accept/b3c87035-88bd-47e7-b003-8810973ffc59

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index: true|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
 - has_many :tracks, dependent: :destroy
 - has_many :comments, dependent: :destroy
 - has_many :likes, dependent: :destroy
 - has_many :liked_tracks, through: :likes, source: :track

## tracksテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|index: true, null: false|
|data|string|null: false|
|user|references|null: false|

### Association
 - belongs_to :user

 - has_many :liked_users, through: :likes, source: :user

 - has_many :tags, through: :track_tags
 - has_many :track_tags


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|track|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :track

## track_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|tag|references|null: false, foreign_key: true|
|track|references|null: false, foreign_key: true|
### Association
belongs_to :track
belongs_to :tag

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|index: true, unique: true|

### Association
has_many :track_likes
has_many :tracks, through: :track_tags

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|track|refernces|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :track