# Animal Search
![1e682a0aa293e6e50e8192a9ce43795b](https://user-images.githubusercontent.com/67887018/91512678-7e450f80-e91d-11ea-834e-afb051c6c6a8.jpg)

## このアプリについて
* 生き物の画像を投稿し教え合うコミュニケーションおよび情報の交換や蓄積を目的としたアプリケーション
* 制作期間約20日間

## 概要(機能)
* 画像の投稿機能（テキスト、画像、生き物の分類の選択、撮影地域の選択）

https://gyazo.com/ccfd5f14578f06d2764347c14f5b797c

* 投稿に対するコメント機能
* ログイン/ログアウト機能
* 検索機能
* 生き物の分類ごとのページ一覧
* マイページ

## 制作背景
* 最近より顕著に生き物の生態系の変化を感じます。そんな中で、楽しみながら生き物の生息地の情報を集めることができないか？と考えたのがきっかけです。
* より多くの情報を集めるため、見やすい画面を作り子供から大人まで利用できるアプリケーションを目指しました。
* 生き物の名前がわからなくても気軽に利用できるようコンセプトを工夫し、それにより些細な情報も学術的なデータベースとして蓄積できることを目指しました。

## 本番環境
https://animal-search-ja.herokuapp.com/

#### テストアカウント
- ユーザー名: user
- E-mail: user@gmail.com
- パスワード: useruser
#### Basic認証
- username: animal
- password: search

## 工夫したポイント
* カリキュラムでは学習していなかったカテゴリー機能に挑戦
* シンプルで見やすいビューの作成（女性や子供でも使いやすいように少し柔らかい色合い、大きめのフォントサイズ）

## 今後実装したい機能
* 非同期通信（検索機能・コメント機能）
* 地域別の一覧ページ

## Gem/Ver
* Ruby 2.6.5
* Rails 6.0.0
  

* gem 'puma'
* gem 'sass-rails'
* gem 'webpacker'
* gem 'turbolinks'
* gem 'jbuilder'
* gem 'bootsnap'
* gem 'byebug'
* gem 'sqlite3'
* gem 'web-console'
* gem 'listen'
* gem 'spring'
* gem 'spring-watcher-listen'
* gem 'capybara', '>= 2.15'
* gem 'selenium-webdriver'
* gem 'webdrivers'
* gem 'tzinfo-data'
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
