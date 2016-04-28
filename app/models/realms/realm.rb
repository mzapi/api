module Realms
  class Realm < BaseModel
    self.table_name = "realmlist"

    # Attribute Aliases
    alias_attribute :type,            :icon
    alias_attribute :status,          :realmflags
    alias_attribute :allowedBuilds,  :realmbuilds
    alias_attribute :ipAddress,      :address

    # Begin Enumerations
    # These enumerations abstract the functionality of the
    # integer type fields on this table to human readable

    # Realm Type
    enum icon: {
      normal:   0,
      pvp:      1,
      rp:       6,
      rppvp:    8
    }

    # Realm Status
    enum realmflags: {
      offline:        2,
      show_version:   4,
      new_players:    32,
      recommended:    64
    }

    # Timezone
    enum timezone: {
      us:   1,
      kor:  2,
      eu:   3,
      twn:  4,
      chn:  5,
      test: 99,
      qa:   101
    }


  end
end
