DB_CHARACTER = YAML::load(ERB.new(File.read(Rails.root.join("config", "database_character.yml"))).result)[Rails.env]
