module Realms

  class RealmCharacter < BaseModel
    self.table_name = "realmcharacters"

    # Delegations allow you to access properties of other objects by calling the property on this object
    delegate :id, :name, to: :realm

    # Account/Realm joins
    belongs_to :realm, class_name: 'Realms::Realm', foreign_key: :realmid
    belongs_to :account, class_name: 'Realms::Account', foreign_key: :acctid


    # Attribute Aliases
    alias_attribute :characters, :numchars
  end

end
