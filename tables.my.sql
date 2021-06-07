#
# MySQL MRBS table creation script
#
# Notes:
# (1) If you have decided to change the prefix of your tables from 'mrbs_'
#     to something else using $db_tbl_prefix then you must edit each
#     'CREATE TABLE', 'INSERT INTO' and 'REFERENCES' line below to replace
#     'mrbs_' with your new table prefix.  A global replace of 'mrbs_' is
#     sufficient.
#
# (2) If you add new fields then you should also change the global variable
#     $standard_fields.   Note that if you are just adding custom fields for
#     a single site then this is not necessary.

CREATE TABLE mrbs_area
(
  id                          int NOT NULL auto_increment,
  disabled                    tinyint DEFAULT 0 NOT NULL,
  area_name                   varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  sort_key                    varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' NOT NULL,
  timezone                    varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  area_admin_email            text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  resolution                  int,
  default_duration            int,
  default_duration_all_day    tinyint DEFAULT 0 NOT NULL,
  morningstarts               int,
  morningstarts_minutes       int,
  eveningends                 int,
  eveningends_minutes         int,
  private_enabled             tinyint,
  private_default             tinyint,
  private_mandatory           tinyint,
  private_override            varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  min_create_ahead_enabled    tinyint,
  min_create_ahead_secs       int,
  max_create_ahead_enabled    tinyint,
  max_create_ahead_secs       int,
  min_delete_ahead_enabled    tinyint,
  min_delete_ahead_secs       int,
  max_delete_ahead_enabled    tinyint,
  max_delete_ahead_secs       int,
  max_per_day_enabled         tinyint DEFAULT 0 NOT NULL,
  max_per_day                 int DEFAULT 0 NOT NULL,
  max_per_week_enabled        tinyint DEFAULT 0 NOT NULL,
  max_per_week                int DEFAULT 0 NOT NULL,
  max_per_month_enabled       tinyint DEFAULT 0 NOT NULL,
  max_per_month               int DEFAULT 0 NOT NULL,
  max_per_year_enabled        tinyint DEFAULT 0 NOT NULL,
  max_per_year                int DEFAULT 0 NOT NULL,
  max_per_future_enabled      tinyint DEFAULT 0 NOT NULL,
  max_per_future              int DEFAULT 0 NOT NULL,
  max_secs_per_day_enabled    tinyint DEFAULT 0 NOT NULL,
  max_secs_per_day            int DEFAULT 0 NOT NULL,
  max_secs_per_week_enabled   tinyint DEFAULT 0 NOT NULL,
  max_secs_per_week           int DEFAULT 0 NOT NULL,
  max_secs_per_month_enabled  tinyint DEFAULT 0 NOT NULL,
  max_secs_per_month          int DEFAULT 0 NOT NULL,
  max_secs_per_year_enabled   tinyint DEFAULT 0 NOT NULL,
  max_secs_per_year           int DEFAULT 0 NOT NULL,
  max_secs_per_future_enabled tinyint DEFAULT 0 NOT NULL,
  max_secs_per_future         int DEFAULT 0 NOT NULL,
  max_duration_enabled        tinyint DEFAULT 0 NOT NULL,
  max_duration_secs           int DEFAULT 0 NOT NULL,
  max_duration_periods        int DEFAULT 0 NOT NULL,
  custom_html                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  approval_enabled            tinyint,
  reminders_enabled           tinyint,
  enable_periods              tinyint,
  periods                     text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  confirmation_enabled        tinyint,
  confirmed_default           tinyint,
  times_along_top             tinyint NOT NULL DEFAULT 0,
  default_type                char DEFAULT 'E' NOT NULL,
  periods_booking_opens       time DEFAULT '00:00:00' NOT NULL,

  PRIMARY KEY (id),
  UNIQUE KEY uq_area_name (area_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE mrbs_room
(
  id               int NOT NULL auto_increment,
  disabled         tinyint DEFAULT 0 NOT NULL,
  area_id          int DEFAULT 0 NOT NULL,
  room_name        varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' NOT NULL,
  sort_key         varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' NOT NULL,
  description      varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  capacity         int DEFAULT 0 NOT NULL,
  room_admin_email text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  invalid_types    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JSON encoded',
  custom_html      text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,

  PRIMARY KEY (id),
  FOREIGN KEY (area_id)
    REFERENCES mrbs_area(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  UNIQUE KEY uq_room_name (area_id, room_name),
  KEY idxSortKey (sort_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE mrbs_repeat
(
  id             int NOT NULL auto_increment,
  start_time     bigint DEFAULT 0 NOT NULL COMMENT 'Unix timestamp',
  end_time       bigint DEFAULT 0 NOT NULL COMMENT 'Unix timestamp',
  rep_type       int DEFAULT 0 NOT NULL,
  end_date       bigint DEFAULT 0 NOT NULL COMMENT 'Unix timestamp',
  rep_opt        varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' NOT NULL,
  room_id        int DEFAULT 1 NOT NULL,
  timestamp      timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  create_by      varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' NOT NULL,
  modified_by    varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' NOT NULL,
  name           varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' NOT NULL,
  type           char DEFAULT 'E' NOT NULL,
  description    text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  rep_interval   smallint DEFAULT 1 NOT NULL,
  month_absolute smallint DEFAULT NULL,
  month_relative varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  status         tinyint unsigned NOT NULL DEFAULT 0,
  reminded       bigint COMMENT 'Unix timestamp',
  info_time      bigint COMMENT 'Unix timestamp',
  info_user      varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  info_text      text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  ical_uid       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' NOT NULL,
  ical_sequence  smallint DEFAULT 0 NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (room_id)
    REFERENCES mrbs_room(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE mrbs_entry
(
  id                          int NOT NULL auto_increment,
  start_time                  bigint DEFAULT 0 NOT NULL COMMENT 'Unix timestamp',
  end_time                    bigint DEFAULT 0 NOT NULL COMMENT 'Unix timestamp',
  entry_type                  int DEFAULT 0 NOT NULL,
  repeat_id                   int DEFAULT NULL,
  room_id                     int DEFAULT 1 NOT NULL,
  timestamp                   timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  create_by                   varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' NOT NULL,
  modified_by                 varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' NOT NULL,
  name                        varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' NOT NULL,
  type                        char DEFAULT 'E' NOT NULL,
  description                 text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  status                      tinyint unsigned NOT NULL DEFAULT 0,
  reminded                    bigint COMMENT 'Unix timestamp',
  info_time                   bigint COMMENT 'Unix timestamp',
  info_user                   varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  info_text                   text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  ical_uid                    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' NOT NULL,
  ical_sequence               smallint DEFAULT 0 NOT NULL,
  ical_recur_id               varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  allow_registration          tinyint DEFAULT 0 NOT NULL,
  registrant_limit            int DEFAULT 0 NOT NULL,
  registrant_limit_enabled    tinyint DEFAULT 1 NOT NULL,
  registration_opens          int DEFAULT 1209600 NOT NULL COMMENT 'Seconds before the start time', -- 2 weeks
  registration_opens_enabled  tinyint DEFAULT 0 NOT NULL,
  registration_closes         int DEFAULT 0 NOT NULL COMMENT 'Seconds before the start_time',
  registration_closes_enabled tinyint DEFAULT 0 NOT NULL,

  PRIMARY KEY (id),
  FOREIGN KEY (room_id)
    REFERENCES mrbs_room(id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  FOREIGN KEY (repeat_id)
    REFERENCES mrbs_repeat(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  KEY idxStartTime (start_time),
  KEY idxEndTime   (end_time),
  KEY idxRoomStartEnd (room_id, start_time, end_time)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE mrbs_participant
(
  id          int NOT NULL auto_increment,
  entry_id    int NOT NULL,
  username    varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  create_by   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  registered  bigint COMMENT 'Unix timestamp',

  PRIMARY KEY (id),
  UNIQUE KEY uq_entryid_username (entry_id, username),
  FOREIGN KEY (entry_id)
    REFERENCES mrbs_entry(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE mrbs_variable
(
  id               int NOT NULL auto_increment,
  variable_name    varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  variable_content text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,

  PRIMARY KEY (id),
  UNIQUE KEY uq_variable_name (variable_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE mrbs_zoneinfo
(
  id                 int NOT NULL auto_increment,
  timezone           varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' NOT NULL,
  outlook_compatible tinyint unsigned NOT NULL DEFAULT 0,
  vtimezone          text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  last_updated       bigint NOT NULL DEFAULT 0 COMMENT 'Unix timestamp',

  /* Note that there is a limit on the length of keys which imposes a constraint
     on the size of VARCHAR that can be keyed */
  PRIMARY KEY (id),
  UNIQUE KEY uq_timezone (timezone, outlook_compatible)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE mrbs_session
(
  id      varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  access  bigint unsigned DEFAULT NULL COMMENT 'Unix timestamp',
  data    text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,

  /* Note that there is a limit on the length of keys which imposes a constraint
     on the size of VARCHAR that can be keyed */
  PRIMARY KEY (id),
  KEY idxAccess (access)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE mrbs_user
(
  id                int NOT NULL auto_increment,
  auth_type         varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'db',
  level             smallint DEFAULT 0 NOT NULL,  /* play safe and give no rights */
  name              varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  display_name      varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  password_hash     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  email             varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  timestamp         timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  last_login        bigint DEFAULT 0 NOT NULL COMMENT 'Unix timestamp',
  reset_key_hash    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  reset_key_expiry  bigint DEFAULT 0 NOT NULL COMMENT 'Unix timestamp',

  PRIMARY KEY (id),
  UNIQUE KEY uq_name_auth_type (name, auth_type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE mrbs_group
(
  id          int NOT NULL auto_increment,
  auth_type   varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'db',
  name        varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,

  PRIMARY KEY (id),
  UNIQUE KEY uq_group_name_auth_type (name, auth_type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE mrbs_user_group
(
  user_id     int NOT NULL,
  group_id    int NOT NULL,

  UNIQUE KEY uq_user_group (user_id, group_id),
  FOREIGN KEY (user_id)
    REFERENCES mrbs_user(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (group_id)
    REFERENCES mrbs_group(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE mrbs_role
(
  id        int NOT NULL auto_increment,
  name      varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,

  PRIMARY KEY (id),
  UNIQUE KEY uq_name (name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE mrbs_user_role
(
  user_id     int NOT NULL,
  role_id     int NOT NULL,

  UNIQUE KEY uq_user_role (user_id, role_id),
  FOREIGN KEY (user_id)
    REFERENCES mrbs_user(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (role_id)
    REFERENCES mrbs_role(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE mrbs_group_role
(
  group_id    int NOT NULL,
  role_id     int NOT NULL,

  UNIQUE KEY uq_group_role (group_id, role_id),
  FOREIGN KEY (group_id)
    REFERENCES mrbs_group(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (role_id)
    REFERENCES mrbs_role(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE mrbs_role_area
(
  role_id     int NOT NULL,
  area_id     int NOT NULL,
  permission  char CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  state       char CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,

  UNIQUE KEY uq_role_area (role_id, area_id),
  FOREIGN KEY (role_id)
    REFERENCES mrbs_role(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (area_id)
    REFERENCES mrbs_area(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE mrbs_role_room
(
  role_id     int NOT NULL,
  room_id     int NOT NULL,
  permission  char CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  state       char CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,

  UNIQUE KEY uq_role_room (role_id, room_id),
  FOREIGN KEY (role_id)
    REFERENCES mrbs_role(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (room_id)
    REFERENCES mrbs_room(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO mrbs_variable (variable_name, variable_content)
  VALUES ('db_version', '85');
INSERT INTO mrbs_variable (variable_name, variable_content)
  VALUES ('local_db_version', '1');
