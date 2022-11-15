# 事前に以下のファイルを実行しておくこと
# migration.rb
# create_data.rb

load "./database.rb"

ops = {
  username: "postgres",
  password: "password",
  encoding: "UTF8"
}
config = ROM::Configuration.new(:sql, "postgres://0.0.0.0/sample", ops)
config.register_relation(Relations::Articles)
rom = ROM.container(config)

articles = rom.relations[:articles]
puts articles.to_a
