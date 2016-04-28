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

  create_table "account", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Account System" do |t|
    t.string   "username",        limit: 32,         default: "",                         null: false, comment: "User name"
    t.string   "sha_pass_hash",   limit: 40,         default: "",                         null: false, comment: "SHA1 password Hash"
    t.integer  "gmlevel",         limit: 1,          default: 0,                          null: false,                                                        unsigned: true
    t.text     "sessionkey",      limit: 4294967295
    t.text     "v",               limit: 4294967295
    t.text     "s",               limit: 4294967295,                                                   comment: "password salt"
    t.text     "email",           limit: 65535,                                                        comment: "Email address"
    t.datetime "joindate",                           default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Account Created Date"
    t.string   "last_ip",         limit: 30,         default: "0.0.0.0",                  null: false
    t.integer  "failed_logins",                      default: 0,                          null: false,                                                        unsigned: true
    t.integer  "locked",          limit: 1,          default: 0,                          null: false,                                                        unsigned: true
    t.datetime "last_login",                                                              null: false
    t.integer  "active_realm_id",                    default: 0,                          null: false, comment: "last realm id",                              unsigned: true
    t.integer  "expansion",       limit: 1,          default: 0,                          null: false, comment: "max game expansion",                         unsigned: true
    t.bigint   "mutetime",                           default: 0,                          null: false,                                                        unsigned: true
    t.integer  "locale",          limit: 1,          default: 0,                          null: false,                                                        unsigned: true
    t.string   "os",              limit: 3,          default: "",                                      comment: "Client OS Version"
    t.binary   "playerBot",       limit: 1,          default: "b'0'",                     null: false, comment: "Whether the account is a playerbot account"
    t.index ["gmlevel"], name: "idx_gmlevel", using: :btree
    t.index ["username"], name: "idx_username", unique: true, using: :btree
  end

  create_table "account_banned", primary_key: ["id", "bandate"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Ban List" do |t|
    t.integer "id",                               null: false, comment: "Account identifier", unsigned: true
    t.bigint  "bandate",              default: 0, null: false
    t.bigint  "unbandate",            default: 0, null: false
    t.string  "bannedby",  limit: 50,             null: false
    t.string  "banreason",                        null: false
    t.integer "active",    limit: 1,  default: 1, null: false
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
    t.integer "languageId",                 default: 0, null: false, comment: "dbdocsLanguageId to link to. (Normallu 0 = English)"
    t.string  "tableName",    limit: 80,                null: false, comment: "Name of the table to link to"
    t.string  "fieldName",    limit: 80,                null: false, comment: "Name of the field to link the note to"
    t.string  "fieldComment", limit: 80,                             comment: "Main field Note"
    t.text    "fieldNotes",   limit: 65535,             null: false, comment: "Additional Field Notes"
    t.index ["fieldId"], name: "fieldId", using: :btree
  end

  create_table "dbdocsfields_localised", primary_key: ["fieldId", "languageId"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "fieldId",                    null: false, comment: "dbdocsfields.fieldId to link to."
    t.integer "languageId",                 null: false, comment: "dbdocsLanguageId to link to. (Normallu 0 = English)"
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
    t.integer "languageId",                     default: 2, null: false, comment: "dbdocsLanguageId to link to."
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
    t.integer "languageId",               default: 2, null: false, comment: "The dbdocsLanguageId to link to"
    t.text    "tableNotes", limit: 65535,             null: false, comment: "The additional note to be added to the table"
  end

  create_table "ip_banned", primary_key: ["ip", "bandate"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Banned IPs" do |t|
    t.string "ip",        limit: 32, default: "0.0.0.0",   null: false
    t.bigint "bandate",                                    null: false
    t.bigint "unbandate",                                  null: false
    t.string "bannedby",  limit: 50, default: "[Console]", null: false
    t.string "banreason",            default: "no reason", null: false
  end

  create_table "realmcharacters", primary_key: ["realmid", "acctid"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Realm Character Tracker" do |t|
    t.integer "realmid",                        null: false, comment: "Realm identifier",   unsigned: true
    t.integer "acctid",                         null: false, comment: "Account identifier", unsigned: true
    t.integer "numchars", limit: 1, default: 0, null: false,                                unsigned: true
    t.index ["acctid"], name: "acctid", using: :btree
  end

  create_table "realmlist", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Realm System" do |t|
    t.string  "name",                 limit: 32, default: "",              null: false
    t.string  "address",              limit: 32, default: "127.0.0.1",     null: false
    t.string  "localAddress",                    default: "127.0.0.1",     null: false
    t.string  "localSubnetMask",                 default: "255.255.255.0", null: false
    t.integer "port",                            default: 8085,            null: false
    t.integer "icon",                 limit: 1,  default: 0,               null: false,                                                                                                                                                                         unsigned: true
    t.integer "realmflags",           limit: 1,  default: 2,               null: false, comment: "Supported masks: 0x1 (invalid, not show in realm list), 0x2 (offline, set by mangosd), 0x4 (show version and build), 0x20 (new players), 0x40 (recommended)", unsigned: true
    t.integer "timezone",             limit: 1,  default: 0,               null: false,                                                                                                                                                                         unsigned: true
    t.integer "allowedSecurityLevel", limit: 1,  default: 0,               null: false,                                                                                                                                                                         unsigned: true
    t.float   "population",           limit: 24, default: 0.0,             null: false,                                                                                                                                                                         unsigned: true
    t.string  "realmbuilds",          limit: 64, default: "",              null: false
    t.index ["name"], name: "idx_name", unique: true, using: :btree
  end

  create_table "uptime", primary_key: ["realmid", "starttime"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "Uptime system" do |t|
    t.integer "realmid",                             null: false, comment: "Realm identifier", unsigned: true
    t.bigint  "starttime",              default: 0,  null: false,                              unsigned: true
    t.string  "startstring", limit: 64, default: "", null: false
    t.bigint  "uptime",                 default: 0,  null: false,                              unsigned: true
    t.integer "maxplayers",  limit: 2,  default: 0,  null: false,                              unsigned: true
  end

  create_table "warden_log", primary_key: "entry", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED", comment: "Warden log of failed checks" do |t|
    t.integer  "check",      limit: 2,                                       null: false, comment: "Failed Warden check ID",            unsigned: true
    t.integer  "action",     limit: 1,  default: 0,                          null: false, comment: "Action taken (enum WardenActions)", unsigned: true
    t.integer  "account",                                                    null: false, comment: "Account ID",                        unsigned: true
    t.integer  "guid",                  default: 0,                          null: false, comment: "Player GUID",                       unsigned: true
    t.integer  "map",                                                                     comment: "Map ID",                            unsigned: true
    t.float    "position_x", limit: 24,                                                   comment: "Player position X"
    t.float    "position_y", limit: 24,                                                   comment: "Player position Y"
    t.float    "position_z", limit: 24,                                                   comment: "Player position Z"
    t.datetime "date",                  default: -> { "CURRENT_TIMESTAMP" }, null: false, comment: "Date of the log entry"
  end

end
