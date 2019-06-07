# 概要 
    タスク管理およびタスク実施履歴の可視化を行うアプリケーションです
# 機能
### アクセス管理
-  ユーザ登録/削除
-  管理者権限によるアクセスコントロール
-  ログイン/ログアウト
    -  GEM devise使用
-  登録メールアドレスへのパスワードリマインダー送信
### 一般ユーザ向け機能
-  タスク登録/編集/削除(自身作成分のみ管理・閲覧可能)
-  登録タスク検索/ソート
    -   GEM ransack使用
-  画像アップロード/削除
-  ページネーション
    -  GEM kaminari使用
-  カレンダーでのタスク実施頻度閲覧
    -  GEM simple_calendar使用
### 管理者向け機能
-  全ユーザのタスク管理(閲覧/削除)
-  全ユーザアカウント管理(閲覧/管理者権限の付与・剥奪/削除)
### その他
-  Rspecによるモデル/コントローラの単体テスト
-  Rspecによる統合テスト(フィーチャスペック)

# 使用している技術
### GEM
- devise
    - ユーザ認証
- bootstrap4
- kaminari
    - ページネーション追加
- ransack
    - 検索機能追加
- simple_calendar
    - カレンダー機能実装
- font-awesome-sass
    - font-awesome
- dropzonejs-rails
    - 画像をドラッグ&ドロップでアップロード
- slim-rails
    - slimのジェネレータ
- html2slim
    - erb->slimの変換
- rspec-rails
    - Rspecでのテスト
- factory_bot_rails
    - テストデータ作成
- capybara
    - フィーチャスペック

# 言語・環境
    言語：Ruby2.6
    フレームワーク：Ruby on Rails 5.2
    DB：development:sqlite3 / product:heroku postgresql
    テスト：Rspec
    デプロイ：heroku
    エディタ：windows10 + AWS cloud9 or MAC + VScode
    制作時間：約200時間(1日5h×40日)
