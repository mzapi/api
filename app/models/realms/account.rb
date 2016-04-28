module Realms
  class Account < BaseModel
    self.table_name = "account"

    # Hooks
    before_create :assign_join_date

    # Realm joins
    has_many :realm_characters, class_name: 'Realms::RealmCharacter', foreign_key: :acctid
    has_many :realms,           class_name: 'Realms::Realm', through: :realm_characters

    # Attribute Aliases
    alias_attribute :type,        :gmlevel
    alias_attribute :joined,      :joindate
    alias_attribute :lastIp ,     :last_ip
    alias_attribute :lastLogin,   :last_login
    alias_attribute :password,    :sha_pass_hash

    # Begin Enumerations
    # These enumerations abstract the functionality of the
    # integer type fields on this table to human readable

    # Account Type
    enum gmlevel: {
      player:         0,
      moderator:      1,
      game_master:    2,
      administrator:  3
    }

    def locked?
      self.locked != 0
    end

    def assign_join_date
      self.joindate = Time.now
    end

  end
end
