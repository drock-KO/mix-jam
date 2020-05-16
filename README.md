# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, add_index|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
 - has_many :tracks
 - has_many :comments
 - has_many :likes, dependent: :destroy
 - has_many :liked-tracks, through: :likes, source: :track


## tracksテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|add_index, null: false|
|data|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
 - belongs_to :user

 - has_many :likes
 - has_many :users, through: :likes

 - has_many :tags, through: :track-tags
 - has_many :track-tags

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|track_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :track

## track-tagsテーブル
|Column|Type|Options|
|------|----|-------|
|tag_id|integer|null: false, foreign_key: true|
|track_id|integer|null: false, foreign_key: true|

### Association
belongs_to :track
belongs_to :tag

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|add_index, unique: true|

### Association
has_many :track-likes
has_many :tracks, through: :track-tags

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|track_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :track
