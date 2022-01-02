-- -----------------------------------------------------
-- Schema avarum_core
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS avarum_core CASCADE;
DROP TABLE IF EXISTS avarum_core.user CASCADE;
DROP TABLE IF EXISTS avarum_core.userpoints CASCADE;
DROP TABLE IF EXISTS avarum_core.voucher CASCADE;
DROP TABLE IF EXISTS avarum_core.voucheruser CASCADE;

CREATE SCHEMA avarum_core;
SHOW search_path;
SET search_path  TO avarum_core;


-- -----------------------------------------------------
-- Table avarum_core.vouchermotive
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS avarum_core.vouchermotive (
  id BIGSERIAL PRIMARY KEY NOT NULL,
    motive VARCHAR(25) NOT NULL);
-- ---------------------------------
-- -----------------------------------------------------
-- Table avarum_core.voucher
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS avarum_core.voucher (
  id SERIAL PRIMARY KEY NOT NULL,
    points INTEGER NOT NULL,
    vouchermotiveid BIGINT NOT NULL,
    CONSTRAINT fk_category FOREIGN KEY (vouchermotiveid) REFERENCES vouchermotive (id));
-- ---------------------------------
-- -----------------------------------------------------
-- Table avarum_core.user
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS avarum_core.user (
  id BIGSERIAL PRIMARY KEY NOT NULL,
    screenname VARCHAR(32) NOT NULL,
    gender SMALLINT NOT NULL,
    discordid VARCHAR(32) NOT NULL,
    pw VARCHAR(255) NOT NULL,
    email VARCHAR(254) NOT NULL);

-- -----------------------------------------------------
-- Table avarum_core.userpoints
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS avarum_core.userpoints (
id BIGSERIAL PRIMARY KEY NOT NULL,
        points INTEGER NOT NULL,
        userid BIGINT NOT NULL,
    CONSTRAINT fk_userid FOREIGN KEY (userid) REFERENCES avarum_users.user (id));

-- -----------------------------------------------------
-- Table avarum_core.voucheruser
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS avarum_core.voucheruser (
    id SERIAL PRIMARY KEY NOT NULL,
    userid BIGINT NOT NULL,
    CONSTRAINT fk_userid FOREIGN KEY (userid) REFERENCES avarum_core.user (id),
    voucherid BIGINT NOT NULL,
    CONSTRAINT fk_voucherid FOREIGN KEY (voucherid) REFERENCES voucher (id));




-- -----------------------------------------------------
-- Add sample data
-- -----------------------------------------------------

INSERT INTO vouchermotive (motive) VALUES ('VANITY'), ('RANK'),
                                          ('GOW'), ('GOW_1st'),
                                          ('GOW_2nd'), ('GOW_3rd');

INSERT INTO avarum_core.user (screenname, discordid, gender, email, pw)
VALUES ('AV-CL-1000', 'Test#0324', 1, 'Factory New', 'teste123');

INSERT INTO avarum_core.userpoints (points, userid)
VALUES (40000, 1);
