load "./database.rb"

ops = {
  username: "postgres",
  password: "password",
  encoding: "UTF8"
}
config = ROM::Configuration.new(:sql, "postgres://0.0.0.0/sample", ops)
config.register_relation(Relations::Articles)
rom = ROM.container(config)

migration = ROM::SQL.migration(rom) do
  change do
    create_table(:articles) do
      primary_key :id
      column :title, String, null: false, default: ""
      boolean :published, default: false
    end
  end
end

gateway = rom.gateways[:default]
migration.apply(gateway.connection, :up)
