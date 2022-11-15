# rom-rbでデータ作って取得して出力する

## dbを立ち上げる

```shell
$ docker-compose up
```

## マイグレーションする

```shell
$ ruby migration.rb
```

## サンプルデータを作成する

```shell
$ ruby create_data.rb
```

## サンプルデータを出力する

```shell
$ ruby output.rb
```
