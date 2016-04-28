class Realms::AccountSerializer < ActiveModel::Serializer
  attributes :id, :username, :type, :email, :joined, :lastIp, :isLocked, :os

  def isLocked
    object.locked?
  end

  has_many :realm_characters, root: 'realms', serializer: Realms::RealmCharacterSerializer
end
