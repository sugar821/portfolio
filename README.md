# README

## 概要
    実行タスク管理のアプリケーションです。
    
## 機能一覧
    ログイン、ログアウト機能
    ユーザ情報編集機能
    パスワードリマインダー機能
    タスク一覧表示機能
    タスク投稿、編集機能
    画像アップロード機能
    ページネーション機能
    カレンダー表示機能
    タスク一覧の検索、ソート機能
    CSV出力機能
# 権限設定機能について
    各タスクは自身の登録したタスクのみ閲覧、編集削除が可能
    管理者のみ全てのユーザが登録したタスクを管理可能
    管理者は一般ユーザのアカウント削除可能
    
## 使用しているGEM
    ユーザ認証
      devise
    bootstrap4
      bootstrap'
    #bootstrap4
    gem 'kaminari'
    #ページネーション追加
    gem 'ransack'
    #検索機能追加
    gem 'slim-rails'
    #slimのジェネレータ
    gem 'html2slim'
    #erb->slimの変換
    gem 'pry-rails'
    gem 'pry-doc'
    #DBを見やすく
    gem "rspec-rails", "~>3.7"
    #Rspecテスト用GEM
    gem "factory_bot_rails", "~>4.11"
    #テストデータ作成支援
    gem 'better_errors'
    # エラー画面をわかりやすく整形してくれる
    gem 'binding_of_caller'
    # better_errorsの画面上にirb/pry(PERL)を表示する  
    gem 'simple_calendar', '~> 2.0'
    #simple calendar
    gem "font-awesome-sass"
    gem 'dropzonejs-rails'

