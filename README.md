# このサンプルアプリ

パーフェクトRuby on Railsの書籍で取り上げられてるものを勉強ついでに作ったものです

## 使い方

config/database.ymlを作成して、適宜ご自身の環境で読み替えてください

```yaml
development:
  adapter: mysql2
  database: awesome
  encoding: utf8
  username: YOURNAME
  password: YOURPASSWORD
  host: localhost
  pool: 5
  timeout: 5000

test:
  adapter: mysql2
  database: awesome_test
  encoding: utf8
  username: YOURNAME
  password: YOURPASSWORD
  host: localhost
  pool: 5
  timeout: 5000

production:
  adapter: mysql2
  database: awesome
  encoding: utf8
  username: YOURNAME
  password: YOURPASSWORD
  host: localhost
  pool: 5
  timeout: 5000

staging:
  adapter: mysql2
  database: awesome
  encoding: utf8
  username: YOURNAME
  password: YOURPASSWORD
  host: localhost
  pool: 5
  timeout: 5000
```
