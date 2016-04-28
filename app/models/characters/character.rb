module Characters
  class Character < BaseModel
    self.table_name = "characters"

    bad_attribute_names :class
    ignore_columns :playerBytes,
                   :playerBytes2,
                   :playerFlags,
                   :position_x,
                   :position_y,
                   :position_z,
                   :taximask,
                   :cinematic,
                   :totaltime,
                   :leveltime,
                   :logout_time,
                   :is_logout_resting,
                   :rest_bonus,
                   :resettalents_cost,
                   :resettalents_time,
                   :trans_x,
                   :trans_y,
                   :trans_z,
                   :trans_o,
                   :transguid,
                   :extra_flags,
                   :stable_slots,
                   :at_login,
                   :death_expire_time,
                   :taxi_path,
                   :watchedFaction,
                   :exploredZones,
                   :equipmentCache,
                   :ammoId,
                   :actionBars,
                   :deleteInfos_Account,
                   :deleteInfos_Name,
                   :deleteDate
  end
end
