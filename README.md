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
    -devise
        ユーザ認証
    -bootstrap4
        bootstrap4
    -kaminari
        ページネーション
    -ransack
        検索機能
    -dropzonejs-rails
        画像のドラッグ&ドロップ
    -simple_calendar
        カレンダー機能
    -font-awesome-sass
        font-awesome
    -slim-rails
        slim記法
    -html2slim
        erb->slimの変換
    -pry-rails
        rails consoleでのPry使用
    -pry-doc
        rails consoleでのPry使用
    -rspec-rails
        テスト用Rspec
    -factory_bot_rails
        テストデータ作成支援
    -better_errors
        エラー画面をわかりやすく整形
    -binding_of_caller
        better_errorsの画面上にirb/pry(PERL)を表示する  