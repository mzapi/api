class Realms::RealmCharacterSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :characters
end
