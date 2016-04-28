class Realms::RealmSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :ipAddress,
             :port,
             :type,
             :status,
             :timezone,
             :population,
             :allowedBuilds

end
