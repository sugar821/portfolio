## 目的
    タスク管理およびタスク実施履歴の可視化
## 機能
# ユーザ関連
-  ユーザ登録/削除
-  ログイン/ログアウト
    -  GEM devise使用
-  登録メールアドレスへのパスワードリマインダー送信
-  管理者権限
    -  全ユーザのタスク管理閲覧/削除
    -  全ユーザアカウントの閲覧/削除
# タスク関連
-  タスク登録/編集/削除
-  登録タスク検索/ソート
    -   GEM ransack
-  画像登録
-  ページネーション
    -  GEM kaminari
-  カレンダー
    -  GEM simple_calendar
# テスト関連
    -  Rspec
# HTML/CSS
-  slim記法
    -  GEM slim-rails
-  CSS
    -  GEM bootstrap4
## GEM
- devise
    - ユーザ認証
- bootstrap4
- kaminari
    - ページネーション追加
- ransack
    - 検索機能追加
- slim-rails
    - slimのジェネレータ
- html2slim
    - erb->slimの変換
- pry-rails
- pry-doc
    - DBを見やすく
- rspec-rails
    - Rspecテスト用GEM
- factory_bot_rails
    - テストデータ作成支援
- simple_calendar
    - simple calendar
- font-awesome-sass
    - font-awesome
- dropzonejs-rails
    - dropzone
