DB_WORLD = YAML::load(ERB.new(File.read(Rails.root.join("config", "database_world.yml"))).result)[Rails.env]
