DB_REALM = YAML::load(ERB.new(File.read(Rails.root.join("config", "database_realm.yml"))).result)[Rails.env]
