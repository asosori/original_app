# どんなアプリ？
大学のゼミ&研究室の口コミサイトです。レスポンシブデザインも意識しました。

# URL
https://zemilabonavi2.herokuapp.com/

エラーが出た際はherokuのタイムアウトエラーなので再度ブラウザを更新するか、いったんブラウザを閉じて開きなおすと、ちゃんと表示されます。

# 実装した機能など
- circleCIを使ったCI/CDパイプライン
- docker(docker for Mac)
- 単体、統合テスト(E2Eテスト)(rspec,factory,system spec, capybara)
- 管理者画面(Active Admin)
- 画像投稿機能(Active Storage, AWS S3)
- 検索機能(ransack)
- いいね機能（Ajax)
- ログイン機能(devise)
- お問い合わせ機能(mailer, sendgrid)
- ページネーション機能(kaminari)
- i18nを用いた国際化
- 各種バリデーション
- bootstrap
- postgresql
- heroku

途中からgithub上でissue作ってプルリクをすることでチーム開発を意識しました。
