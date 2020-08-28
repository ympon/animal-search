# README
![Uploading 1e682a0aa293e6e50e8192a9ce43795b.jpg…]()

## このアプリについて
* 生き物の画像を投稿し教え合うコミュニケーションを目的としたアプリケーション
* 制作期間約20日間

## Gem/Ver
* Ruby 2.6.5
* Rails 6.0.0

* gem 'sass-rails'
* gem 'byebug'
* gem 'sqlite3'
* gem 'web-console'
* gem 'pry-rails'
* gem 'haml-rails'
* gem 'font-awesome-sass'
* gem 'carrierwave'
* gem 'mini_magick'
* gem 'jquery-rails'
* gem 'devise'
* gem 'active_hash'
* gem 'fog-aws'
* gem 'pg'

# animal-searchのDB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :posts
- has_many :comments

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|image|string|null: false|
|user_id|null: false, foreign_key: true|
|category_id|null: false, foreign_key: true|
|area_id|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :categories
- belongs_to :areas
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
### Association
- has_many :posts

## areasテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :posts
