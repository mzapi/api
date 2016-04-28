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

  create_table "ahbot_category", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "category",          limit: 45
    t.decimal "multiplier",                   precision: 20, scale: 2, null: false
    t.bigint  "max_auction_count",                                     null: false
    t.bigint  "expire_time",                                           null: false
    t.index ["category", "multiplier", "expire_time"], name: "helper", using: :btree
  end

  create_table "ahbot_history", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "buytime",                  null: false
    t.bigint "item",                     null: false
    t.bigint "bid",                      null: false
    t.bigint "buyout",                   null: false
    t.bigint "won",                      null: false
    t.string "category",      limit: 45
    t.bigint "auction_house",            null: false
    t.index ["auction_house"], name: "auction_house", using: :btree
    t.index ["category"], name: "category", using: :btree
    t.index ["won"], name: "won", using: :btree
  end

  create_table "ahbot_price", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "item",          limit: 45
    t.decimal "price",                    precision: 20, scale: 2, null: false
    t.bigint  "auction_house",                                     null: false
    t.index ["item"], name: "ahbot_price_item", using: :btree
  end

  create_table "ai_playerbot_names", primary_key: "name_id", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "PlayerbotAI AutoBot names" do |t|
    t.string  "name",     limit: 13, null: false
    t.integer "gender",   limit: 1,  null: false, unsigned: true
    t.integer "race",     limit: 2,  null: false, unsigned: true
    t.integer "class",    limit: 2,  null: false, unsigned: true
    t.integer "purpose",             null: false, unsigned: true
    t.binary  "priority", limit: 1,  null: false
    t.binary  "in_use",   limit: 1,  null: false
    t.index ["name"], name: "name", unique: true, using: :btree
    t.index ["name_id"], name: "name_id", unique: true, using: :btree
  end

  create_table "ai_playerbot_random_bots", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "owner",              null: false
    t.bigint "bot",                null: false
    t.bigint "time",               null: false
    t.bigint "validIn"
    t.string "event",   limit: 45
    t.bigint "value"
    t.string "data"
    t.index ["bot"], name: "bot", using: :btree
    t.index ["event"], name: "event", using: :btree
    t.index ["owner"], name: "owner", using: :btree
  end

  create_table "auction", id: :integer, default: 0, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "houseid",               default: 0, null: false,                             unsigned: true
    t.integer "itemguid",              default: 0, null: false,                             unsigned: true
    t.integer "item_template",         default: 0, null: false, comment: "Item Identifier", unsigned: true
    t.integer "item_count",            default: 0, null: false,                             unsigned: true
    t.integer "item_randompropertyid", default: 0, null: false
    t.integer "itemowner",             default: 0, null: false,                             unsigned: true
    t.integer "buyoutprice",           default: 0, null: false
    t.bigint  "time",                  default: 0, null: false,                             unsigned: true
    t.integer "buyguid",               default: 0, null: false,                             unsigned: true
    t.integer "lastbid",               default: 0, null: false
    t.integer "startbid",              default: 0, null: false
    t.integer "deposit",               default: 0, null: false
  end

  create_table "bugreport", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Debug System" do |t|
    t.text "type",    limit: 4294967295, null: false
    t.text "content", limit: 4294967295, null: false
  end

  create_table "character_action", primary_key: ["guid", "button"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Player System" do |t|
    t.integer "guid",             default: 0, null: false, comment: "Global Unique Identifier", unsigned: true
    t.integer "button", limit: 1, default: 0, null: false,                                      unsigned: true
    t.integer "action",           default: 0, null: false,                                      unsigned: true
    t.integer "type",   limit: 1, default: 0, null: false,                                      unsigned: true
  end

  create_table "character_aura", primary_key: ["guid", "caster_guid", "item_guid", "spell"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Player System" do |t|
    t.integer "guid",          default: 0, null: false, comment: "Global Unique Identifier",      unsigned: true
    t.bigint  "caster_guid",   default: 0, null: false, comment: "Full Global Unique Identifier", unsigned: true
    t.integer "item_guid",     default: 0, null: false,                                           unsigned: true
    t.integer "spell",         default: 0, null: false,                                           unsigned: true
    t.integer "stackcount",    default: 1, null: false,                                           unsigned: true
    t.integer "remaincharges", default: 0, null: false,                                           unsigned: true
    t.integer "basepoints0",   default: 0, null: false
    t.integer "basepoints1",   default: 0, null: false
    t.integer "basepoints2",   default: 0, null: false
    t.integer "periodictime0", default: 0, null: false,                                           unsigned: true
    t.integer "periodictime1", default: 0, null: false,                                           unsigned: true
    t.integer "periodictime2", default: 0, null: false,                                           unsigned: true
    t.integer "maxduration",   default: 0, null: false
    t.integer "remaintime",    default: 0, null: false
    t.integer "effIndexMask",  default: 0, null: false,                                           unsigned: true
  end

  create_table "character_battleground_data", primary_key: "guid", id: :integer, default: 0, comment: "Global Unique Identifier", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Player System" do |t|
    t.integer "instance_id",            default: 0,   null: false, unsigned: true
    t.integer "team",                   default: 0,   null: false, unsigned: true
    t.float   "join_x",      limit: 24, default: 0.0, null: false
    t.float   "join_y",      limit: 24, default: 0.0, null: false
    t.float   "join_z",      limit: 24, default: 0.0, null: false
    t.float   "join_o",      limit: 24, default: 0.0, null: false
    t.integer "join_map",               default: 0,   null: false
  end

  create_table "character_gifts", primary_key: "item_guid", id: :integer, default: 0, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "guid",  default: 0, null: false, unsigned: true
    t.integer "entry", default: 0, null: false, unsigned: true
    t.integer "flags", default: 0, null: false, unsigned: true
    t.index ["guid"], name: "idx_guid", using: :btree
  end

  create_table "character_homebind", primary_key: "guid", id: :integer, default: 0, comment: "Global Unique Identifier", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Player System" do |t|
    t.integer "map",                   default: 0,   null: false, comment: "Map Identifier",  unsigned: true
    t.integer "zone",                  default: 0,   null: false, comment: "Zone Identifier", unsigned: true
    t.float   "position_x", limit: 24, default: 0.0, null: false
    t.float   "position_y", limit: 24, default: 0.0, null: false
    t.float   "position_z", limit: 24, default: 0.0, null: false
  end

  create_table "character_honor_cp", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Player System" do |t|
    t.integer "guid",                   default: 0,     null: false, comment: "Global Unique Identifier",             unsigned: true
    t.integer "victim_type", limit: 1,  default: 4,     null: false,                                                  unsigned: true
    t.integer "victim",                 default: 0,     null: false, comment: "Creature / Player Identifier",         unsigned: true
    t.float   "honor",       limit: 24, default: 0.0,   null: false
    t.integer "date",                   default: 0,     null: false,                                                  unsigned: true
    t.integer "type",        limit: 1,  default: 0,     null: false,                                                  unsigned: true
    t.boolean "used",                   default: false, null: false, comment: "=1 if already counted in rank points"
    t.index ["guid"], name: "idx_guid", using: :btree
  end

  create_table "character_instance", primary_key: ["guid", "instance"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "guid",      default: 0,     null: false, unsigned: true
    t.integer "instance",  default: 0,     null: false, unsigned: true
    t.boolean "permanent", default: false, null: false, unsigned: true
    t.index ["instance"], name: "instance", using: :btree
  end

  create_table "character_inventory", primary_key: "item", id: :integer, default: 0, comment: "Item Global Unique Identifier", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Player System" do |t|
    t.integer "guid",                    default: 0, null: false, comment: "Global Unique Identifier", unsigned: true
    t.integer "bag",                     default: 0, null: false,                                      unsigned: true
    t.integer "slot",          limit: 1, default: 0, null: false,                                      unsigned: true
    t.integer "item_template",           default: 0, null: false, comment: "Item Identifier",          unsigned: true
    t.index ["guid"], name: "idx_guid", using: :btree
  end

  create_table "character_pet", id: :integer, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Pet System" do |t|
    t.integer "entry",                                default: 0,     null: false, unsigned: true
    t.integer "owner",                                default: 0,     null: false, unsigned: true
    t.integer "modelid",                              default: 0,                  unsigned: true
    t.integer "CreatedBySpell",                       default: 0,     null: false, unsigned: true
    t.integer "PetType",           limit: 1,          default: 0,     null: false, unsigned: true
    t.integer "level",                                default: 1,     null: false, unsigned: true
    t.integer "exp",                                  default: 0,     null: false, unsigned: true
    t.boolean "Reactstate",                           default: false, null: false, unsigned: true
    t.integer "loyaltypoints",                        default: 0,     null: false
    t.integer "loyalty",                              default: 0,     null: false, unsigned: true
    t.integer "trainpoint",                           default: 0,     null: false
    t.string  "name",              limit: 100,        default: "Pet"
    t.boolean "renamed",                              default: false, null: false, unsigned: true
    t.integer "slot",                                 default: 0,     null: false, unsigned: true
    t.integer "curhealth",                            default: 1,     null: false, unsigned: true
    t.integer "curmana",                              default: 0,     null: false, unsigned: true
    t.integer "curhappiness",                         default: 0,     null: false, unsigned: true
    t.bigint  "savetime",                             default: 0,     null: false, unsigned: true
    t.integer "resettalents_cost",                    default: 0,     null: false, unsigned: true
    t.bigint  "resettalents_time",                    default: 0,     null: false, unsigned: true
    t.text    "abdata",            limit: 4294967295
    t.text    "teachspelldata",    limit: 4294967295
    t.index ["owner"], name: "owner", using: :btree
  end

  create_table "character_queststatus", primary_key: ["guid", "quest"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Player System" do |t|
    t.integer "guid",       default: 0,     null: false, comment: "Global Unique Identifier", unsigned: true
    t.integer "quest",      default: 0,     null: false, comment: "Quest Identifier",         unsigned: true
    t.integer "status",     default: 0,     null: false,                                      unsigned: true
    t.boolean "rewarded",   default: false, null: false,                                      unsigned: true
    t.boolean "explored",   default: false, null: false,                                      unsigned: true
    t.bigint  "timer",      default: 0,     null: false,                                      unsigned: true
    t.integer "mobcount1",  default: 0,     null: false,                                      unsigned: true
    t.integer "mobcount2",  default: 0,     null: false,                                      unsigned: true
    t.integer "mobcount3",  default: 0,     null: false,                                      unsigned: true
    t.integer "mobcount4",  default: 0,     null: false,                                      unsigned: true
    t.integer "itemcount1", default: 0,     null: false,                                      unsigned: true
    t.integer "itemcount2", default: 0,     null: false,                                      unsigned: true
    t.integer "itemcount3", default: 0,     null: false,                                      unsigned: true
    t.integer "itemcount4", default: 0,     null: false,                                      unsigned: true
  end

  create_table "character_reputation", primary_key: ["guid", "faction"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Player System" do |t|
    t.integer "guid",     default: 0, null: false, comment: "Global Unique Identifier", unsigned: true
    t.integer "faction",  default: 0, null: false,                                      unsigned: true
    t.integer "standing", default: 0, null: false
    t.integer "flags",    default: 0, null: false
  end

  create_table "character_skills", primary_key: ["guid", "skill"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Player System" do |t|
    t.integer "guid",            null: false, comment: "Global Unique Identifier", unsigned: true
    t.integer "skill", limit: 3, null: false,                                      unsigned: true
    t.integer "value", limit: 3, null: false,                                      unsigned: true
    t.integer "max",   limit: 3, null: false,                                      unsigned: true
  end

  create_table "character_social", primary_key: ["guid", "friend", "flags"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Player System" do |t|
    t.integer "guid",   default: 0,     null: false, comment: "Character Global Unique Identifier", unsigned: true
    t.integer "friend", default: 0,     null: false, comment: "Friend Global Unique Identifier",    unsigned: true
    t.boolean "flags",  default: false, null: false, comment: "Friend Flags",                       unsigned: true
    t.index ["friend", "flags"], name: "friend_flags", using: :btree
    t.index ["friend"], name: "friend", using: :btree
    t.index ["guid", "flags"], name: "guid_flags", using: :btree
    t.index ["guid"], name: "guid", using: :btree
  end

  create_table "character_spell", primary_key: ["guid", "spell"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Player System" do |t|
    t.integer "guid",               default: 0, null: false, comment: "Global Unique Identifier", unsigned: true
    t.integer "spell",              default: 0, null: false, comment: "Spell Identifier",         unsigned: true
    t.integer "active",   limit: 1, default: 1, null: false,                                      unsigned: true
    t.integer "disabled", limit: 1, default: 0, null: false,                                      unsigned: true
    t.index ["spell"], name: "Idx_spell", using: :btree
  end

  create_table "character_spell_cooldown", primary_key: ["guid", "spell"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "guid",  default: 0, null: false, comment: "Global Unique Identifier, Low part", unsigned: true
    t.integer "spell", default: 0, null: false, comment: "Spell Identifier",                   unsigned: true
    t.integer "item",  default: 0, null: false, comment: "Item Identifier",                    unsigned: true
    t.bigint  "time",  default: 0, null: false,                                                unsigned: true
  end

  create_table "character_stats", primary_key: "guid", id: :integer, default: 0, comment: "Global Unique Identifier, Low part", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "maxhealth",                    default: 0,   null: false, unsigned: true
    t.integer "maxpower1",                    default: 0,   null: false, unsigned: true
    t.integer "maxpower2",                    default: 0,   null: false, unsigned: true
    t.integer "maxpower3",                    default: 0,   null: false, unsigned: true
    t.integer "maxpower4",                    default: 0,   null: false, unsigned: true
    t.integer "maxpower5",                    default: 0,   null: false, unsigned: true
    t.integer "maxpower6",                    default: 0,   null: false, unsigned: true
    t.integer "maxpower7",                    default: 0,   null: false, unsigned: true
    t.integer "strength",                     default: 0,   null: false, unsigned: true
    t.integer "agility",                      default: 0,   null: false, unsigned: true
    t.integer "stamina",                      default: 0,   null: false, unsigned: true
    t.integer "intellect",                    default: 0,   null: false, unsigned: true
    t.integer "spirit",                       default: 0,   null: false, unsigned: true
    t.integer "armor",                        default: 0,   null: false, unsigned: true
    t.integer "resHoly",                      default: 0,   null: false, unsigned: true
    t.integer "resFire",                      default: 0,   null: false, unsigned: true
    t.integer "resNature",                    default: 0,   null: false, unsigned: true
    t.integer "resFrost",                     default: 0,   null: false, unsigned: true
    t.integer "resShadow",                    default: 0,   null: false, unsigned: true
    t.integer "resArcane",                    default: 0,   null: false, unsigned: true
    t.float   "blockPct",          limit: 24, default: 0.0, null: false, unsigned: true
    t.float   "dodgePct",          limit: 24, default: 0.0, null: false, unsigned: true
    t.float   "parryPct",          limit: 24, default: 0.0, null: false, unsigned: true
    t.float   "critPct",           limit: 24, default: 0.0, null: false, unsigned: true
    t.float   "rangedCritPct",     limit: 24, default: 0.0, null: false, unsigned: true
    t.integer "attackPower",                  default: 0,   null: false, unsigned: true
    t.integer "rangedAttackPower",            default: 0,   null: false, unsigned: true
  end

  create_table "character_ticket", primary_key: "ticket_id", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Player System" do |t|
    t.integer  "guid",                            default: 0,                          null: false, unsigned: true
    t.text     "ticket_text",       limit: 65535
    t.text     "response_text",     limit: 65535
    t.datetime "ticket_lastchange",               default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.boolean  "resolved",                        default: false
  end

  create_table "character_tutorial", primary_key: "account", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Player System" do |t|
    t.integer "tut0", default: 0, null: false, unsigned: true
    t.integer "tut1", default: 0, null: false, unsigned: true
    t.integer "tut2", default: 0, null: false, unsigned: true
    t.integer "tut3", default: 0, null: false, unsigned: true
    t.integer "tut4", default: 0, null: false, unsigned: true
    t.integer "tut5", default: 0, null: false, unsigned: true
    t.integer "tut6", default: 0, null: false, unsigned: true
    t.integer "tut7", default: 0, null: false, unsigned: true
  end

  create_table "character_whispers", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "to_guid",                                                              null: false, comment: "guid of receiver of the whisper"
    t.integer  "from_guid",                                                            null: false, comment: "guid of sender of the whisper"
    t.string   "message",             limit: 256,                                      null: false, comment: "actual whisper that was sent"
    t.integer  "regarding_ticket_id",             default: 0,                          null: false, comment: "link to character_ticket.ticket_id, if 0 just a log of a whisper sent", unsigned: true
    t.datetime "sent_on",                         default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "this is when the whisper was sent"
  end

  create_table "characters", primary_key: "guid", id: :integer, default: 0, comment: "Global Unique Identifier", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Player System" do |t|
    t.integer "account",                                      default: 0,     null: false, comment: "Account Identifier", unsigned: true
    t.string  "name",                      limit: 12,         default: "",    null: false
    t.integer "race",                      limit: 1,          default: 0,     null: false,                                unsigned: true
    t.integer "class",                     limit: 1,          default: 0,     null: false,                                unsigned: true
    t.integer "gender",                    limit: 1,          default: 0,     null: false,                                unsigned: true
    t.integer "level",                     limit: 1,          default: 0,     null: false,                                unsigned: true
    t.integer "xp",                                           default: 0,     null: false,                                unsigned: true
    t.integer "money",                                        default: 0,     null: false,                                unsigned: true
    t.integer "playerBytes",                                  default: 0,     null: false,                                unsigned: true
    t.integer "playerBytes2",                                 default: 0,     null: false,                                unsigned: true
    t.integer "playerFlags",                                  default: 0,     null: false,                                unsigned: true
    t.float   "position_x",                limit: 24,         default: 0.0,   null: false
    t.float   "position_y",                limit: 24,         default: 0.0,   null: false
    t.float   "position_z",                limit: 24,         default: 0.0,   null: false
    t.integer "map",                                          default: 0,     null: false, comment: "Map Identifier",     unsigned: true
    t.float   "orientation",               limit: 24,         default: 0.0,   null: false
    t.text    "taximask",                  limit: 4294967295
    t.integer "online",                    limit: 1,          default: 0,     null: false,                                unsigned: true
    t.integer "cinematic",                 limit: 1,          default: 0,     null: false,                                unsigned: true
    t.integer "totaltime",                                    default: 0,     null: false,                                unsigned: true
    t.integer "leveltime",                                    default: 0,     null: false,                                unsigned: true
    t.bigint  "logout_time",                                  default: 0,     null: false,                                unsigned: true
    t.integer "is_logout_resting",         limit: 1,          default: 0,     null: false,                                unsigned: true
    t.float   "rest_bonus",                limit: 24,         default: 0.0,   null: false
    t.integer "resettalents_cost",                            default: 0,     null: false,                                unsigned: true
    t.bigint  "resettalents_time",                            default: 0,     null: false,                                unsigned: true
    t.float   "trans_x",                   limit: 24,         default: 0.0,   null: false
    t.float   "trans_y",                   limit: 24,         default: 0.0,   null: false
    t.float   "trans_z",                   limit: 24,         default: 0.0,   null: false
    t.float   "trans_o",                   limit: 24,         default: 0.0,   null: false
    t.bigint  "transguid",                                    default: 0,     null: false,                                unsigned: true
    t.integer "extra_flags",                                  default: 0,     null: false,                                unsigned: true
    t.boolean "stable_slots",                                 default: false, null: false,                                unsigned: true
    t.integer "at_login",                                     default: 0,     null: false,                                unsigned: true
    t.integer "zone",                                         default: 0,     null: false,                                unsigned: true
    t.bigint  "death_expire_time",                            default: 0,     null: false,                                unsigned: true
    t.text    "taxi_path",                 limit: 65535
    t.integer "honor_highest_rank",                           default: 0,     null: false,                                unsigned: true
    t.integer "honor_standing",                               default: 0,     null: false,                                unsigned: true
    t.float   "stored_honor_rating",       limit: 24,         default: 0.0,   null: false
    t.integer "stored_dishonorable_kills",                    default: 0,     null: false
    t.integer "stored_honorable_kills",                       default: 0,     null: false
    t.integer "watchedFaction",                               default: 0,     null: false,                                unsigned: true
    t.integer "drunk",                     limit: 2,          default: 0,     null: false,                                unsigned: true
    t.integer "health",                                       default: 0,     null: false,                                unsigned: true
    t.integer "power1",                                       default: 0,     null: false,                                unsigned: true
    t.integer "power2",                                       default: 0,     null: false,                                unsigned: true
    t.integer "power3",                                       default: 0,     null: false,                                unsigned: true
    t.integer "power4",                                       default: 0,     null: false,                                unsigned: true
    t.integer "power5",                                       default: 0,     null: false,                                unsigned: true
    t.text    "exploredZones",             limit: 4294967295
    t.text    "equipmentCache",            limit: 4294967295
    t.integer "ammoId",                                       default: 0,     null: false,                                unsigned: true
    t.integer "actionBars",                limit: 1,          default: 0,     null: false,                                unsigned: true
    t.integer "deleteInfos_Account",                                                                                      unsigned: true
    t.string  "deleteInfos_Name",          limit: 12
    t.bigint  "deleteDate",                                                                                               unsigned: true
    t.index ["account"], name: "idx_account", using: :btree
    t.index ["name"], name: "idx_name", using: :btree
    t.index ["online"], name: "idx_online", using: :btree
  end

  create_table "corpse", primary_key: "guid", id: :integer, default: 0, comment: "Global Unique Identifier", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Death System" do |t|
    t.integer "player",                 default: 0,   null: false, comment: "Character Global Unique Identifier", unsigned: true
    t.float   "position_x",  limit: 24, default: 0.0, null: false
    t.float   "position_y",  limit: 24, default: 0.0, null: false
    t.float   "position_z",  limit: 24, default: 0.0, null: false
    t.float   "orientation", limit: 24, default: 0.0, null: false
    t.integer "map",                    default: 0,   null: false, comment: "Map Identifier",                     unsigned: true
    t.bigint  "time",                   default: 0,   null: false,                                                unsigned: true
    t.integer "corpse_type", limit: 1,  default: 0,   null: false,                                                unsigned: true
    t.integer "instance",               default: 0,   null: false,                                                unsigned: true
    t.index ["corpse_type"], name: "idx_type", using: :btree
    t.index ["instance"], name: "instance", using: :btree
    t.index ["player"], name: "Idx_player", using: :btree
    t.index ["time"], name: "Idx_time", using: :btree
  end

  create_table "creature_respawn", primary_key: ["guid", "instance"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Grid Loading System" do |t|
    t.integer "guid",                  default: 0, null: false, comment: "Global Unique Identifier", unsigned: true
    t.bigint  "respawntime",           default: 0, null: false,                                      unsigned: true
    t.integer "instance",    limit: 3, default: 0, null: false,                                      unsigned: true
    t.index ["instance"], name: "instance", using: :btree
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
    t.integer "fieldId",                    null: false, comment: "dbdocsfields.fieldId to link to."
    t.integer "languageId",                 null: false, comment: "dbdocsLanguageId to link to. (Normally 0 = English)"
    t.text    "fieldNotes",   limit: 65535, null: false, comment: "Additional Field Notes"
    t.string  "fieldComment", limit: 80,                 comment: "Main field Note"
    t.index ["fieldId"], name: "fieldId", using: :btree
  end

  create_table "dbdocslanguage", primary_key: "LanguageId", id: :integer, comment: "LanguageId for this Language", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "LanguageName", limit: 30, null: false, comment: "The Language Name"
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
    t.integer "languageId",                     default: 0, null: false, comment: "dbdocsLanguageId to link to."
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
    t.integer "languageId",               default: 0, null: false, comment: "The dbdocsLanguageId to link to"
    t.text    "tableNotes", limit: 65535,             null: false, comment: "The additional note to be added to the table"
  end

  create_table "game_event_status", primary_key: "event", id: :integer, limit: 2, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Game event system" do |t|
  end

  create_table "gameobject_respawn", primary_key: ["guid", "instance"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Grid Loading System" do |t|
    t.integer "guid",                  default: 0, null: false, comment: "Global Unique Identifier", unsigned: true
    t.bigint  "respawntime",           default: 0, null: false,                                      unsigned: true
    t.integer "instance",    limit: 3, default: 0, null: false,                                      unsigned: true
    t.index ["instance"], name: "instance", using: :btree
  end

  create_table "group_instance", primary_key: ["leaderGuid", "instance"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "leaderGuid", default: 0,     null: false, unsigned: true
    t.integer "instance",   default: 0,     null: false, unsigned: true
    t.boolean "permanent",  default: false, null: false, unsigned: true
    t.index ["instance"], name: "instance", using: :btree
  end

  create_table "group_member", primary_key: ["groupId", "memberGuid"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Groups" do |t|
    t.integer "groupId",              null: false, unsigned: true
    t.integer "memberGuid",           null: false, unsigned: true
    t.boolean "assistant",            null: false, unsigned: true
    t.integer "subgroup",   limit: 2, null: false, unsigned: true
    t.index ["memberGuid"], name: "Idx_memberGuid", using: :btree
  end

  create_table "groups", primary_key: "groupId", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Groups" do |t|
    t.integer "leaderGuid",              null: false, unsigned: true
    t.integer "mainTank",                null: false, unsigned: true
    t.integer "mainAssistant",           null: false, unsigned: true
    t.integer "lootMethod",    limit: 1, null: false, unsigned: true
    t.integer "looterGuid",              null: false, unsigned: true
    t.integer "lootThreshold", limit: 1, null: false, unsigned: true
    t.integer "icon1",                   null: false, unsigned: true
    t.integer "icon2",                   null: false, unsigned: true
    t.integer "icon3",                   null: false, unsigned: true
    t.integer "icon4",                   null: false, unsigned: true
    t.integer "icon5",                   null: false, unsigned: true
    t.integer "icon6",                   null: false, unsigned: true
    t.integer "icon7",                   null: false, unsigned: true
    t.integer "icon8",                   null: false, unsigned: true
    t.boolean "isRaid",                  null: false, unsigned: true
    t.index ["leaderGuid"], name: "leaderGuid", unique: true, using: :btree
  end

  create_table "guild", primary_key: "guildid", id: :integer, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Guild System" do |t|
    t.string  "name",                        default: "", null: false
    t.integer "leaderguid",                  default: 0,  null: false, unsigned: true
    t.integer "EmblemStyle",                 default: 0,  null: false
    t.integer "EmblemColor",                 default: 0,  null: false
    t.integer "BorderStyle",                 default: 0,  null: false
    t.integer "BorderColor",                 default: 0,  null: false
    t.integer "BackgroundColor",             default: 0,  null: false
    t.string  "info",            limit: 500, default: "", null: false
    t.string  "motd",            limit: 128, default: "", null: false
    t.bigint  "createdate",                  default: 0,  null: false, unsigned: true
  end

  create_table "guild_eventlog", primary_key: ["guildid", "LogGuid"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "Guild Eventlog" do |t|
    t.integer "guildid",               null: false, comment: "Guild Identificator",                         unsigned: true
    t.integer "LogGuid",               null: false, comment: "Log record identificator - auxiliary column", unsigned: true
    t.boolean "EventType",             null: false, comment: "Event type",                                  unsigned: true
    t.integer "PlayerGuid1",           null: false, comment: "Player 1",                                    unsigned: true
    t.integer "PlayerGuid2",           null: false, comment: "Player 2",                                    unsigned: true
    t.integer "NewRank",     limit: 1, null: false, comment: "New rank(in case promotion/demotion)",        unsigned: true
    t.bigint  "TimeStamp",             null: false, comment: "Event UNIX time",                             unsigned: true
    t.index ["LogGuid"], name: "Idx_LogGuid", using: :btree
    t.index ["PlayerGuid1"], name: "Idx_PlayerGuid1", using: :btree
    t.index ["PlayerGuid2"], name: "Idx_PlayerGuid2", using: :btree
  end

  create_table "guild_member", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Guild System" do |t|
    t.integer "guildid",            default: 0,  null: false, unsigned: true
    t.integer "guid",               default: 0,  null: false, unsigned: true
    t.integer "rank",    limit: 1,  default: 0,  null: false, unsigned: true
    t.string  "pnote",   limit: 31, default: "", null: false
    t.string  "offnote", limit: 31, default: "", null: false
    t.index ["guid"], name: "guid_key", unique: true, using: :btree
    t.index ["guildid", "rank"], name: "guildid_rank_key", using: :btree
    t.index ["guildid"], name: "guildid_key", using: :btree
  end

  create_table "guild_rank", primary_key: ["guildid", "rid"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Guild System" do |t|
    t.integer "guildid", default: 0,  null: false, unsigned: true
    t.integer "rid",                  null: false, unsigned: true
    t.string  "rname",   default: "", null: false
    t.integer "rights",  default: 0,  null: false, unsigned: true
    t.index ["rid"], name: "Idx_rid", using: :btree
  end

  create_table "instance", id: :integer, default: 0, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "map",                          default: 0, null: false, unsigned: true
    t.bigint  "resettime",                    default: 0, null: false, unsigned: true
    t.text    "data",      limit: 4294967295
    t.index ["map"], name: "map", using: :btree
    t.index ["resettime"], name: "resettime", using: :btree
  end

  create_table "instance_reset", primary_key: "mapid", id: :integer, default: 0, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "resettime", default: 0, null: false, unsigned: true
  end

  create_table "item_instance", primary_key: "guid", id: :integer, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Item System" do |t|
    t.integer "owner_guid",                    default: 0, null: false, unsigned: true
    t.text    "data",       limit: 4294967295
    t.index ["owner_guid"], name: "idx_owner_guid", using: :btree
  end

  create_table "item_loot", primary_key: ["guid", "itemid"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Item System" do |t|
    t.integer "guid",       default: 0, null: false, unsigned: true
    t.integer "owner_guid", default: 0, null: false, unsigned: true
    t.integer "itemid",     default: 0, null: false, unsigned: true
    t.integer "amount",     default: 0, null: false, unsigned: true
    t.integer "property",   default: 0, null: false
    t.index ["owner_guid"], name: "idx_owner_guid", using: :btree
  end

  create_table "item_text", id: :integer, default: 0, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Item System" do |t|
    t.text "text", limit: 4294967295
  end

  create_table "mail", id: :integer, default: 0, comment: "Identifier", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Mail System" do |t|
    t.integer "messageType",    limit: 1,          default: 0,  null: false,                                                unsigned: true
    t.integer "stationery",     limit: 1,          default: 41, null: false
    t.integer "mailTemplateId", limit: 3,          default: 0,  null: false,                                                unsigned: true
    t.integer "sender",                            default: 0,  null: false, comment: "Character Global Unique Identifier", unsigned: true
    t.integer "receiver",                          default: 0,  null: false, comment: "Character Global Unique Identifier", unsigned: true
    t.text    "subject",        limit: 4294967295
    t.integer "itemTextId",                        default: 0,  null: false,                                                unsigned: true
    t.integer "has_items",      limit: 1,          default: 0,  null: false,                                                unsigned: true
    t.bigint  "expire_time",                       default: 0,  null: false,                                                unsigned: true
    t.bigint  "deliver_time",                      default: 0,  null: false,                                                unsigned: true
    t.integer "money",                             default: 0,  null: false,                                                unsigned: true
    t.integer "cod",                               default: 0,  null: false,                                                unsigned: true
    t.integer "checked",        limit: 1,          default: 0,  null: false,                                                unsigned: true
    t.index ["receiver"], name: "idx_receiver", using: :btree
  end

  create_table "mail_items", primary_key: ["mail_id", "item_guid"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC" do |t|
    t.integer "mail_id",       default: 0, null: false
    t.integer "item_guid",     default: 0, null: false
    t.integer "item_template", default: 0, null: false
    t.integer "receiver",      default: 0, null: false, comment: "Character Global Unique Identifier", unsigned: true
    t.index ["receiver"], name: "idx_receiver", using: :btree
  end

  create_table "pet_aura", primary_key: ["guid", "caster_guid", "item_guid", "spell"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Pet System" do |t|
    t.integer "guid",          default: 0, null: false, comment: "Global Unique Identifier",      unsigned: true
    t.bigint  "caster_guid",   default: 0, null: false, comment: "Full Global Unique Identifier", unsigned: true
    t.integer "item_guid",     default: 0, null: false,                                           unsigned: true
    t.integer "spell",         default: 0, null: false,                                           unsigned: true
    t.integer "stackcount",    default: 1, null: false,                                           unsigned: true
    t.integer "remaincharges", default: 0, null: false,                                           unsigned: true
    t.integer "basepoints0",   default: 0, null: false
    t.integer "basepoints1",   default: 0, null: false
    t.integer "basepoints2",   default: 0, null: false
    t.integer "periodictime0", default: 0, null: false,                                           unsigned: true
    t.integer "periodictime1", default: 0, null: false,                                           unsigned: true
    t.integer "periodictime2", default: 0, null: false,                                           unsigned: true
    t.integer "maxduration",   default: 0, null: false
    t.integer "remaintime",    default: 0, null: false
    t.integer "effIndexMask",  default: 0, null: false,                                           unsigned: true
  end

  create_table "pet_spell", primary_key: ["guid", "spell"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Pet System" do |t|
    t.integer "guid",   default: 0, null: false, comment: "Global Unique Identifier", unsigned: true
    t.integer "spell",  default: 0, null: false, comment: "Spell Identifier",         unsigned: true
    t.integer "active", default: 0, null: false,                                      unsigned: true
  end

  create_table "pet_spell_cooldown", primary_key: ["guid", "spell"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "guid",  default: 0, null: false, comment: "Global Unique Identifier, Low part", unsigned: true
    t.integer "spell", default: 0, null: false, comment: "Spell Identifier",                   unsigned: true
    t.bigint  "time",  default: 0, null: false,                                                unsigned: true
  end

  create_table "petition", primary_key: "ownerguid", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Guild System" do |t|
    t.integer "petitionguid", default: 0,               unsigned: true
    t.string  "name",         default: "", null: false
    t.index ["ownerguid", "petitionguid"], name: "index_ownerguid_petitionguid", unique: true, using: :btree
  end

  create_table "petition_sign", primary_key: ["petitionguid", "playerguid"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Guild System" do |t|
    t.integer "ownerguid",                  null: false, unsigned: true
    t.integer "petitionguid",   default: 0, null: false, unsigned: true
    t.integer "playerguid",     default: 0, null: false, unsigned: true
    t.integer "player_account", default: 0, null: false, unsigned: true
    t.index ["ownerguid"], name: "Idx_ownerguid", using: :btree
    t.index ["playerguid"], name: "Idx_playerguid", using: :btree
  end

  create_table "pvpstats_battlegrounds", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "winner_team", limit: 1, null: false
    t.integer  "bracket_id",  limit: 1, null: false, unsigned: true
    t.integer  "type",        limit: 1, null: false, unsigned: true
    t.datetime "date",                  null: false
  end

  create_table "pvpstats_players", primary_key: ["battleground_id", "character_guid"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint  "battleground_id",                             null: false, unsigned: true
    t.integer "character_guid",                              null: false, unsigned: true
    t.integer "score_killing_blows",   limit: 3,             null: false, unsigned: true
    t.integer "score_deaths",          limit: 3,             null: false, unsigned: true
    t.integer "score_honorable_kills", limit: 3,             null: false, unsigned: true
    t.integer "score_bonus_honor",     limit: 3,             null: false, unsigned: true
    t.integer "score_damage_done",     limit: 3,             null: false, unsigned: true
    t.integer "score_healing_done",    limit: 3,             null: false, unsigned: true
    t.integer "attr_1",                limit: 3, default: 0, null: false, unsigned: true
    t.integer "attr_2",                limit: 3, default: 0, null: false, unsigned: true
    t.integer "attr_3",                limit: 3, default: 0, null: false, unsigned: true
    t.integer "attr_4",                limit: 3, default: 0, null: false, unsigned: true
    t.integer "attr_5",                limit: 3, default: 0, null: false, unsigned: true
  end

  create_table "saved_variables", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Variable Saves" do |t|
    t.integer "NextMaintenanceDate", default: 0, null: false, unsigned: true
    t.integer "cleaning_flags",      default: 0, null: false, unsigned: true
  end

  create_table "warden_action", primary_key: "wardenId", id: :integer, limit: 2, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "action", limit: 1, unsigned: true
  end

  create_table "world", primary_key: "map", id: :integer, default: 0, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "data", limit: 4294967295
  end

end
