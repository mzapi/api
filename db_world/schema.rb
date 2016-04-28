# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "areatrigger_tavern", id: :integer, limit: 3, default: 0, comment: "Identifier", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Trigger System" do |t|
    t.text "name", limit: 65535
  end

  create_table "areatrigger_teleport", id: :integer, limit: 3, default: 0, comment: "Identifier", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Trigger System" do |t|
    t.text    "name",               limit: 65535
    t.integer "target_map",         limit: 2,     default: 0,   null: false, unsigned: true
    t.float   "target_position_x",  limit: 24,    default: 0.0, null: false
    t.float   "target_position_y",  limit: 24,    default: 0.0, null: false
    t.float   "target_position_z",  limit: 24,    default: 0.0, null: false
    t.float   "target_orientation", limit: 24,    default: 0.0, null: false
    t.integer "condition_id",       limit: 3,     default: 0,   null: false
  end

  create_table "battleground_events", primary_key: ["map", "event1", "event2"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "map",         limit: 2, null: false
    t.integer "event1",      limit: 1, null: false, unsigned: true
    t.integer "event2",      limit: 1, null: false, unsigned: true
    t.string  "description",           null: false
  end

  create_table "battleground_template", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "MinPlayersPerTeam", limit: 2,  default: 0,   null: false, unsigned: true
    t.integer "MaxPlayersPerTeam", limit: 2,  default: 0,   null: false, unsigned: true
    t.integer "MinLvl",            limit: 1,  default: 0,   null: false, unsigned: true
    t.integer "MaxLvl",            limit: 1,  default: 0,   null: false, unsigned: true
    t.integer "AllianceStartLoc",  limit: 3,                null: false, unsigned: true
    t.float   "AllianceStartO",    limit: 24,               null: false
    t.integer "HordeStartLoc",     limit: 3,                null: false, unsigned: true
    t.float   "HordeStartO",       limit: 24,               null: false
    t.float   "StartMaxDist",      limit: 24, default: 0.0, null: false
  end

  create_table "battlemaster_entry", primary_key: "entry", id: :integer, limit: 3, default: 0, comment: "Entry of a creature", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "bg_template", limit: 3, default: 0, null: false, comment: "Battleground template id", unsigned: true
  end

  create_table "command", primary_key: "name", id: :string, limit: 50, default: "", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Chat System" do |t|
    t.integer "security", limit: 1,          default: 0, null: false, unsigned: true
    t.text    "help",     limit: 4294967295
  end

  create_table "conditions", primary_key: "condition_entry", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Condition System" do |t|
    t.integer "type",   limit: 1, default: 0, null: false, comment: "Type of the condition"
    t.integer "value1", limit: 3, default: 0, null: false, comment: "data field one for the condition", unsigned: true
    t.integer "value2", limit: 3, default: 0, null: false, comment: "data field two for the condition", unsigned: true
    t.index ["type", "value1", "value2"], name: "unique_conditions", unique: true, using: :btree
  end

  create_table "creature", primary_key: "guid", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Creature System" do |t|
    t.integer "id",              limit: 3,  default: 0,   null: false, comment: "Creature Identifier", unsigned: true
    t.integer "map",             limit: 2,  default: 0,   null: false, comment: "Map Identifier",      unsigned: true
    t.integer "modelid",         limit: 3,  default: 0,   null: false,                                 unsigned: true
    t.integer "equipment_id",    limit: 3,  default: 0,   null: false
    t.float   "position_x",      limit: 24, default: 0.0, null: false
    t.float   "position_y",      limit: 24, default: 0.0, null: false
    t.float   "position_z",      limit: 24, default: 0.0, null: false
    t.float   "orientation",     limit: 24, default: 0.0, null: false
    t.integer "spawntimesecs",              default: 120, null: false,                                 unsigned: true
    t.float   "spawndist",       limit: 24, default: 5.0, null: false
    t.integer "currentwaypoint", limit: 3,  default: 0,   null: false,                                 unsigned: true
    t.integer "curhealth",                  default: 1,   null: false,                                 unsigned: true
    t.integer "curmana",                    default: 0,   null: false,                                 unsigned: true
    t.integer "DeathState",      limit: 1,  default: 0,   null: false,                                 unsigned: true
    t.integer "MovementType",    limit: 1,  default: 0,   null: false,                                 unsigned: true
    t.index ["id"], name: "index_id", using: :btree
    t.index ["map"], name: "idx_map", using: :btree
  end

  create_table "creature_addon", primary_key: "guid", id: :integer, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "mount",       limit: 3,     default: 0, null: false, unsigned: true
    t.integer "bytes1",                    default: 0, null: false, unsigned: true
    t.integer "b2_0_sheath", limit: 1,     default: 0, null: false, unsigned: true
    t.integer "b2_1_flags",  limit: 1,     default: 0, null: false, unsigned: true
    t.integer "emote",                     default: 0, null: false, unsigned: true
    t.integer "moveflags",                 default: 0, null: false, unsigned: true
    t.text    "auras",       limit: 65535
  end

  create_table "creature_ai_scripts", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "EventAI Scripts" do |t|
    t.integer "creature_id",                        default: 0,   null: false, comment: "Creature Template Identifier",                     unsigned: true
    t.integer "event_type",               limit: 1, default: 0,   null: false, comment: "Event Type",                                       unsigned: true
    t.integer "event_inverse_phase_mask",           default: 0,   null: false, comment: "Mask which phases this event will not trigger in"
    t.integer "event_chance",                       default: 100, null: false,                                                              unsigned: true
    t.integer "event_flags",                        default: 0,   null: false,                                                              unsigned: true
    t.integer "event_param1",                       default: 0,   null: false
    t.integer "event_param2",                       default: 0,   null: false
    t.integer "event_param3",                       default: 0,   null: false
    t.integer "event_param4",                       default: 0,   null: false
    t.integer "action1_type",             limit: 1, default: 0,   null: false, comment: "Action Type",                                      unsigned: true
    t.integer "action1_param1",                     default: 0,   null: false
    t.integer "action1_param2",                     default: 0,   null: false
    t.integer "action1_param3",                     default: 0,   null: false
    t.integer "action2_type",             limit: 1, default: 0,   null: false, comment: "Action Type",                                      unsigned: true
    t.integer "action2_param1",                     default: 0,   null: false
    t.integer "action2_param2",                     default: 0,   null: false
    t.integer "action2_param3",                     default: 0,   null: false
    t.integer "action3_type",             limit: 1, default: 0,   null: false, comment: "Action Type",                                      unsigned: true
    t.integer "action3_param1",                     default: 0,   null: false
    t.integer "action3_param2",                     default: 0,   null: false
    t.integer "action3_param3",                     default: 0,   null: false
    t.string  "comment",                            default: "",  null: false, comment: "Event Comment"
  end

  create_table "creature_ai_summons", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "EventAI Summoning Locations" do |t|
    t.float   "position_x",    limit: 24, default: 0.0, null: false
    t.float   "position_y",    limit: 24, default: 0.0, null: false
    t.float   "position_z",    limit: 24, default: 0.0, null: false
    t.float   "orientation",   limit: 24, default: 0.0, null: false
    t.integer "spawntimesecs",            default: 120, null: false,                            unsigned: true
    t.string  "comment",                  default: "",  null: false, comment: "Summon Comment"
  end

  create_table "creature_ai_texts", primary_key: "entry", id: :integer, limit: 3, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Script Texts" do |t|
    t.text    "content_default", limit: 65535,             null: false
    t.text    "content_loc1",    limit: 65535
    t.text    "content_loc2",    limit: 65535
    t.text    "content_loc3",    limit: 65535
    t.text    "content_loc4",    limit: 65535
    t.text    "content_loc5",    limit: 65535
    t.text    "content_loc6",    limit: 65535
    t.text    "content_loc7",    limit: 65535
    t.text    "content_loc8",    limit: 65535
    t.integer "sound",           limit: 3,     default: 0, null: false, unsigned: true
    t.integer "type",            limit: 1,     default: 0, null: false, unsigned: true
    t.integer "language",        limit: 1,     default: 0, null: false, unsigned: true
    t.integer "emote",           limit: 2,     default: 0, null: false, unsigned: true
    t.text    "comment",         limit: 65535
  end

  create_table "creature_battleground", primary_key: "guid", id: :integer, comment: "Creature's GUID", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Creature battleground indexing system" do |t|
    t.integer "event1", limit: 1, null: false, comment: "main event", unsigned: true
    t.integer "event2", limit: 1, null: false, comment: "sub event",  unsigned: true
  end

  create_table "creature_equip_template", primary_key: "entry", id: :integer, limit: 3, default: 0, comment: "Unique entry", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", comment: "Creature System (Equipment)" do |t|
    t.integer "equipentry1", limit: 3, default: 0, null: false, unsigned: true
    t.integer "equipentry2", limit: 3, default: 0, null: false, unsigned: true
    t.integer "equipentry3", limit: 3, default: 0, null: false, unsigned: true
    t.index ["equipentry1", "equipentry2", "equipentry3"], name: "unique_template", unique: true, using: :btree
  end

  create_table "creature_equip_template_raw", primary_key: "entry", id: :integer, limit: 3, default: 0, comment: "Unique entry", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", comment: "Creature System (Equipment)" do |t|
    t.integer "equipmodel1", limit: 3, default: 0, null: false, unsigned: true
    t.integer "equipmodel2", limit: 3, default: 0, null: false, unsigned: true
    t.integer "equipmodel3", limit: 3, default: 0, null: false, unsigned: true
    t.integer "equipinfo1",            default: 0, null: false, unsigned: true
    t.integer "equipinfo2",            default: 0, null: false, unsigned: true
    t.integer "equipinfo3",            default: 0, null: false, unsigned: true
    t.integer "equipslot1",            default: 0, null: false
    t.integer "equipslot2",            default: 0, null: false
    t.integer "equipslot3",            default: 0, null: false
  end

  create_table "creature_item_template", primary_key: "entry", id: :integer, limit: 3, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", comment: "Creature System (Equipment)" do |t|
    t.integer "class",          limit: 1, default: 0, unsigned: true
    t.integer "subclass",       limit: 1, default: 0, unsigned: true
    t.integer "material",       limit: 3, default: 0, unsigned: true
    t.integer "displayid",      limit: 3, default: 0, unsigned: true
    t.integer "inventory_type", limit: 1, default: 0, unsigned: true
    t.integer "sheath_type",    limit: 1, default: 0, unsigned: true
  end

  create_table "creature_linking", primary_key: "guid", id: :integer, comment: "creature.guid of the slave mob that is linked", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Creature Linking System" do |t|
    t.integer "master_guid",           null: false, comment: "master to trigger events",                  unsigned: true
    t.integer "flag",        limit: 3, null: false, comment: "flag - describing what should happen when", unsigned: true
  end

  create_table "creature_linking_template", primary_key: ["entry", "map"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Creature Linking System" do |t|
    t.integer "entry",        limit: 3, default: 0, null: false, comment: "creature_template.entry of the slave mob that is linked",                                      unsigned: true
    t.integer "map",          limit: 2, default: 0, null: false, comment: "Id of map of the mobs",                                                                        unsigned: true
    t.integer "master_entry", limit: 3, default: 0, null: false, comment: "master to trigger events",                                                                     unsigned: true
    t.integer "flag",         limit: 3, default: 0, null: false, comment: "flag - describing what should happen when",                                                    unsigned: true
    t.integer "search_range", limit: 3, default: 0, null: false, comment: "search_range - describing in which range (spawn-coords) master and slave are linked together", unsigned: true
  end

  create_table "creature_loot_template", primary_key: ["entry", "item"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Loot System" do |t|
    t.integer "entry",               limit: 3,  default: 0,     null: false, comment: "entry 0 used for player insignia loot", unsigned: true
    t.integer "item",                limit: 3,  default: 0,     null: false,                                                   unsigned: true
    t.float   "ChanceOrQuestChance", limit: 24, default: 100.0, null: false
    t.integer "groupid",             limit: 1,  default: 0,     null: false,                                                   unsigned: true
    t.integer "mincountOrRef",       limit: 3,  default: 1,     null: false
    t.integer "maxcount",            limit: 1,  default: 1,     null: false,                                                   unsigned: true
    t.integer "condition_id",        limit: 3,  default: 0,     null: false,                                                   unsigned: true
  end

  create_table "creature_model_info", primary_key: "modelid", id: :integer, limit: 3, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", comment: "Creature System (Model related info)" do |t|
    t.float   "bounding_radius",      limit: 24, default: 0.0, null: false
    t.float   "combat_reach",         limit: 24, default: 0.0, null: false
    t.integer "gender",               limit: 1,  default: 2,   null: false, unsigned: true
    t.integer "modelid_other_gender", limit: 3,  default: 0,   null: false, unsigned: true
    t.integer "modelid_other_team",   limit: 3,  default: 0,   null: false, unsigned: true
  end

  create_table "creature_movement", primary_key: ["id", "point"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Creature System" do |t|
    t.integer "id",                                   null: false, comment: "Creature GUID", unsigned: true
    t.integer "point",       limit: 3,  default: 0,   null: false,                           unsigned: true
    t.float   "position_x",  limit: 24, default: 0.0, null: false
    t.float   "position_y",  limit: 24, default: 0.0, null: false
    t.float   "position_z",  limit: 24, default: 0.0, null: false
    t.integer "waittime",               default: 0,   null: false,                           unsigned: true
    t.integer "script_id",   limit: 3,  default: 0,   null: false,                           unsigned: true
    t.integer "textid1",                default: 0,   null: false
    t.integer "textid2",                default: 0,   null: false
    t.integer "textid3",                default: 0,   null: false
    t.integer "textid4",                default: 0,   null: false
    t.integer "textid5",                default: 0,   null: false
    t.integer "emote",       limit: 3,  default: 0,   null: false,                           unsigned: true
    t.integer "spell",       limit: 3,  default: 0,   null: false,                           unsigned: true
    t.float   "orientation", limit: 24, default: 0.0, null: false
    t.integer "model1",      limit: 3,  default: 0,   null: false
    t.integer "model2",      limit: 3,  default: 0,   null: false
  end

  create_table "creature_movement_template", primary_key: ["entry", "point"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Creature waypoint system" do |t|
    t.integer "entry",       limit: 3,                null: false, comment: "Creature entry", unsigned: true
    t.integer "point",       limit: 3,  default: 0,   null: false,                            unsigned: true
    t.float   "position_x",  limit: 24, default: 0.0, null: false
    t.float   "position_y",  limit: 24, default: 0.0, null: false
    t.float   "position_z",  limit: 24, default: 0.0, null: false
    t.integer "waittime",               default: 0,   null: false,                            unsigned: true
    t.integer "script_id",   limit: 3,  default: 0,   null: false,                            unsigned: true
    t.integer "textid1",                default: 0,   null: false
    t.integer "textid2",                default: 0,   null: false
    t.integer "textid3",                default: 0,   null: false
    t.integer "textid4",                default: 0,   null: false
    t.integer "textid5",                default: 0,   null: false
    t.integer "emote",       limit: 3,  default: 0,   null: false,                            unsigned: true
    t.integer "spell",       limit: 3,  default: 0,   null: false,                            unsigned: true
    t.float   "orientation", limit: 24, default: 0.0, null: false
    t.integer "model1",      limit: 3,  default: 0,   null: false
    t.integer "model2",      limit: 3,  default: 0,   null: false
  end

  create_table "creature_onkill_reputation", primary_key: "creature_id", id: :integer, limit: 3, default: 0, comment: "Creature Identifier", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Creature OnKill Reputation gain" do |t|
    t.integer "RewOnKillRepFaction1", limit: 2, default: 0, null: false
    t.integer "RewOnKillRepFaction2", limit: 2, default: 0, null: false
    t.integer "MaxStanding1",         limit: 1, default: 0, null: false
    t.integer "IsTeamAward1",         limit: 1, default: 0, null: false
    t.integer "RewOnKillRepValue1",   limit: 3, default: 0, null: false
    t.integer "MaxStanding2",         limit: 1, default: 0, null: false
    t.integer "IsTeamAward2",         limit: 1, default: 0, null: false
    t.integer "RewOnKillRepValue2",   limit: 3, default: 0, null: false
    t.integer "TeamDependent",        limit: 1, default: 0, null: false, unsigned: true
  end

  create_table "creature_template", primary_key: "Entry", id: :integer, limit: 3, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Creature System" do |t|
    t.string  "Name",                 limit: 100, default: "",      null: false
    t.string  "SubName",              limit: 100
    t.integer "MinLevel",             limit: 1,   default: 1,       null: false, unsigned: true
    t.integer "MaxLevel",             limit: 1,   default: 1,       null: false, unsigned: true
    t.integer "ModelId1",             limit: 3,   default: 0,       null: false, unsigned: true
    t.integer "ModelId2",             limit: 3,   default: 0,       null: false, unsigned: true
    t.integer "ModelId3",             limit: 3,   default: 0,       null: false, unsigned: true
    t.integer "ModelId4",             limit: 3,   default: 0,       null: false, unsigned: true
    t.integer "FactionAlliance",      limit: 2,   default: 0,       null: false, unsigned: true
    t.integer "FactionHorde",         limit: 2,   default: 0,       null: false, unsigned: true
    t.float   "Scale",                limit: 24,  default: 1.0,     null: false
    t.integer "Family",               limit: 1,   default: 0,       null: false
    t.integer "CreatureType",         limit: 1,   default: 0,       null: false, unsigned: true
    t.integer "InhabitType",          limit: 1,   default: 3,       null: false, unsigned: true
    t.integer "RegenerateStats",      limit: 1,                                  unsigned: true
    t.integer "RacialLeader",         limit: 1,   default: 0,       null: false, unsigned: true
    t.integer "NpcFlags",                         default: 0,       null: false, unsigned: true
    t.integer "UnitFlags",                        default: 0,       null: false, unsigned: true
    t.integer "DynamicFlags",                     default: 0,       null: false, unsigned: true
    t.integer "ExtraFlags",                       default: 0,       null: false, unsigned: true
    t.integer "CreatureTypeFlags",                default: 0,       null: false, unsigned: true
    t.float   "SpeedWalk",            limit: 24,  default: 1.0,     null: false
    t.float   "SpeedRun",             limit: 24,  default: 1.14286, null: false
    t.integer "UnitClass",            limit: 1,   default: 0,       null: false, unsigned: true
    t.integer "Rank",                 limit: 1,   default: 0,       null: false, unsigned: true
    t.float   "HealthMultiplier",     limit: 24,  default: 1.0,     null: false
    t.float   "PowerMultiplier",      limit: 24,  default: 1.0,     null: false
    t.float   "DamageMultiplier",     limit: 24,  default: 1.0,     null: false
    t.float   "DamageVariance",       limit: 24,  default: 1.0,     null: false
    t.float   "ArmorMultiplier",      limit: 24,  default: 1.0,     null: false
    t.float   "ExperienceMultiplier", limit: 24,  default: 1.0,     null: false
    t.integer "MinLevelHealth",                   default: 0,       null: false, unsigned: true
    t.integer "MaxLevelHealth",                   default: 0,       null: false, unsigned: true
    t.integer "MinLevelMana",                     default: 0,       null: false, unsigned: true
    t.integer "MaxLevelMana",                     default: 0,       null: false, unsigned: true
    t.float   "MinMeleeDmg",          limit: 24,  default: 0.0,     null: false
    t.float   "MaxMeleeDmg",          limit: 24,  default: 0.0,     null: false
    t.float   "MinRangedDmg",         limit: 24,  default: 0.0,     null: false
    t.float   "MaxRangedDmg",         limit: 24,  default: 0.0,     null: false
    t.integer "Armor",                limit: 3,   default: 0,       null: false, unsigned: true
    t.integer "MeleeAttackPower",                 default: 0,       null: false, unsigned: true
    t.integer "RangedAttackPower",    limit: 2,   default: 0,       null: false, unsigned: true
    t.integer "MeleeBaseAttackTime",              default: 2000,    null: false, unsigned: true
    t.integer "RangedBaseAttackTime",             default: 2000,    null: false, unsigned: true
    t.integer "DamageSchool",         limit: 1,   default: 0,       null: false
    t.integer "MinLootGold",          limit: 3,   default: 0,       null: false, unsigned: true
    t.integer "MaxLootGold",          limit: 3,   default: 0,       null: false, unsigned: true
    t.integer "LootId",               limit: 3,   default: 0,       null: false, unsigned: true
    t.integer "PickpocketLootId",     limit: 3,   default: 0,       null: false, unsigned: true
    t.integer "SkinningLootId",       limit: 3,   default: 0,       null: false, unsigned: true
    t.integer "KillCredit1",                      default: 0,       null: false, unsigned: true
    t.integer "KillCredit2",                      default: 0,       null: false, unsigned: true
    t.integer "MechanicImmuneMask",               default: 0,       null: false, unsigned: true
    t.integer "ResistanceHoly",       limit: 2,   default: 0,       null: false
    t.integer "ResistanceFire",       limit: 2,   default: 0,       null: false
    t.integer "ResistanceNature",     limit: 2,   default: 0,       null: false
    t.integer "ResistanceFrost",      limit: 2,   default: 0,       null: false
    t.integer "ResistanceShadow",     limit: 2,   default: 0,       null: false
    t.integer "ResistanceArcane",     limit: 2,   default: 0,       null: false
    t.integer "PetSpellDataId",       limit: 3,   default: 0,       null: false, unsigned: true
    t.integer "MovementType",         limit: 1,   default: 0,       null: false, unsigned: true
    t.integer "TrainerType",          limit: 1,   default: 0,       null: false
    t.integer "TrainerSpell",         limit: 3,   default: 0,       null: false, unsigned: true
    t.integer "TrainerClass",         limit: 1,   default: 0,       null: false, unsigned: true
    t.integer "TrainerRace",          limit: 1,   default: 0,       null: false, unsigned: true
    t.integer "TrainerTemplateId",    limit: 3,   default: 0,       null: false, unsigned: true
    t.integer "VendorTemplateId",     limit: 3,   default: 0,       null: false, unsigned: true
    t.integer "GossipMenuId",         limit: 3,   default: 0,       null: false, unsigned: true
    t.integer "EquipmentTemplateId",  limit: 3,   default: 0,       null: false, unsigned: true
    t.integer "Civilian",             limit: 1,   default: 0,       null: false, unsigned: true
    t.string  "AIName",               limit: 64,  default: ""
  end

  create_table "creature_template_addon", primary_key: "entry", id: :integer, limit: 3, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "mount",       limit: 3,     default: 0, null: false, unsigned: true
    t.integer "bytes1",                    default: 0, null: false, unsigned: true
    t.integer "b2_0_sheath", limit: 1,     default: 0, null: false, unsigned: true
    t.integer "b2_1_flags",  limit: 1,     default: 0, null: false, unsigned: true
    t.integer "emote",       limit: 3,     default: 0, null: false, unsigned: true
    t.integer "moveflags",                 default: 0, null: false, unsigned: true
    t.text    "auras",       limit: 65535
  end

  create_table "creature_template_classlevelstats", primary_key: ["Level", "Class"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "Level",                 limit: 1,                null: false
    t.integer "Class",                 limit: 1,                null: false
    t.integer "BaseHealthExp0",        limit: 3,  default: 1,   null: false, unsigned: true
    t.integer "BaseMana",              limit: 3,  default: 0,   null: false, unsigned: true
    t.float   "BaseDamageExp0",        limit: 24, default: 0.0, null: false
    t.float   "BaseMeleeAttackPower",  limit: 24, default: 0.0, null: false
    t.float   "BaseRangedAttackPower", limit: 24, default: 0.0, null: false
    t.integer "BaseArmor",             limit: 3,  default: 0,   null: false, unsigned: true
  end

  create_table "creature_template_spells", primary_key: "entry", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Creature System (Spells used by creature)" do |t|
    t.integer "spell1", limit: 3,             null: false, unsigned: true
    t.integer "spell2", limit: 3, default: 0, null: false, unsigned: true
    t.integer "spell3", limit: 3, default: 0, null: false, unsigned: true
    t.integer "spell4", limit: 3, default: 0, null: false, unsigned: true
  end

  create_table "custom_texts", primary_key: "entry", id: :integer, limit: 3, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Custom Texts" do |t|
    t.text    "content_default", limit: 65535,             null: false
    t.text    "content_loc1",    limit: 65535
    t.text    "content_loc2",    limit: 65535
    t.text    "content_loc3",    limit: 65535
    t.text    "content_loc4",    limit: 65535
    t.text    "content_loc5",    limit: 65535
    t.text    "content_loc6",    limit: 65535
    t.text    "content_loc7",    limit: 65535
    t.text    "content_loc8",    limit: 65535
    t.integer "sound",           limit: 3,     default: 0, null: false, unsigned: true
    t.integer "type",            limit: 1,     default: 0, null: false, unsigned: true
    t.integer "language",        limit: 1,     default: 0, null: false, unsigned: true
    t.integer "emote",           limit: 2,     default: 0, null: false, unsigned: true
    t.text    "comment",         limit: 65535
  end

  create_table "db_script_string", primary_key: "entry", id: :integer, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.text    "content_default", limit: 65535,             null: false
    t.text    "content_loc1",    limit: 65535
    t.text    "content_loc2",    limit: 65535
    t.text    "content_loc3",    limit: 65535
    t.text    "content_loc4",    limit: 65535
    t.text    "content_loc5",    limit: 65535
    t.text    "content_loc6",    limit: 65535
    t.text    "content_loc7",    limit: 65535
    t.text    "content_loc8",    limit: 65535
    t.integer "sound",           limit: 3,     default: 0, null: false, unsigned: true
    t.integer "type",            limit: 1,     default: 0, null: false, unsigned: true
    t.integer "language",        limit: 1,     default: 0, null: false, unsigned: true
    t.integer "emote",           limit: 2,     default: 0, null: false, unsigned: true
    t.text    "comment",         limit: 65535
  end

  create_table "db_scripts", primary_key: "script_guid", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "script_type",   limit: 2,  default: 0,   null: false, unsigned: true
    t.integer "id",            limit: 3,  default: 0,   null: false, unsigned: true
    t.integer "delay",                    default: 0,   null: false, unsigned: true
    t.integer "command",       limit: 3,  default: 0,   null: false, unsigned: true
    t.integer "datalong",      limit: 3,  default: 0,   null: false, unsigned: true
    t.integer "datalong2",                default: 0,   null: false, unsigned: true
    t.integer "buddy_entry",              default: 0,   null: false, unsigned: true
    t.integer "search_radius",            default: 0,   null: false, unsigned: true
    t.integer "data_flags",    limit: 1,  default: 0,   null: false, unsigned: true
    t.integer "dataint",                  default: 0,   null: false
    t.integer "dataint2",                 default: 0,   null: false
    t.integer "dataint3",                 default: 0,   null: false
    t.integer "dataint4",                 default: 0,   null: false
    t.float   "x",             limit: 24, default: 0.0, null: false
    t.float   "y",             limit: 24, default: 0.0, null: false
    t.float   "z",             limit: 24, default: 0.0, null: false
    t.float   "o",             limit: 24, default: 0.0, null: false
    t.string  "comments",                               null: false
  end

  create_table "db_version", primary_key: ["version", "structure", "content"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT", comment: "Used DB version notes" do |t|
    t.integer "version",                              null: false
    t.integer "structure",                            null: false
    t.integer "content",                              null: false
    t.string  "description", limit: 30,  default: "", null: false
    t.string  "comment",     limit: 150, default: ""
  end

  create_table "dbdocsfields", primary_key: ["fieldId", "languageId"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "fieldId",                                null: false, comment: "Unique Id for this field"
    t.integer "languageId",                 default: 0, null: false, comment: "dbdocsLanguageId to link to. (Normally 0 = English)"
    t.string  "tableName",    limit: 80,                null: false, comment: "Name of the table to link to"
    t.string  "fieldName",    limit: 80,                null: false, comment: "Name of the field to link the note to"
    t.string  "fieldComment", limit: 80,                             comment: "Main field Note"
    t.text    "fieldNotes",   limit: 65535,             null: false, comment: "Additional Field Notes"
    t.index ["fieldId"], name: "fieldId", using: :btree
  end

  create_table "dbdocsfields_localised", primary_key: ["fieldId", "languageId"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "fieldId",                                null: false, comment: "dbdocsfields.fieldId to link to."
    t.integer "languageId",                 default: 0, null: false, comment: "dbdocsLanguageId to link to. (Normally 0 = English)"
    t.text    "fieldNotes",   limit: 65535,             null: false, comment: "Additional Field Notes"
    t.string  "fieldComment", limit: 80,                             comment: "Main field Note"
    t.index ["fieldId"], name: "fieldId", using: :btree
  end

  create_table "dbdocslanguage", primary_key: "LanguageId", id: :integer, comment: "LanguageId for this Language", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "LanguageName", limit: 30, null: false, comment: "The Language Name"
  end

  create_table "dbdocsprogressquests", primary_key: "QuestID", id: :integer, comment: "The Quest ID to link to", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "Progress",                 default: 0, null: false, comment: "The percentage of how complete the quest is"
    t.text    "QuestNotes", limit: 65535,                          comment: "Notes about the Quest"
  end

  create_table "dbdocssubtables", primary_key: ["subTableId", "languageId"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "subTableId",                                 null: false, comment: "Unique Lookup Id"
    t.integer "languageId",                     default: 0, null: false, comment: "dbdocsLanguageId to link to. (Normally 0 = English)"
    t.string  "subTableName",     limit: 80,                             comment: "Description of Content"
    t.text    "subTableContent",  limit: 65535,             null: false, comment: "The Sub Table Content"
    t.text    "subTableTemplate", limit: 65535,             null: false, comment: "The Sub Table Template"
  end

  create_table "dbdocssubtables_localised", primary_key: ["subTableId", "languageId"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "subTableId",                                 null: false, comment: "dbdocsSubtableId to link to"
    t.integer "languageId",                     default: 0, null: false, comment: "dbdocsLanguageId to link to. (Normally 0 = English)"
    t.text    "subTableContent",  limit: 65535,             null: false, comment: "The Sub Table Content"
    t.text    "subTableTemplate", limit: 65535,             null: false, comment: "The Sub Table Template"
  end

  create_table "dbdocstable", primary_key: ["tableId", "languageId", "tableName"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "tableId",                              null: false, comment: "Unique ID of this entry"
    t.integer "languageId",               default: 0, null: false, comment: "The Language Id for the Notes (Normally 0 for English)"
    t.string  "tableName",  limit: 80,                null: false, comment: "Name of the table to add additional notes to"
    t.text    "tableNotes", limit: 65535,             null: false, comment: "The additional note to be added to the table"
    t.index ["tableId"], name: "tableId", using: :btree
  end

  create_table "dbdocstable_localised", primary_key: ["tableId", "languageId"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "tableId",                              null: false, comment: "The dbdocsTableId to link to"
    t.integer "languageId",               default: 0, null: false, comment: "The dbdocsLanguageId to link to. (Normally 0 for English)"
    t.text    "tableNotes", limit: 65535,             null: false, comment: "The additional note to be added to the table"
  end

  create_table "disables", primary_key: ["sourceType", "entry", "data"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", comment: "Mangos disables system" do |t|
    t.integer "sourceType",                       null: false, comment: "Type of disable, see enum DisableType", unsigned: true
    t.integer "entry",                            null: false, comment: "Main entry for disable, type-specific", unsigned: true
    t.integer "flags",      limit: 1, default: 0, null: false, comment: "Flag bitfield, type-specific",          unsigned: true
    t.integer "data",                 default: 0, null: false, comment: "Additional data, type-specific",        unsigned: true
    t.string  "comment",                                       comment: "Description of disable cause"
  end

  create_table "disenchant_loot_template", primary_key: ["entry", "item"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Loot System" do |t|
    t.integer "entry",               limit: 3,  default: 0,     null: false, comment: "Recommended id selection: item_level*100 + item_quality", unsigned: true
    t.integer "item",                limit: 3,  default: 0,     null: false,                                                                     unsigned: true
    t.float   "ChanceOrQuestChance", limit: 24, default: 100.0, null: false
    t.integer "groupid",             limit: 1,  default: 0,     null: false,                                                                     unsigned: true
    t.integer "mincountOrRef",       limit: 3,  default: 1,     null: false
    t.integer "maxcount",            limit: 1,  default: 1,     null: false,                                                                     unsigned: true
    t.integer "condition_id",        limit: 3,  default: 0,     null: false,                                                                     unsigned: true
  end

  create_table "exploration_basexp", primary_key: "level", id: :integer, limit: 1, default: 0, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Exploration System" do |t|
    t.integer "basexp", limit: 3, default: 0, null: false
  end

  create_table "fishing_loot_template", primary_key: ["entry", "item"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Loot System" do |t|
    t.integer "entry",               limit: 3,  default: 0,     null: false, comment: "entry 0 used for junk loot at fishing fail (if allowed by config option)", unsigned: true
    t.integer "item",                limit: 3,  default: 0,     null: false,                                                                                      unsigned: true
    t.float   "ChanceOrQuestChance", limit: 24, default: 100.0, null: false
    t.integer "groupid",             limit: 1,  default: 0,     null: false,                                                                                      unsigned: true
    t.integer "mincountOrRef",       limit: 3,  default: 1,     null: false
    t.integer "maxcount",            limit: 1,  default: 1,     null: false,                                                                                      unsigned: true
    t.integer "condition_id",        limit: 3,  default: 0,     null: false,                                                                                      unsigned: true
  end

  create_table "game_event", primary_key: "entry", id: :integer, limit: 3, comment: "Entry of the game event", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.datetime "start_time",                            null: false, comment: "Absolute start date, the event will never start before"
    t.datetime "end_time",                              null: false, comment: "Absolute end date, the event will never start afler"
    t.bigint   "occurence",             default: 86400, null: false, comment: "Delay in minutes between occurences of the event",       unsigned: true
    t.bigint   "length",                default: 43200, null: false, comment: "Length in minutes of the event",                         unsigned: true
    t.integer  "holiday",     limit: 3, default: 0,     null: false, comment: "Client side holiday id",                                 unsigned: true
    t.string   "description",                                        comment: "Description of the event displayed in console"
  end

  create_table "game_event_creature", primary_key: "guid", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "event", limit: 2, default: 0, null: false, comment: "Negatives value to remove during event and ignore pool grouping, positive value for spawn during event and if guid is part of pool then al pool memebers must be listed as part of event spawn."
  end

  create_table "game_event_creature_data", primary_key: ["guid", "event"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "guid",                   default: 0, null: false, unsigned: true
    t.integer "entry_id",     limit: 3, default: 0, null: false, unsigned: true
    t.integer "modelid",      limit: 3, default: 0, null: false, unsigned: true
    t.integer "equipment_id", limit: 3, default: 0, null: false, unsigned: true
    t.integer "spell_start",  limit: 3, default: 0, null: false, unsigned: true
    t.integer "spell_end",    limit: 3, default: 0, null: false, unsigned: true
    t.integer "event",        limit: 2, default: 0, null: false, unsigned: true
  end

  create_table "game_event_gameobject", primary_key: "guid", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "event", limit: 2, default: 0, null: false, comment: "Negatives value to remove during event and ignore pool grouping, positive value for spawn during event and if guid is part of pool then al pool memebers must be listed as part of event spawn."
  end

  create_table "game_event_mail", primary_key: ["event", "raceMask", "quest"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Game event system" do |t|
    t.integer "event",          limit: 2, default: 0, null: false, comment: "Negatives value to send at event stop, positive value for send at event start."
    t.integer "raceMask",       limit: 3, default: 0, null: false,                                                                                            unsigned: true
    t.integer "quest",          limit: 3, default: 0, null: false,                                                                                            unsigned: true
    t.integer "mailTemplateId", limit: 3, default: 0, null: false,                                                                                            unsigned: true
    t.integer "senderEntry",    limit: 3, default: 0, null: false,                                                                                            unsigned: true
  end

  create_table "game_event_quest", primary_key: ["quest", "event"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", comment: "Game event system" do |t|
    t.integer "quest", limit: 3, default: 0, null: false, comment: "entry from quest_template", unsigned: true
    t.integer "event", limit: 2, default: 0, null: false, comment: "entry from game_event",     unsigned: true
  end

  create_table "game_graveyard_zone", primary_key: ["id", "ghost_zone"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", comment: "Trigger System" do |t|
    t.integer "id",         limit: 3, default: 0, null: false, unsigned: true
    t.integer "ghost_zone", limit: 3, default: 0, null: false, unsigned: true
    t.integer "faction",    limit: 2, default: 0, null: false, unsigned: true
  end

  create_table "game_tele", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", comment: "Tele Command" do |t|
    t.float   "position_x",  limit: 24,  default: 0.0, null: false
    t.float   "position_y",  limit: 24,  default: 0.0, null: false
    t.float   "position_z",  limit: 24,  default: 0.0, null: false
    t.float   "orientation", limit: 24,  default: 0.0, null: false
    t.integer "map",         limit: 2,   default: 0,   null: false, unsigned: true
    t.string  "name",        limit: 100, default: "",  null: false
  end

  create_table "game_weather", primary_key: "zone", id: :integer, limit: 3, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Weather System" do |t|
    t.integer "spring_rain_chance",  limit: 1, default: 25, null: false, unsigned: true
    t.integer "spring_snow_chance",  limit: 1, default: 25, null: false, unsigned: true
    t.integer "spring_storm_chance", limit: 1, default: 25, null: false, unsigned: true
    t.integer "summer_rain_chance",  limit: 1, default: 25, null: false, unsigned: true
    t.integer "summer_snow_chance",  limit: 1, default: 25, null: false, unsigned: true
    t.integer "summer_storm_chance", limit: 1, default: 25, null: false, unsigned: true
    t.integer "fall_rain_chance",    limit: 1, default: 25, null: false, unsigned: true
    t.integer "fall_snow_chance",    limit: 1, default: 25, null: false, unsigned: true
    t.integer "fall_storm_chance",   limit: 1, default: 25, null: false, unsigned: true
    t.integer "winter_rain_chance",  limit: 1, default: 25, null: false, unsigned: true
    t.integer "winter_snow_chance",  limit: 1, default: 25, null: false, unsigned: true
    t.integer "winter_storm_chance", limit: 1, default: 25, null: false, unsigned: true
  end

  create_table "gameobject", primary_key: "guid", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Gameobject System" do |t|
    t.integer "id",            limit: 3,  default: 0,   null: false, comment: "Gameobject Identifier", unsigned: true
    t.integer "map",           limit: 2,  default: 0,   null: false, comment: "Map Identifier",        unsigned: true
    t.float   "position_x",    limit: 24, default: 0.0, null: false
    t.float   "position_y",    limit: 24, default: 0.0, null: false
    t.float   "position_z",    limit: 24, default: 0.0, null: false
    t.float   "orientation",   limit: 24, default: 0.0, null: false
    t.float   "rotation0",     limit: 24, default: 0.0, null: false
    t.float   "rotation1",     limit: 24, default: 0.0, null: false
    t.float   "rotation2",     limit: 24, default: 0.0, null: false
    t.float   "rotation3",     limit: 24, default: 0.0, null: false
    t.integer "spawntimesecs",            default: 0,   null: false
    t.integer "animprogress",  limit: 1,  default: 0,   null: false,                                   unsigned: true
    t.integer "state",         limit: 1,  default: 0,   null: false,                                   unsigned: true
    t.index ["id"], name: "idx_id", using: :btree
    t.index ["map"], name: "idx_map", using: :btree
  end

  create_table "gameobject_battleground", primary_key: "guid", id: :integer, comment: "GameObject's GUID", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "GameObject battleground indexing system" do |t|
    t.integer "event1", limit: 1, null: false, comment: "main event", unsigned: true
    t.integer "event2", limit: 1, null: false, comment: "sub event",  unsigned: true
  end

  create_table "gameobject_loot_template", primary_key: ["entry", "item"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Loot System" do |t|
    t.integer "entry",               limit: 3,  default: 0,     null: false, unsigned: true
    t.integer "item",                limit: 3,  default: 0,     null: false, unsigned: true
    t.float   "ChanceOrQuestChance", limit: 24, default: 100.0, null: false
    t.integer "groupid",             limit: 1,  default: 0,     null: false, unsigned: true
    t.integer "mincountOrRef",       limit: 3,  default: 1,     null: false
    t.integer "maxcount",            limit: 1,  default: 1,     null: false, unsigned: true
    t.integer "condition_id",        limit: 3,  default: 0,     null: false, unsigned: true
  end

  create_table "gameobject_template", primary_key: "entry", id: :integer, limit: 3, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Gameobject System" do |t|
    t.integer "type",      limit: 1,   default: 0,   null: false, unsigned: true
    t.integer "displayId", limit: 3,   default: 0,   null: false, unsigned: true
    t.string  "name",      limit: 100, default: "",  null: false
    t.integer "faction",   limit: 2,   default: 0,   null: false, unsigned: true
    t.integer "flags",                 default: 0,   null: false, unsigned: true
    t.float   "size",      limit: 24,  default: 1.0, null: false
    t.integer "data0",                 default: 0,   null: false, unsigned: true
    t.integer "data1",                 default: 0,   null: false, unsigned: true
    t.integer "data2",                 default: 0,   null: false, unsigned: true
    t.integer "data3",                 default: 0,   null: false, unsigned: true
    t.integer "data4",                 default: 0,   null: false, unsigned: true
    t.integer "data5",                 default: 0,   null: false, unsigned: true
    t.integer "data6",                 default: 0,   null: false, unsigned: true
    t.integer "data7",                 default: 0,   null: false, unsigned: true
    t.integer "data8",                 default: 0,   null: false, unsigned: true
    t.integer "data9",                 default: 0,   null: false, unsigned: true
    t.integer "data10",                default: 0,   null: false, unsigned: true
    t.integer "data11",                default: 0,   null: false, unsigned: true
    t.integer "data12",                default: 0,   null: false, unsigned: true
    t.integer "data13",                default: 0,   null: false, unsigned: true
    t.integer "data14",                default: 0,   null: false, unsigned: true
    t.integer "data15",                default: 0,   null: false, unsigned: true
    t.integer "data16",                default: 0,   null: false, unsigned: true
    t.integer "data17",                default: 0,   null: false, unsigned: true
    t.integer "data18",                default: 0,   null: false, unsigned: true
    t.integer "data19",                default: 0,   null: false, unsigned: true
    t.integer "data20",                default: 0,   null: false, unsigned: true
    t.integer "data21",                default: 0,   null: false, unsigned: true
    t.integer "data22",                default: 0,   null: false, unsigned: true
    t.integer "data23",                default: 0,   null: false, unsigned: true
    t.integer "mingold",   limit: 3,   default: 0,   null: false, unsigned: true
    t.integer "maxgold",   limit: 3,   default: 0,   null: false, unsigned: true
  end

  create_table "gossip_menu", primary_key: ["entry", "text_id", "script_id"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "entry",        limit: 2, default: 0, null: false,                                                                          unsigned: true
    t.integer "text_id",      limit: 3, default: 0, null: false,                                                                          unsigned: true
    t.integer "script_id",    limit: 3, default: 0, null: false, comment: "script in `gossip_scripts` - will be executed on GossipHello", unsigned: true
    t.integer "condition_id", limit: 3, default: 0, null: false,                                                                          unsigned: true
  end

  create_table "gossip_menu_option", primary_key: ["menu_id", "id"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "menu_id",            limit: 2,     default: 0, null: false, unsigned: true
    t.integer "id",                 limit: 2,     default: 0, null: false, unsigned: true
    t.integer "option_icon",        limit: 3,     default: 0, null: false, unsigned: true
    t.text    "option_text",        limit: 65535
    t.integer "option_id",          limit: 1,     default: 0, null: false, unsigned: true
    t.integer "npc_option_npcflag",               default: 0, null: false, unsigned: true
    t.integer "action_menu_id",     limit: 3,     default: 0, null: false
    t.integer "action_poi_id",      limit: 3,     default: 0, null: false, unsigned: true
    t.integer "action_script_id",   limit: 3,     default: 0, null: false, unsigned: true
    t.integer "box_coded",          limit: 1,     default: 0, null: false, unsigned: true
    t.integer "box_money",                        default: 0, null: false, unsigned: true
    t.text    "box_text",           limit: 65535
    t.integer "condition_id",       limit: 3,     default: 0, null: false, unsigned: true
  end

  create_table "gossip_texts", primary_key: "entry", id: :integer, limit: 3, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Gossip Texts" do |t|
    t.text "content_default", limit: 65535, null: false
    t.text "content_loc1",    limit: 65535
    t.text "content_loc2",    limit: 65535
    t.text "content_loc3",    limit: 65535
    t.text "content_loc4",    limit: 65535
    t.text "content_loc5",    limit: 65535
    t.text "content_loc6",    limit: 65535
    t.text "content_loc7",    limit: 65535
    t.text "content_loc8",    limit: 65535
    t.text "comment",         limit: 65535
  end

  create_table "instance_template", primary_key: "map", id: :integer, limit: 2, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "parent",           limit: 2,  default: 0, null: false,                                unsigned: true
    t.integer "levelMin",         limit: 1,  default: 0, null: false,                                unsigned: true
    t.integer "levelMax",         limit: 1,  default: 0, null: false,                                unsigned: true
    t.integer "maxPlayers",       limit: 1,  default: 0, null: false,                                unsigned: true
    t.integer "reset_delay",                 default: 0, null: false, comment: "Reset time in days", unsigned: true
    t.integer "ghostEntranceMap", limit: 2,              null: false,                                unsigned: true
    t.float   "ghostEntranceX",   limit: 24,             null: false
    t.float   "ghostEntranceY",   limit: 24,             null: false
  end

  create_table "item_enchantment_template", primary_key: ["entry", "ench"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Item Random Enchantment System" do |t|
    t.integer "entry",  limit: 3,  default: 0,   null: false, unsigned: true
    t.integer "ench",   limit: 3,  default: 0,   null: false, unsigned: true
    t.float   "chance", limit: 24, default: 0.0, null: false, unsigned: true
  end

  create_table "item_loot_template", primary_key: ["entry", "item"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Loot System" do |t|
    t.integer "entry",               limit: 3,  default: 0,     null: false, unsigned: true
    t.integer "item",                limit: 3,  default: 0,     null: false, unsigned: true
    t.float   "ChanceOrQuestChance", limit: 24, default: 100.0, null: false
    t.integer "groupid",             limit: 1,  default: 0,     null: false, unsigned: true
    t.integer "mincountOrRef",       limit: 3,  default: 1,     null: false
    t.integer "maxcount",            limit: 1,  default: 1,     null: false, unsigned: true
    t.integer "condition_id",        limit: 3,  default: 0,     null: false, unsigned: true
  end

  create_table "item_required_target", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED" do |t|
    t.integer "entry",       limit: 3,             null: false, unsigned: true
    t.integer "type",        limit: 1, default: 0, null: false, unsigned: true
    t.integer "targetEntry", limit: 3, default: 0, null: false, unsigned: true
    t.index ["entry", "type", "targetEntry"], name: "entry_type_target", unique: true, using: :btree
  end

  create_table "item_template", primary_key: "entry", id: :integer, limit: 3, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Item System" do |t|
    t.integer "class",                     limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "subclass",                  limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.string  "name",                                 default: "",    null: false
    t.integer "displayid",                 limit: 3,  default: 0,     null: false,                                 unsigned: true
    t.integer "Quality",                   limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "Flags",                                default: 0,     null: false,                                 unsigned: true
    t.integer "BuyCount",                  limit: 1,  default: 1,     null: false,                                 unsigned: true
    t.integer "BuyPrice",                             default: 0,     null: false,                                 unsigned: true
    t.integer "SellPrice",                            default: 0,     null: false,                                 unsigned: true
    t.integer "InventoryType",             limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "AllowableClass",            limit: 3,  default: -1,    null: false
    t.integer "AllowableRace",             limit: 3,  default: -1,    null: false
    t.integer "ItemLevel",                 limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "RequiredLevel",             limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "RequiredSkill",             limit: 2,  default: 0,     null: false,                                 unsigned: true
    t.integer "RequiredSkillRank",         limit: 2,  default: 0,     null: false,                                 unsigned: true
    t.integer "requiredspell",             limit: 3,  default: 0,     null: false,                                 unsigned: true
    t.integer "requiredhonorrank",         limit: 3,  default: 0,     null: false,                                 unsigned: true
    t.integer "RequiredCityRank",          limit: 3,  default: 0,     null: false,                                 unsigned: true
    t.integer "RequiredReputationFaction", limit: 2,  default: 0,     null: false,                                 unsigned: true
    t.integer "RequiredReputationRank",    limit: 2,  default: 0,     null: false,                                 unsigned: true
    t.integer "maxcount",                  limit: 2,  default: 0,     null: false,                                 unsigned: true
    t.integer "stackable",                 limit: 2,  default: 1,     null: false,                                 unsigned: true
    t.integer "ContainerSlots",            limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "stat_type1",                limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "stat_value1",               limit: 2,  default: 0,     null: false
    t.integer "stat_type2",                limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "stat_value2",               limit: 2,  default: 0,     null: false
    t.integer "stat_type3",                limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "stat_value3",               limit: 2,  default: 0,     null: false
    t.integer "stat_type4",                limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "stat_value4",               limit: 2,  default: 0,     null: false
    t.integer "stat_type5",                limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "stat_value5",               limit: 2,  default: 0,     null: false
    t.integer "stat_type6",                limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "stat_value6",               limit: 2,  default: 0,     null: false
    t.integer "stat_type7",                limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "stat_value7",               limit: 2,  default: 0,     null: false
    t.integer "stat_type8",                limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "stat_value8",               limit: 2,  default: 0,     null: false
    t.integer "stat_type9",                limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "stat_value9",               limit: 2,  default: 0,     null: false
    t.integer "stat_type10",               limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "stat_value10",              limit: 2,  default: 0,     null: false
    t.float   "dmg_min1",                  limit: 24, default: 0.0,   null: false
    t.float   "dmg_max1",                  limit: 24, default: 0.0,   null: false
    t.integer "dmg_type1",                 limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.float   "dmg_min2",                  limit: 24, default: 0.0,   null: false
    t.float   "dmg_max2",                  limit: 24, default: 0.0,   null: false
    t.integer "dmg_type2",                 limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.float   "dmg_min3",                  limit: 24, default: 0.0,   null: false
    t.float   "dmg_max3",                  limit: 24, default: 0.0,   null: false
    t.integer "dmg_type3",                 limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.float   "dmg_min4",                  limit: 24, default: 0.0,   null: false
    t.float   "dmg_max4",                  limit: 24, default: 0.0,   null: false
    t.integer "dmg_type4",                 limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.float   "dmg_min5",                  limit: 24, default: 0.0,   null: false
    t.float   "dmg_max5",                  limit: 24, default: 0.0,   null: false
    t.integer "dmg_type5",                 limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "armor",                     limit: 2,  default: 0,     null: false,                                 unsigned: true
    t.integer "holy_res",                  limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "fire_res",                  limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "nature_res",                limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "frost_res",                 limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "shadow_res",                limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "arcane_res",                limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "delay",                     limit: 2,  default: 1000,  null: false,                                 unsigned: true
    t.integer "ammo_type",                 limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.float   "RangedModRange",            limit: 24, default: 0.0,   null: false
    t.integer "spellid_1",                 limit: 3,  default: 0,     null: false,                                 unsigned: true
    t.integer "spelltrigger_1",            limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "spellcharges_1",            limit: 1,  default: 0,     null: false
    t.float   "spellppmRate_1",            limit: 24, default: 0.0,   null: false
    t.integer "spellcooldown_1",                      default: -1,    null: false
    t.integer "spellcategory_1",           limit: 2,  default: 0,     null: false,                                 unsigned: true
    t.integer "spellcategorycooldown_1",              default: -1,    null: false
    t.integer "spellid_2",                 limit: 3,  default: 0,     null: false,                                 unsigned: true
    t.integer "spelltrigger_2",            limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "spellcharges_2",            limit: 1,  default: 0,     null: false
    t.float   "spellppmRate_2",            limit: 24, default: 0.0,   null: false
    t.integer "spellcooldown_2",                      default: -1,    null: false
    t.integer "spellcategory_2",           limit: 2,  default: 0,     null: false,                                 unsigned: true
    t.integer "spellcategorycooldown_2",              default: -1,    null: false
    t.integer "spellid_3",                 limit: 3,  default: 0,     null: false,                                 unsigned: true
    t.integer "spelltrigger_3",            limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "spellcharges_3",            limit: 1,  default: 0,     null: false
    t.float   "spellppmRate_3",            limit: 24, default: 0.0,   null: false
    t.integer "spellcooldown_3",                      default: -1,    null: false
    t.integer "spellcategory_3",           limit: 2,  default: 0,     null: false,                                 unsigned: true
    t.integer "spellcategorycooldown_3",              default: -1,    null: false
    t.integer "spellid_4",                 limit: 3,  default: 0,     null: false,                                 unsigned: true
    t.integer "spelltrigger_4",            limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "spellcharges_4",            limit: 1,  default: 0,     null: false
    t.float   "spellppmRate_4",            limit: 24, default: 0.0,   null: false
    t.integer "spellcooldown_4",                      default: -1,    null: false
    t.integer "spellcategory_4",           limit: 2,  default: 0,     null: false,                                 unsigned: true
    t.integer "spellcategorycooldown_4",              default: -1,    null: false
    t.integer "spellid_5",                 limit: 3,  default: 0,     null: false,                                 unsigned: true
    t.integer "spelltrigger_5",            limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "spellcharges_5",            limit: 1,  default: 0,     null: false
    t.float   "spellppmRate_5",            limit: 24, default: 0.0,   null: false
    t.integer "spellcooldown_5",                      default: -1,    null: false
    t.integer "spellcategory_5",           limit: 2,  default: 0,     null: false,                                 unsigned: true
    t.integer "spellcategorycooldown_5",              default: -1,    null: false
    t.integer "bonding",                   limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.string  "description",                          default: "",    null: false
    t.integer "PageText",                  limit: 3,  default: 0,     null: false,                                 unsigned: true
    t.integer "LanguageID",                limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "PageMaterial",              limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "startquest",                limit: 3,  default: 0,     null: false,                                 unsigned: true
    t.integer "lockid",                    limit: 3,  default: 0,     null: false,                                 unsigned: true
    t.integer "Material",                  limit: 1,  default: 0,     null: false
    t.integer "sheath",                    limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "RandomProperty",            limit: 3,  default: 0,     null: false,                                 unsigned: true
    t.integer "block",                     limit: 3,  default: 0,     null: false,                                 unsigned: true
    t.integer "itemset",                   limit: 3,  default: 0,     null: false,                                 unsigned: true
    t.integer "MaxDurability",             limit: 2,  default: 0,     null: false,                                 unsigned: true
    t.integer "area",                      limit: 3,  default: 0,     null: false,                                 unsigned: true
    t.integer "Map",                       limit: 2,  default: 0,     null: false
    t.integer "BagFamily",                 limit: 3,  default: 0,     null: false
    t.integer "DisenchantID",              limit: 3,  default: 0,     null: false,                                 unsigned: true
    t.integer "FoodType",                  limit: 1,  default: 0,     null: false,                                 unsigned: true
    t.integer "minMoneyLoot",                         default: 0,     null: false,                                 unsigned: true
    t.integer "maxMoneyLoot",                         default: 0,     null: false,                                 unsigned: true
    t.integer "Duration",                             default: 0,     null: false, comment: "Duration in seconds", unsigned: true
    t.boolean "ExtraFlags",                           default: false, null: false,                                 unsigned: true
    t.index ["class"], name: "items_index", using: :btree
  end

  create_table "locales_creature", primary_key: "entry", id: :integer, limit: 3, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string "name_loc1",    limit: 100, default: "", null: false
    t.string "name_loc2",    limit: 100, default: "", null: false
    t.string "name_loc3",    limit: 100, default: "", null: false
    t.string "name_loc4",    limit: 100, default: "", null: false
    t.string "name_loc5",    limit: 100, default: "", null: false
    t.string "name_loc6",    limit: 100, default: "", null: false
    t.string "name_loc7",    limit: 100, default: "", null: false
    t.string "name_loc8",    limit: 100, default: "", null: false
    t.string "subname_loc1", limit: 100
    t.string "subname_loc2", limit: 100
    t.string "subname_loc3", limit: 100
    t.string "subname_loc4", limit: 100
    t.string "subname_loc5", limit: 100
    t.string "subname_loc6", limit: 100
    t.string "subname_loc7", limit: 100
    t.string "subname_loc8", limit: 100
  end

  create_table "locales_gameobject", primary_key: "entry", id: :integer, limit: 3, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string "name_loc1", limit: 100, default: "", null: false
    t.string "name_loc2", limit: 100, default: "", null: false
    t.string "name_loc3", limit: 100, default: "", null: false
    t.string "name_loc4", limit: 100, default: "", null: false
    t.string "name_loc5", limit: 100, default: "", null: false
    t.string "name_loc6", limit: 100, default: "", null: false
    t.string "name_loc7", limit: 100, default: "", null: false
    t.string "name_loc8", limit: 100, default: "", null: false
  end

  create_table "locales_gossip_menu_option", primary_key: ["menu_id", "id"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "menu_id",          limit: 2,     default: 0, null: false, unsigned: true
    t.integer "id",               limit: 2,     default: 0, null: false, unsigned: true
    t.text    "option_text_loc1", limit: 65535
    t.text    "option_text_loc2", limit: 65535
    t.text    "option_text_loc3", limit: 65535
    t.text    "option_text_loc4", limit: 65535
    t.text    "option_text_loc5", limit: 65535
    t.text    "option_text_loc6", limit: 65535
    t.text    "option_text_loc7", limit: 65535
    t.text    "option_text_loc8", limit: 65535
    t.text    "box_text_loc1",    limit: 65535
    t.text    "box_text_loc2",    limit: 65535
    t.text    "box_text_loc3",    limit: 65535
    t.text    "box_text_loc4",    limit: 65535
    t.text    "box_text_loc5",    limit: 65535
    t.text    "box_text_loc6",    limit: 65535
    t.text    "box_text_loc7",    limit: 65535
    t.text    "box_text_loc8",    limit: 65535
  end

  create_table "locales_item", primary_key: "entry", id: :integer, limit: 3, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string "name_loc1",        limit: 100, default: "", null: false
    t.string "name_loc2",        limit: 100, default: "", null: false
    t.string "name_loc3",        limit: 100, default: "", null: false
    t.string "name_loc4",        limit: 100, default: "", null: false
    t.string "name_loc5",        limit: 100, default: "", null: false
    t.string "name_loc6",        limit: 100, default: "", null: false
    t.string "name_loc7",        limit: 100, default: "", null: false
    t.string "name_loc8",        limit: 100, default: "", null: false
    t.string "description_loc1"
    t.string "description_loc2"
    t.string "description_loc3"
    t.string "description_loc4"
    t.string "description_loc5"
    t.string "description_loc6"
    t.string "description_loc7"
    t.string "description_loc8"
  end

  create_table "locales_npc_text", primary_key: "entry", id: :integer, limit: 3, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.text "Text0_0_loc1", limit: 4294967295
    t.text "Text0_0_loc2", limit: 4294967295
    t.text "Text0_0_loc3", limit: 4294967295
    t.text "Text0_0_loc4", limit: 4294967295
    t.text "Text0_0_loc5", limit: 4294967295
    t.text "Text0_0_loc6", limit: 4294967295
    t.text "Text0_0_loc7", limit: 4294967295
    t.text "Text0_0_loc8", limit: 4294967295
    t.text "Text0_1_loc1", limit: 4294967295
    t.text "Text0_1_loc2", limit: 4294967295
    t.text "Text0_1_loc3", limit: 4294967295
    t.text "Text0_1_loc4", limit: 4294967295
    t.text "Text0_1_loc5", limit: 4294967295
    t.text "Text0_1_loc6", limit: 4294967295
    t.text "Text0_1_loc7", limit: 4294967295
    t.text "Text0_1_loc8", limit: 4294967295
    t.text "Text1_0_loc1", limit: 4294967295
    t.text "Text1_0_loc2", limit: 4294967295
    t.text "Text1_0_loc3", limit: 4294967295
    t.text "Text1_0_loc4", limit: 4294967295
    t.text "Text1_0_loc5", limit: 4294967295
    t.text "Text1_0_loc6", limit: 4294967295
    t.text "Text1_0_loc7", limit: 4294967295
    t.text "Text1_0_loc8", limit: 4294967295
    t.text "Text1_1_loc1", limit: 4294967295
    t.text "Text1_1_loc2", limit: 4294967295
    t.text "Text1_1_loc3", limit: 4294967295
    t.text "Text1_1_loc4", limit: 4294967295
    t.text "Text1_1_loc5", limit: 4294967295
    t.text "Text1_1_loc6", limit: 4294967295
    t.text "Text1_1_loc7", limit: 4294967295
    t.text "Text1_1_loc8", limit: 4294967295
    t.text "Text2_0_loc1", limit: 4294967295
    t.text "Text2_0_loc2", limit: 4294967295
    t.text "Text2_0_loc3", limit: 4294967295
    t.text "Text2_0_loc4", limit: 4294967295
    t.text "Text2_0_loc5", limit: 4294967295
    t.text "Text2_0_loc6", limit: 4294967295
    t.text "Text2_0_loc7", limit: 4294967295
    t.text "Text2_0_loc8", limit: 4294967295
    t.text "Text2_1_loc1", limit: 4294967295
    t.text "Text2_1_loc2", limit: 4294967295
    t.text "Text2_1_loc3", limit: 4294967295
    t.text "Text2_1_loc4", limit: 4294967295
    t.text "Text2_1_loc5", limit: 4294967295
    t.text "Text2_1_loc6", limit: 4294967295
    t.text "Text2_1_loc7", limit: 4294967295
    t.text "Text2_1_loc8", limit: 4294967295
    t.text "Text3_0_loc1", limit: 4294967295
    t.text "Text3_0_loc2", limit: 4294967295
    t.text "Text3_0_loc3", limit: 4294967295
    t.text "Text3_0_loc4", limit: 4294967295
    t.text "Text3_0_loc5", limit: 4294967295
    t.text "Text3_0_loc6", limit: 4294967295
    t.text "Text3_0_loc7", limit: 4294967295
    t.text "Text3_0_loc8", limit: 4294967295
    t.text "Text3_1_loc1", limit: 4294967295
    t.text "Text3_1_loc2", limit: 4294967295
    t.text "Text3_1_loc3", limit: 4294967295
    t.text "Text3_1_loc4", limit: 4294967295
    t.text "Text3_1_loc5", limit: 4294967295
    t.text "Text3_1_loc6", limit: 4294967295
    t.text "Text3_1_loc7", limit: 4294967295
    t.text "Text3_1_loc8", limit: 4294967295
    t.text "Text4_0_loc1", limit: 4294967295
    t.text "Text4_0_loc2", limit: 4294967295
    t.text "Text4_0_loc3", limit: 4294967295
    t.text "Text4_0_loc4", limit: 4294967295
    t.text "Text4_0_loc5", limit: 4294967295
    t.text "Text4_0_loc6", limit: 4294967295
    t.text "Text4_0_loc7", limit: 4294967295
    t.text "Text4_0_loc8", limit: 4294967295
    t.text "Text4_1_loc1", limit: 4294967295
    t.text "Text4_1_loc2", limit: 4294967295
    t.text "Text4_1_loc3", limit: 4294967295
    t.text "Text4_1_loc4", limit: 4294967295
    t.text "Text4_1_loc5", limit: 4294967295
    t.text "Text4_1_loc6", limit: 4294967295
    t.text "Text4_1_loc7", limit: 4294967295
    t.text "Text4_1_loc8", limit: 4294967295
    t.text "Text5_0_loc1", limit: 4294967295
    t.text "Text5_0_loc2", limit: 4294967295
    t.text "Text5_0_loc3", limit: 4294967295
    t.text "Text5_0_loc4", limit: 4294967295
    t.text "Text5_0_loc5", limit: 4294967295
    t.text "Text5_0_loc6", limit: 4294967295
    t.text "Text5_0_loc7", limit: 4294967295
    t.text "Text5_0_loc8", limit: 4294967295
    t.text "Text5_1_loc1", limit: 4294967295
    t.text "Text5_1_loc2", limit: 4294967295
    t.text "Text5_1_loc3", limit: 4294967295
    t.text "Text5_1_loc4", limit: 4294967295
    t.text "Text5_1_loc5", limit: 4294967295
    t.text "Text5_1_loc6", limit: 4294967295
    t.text "Text5_1_loc7", limit: 4294967295
    t.text "Text5_1_loc8", limit: 4294967295
    t.text "Text6_0_loc1", limit: 4294967295
    t.text "Text6_0_loc2", limit: 4294967295
    t.text "Text6_0_loc3", limit: 4294967295
    t.text "Text6_0_loc4", limit: 4294967295
    t.text "Text6_0_loc5", limit: 4294967295
    t.text "Text6_0_loc6", limit: 4294967295
    t.text "Text6_0_loc7", limit: 4294967295
    t.text "Text6_0_loc8", limit: 4294967295
    t.text "Text6_1_loc1", limit: 4294967295
    t.text "Text6_1_loc2", limit: 4294967295
    t.text "Text6_1_loc3", limit: 4294967295
    t.text "Text6_1_loc4", limit: 4294967295
    t.text "Text6_1_loc5", limit: 4294967295
    t.text "Text6_1_loc6", limit: 4294967295
    t.text "Text6_1_loc7", limit: 4294967295
    t.text "Text6_1_loc8", limit: 4294967295
    t.text "Text7_0_loc1", limit: 4294967295
    t.text "Text7_0_loc2", limit: 4294967295
    t.text "Text7_0_loc3", limit: 4294967295
    t.text "Text7_0_loc4", limit: 4294967295
    t.text "Text7_0_loc5", limit: 4294967295
    t.text "Text7_0_loc6", limit: 4294967295
    t.text "Text7_0_loc7", limit: 4294967295
    t.text "Text7_0_loc8", limit: 4294967295
    t.text "Text7_1_loc1", limit: 4294967295
    t.text "Text7_1_loc2", limit: 4294967295
    t.text "Text7_1_loc3", limit: 4294967295
    t.text "Text7_1_loc4", limit: 4294967295
    t.text "Text7_1_loc5", limit: 4294967295
    t.text "Text7_1_loc6", limit: 4294967295
    t.text "Text7_1_loc7", limit: 4294967295
    t.text "Text7_1_loc8", limit: 4294967295
  end

  create_table "locales_page_text", primary_key: "entry", id: :integer, limit: 3, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.text "Text_loc1", limit: 4294967295
    t.text "Text_loc2", limit: 4294967295
    t.text "Text_loc3", limit: 4294967295
    t.text "Text_loc4", limit: 4294967295
    t.text "Text_loc5", limit: 4294967295
    t.text "Text_loc6", limit: 4294967295
    t.text "Text_loc7", limit: 4294967295
    t.text "Text_loc8", limit: 4294967295
  end

  create_table "locales_points_of_interest", primary_key: "entry", id: :integer, limit: 3, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.text "icon_name_loc1", limit: 65535
    t.text "icon_name_loc2", limit: 65535
    t.text "icon_name_loc3", limit: 65535
    t.text "icon_name_loc4", limit: 65535
    t.text "icon_name_loc5", limit: 65535
    t.text "icon_name_loc6", limit: 65535
    t.text "icon_name_loc7", limit: 65535
    t.text "icon_name_loc8", limit: 65535
  end

  create_table "locales_quest", primary_key: "entry", id: :integer, limit: 3, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.text "Title_loc1",            limit: 65535
    t.text "Title_loc2",            limit: 65535
    t.text "Title_loc3",            limit: 65535
    t.text "Title_loc4",            limit: 65535
    t.text "Title_loc5",            limit: 65535
    t.text "Title_loc6",            limit: 65535
    t.text "Title_loc7",            limit: 65535
    t.text "Title_loc8",            limit: 65535
    t.text "Details_loc1",          limit: 65535
    t.text "Details_loc2",          limit: 65535
    t.text "Details_loc3",          limit: 65535
    t.text "Details_loc4",          limit: 65535
    t.text "Details_loc5",          limit: 65535
    t.text "Details_loc6",          limit: 65535
    t.text "Details_loc7",          limit: 65535
    t.text "Details_loc8",          limit: 65535
    t.text "Objectives_loc1",       limit: 65535
    t.text "Objectives_loc2",       limit: 65535
    t.text "Objectives_loc3",       limit: 65535
    t.text "Objectives_loc4",       limit: 65535
    t.text "Objectives_loc5",       limit: 65535
    t.text "Objectives_loc6",       limit: 65535
    t.text "Objectives_loc7",       limit: 65535
    t.text "Objectives_loc8",       limit: 65535
    t.text "OfferRewardText_loc1",  limit: 65535
    t.text "OfferRewardText_loc2",  limit: 65535
    t.text "OfferRewardText_loc3",  limit: 65535
    t.text "OfferRewardText_loc4",  limit: 65535
    t.text "OfferRewardText_loc5",  limit: 65535
    t.text "OfferRewardText_loc6",  limit: 65535
    t.text "OfferRewardText_loc7",  limit: 65535
    t.text "OfferRewardText_loc8",  limit: 65535
    t.text "RequestItemsText_loc1", limit: 65535
    t.text "RequestItemsText_loc2", limit: 65535
    t.text "RequestItemsText_loc3", limit: 65535
    t.text "RequestItemsText_loc4", limit: 65535
    t.text "RequestItemsText_loc5", limit: 65535
    t.text "RequestItemsText_loc6", limit: 65535
    t.text "RequestItemsText_loc7", limit: 65535
    t.text "RequestItemsText_loc8", limit: 65535
    t.text "EndText_loc1",          limit: 65535
    t.text "EndText_loc2",          limit: 65535
    t.text "EndText_loc3",          limit: 65535
    t.text "EndText_loc4",          limit: 65535
    t.text "EndText_loc5",          limit: 65535
    t.text "EndText_loc6",          limit: 65535
    t.text "EndText_loc7",          limit: 65535
    t.text "EndText_loc8",          limit: 65535
    t.text "ObjectiveText1_loc1",   limit: 65535
    t.text "ObjectiveText1_loc2",   limit: 65535
    t.text "ObjectiveText1_loc3",   limit: 65535
    t.text "ObjectiveText1_loc4",   limit: 65535
    t.text "ObjectiveText1_loc5",   limit: 65535
    t.text "ObjectiveText1_loc6",   limit: 65535
    t.text "ObjectiveText1_loc7",   limit: 65535
    t.text "ObjectiveText1_loc8",   limit: 65535
    t.text "ObjectiveText2_loc1",   limit: 65535
    t.text "ObjectiveText2_loc2",   limit: 65535
    t.text "ObjectiveText2_loc3",   limit: 65535
    t.text "ObjectiveText2_loc4",   limit: 65535
    t.text "ObjectiveText2_loc5",   limit: 65535
    t.text "ObjectiveText2_loc6",   limit: 65535
    t.text "ObjectiveText2_loc7",   limit: 65535
    t.text "ObjectiveText2_loc8",   limit: 65535
    t.text "ObjectiveText3_loc1",   limit: 65535
    t.text "ObjectiveText3_loc2",   limit: 65535
    t.text "ObjectiveText3_loc3",   limit: 65535
    t.text "ObjectiveText3_loc4",   limit: 65535
    t.text "ObjectiveText3_loc5",   limit: 65535
    t.text "ObjectiveText3_loc6",   limit: 65535
    t.text "ObjectiveText3_loc7",   limit: 65535
    t.text "ObjectiveText3_loc8",   limit: 65535
    t.text "ObjectiveText4_loc1",   limit: 65535
    t.text "ObjectiveText4_loc2",   limit: 65535
    t.text "ObjectiveText4_loc3",   limit: 65535
    t.text "ObjectiveText4_loc4",   limit: 65535
    t.text "ObjectiveText4_loc5",   limit: 65535
    t.text "ObjectiveText4_loc6",   limit: 65535
    t.text "ObjectiveText4_loc7",   limit: 65535
    t.text "ObjectiveText4_loc8",   limit: 65535
  end

  create_table "mail_loot_template", primary_key: ["entry", "item"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Loot System" do |t|
    t.integer "entry",               limit: 3,  default: 0,     null: false, unsigned: true
    t.integer "item",                limit: 3,  default: 0,     null: false, unsigned: true
    t.float   "ChanceOrQuestChance", limit: 24, default: 100.0, null: false
    t.integer "groupid",             limit: 1,  default: 0,     null: false, unsigned: true
    t.integer "mincountOrRef",       limit: 3,  default: 1,     null: false
    t.integer "maxcount",            limit: 1,  default: 1,     null: false, unsigned: true
    t.integer "condition_id",        limit: 3,  default: 0,     null: false, unsigned: true
  end

  create_table "mangos_string", primary_key: "entry", id: :integer, limit: 3, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.text "content_default", limit: 65535, null: false
    t.text "content_loc1",    limit: 65535
    t.text "content_loc2",    limit: 65535
    t.text "content_loc3",    limit: 65535
    t.text "content_loc4",    limit: 65535
    t.text "content_loc5",    limit: 65535
    t.text "content_loc6",    limit: 65535
    t.text "content_loc7",    limit: 65535
    t.text "content_loc8",    limit: 65535
  end

  create_table "npc_gossip", primary_key: "npc_guid", id: :integer, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "textid", limit: 3, default: 0, null: false, unsigned: true
  end

  create_table "npc_text", primary_key: "ID", id: :integer, limit: 3, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.text    "text0_0",     limit: 4294967295
    t.text    "text0_1",     limit: 4294967295
    t.integer "lang0",       limit: 1,          default: 0,   null: false, unsigned: true
    t.float   "prob0",       limit: 24,         default: 0.0, null: false
    t.integer "em0_0_delay", limit: 2
    t.integer "em0_0",       limit: 2
    t.integer "em0_1_delay", limit: 2
    t.integer "em0_1",       limit: 2
    t.integer "em0_2_delay", limit: 2
    t.integer "em0_2",       limit: 2
    t.text    "text1_0",     limit: 4294967295
    t.text    "text1_1",     limit: 4294967295
    t.integer "lang1",       limit: 1,          default: 0,   null: false, unsigned: true
    t.float   "prob1",       limit: 24,         default: 0.0, null: false
    t.integer "em1_0_delay", limit: 2
    t.integer "em1_0",       limit: 2
    t.integer "em1_1_delay", limit: 2
    t.integer "em1_1",       limit: 2
    t.integer "em1_2_delay", limit: 2
    t.integer "em1_2",       limit: 2
    t.text    "text2_0",     limit: 4294967295
    t.text    "text2_1",     limit: 4294967295
    t.integer "lang2",       limit: 1,          default: 0,   null: false, unsigned: true
    t.float   "prob2",       limit: 24,         default: 0.0, null: false
    t.integer "em2_0_delay", limit: 2
    t.integer "em2_0",       limit: 2
    t.integer "em2_1_delay", limit: 2
    t.integer "em2_1",       limit: 2
    t.integer "em2_2_delay", limit: 2
    t.integer "em2_2",       limit: 2
    t.text    "text3_0",     limit: 4294967295
    t.text    "text3_1",     limit: 4294967295
    t.integer "lang3",       limit: 1,          default: 0,   null: false, unsigned: true
    t.float   "prob3",       limit: 24,         default: 0.0, null: false
    t.integer "em3_0_delay", limit: 2
    t.integer "em3_0",       limit: 2
    t.integer "em3_1_delay", limit: 2
    t.integer "em3_1",       limit: 2
    t.integer "em3_2_delay", limit: 2
    t.integer "em3_2",       limit: 2
    t.text    "text4_0",     limit: 4294967295
    t.text    "text4_1",     limit: 4294967295
    t.integer "lang4",       limit: 1,          default: 0,   null: false, unsigned: true
    t.float   "prob4",       limit: 24,         default: 0.0, null: false
    t.integer "em4_0_delay", limit: 2
    t.integer "em4_0",       limit: 2
    t.integer "em4_1_delay", limit: 2
    t.integer "em4_1",       limit: 2
    t.integer "em4_2_delay", limit: 2
    t.integer "em4_2",       limit: 2
    t.text    "text5_0",     limit: 4294967295
    t.text    "text5_1",     limit: 4294967295
    t.integer "lang5",       limit: 1,          default: 0,   null: false, unsigned: true
    t.float   "prob5",       limit: 24,         default: 0.0, null: false
    t.integer "em5_0_delay", limit: 2
    t.integer "em5_0",       limit: 2
    t.integer "em5_1_delay", limit: 2
    t.integer "em5_1",       limit: 2
    t.integer "em5_2_delay", limit: 2
    t.integer "em5_2",       limit: 2
    t.text    "text6_0",     limit: 4294967295
    t.text    "text6_1",     limit: 4294967295
    t.integer "lang6",       limit: 1,          default: 0,   null: false, unsigned: true
    t.float   "prob6",       limit: 24,         default: 0.0, null: false
    t.integer "em6_0_delay", limit: 2
    t.integer "em6_0",       limit: 2
    t.integer "em6_1_delay", limit: 2
    t.integer "em6_1",       limit: 2
    t.integer "em6_2_delay", limit: 2
    t.integer "em6_2",       limit: 2
    t.text    "text7_0",     limit: 4294967295
    t.text    "text7_1",     limit: 4294967295
    t.integer "lang7",       limit: 1,          default: 0,   null: false, unsigned: true
    t.float   "prob7",       limit: 24,         default: 0.0, null: false
    t.integer "em7_0_delay", limit: 2
    t.integer "em7_0",       limit: 2
    t.integer "em7_1_delay", limit: 2
    t.integer "em7_1",       limit: 2
    t.integer "em7_2_delay", limit: 2
    t.integer "em7_2",       limit: 2
  end

  create_table "npc_trainer", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "entry",         limit: 3, default: 0, null: false, unsigned: true
    t.integer "spell",         limit: 3, default: 0, null: false, unsigned: true
    t.integer "spellcost",               default: 0, null: false, unsigned: true
    t.integer "reqskill",      limit: 2, default: 0, null: false, unsigned: true
    t.integer "reqskillvalue", limit: 2, default: 0, null: false, unsigned: true
    t.integer "reqlevel",      limit: 1, default: 0, null: false, unsigned: true
    t.index ["entry", "spell"], name: "entry_spell", unique: true, using: :btree
  end

  create_table "npc_trainer_template", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "entry",         limit: 3, default: 0, null: false, unsigned: true
    t.integer "spell",         limit: 3, default: 0, null: false, unsigned: true
    t.integer "spellcost",               default: 0, null: false, unsigned: true
    t.integer "reqskill",      limit: 2, default: 0, null: false, unsigned: true
    t.integer "reqskillvalue", limit: 2, default: 0, null: false, unsigned: true
    t.integer "reqlevel",      limit: 1, default: 0, null: false, unsigned: true
    t.index ["entry", "spell"], name: "entry_spell", unique: true, using: :btree
  end

  create_table "npc_vendor", primary_key: ["entry", "item"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Npc System" do |t|
    t.integer "entry",        limit: 3, default: 0, null: false, unsigned: true
    t.integer "item",         limit: 3, default: 0, null: false, unsigned: true
    t.integer "maxcount",     limit: 1, default: 0, null: false, unsigned: true
    t.integer "incrtime",               default: 0, null: false, unsigned: true
    t.integer "condition_id", limit: 3, default: 0, null: false, unsigned: true
  end

  create_table "npc_vendor_template", primary_key: ["entry", "item"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Npc System" do |t|
    t.integer "entry",        limit: 3, default: 0, null: false, unsigned: true
    t.integer "item",         limit: 3, default: 0, null: false, unsigned: true
    t.integer "maxcount",     limit: 1, default: 0, null: false, unsigned: true
    t.integer "incrtime",               default: 0, null: false, unsigned: true
    t.integer "condition_id", limit: 3, default: 0, null: false, unsigned: true
  end

  create_table "page_text", primary_key: "entry", id: :integer, limit: 3, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Item System" do |t|
    t.text    "text",      limit: 4294967295,             null: false
    t.integer "next_page", limit: 3,          default: 0, null: false, unsigned: true
  end

  create_table "pet_levelstats", primary_key: ["creature_entry", "level"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0", comment: "Stores pet levels stats." do |t|
    t.integer "creature_entry", limit: 3,             null: false, unsigned: true
    t.integer "level",          limit: 1,             null: false, unsigned: true
    t.integer "hp",             limit: 2,             null: false, unsigned: true
    t.integer "mana",           limit: 2,             null: false, unsigned: true
    t.integer "armor",                    default: 0, null: false, unsigned: true
    t.integer "str",            limit: 2,             null: false, unsigned: true
    t.integer "agi",            limit: 2,             null: false, unsigned: true
    t.integer "sta",            limit: 2,             null: false, unsigned: true
    t.integer "inte",           limit: 2,             null: false, unsigned: true
    t.integer "spi",            limit: 2,             null: false, unsigned: true
  end

  create_table "pet_name_generation", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.text    "word",  limit: 255,             null: false
    t.integer "entry", limit: 3,   default: 0, null: false, unsigned: true
    t.integer "half",  limit: 1,   default: 0, null: false
  end

  create_table "petcreateinfo_spell", primary_key: "entry", id: :integer, limit: 3, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Pet Create Spells" do |t|
    t.integer "Spell1", limit: 3, default: 0, null: false, unsigned: true
    t.integer "Spell2", limit: 3, default: 0, null: false, unsigned: true
    t.integer "Spell3", limit: 3, default: 0, null: false, unsigned: true
    t.integer "Spell4", limit: 3, default: 0, null: false, unsigned: true
  end

  create_table "pickpocketing_loot_template", primary_key: ["entry", "item"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Loot System" do |t|
    t.integer "entry",               limit: 3,  default: 0,     null: false, unsigned: true
    t.integer "item",                limit: 3,  default: 0,     null: false, unsigned: true
    t.float   "ChanceOrQuestChance", limit: 24, default: 100.0, null: false
    t.integer "groupid",             limit: 1,  default: 0,     null: false, unsigned: true
    t.integer "mincountOrRef",       limit: 3,  default: 1,     null: false
    t.integer "maxcount",            limit: 1,  default: 1,     null: false, unsigned: true
    t.integer "condition_id",        limit: 3,  default: 0,     null: false, unsigned: true
  end

  create_table "player_classlevelstats", primary_key: ["class", "level"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0", comment: "Stores levels stats." do |t|
    t.integer "class",    limit: 1, null: false, unsigned: true
    t.integer "level",    limit: 1, null: false, unsigned: true
    t.integer "basehp",   limit: 2, null: false, unsigned: true
    t.integer "basemana", limit: 2, null: false, unsigned: true
  end

  create_table "player_levelstats", primary_key: ["race", "class", "level"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0", comment: "Stores levels stats." do |t|
    t.integer "race",  limit: 1, null: false, unsigned: true
    t.integer "class", limit: 1, null: false, unsigned: true
    t.integer "level", limit: 1, null: false, unsigned: true
    t.integer "str",   limit: 1, null: false, unsigned: true
    t.integer "agi",   limit: 1, null: false, unsigned: true
    t.integer "sta",   limit: 1, null: false, unsigned: true
    t.integer "inte",  limit: 1, null: false, unsigned: true
    t.integer "spi",   limit: 1, null: false, unsigned: true
  end

  create_table "player_xp_for_level", primary_key: "lvl", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "xp_for_next_level", null: false, unsigned: true
  end

  create_table "playercreateinfo", primary_key: ["race", "class"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "race",        limit: 1,  default: 0,   null: false, unsigned: true
    t.integer "class",       limit: 1,  default: 0,   null: false, unsigned: true
    t.integer "map",         limit: 2,  default: 0,   null: false, unsigned: true
    t.integer "zone",        limit: 3,  default: 0,   null: false, unsigned: true
    t.float   "position_x",  limit: 24, default: 0.0, null: false
    t.float   "position_y",  limit: 24, default: 0.0, null: false
    t.float   "position_z",  limit: 24, default: 0.0, null: false
    t.float   "orientation", limit: 24, default: 0.0, null: false
  end

  create_table "playercreateinfo_action", primary_key: ["race", "class", "button"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "race",   limit: 1, default: 0, null: false, unsigned: true
    t.integer "class",  limit: 1, default: 0, null: false, unsigned: true
    t.integer "button", limit: 2, default: 0, null: false, unsigned: true
    t.integer "action",           default: 0, null: false, unsigned: true
    t.integer "type",   limit: 2, default: 0, null: false, unsigned: true
    t.index ["race", "class"], name: "playercreateinfo_race_class_index", using: :btree
  end

  create_table "playercreateinfo_item", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "race",   limit: 1, default: 0, null: false, unsigned: true
    t.integer "class",  limit: 1, default: 0, null: false, unsigned: true
    t.integer "itemid", limit: 3, default: 0, null: false, unsigned: true
    t.integer "amount", limit: 1, default: 1, null: false, unsigned: true
    t.index ["race", "class"], name: "playercreateinfo_race_class_index", using: :btree
  end

  create_table "playercreateinfo_spell", primary_key: ["race", "class", "Spell"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "race",  limit: 1, default: 0, null: false, unsigned: true
    t.integer "class", limit: 1, default: 0, null: false, unsigned: true
    t.integer "Spell", limit: 3, default: 0, null: false, unsigned: true
    t.string  "Note"
  end

  create_table "points_of_interest", primary_key: "entry", id: :integer, limit: 3, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.float   "x",         limit: 24,    default: 0.0, null: false
    t.float   "y",         limit: 24,    default: 0.0, null: false
    t.integer "icon",      limit: 3,     default: 0,   null: false, unsigned: true
    t.integer "flags",     limit: 3,     default: 0,   null: false, unsigned: true
    t.integer "data",      limit: 3,     default: 0,   null: false, unsigned: true
    t.text    "icon_name", limit: 65535,               null: false
  end

  create_table "pool_creature", primary_key: "guid", id: :integer, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "pool_entry",  limit: 3,  default: 0,   null: false, unsigned: true
    t.float   "chance",      limit: 24, default: 0.0, null: false, unsigned: true
    t.string  "description",                          null: false
    t.index ["pool_entry"], name: "pool_idx", using: :btree
  end

  create_table "pool_creature_template", id: :integer, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "pool_entry",  limit: 3,  default: 0,   null: false, unsigned: true
    t.float   "chance",      limit: 24, default: 0.0, null: false, unsigned: true
    t.string  "description",                          null: false
    t.index ["pool_entry"], name: "pool_idx", using: :btree
  end

  create_table "pool_gameobject", primary_key: "guid", id: :integer, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "pool_entry",  limit: 3,  default: 0,   null: false, unsigned: true
    t.float   "chance",      limit: 24, default: 0.0, null: false, unsigned: true
    t.string  "description",                          null: false
    t.index ["pool_entry"], name: "pool_idx", using: :btree
  end

  create_table "pool_gameobject_template", id: :integer, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "pool_entry",  limit: 3,  default: 0,   null: false, unsigned: true
    t.float   "chance",      limit: 24, default: 0.0, null: false, unsigned: true
    t.string  "description",                          null: false
    t.index ["pool_entry"], name: "pool_idx", using: :btree
  end

  create_table "pool_pool", primary_key: "pool_id", id: :integer, limit: 3, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "mother_pool", limit: 3,  default: 0,   null: false, unsigned: true
    t.float   "chance",      limit: 24, default: 0.0, null: false
    t.string  "description",                          null: false
    t.index ["mother_pool"], name: "pool_idx", using: :btree
  end

  create_table "pool_template", primary_key: "entry", id: :integer, limit: 3, default: 0, comment: "Pool entry", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "max_limit",   default: 0, null: false, comment: "Max number of objects (0) is no limit", unsigned: true
    t.string  "description",             null: false
  end

  create_table "quest_relations", primary_key: ["entry", "quest", "role"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "actor", limit: 1, default: 0, null: false, comment: "Entity involved in quest: 0 - Creature, 1 - GameObject, 2 - Area trigger",           unsigned: true
    t.integer "entry",           default: 0, null: false, comment: "Creature or GO entry from *_template, AreaTrigger ID",                               unsigned: true
    t.integer "quest",           default: 0, null: false, comment: "Quest ID from quest_template",                                                       unsigned: true
    t.integer "role",  limit: 1, default: 0, null: false, comment: "Role of the actor: 0 - starts the quest, 1 - ends the quest (unused for actor = 2)", unsigned: true
  end

  create_table "quest_template", primary_key: "entry", id: :integer, limit: 3, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", comment: "Quest System" do |t|
    t.integer "Method",                 limit: 1,     default: 2,   null: false,                                                      unsigned: true
    t.integer "ZoneOrSort",             limit: 2,     default: 0,   null: false
    t.integer "MinLevel",               limit: 1,     default: 0,   null: false,                                                      unsigned: true
    t.integer "QuestLevel",             limit: 1,     default: 0,   null: false,                                                      unsigned: true
    t.integer "Type",                   limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RequiredClasses",        limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RequiredRaces",          limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RequiredSkill",          limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RequiredSkillValue",     limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RepObjectiveFaction",    limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RepObjectiveValue",      limit: 3,     default: 0,   null: false
    t.integer "RequiredMinRepFaction",  limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RequiredMinRepValue",    limit: 3,     default: 0,   null: false
    t.integer "RequiredMaxRepFaction",  limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RequiredMaxRepValue",    limit: 3,     default: 0,   null: false
    t.integer "SuggestedPlayers",       limit: 1,     default: 0,   null: false,                                                      unsigned: true
    t.integer "LimitTime",                            default: 0,   null: false,                                                      unsigned: true
    t.integer "QuestFlags",             limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "SpecialFlags",           limit: 1,     default: 0,   null: false,                                                      unsigned: true
    t.integer "PrevQuestId",            limit: 3,     default: 0,   null: false
    t.integer "NextQuestId",            limit: 3,     default: 0,   null: false
    t.integer "ExclusiveGroup",         limit: 3,     default: 0,   null: false
    t.integer "NextQuestInChain",       limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "SrcItemId",              limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "SrcItemCount",           limit: 1,     default: 0,   null: false,                                                      unsigned: true
    t.integer "SrcSpell",               limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.text    "Title",                  limit: 65535
    t.text    "Details",                limit: 65535
    t.text    "Objectives",             limit: 65535
    t.text    "OfferRewardText",        limit: 65535
    t.text    "RequestItemsText",       limit: 65535
    t.text    "EndText",                limit: 65535
    t.text    "ObjectiveText1",         limit: 65535
    t.text    "ObjectiveText2",         limit: 65535
    t.text    "ObjectiveText3",         limit: 65535
    t.text    "ObjectiveText4",         limit: 65535
    t.integer "ReqItemId1",             limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "ReqItemId2",             limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "ReqItemId3",             limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "ReqItemId4",             limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "ReqItemCount1",          limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "ReqItemCount2",          limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "ReqItemCount3",          limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "ReqItemCount4",          limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "ReqSourceId1",           limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "ReqSourceId2",           limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "ReqSourceId3",           limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "ReqSourceId4",           limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "ReqSourceCount1",        limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "ReqSourceCount2",        limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "ReqSourceCount3",        limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "ReqSourceCount4",        limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "ReqCreatureOrGOId1",     limit: 3,     default: 0,   null: false
    t.integer "ReqCreatureOrGOId2",     limit: 3,     default: 0,   null: false
    t.integer "ReqCreatureOrGOId3",     limit: 3,     default: 0,   null: false
    t.integer "ReqCreatureOrGOId4",     limit: 3,     default: 0,   null: false
    t.integer "ReqCreatureOrGOCount1",  limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "ReqCreatureOrGOCount2",  limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "ReqCreatureOrGOCount3",  limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "ReqCreatureOrGOCount4",  limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "ReqSpellCast1",          limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "ReqSpellCast2",          limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "ReqSpellCast3",          limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "ReqSpellCast4",          limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RewChoiceItemId1",       limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RewChoiceItemId2",       limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RewChoiceItemId3",       limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RewChoiceItemId4",       limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RewChoiceItemId5",       limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RewChoiceItemId6",       limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RewChoiceItemCount1",    limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RewChoiceItemCount2",    limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RewChoiceItemCount3",    limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RewChoiceItemCount4",    limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RewChoiceItemCount5",    limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RewChoiceItemCount6",    limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RewItemId1",             limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RewItemId2",             limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RewItemId3",             limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RewItemId4",             limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RewItemCount1",          limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RewItemCount2",          limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RewItemCount3",          limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RewItemCount4",          limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RewRepFaction1",         limit: 2,     default: 0,   null: false, comment: "faction id from Faction.dbc in this case", unsigned: true
    t.integer "RewRepFaction2",         limit: 2,     default: 0,   null: false, comment: "faction id from Faction.dbc in this case", unsigned: true
    t.integer "RewRepFaction3",         limit: 2,     default: 0,   null: false, comment: "faction id from Faction.dbc in this case", unsigned: true
    t.integer "RewRepFaction4",         limit: 2,     default: 0,   null: false, comment: "faction id from Faction.dbc in this case", unsigned: true
    t.integer "RewRepFaction5",         limit: 2,     default: 0,   null: false, comment: "faction id from Faction.dbc in this case", unsigned: true
    t.integer "RewRepValue1",           limit: 3,     default: 0,   null: false
    t.integer "RewRepValue2",           limit: 3,     default: 0,   null: false
    t.integer "RewRepValue3",           limit: 3,     default: 0,   null: false
    t.integer "RewRepValue4",           limit: 3,     default: 0,   null: false
    t.integer "RewRepValue5",           limit: 3,     default: 0,   null: false
    t.integer "RewOrReqMoney",                        default: 0,   null: false
    t.integer "RewMoneyMaxLevel",                     default: 0,   null: false,                                                      unsigned: true
    t.integer "RewSpell",               limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RewSpellCast",           limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RewMailTemplateId",      limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "RewMailDelaySecs",                     default: 0,   null: false,                                                      unsigned: true
    t.integer "PointMapId",             limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.float   "PointX",                 limit: 24,    default: 0.0, null: false
    t.float   "PointY",                 limit: 24,    default: 0.0, null: false
    t.integer "PointOpt",               limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "DetailsEmote1",          limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "DetailsEmote2",          limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "DetailsEmote3",          limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "DetailsEmote4",          limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "DetailsEmoteDelay1",                   default: 0,   null: false,                                                      unsigned: true
    t.integer "DetailsEmoteDelay2",                   default: 0,   null: false,                                                      unsigned: true
    t.integer "DetailsEmoteDelay3",                   default: 0,   null: false,                                                      unsigned: true
    t.integer "DetailsEmoteDelay4",                   default: 0,   null: false,                                                      unsigned: true
    t.integer "IncompleteEmote",        limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "CompleteEmote",          limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "OfferRewardEmote1",      limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "OfferRewardEmote2",      limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "OfferRewardEmote3",      limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "OfferRewardEmote4",      limit: 2,     default: 0,   null: false,                                                      unsigned: true
    t.integer "OfferRewardEmoteDelay1",               default: 0,   null: false,                                                      unsigned: true
    t.integer "OfferRewardEmoteDelay2",               default: 0,   null: false,                                                      unsigned: true
    t.integer "OfferRewardEmoteDelay3",               default: 0,   null: false,                                                      unsigned: true
    t.integer "OfferRewardEmoteDelay4",               default: 0,   null: false,                                                      unsigned: true
    t.integer "StartScript",            limit: 3,     default: 0,   null: false,                                                      unsigned: true
    t.integer "CompleteScript",         limit: 3,     default: 0,   null: false,                                                      unsigned: true
  end

  create_table "reference_loot_template", primary_key: ["entry", "item"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Loot System" do |t|
    t.integer "entry",               limit: 3,  default: 0,     null: false, unsigned: true
    t.integer "item",                limit: 3,  default: 0,     null: false, unsigned: true
    t.float   "ChanceOrQuestChance", limit: 24, default: 100.0, null: false
    t.integer "groupid",             limit: 1,  default: 0,     null: false, unsigned: true
    t.integer "mincountOrRef",       limit: 3,  default: 1,     null: false
    t.integer "maxcount",            limit: 1,  default: 1,     null: false, unsigned: true
    t.integer "condition_id",        limit: 3,  default: 0,     null: false, unsigned: true
  end

  create_table "reputation_reward_rate", primary_key: "faction", id: :integer, limit: 3, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.float "quest_rate",    limit: 24, default: 1.0, null: false
    t.float "creature_rate", limit: 24, default: 1.0, null: false
    t.float "spell_rate",    limit: 24, default: 1.0, null: false
  end

  create_table "reputation_spillover_template", primary_key: "faction", id: :integer, limit: 2, default: 0, comment: "faction entry", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Reputation spillover reputation gain" do |t|
    t.integer "faction1", limit: 2,  default: 0,   null: false, comment: "faction to give spillover for",                    unsigned: true
    t.float   "rate_1",   limit: 24, default: 0.0, null: false, comment: "the given rep points * rate"
    t.integer "rank_1",   limit: 1,  default: 0,   null: false, comment: "max rank, above this will not give any spillover", unsigned: true
    t.integer "faction2", limit: 2,  default: 0,   null: false,                                                              unsigned: true
    t.float   "rate_2",   limit: 24, default: 0.0, null: false
    t.integer "rank_2",   limit: 1,  default: 0,   null: false,                                                              unsigned: true
    t.integer "faction3", limit: 2,  default: 0,   null: false,                                                              unsigned: true
    t.float   "rate_3",   limit: 24, default: 0.0, null: false
    t.integer "rank_3",   limit: 1,  default: 0,   null: false,                                                              unsigned: true
    t.integer "faction4", limit: 2,  default: 0,   null: false,                                                              unsigned: true
    t.float   "rate_4",   limit: 24, default: 0.0, null: false
    t.integer "rank_4",   limit: 1,  default: 0,   null: false,                                                              unsigned: true
  end

  create_table "reserved_name", primary_key: "name", id: :string, limit: 12, default: "", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Player Reserved Names" do |t|
  end

  create_table "script_binding", primary_key: ["ScriptName", "bind"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "SD2 Script Names and Binding" do |t|
    t.integer "type",       limit: 1,              null: false, comment: "enum ScriptedObjectType",                    unsigned: true
    t.string  "ScriptName", limit: 64,             null: false, comment: "Script name, to be unique across all types"
    t.integer "bind",       limit: 3,              null: false, comment: "Bound to entry (>0) or GUID (<0)"
    t.integer "data",       limit: 1,  default: 0,              comment: "Misc data; Effect number for spellscripts",  unsigned: true
    t.index ["type"], name: "type", using: :btree
  end

  create_table "script_texts", primary_key: "entry", id: :integer, limit: 3, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Script Texts" do |t|
    t.text    "content_default", limit: 65535,             null: false
    t.text    "content_loc1",    limit: 65535
    t.text    "content_loc2",    limit: 65535
    t.text    "content_loc3",    limit: 65535
    t.text    "content_loc4",    limit: 65535
    t.text    "content_loc5",    limit: 65535
    t.text    "content_loc6",    limit: 65535
    t.text    "content_loc7",    limit: 65535
    t.text    "content_loc8",    limit: 65535
    t.integer "sound",           limit: 3,     default: 0, null: false, unsigned: true
    t.integer "type",            limit: 1,     default: 0, null: false, unsigned: true
    t.integer "language",        limit: 1,     default: 0, null: false, unsigned: true
    t.integer "emote",           limit: 2,     default: 0, null: false, unsigned: true
    t.text    "comment",         limit: 65535
  end

  create_table "script_waypoint", primary_key: ["entry", "pointid"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Script Creature waypoints" do |t|
    t.integer "entry",         limit: 3,     default: 0,   null: false, comment: "creature_template entry", unsigned: true
    t.integer "pointid",       limit: 3,     default: 0,   null: false,                                     unsigned: true
    t.float   "location_x",    limit: 24,    default: 0.0, null: false
    t.float   "location_y",    limit: 24,    default: 0.0, null: false
    t.float   "location_z",    limit: 24,    default: 0.0, null: false
    t.integer "waittime",                    default: 0,   null: false, comment: "waittime in millisecs",   unsigned: true
    t.text    "point_comment", limit: 65535
  end

  create_table "skill_fishing_base_level", primary_key: "entry", id: :integer, limit: 3, default: 0, comment: "Area identifier", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Fishing system" do |t|
    t.integer "skill", limit: 2, default: 0, null: false, comment: "Base skill level requirement"
  end

  create_table "skinning_loot_template", primary_key: ["entry", "item"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Loot System" do |t|
    t.integer "entry",               limit: 3,  default: 0,     null: false, unsigned: true
    t.integer "item",                limit: 3,  default: 0,     null: false, unsigned: true
    t.float   "ChanceOrQuestChance", limit: 24, default: 100.0, null: false
    t.integer "groupid",             limit: 1,  default: 0,     null: false, unsigned: true
    t.integer "mincountOrRef",       limit: 3,  default: 1,     null: false
    t.integer "maxcount",            limit: 1,  default: 1,     null: false, unsigned: true
    t.integer "condition_id",        limit: 3,  default: 0,     null: false, unsigned: true
  end

  create_table "spell_affect", primary_key: ["entry", "effectId"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "entry",           limit: 2, default: 0, null: false, unsigned: true
    t.integer "effectId",        limit: 1, default: 0, null: false, unsigned: true
    t.bigint  "SpellFamilyMask",           default: 0, null: false, unsigned: true
  end

  create_table "spell_area", primary_key: ["spell", "area", "quest_start", "quest_start_active", "aura_spell", "racemask", "gender"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "spell",              limit: 3, default: 0,     null: false, unsigned: true
    t.integer "area",               limit: 3, default: 0,     null: false, unsigned: true
    t.integer "quest_start",        limit: 3, default: 0,     null: false, unsigned: true
    t.boolean "quest_start_active",           default: false, null: false, unsigned: true
    t.integer "quest_end",          limit: 3, default: 0,     null: false, unsigned: true
    t.integer "condition_id",       limit: 3, default: 0,     null: false, unsigned: true
    t.integer "aura_spell",         limit: 3, default: 0,     null: false
    t.integer "racemask",           limit: 3, default: 0,     null: false, unsigned: true
    t.boolean "gender",                       default: true,  null: false, unsigned: true
    t.boolean "autocast",                     default: false, null: false, unsigned: true
  end

  create_table "spell_bonus_data", primary_key: "entry", id: :integer, limit: 2, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.float  "direct_bonus",                limit: 24, default: 0.0, null: false
    t.float  "one_hand_direct_bonus",       limit: 24, default: 0.0, null: false
    t.float  "two_hand_direct_bonus",       limit: 24, default: 0.0, null: false
    t.float  "direct_bonus_done",           limit: 24, default: 0.0, null: false
    t.float  "one_hand_direct_bonus_done",  limit: 24, default: 0.0, null: false
    t.float  "two_hand_direct_bonus_done",  limit: 24, default: 0.0, null: false
    t.float  "direct_bonus_taken",          limit: 24, default: 0.0, null: false
    t.float  "one_hand_direct_bonus_taken", limit: 24, default: 0.0, null: false
    t.float  "two_hand_direct_bonus_taken", limit: 24, default: 0.0, null: false
    t.float  "dot_bonus",                   limit: 24, default: 0.0, null: false
    t.float  "ap_bonus",                    limit: 24, default: 0.0, null: false
    t.float  "ap_dot_bonus",                limit: 24, default: 0.0, null: false
    t.string "comments"
  end

  create_table "spell_chain", primary_key: "spell_id", id: :integer, limit: 3, default: 0, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Spell Additinal Data" do |t|
    t.integer "prev_spell",  limit: 3, default: 0, null: false
    t.integer "first_spell", limit: 3, default: 0, null: false
    t.integer "rank",        limit: 1, default: 0, null: false
    t.integer "req_spell",   limit: 3, default: 0, null: false
  end

  create_table "spell_elixir", primary_key: "entry", id: :integer, default: 0, comment: "SpellId of potion", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Spell System" do |t|
    t.boolean "mask", default: false, null: false, comment: "Mask 0x1 battle 0x2 guardian 0x3 flask 0x7 unstable flasks 0xB shattrath flasks", unsigned: true
  end

  create_table "spell_facing", primary_key: "entry", id: :integer, default: 0, comment: "Spell ID", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.boolean "facingcasterflag", default: true, null: false, comment: "flag for facing state, usually 1"
  end

  create_table "spell_learn_spell", primary_key: ["entry", "SpellID"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Item System" do |t|
    t.integer "entry",   limit: 2, default: 0, null: false, unsigned: true
    t.integer "SpellID", limit: 2, default: 0, null: false, unsigned: true
    t.integer "Active",  limit: 1, default: 1, null: false, unsigned: true
  end

  create_table "spell_linked", primary_key: ["entry", "linked_entry", "type"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0", comment: "Linked spells storage" do |t|
    t.integer "entry",                     null: false, comment: "Spell entry",         unsigned: true
    t.integer "linked_entry",              null: false, comment: "Linked spell entry",  unsigned: true
    t.integer "type",         default: 0,  null: false, comment: "Type of link",        unsigned: true
    t.integer "effect_mask",  default: 0,  null: false, comment: "mask of effect (NY)", unsigned: true
    t.string  "comment",      default: "", null: false
  end

  create_table "spell_pet_auras", primary_key: ["spell", "pet"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "spell", limit: 3,             null: false, comment: "dummy spell id",  unsigned: true
    t.integer "pet",   limit: 3, default: 0, null: false, comment: "pet id; 0 = all", unsigned: true
    t.integer "aura",  limit: 3,             null: false, comment: "pet aura id",     unsigned: true
  end

  create_table "spell_proc_event", primary_key: "entry", id: :integer, limit: 3, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "SchoolMask",       limit: 1,  default: 0,   null: false, unsigned: true
    t.integer "SpellFamilyName",  limit: 2,  default: 0,   null: false, unsigned: true
    t.bigint  "SpellFamilyMask0",            default: 0,   null: false, unsigned: true
    t.bigint  "SpellFamilyMask1",            default: 0,   null: false, unsigned: true
    t.bigint  "SpellFamilyMask2",            default: 0,   null: false, unsigned: true
    t.integer "procFlags",                   default: 0,   null: false, unsigned: true
    t.integer "procEx",                      default: 0,   null: false, unsigned: true
    t.float   "ppmRate",          limit: 24, default: 0.0, null: false
    t.float   "CustomChance",     limit: 24, default: 0.0, null: false
    t.integer "Cooldown",                    default: 0,   null: false, unsigned: true
  end

  create_table "spell_proc_item_enchant", primary_key: "entry", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.float "ppmRate", limit: 24, default: 0.0, null: false
  end

  create_table "spell_script_target", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", comment: "Spell System" do |t|
    t.integer "entry",             limit: 3,             null: false, unsigned: true
    t.integer "type",              limit: 1, default: 0, null: false, unsigned: true
    t.integer "targetEntry",       limit: 3, default: 0, null: false, unsigned: true
    t.integer "inverseEffectMask", limit: 3, default: 0, null: false, unsigned: true
    t.index ["entry", "type", "targetEntry"], name: "entry_type_target", unique: true, using: :btree
  end

  create_table "spell_target_position", id: :integer, limit: 3, default: 0, comment: "Identifier", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Spell System" do |t|
    t.integer "target_map",         limit: 2,  default: 0,   null: false, unsigned: true
    t.float   "target_position_x",  limit: 24, default: 0.0, null: false
    t.float   "target_position_y",  limit: 24, default: 0.0, null: false
    t.float   "target_position_z",  limit: 24, default: 0.0, null: false
    t.float   "target_orientation", limit: 24, default: 0.0, null: false
  end

  create_table "spell_threat", primary_key: "entry", id: :integer, limit: 3, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED" do |t|
    t.integer "Threat",     limit: 2,                null: false
    t.float   "multiplier", limit: 24, default: 1.0, null: false, comment: "threat multiplier for damage/healing"
    t.float   "ap_bonus",   limit: 24, default: 0.0, null: false, comment: "additional threat bonus from attack power"
  end

  create_table "transports", primary_key: "entry", id: :integer, limit: 3, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Transports" do |t|
    t.text    "name",   limit: 65535
    t.integer "period", limit: 3,     default: 0, null: false, unsigned: true
  end

  create_table "warden", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "groupid", limit: 2,               null: false, comment: "The Grouping ID of the warden_checks", unsigned: true
    t.integer "build",   limit: 2,               null: false, comment: "Client build",                         unsigned: true
    t.integer "type",    limit: 1,                            comment: "Check Type",                           unsigned: true
    t.string  "data",    limit: 48, default: "", null: false
    t.string  "str",     limit: 20, default: "", null: false
    t.integer "address",            default: 0,  null: false,                                                  unsigned: true
    t.integer "length",  limit: 1,  default: 0,  null: false,                                                  unsigned: true
    t.string  "result",  limit: 24, default: "", null: false
    t.string  "comment", limit: 50, default: "",              comment: "Description of what the check is"
  end

end
