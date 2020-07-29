# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

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
### Association
- belongs_to :user
- has_many :comments
- has_many :posts_categories
- has_many :categories, through: :posts_categories
- has_many :posts_areas
- has_many :areas, through: :posts_areas

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
### Association
- has_many :posts_categories
- has_many :posts, through: :posts_categories

## areasテーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
### Association
- has_many :posts_areas
- has_many :posts, through: :posts_areas

## posts_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :category

## posts_areasテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|integer|null: false, foreign_key: true|
|area_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :areas