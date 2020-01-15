--------------------------------------------------------
--  File created - Wednesday-January-15-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence KORISNIK_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "KORISNIK_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REGISTRACIJA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "REGISTRACIJA_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REGISTRACIJA_SEQ1
--------------------------------------------------------

   CREATE SEQUENCE  "REGISTRACIJA_SEQ1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table KORISNIK
--------------------------------------------------------

  CREATE TABLE "KORISNIK" 
   (	"ID" NUMBER(*,0), 
	"USERNAME" VARCHAR2(64 BYTE), 
	"PASSWORD" VARCHAR2(64 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REGISTRACIJA
--------------------------------------------------------

  CREATE TABLE "REGISTRACIJA" 
   (	"ID" NUMBER(*,0), 
	"IME" VARCHAR2(32 BYTE), 
	"PREZIME" VARCHAR2(32 BYTE), 
	"JMBG" LONG, 
	"ADRESA" VARCHAR2(128 BYTE), 
	"KONTAKT_TELEFON" VARCHAR2(32 BYTE), 
	"REGISTARSKA_OZNAKA" VARCHAR2(16 BYTE), 
	"MARKA" VARCHAR2(32 BYTE), 
	"MODEL" VARCHAR2(32 BYTE), 
	"BOJA" VARCHAR2(16 BYTE), 
	"BROJ_SASIJE" VARCHAR2(128 BYTE), 
	"GODINA_PROIZVODNJE" NUMBER(*,0), 
	"ZAPREMINA_MOTORA" NUMBER(*,0), 
	"SNAGA_MOTORA" NUMBER(*,0), 
	"DATUM_REGISTRACIJE" DATE, 
	"REGISTROVAN_DO" DATE, 
	"KORISNIK_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into KORISNIK
SET DEFINE OFF;
Insert into KORISNIK (ID,USERNAME,PASSWORD) values (1,'admin','admin');
Insert into KORISNIK (ID,USERNAME,PASSWORD) values (2,'user','user');
REM INSERTING into REGISTRACIJA
SET DEFINE OFF;
Insert into REGISTRACIJA (ID,IME,PREZIME,JMBG,ADRESA,KONTAKT_TELEFON,REGISTARSKA_OZNAKA,MARKA,MODEL,BOJA,BROJ_SASIJE,GODINA_PROIZVODNJE,ZAPREMINA_MOTORA,SNAGA_MOTORA,DATUM_REGISTRACIJE,REGISTROVAN_DO,KORISNIK_ID) values (2,'Marko','Markovic','456123987789','Balkanska 1','060/100100','BG-0001-AA','Fiat','Panda','Plava','100100123123',2008,1300,50,to_date('10-JAN-20','DD-MON-RR'),to_date('10-JAN-21','DD-MON-RR'),1);
--------------------------------------------------------
--  DDL for Index KORISNIK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KORISNIK_PK" ON "KORISNIK" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index REGISTRACIJA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "REGISTRACIJA_PK" ON "REGISTRACIJA" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger KORISNIK_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "KORISNIK_TRG" 
BEFORE INSERT ON KORISNIK 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT KORISNIK_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/
ALTER TRIGGER "KORISNIK_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger REGISTRACIJA_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "REGISTRACIJA_TRG" 
BEFORE INSERT ON REGISTRACIJA 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;

/
ALTER TRIGGER "REGISTRACIJA_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger REGISTRACIJA_TRG1
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "REGISTRACIJA_TRG1" 
BEFORE INSERT ON REGISTRACIJA 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT REGISTRACIJA_SEQ1.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;

/
ALTER TRIGGER "REGISTRACIJA_TRG1" ENABLE;
--------------------------------------------------------
--  DDL for Function CUSTOM_AUTH
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "CUSTOM_AUTH" (p_username in VARCHAR2, p_password in VARCHAR2)
return BOOLEAN
is
  l_password varchar2(4000);
  l_stored_password varchar2(4000);
  l_expires_on date;
  l_count number;
begin
-- First, check to see if the user is in the user table
select count(*) into l_count from demo_users where user_name = p_username;
if l_count > 0 then
  -- First, we fetch the stored hashed password & expire date
  select password, expires_on into l_stored_password, l_expires_on
   from demo_users where user_name = p_username;

  -- Next, we check to see if the user's account is expired
  -- If it is, return FALSE
  if l_expires_on > sysdate or l_expires_on is null then

    -- If the account is not expired, we have to apply the custom hash
    -- function to the password
    l_password := custom_hash(p_username, p_password);

    -- Finally, we compare them to see if they are the same and return
    -- either TRUE or FALSE
    if l_password = l_stored_password then
      return true;
    else
      return false;
    end if;
  else
    return false;
  end if;
else
  -- The username provided is not in the DEMO_USERS table
  return false;
end if;
end;


/
--------------------------------------------------------
--  DDL for Function CUSTOM_HASH
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "CUSTOM_HASH" (p_username in varchar2, p_password in varchar2)
return varchar2
is
  l_password varchar2(4000);
  l_salt varchar2(4000) := '7C8PEWR1ZWQ7M9NRPVWY2WIIUU3UQO';
begin

-- This function should be wrapped, as the hash algorhythm is exposed here.
-- You can change the value of l_salt or the method of which to call the
-- DBMS_OBFUSCATOIN toolkit, but you much reset all of your passwords
-- if you choose to do this.

l_password := utl_raw.cast_to_raw(dbms_obfuscation_toolkit.md5
  (input_string => p_password || substr(l_salt,10,13) || p_username ||
    substr(l_salt, 4,10)));
return l_password;
end;


/
--------------------------------------------------------
--  Constraints for Table KORISNIK
--------------------------------------------------------

  ALTER TABLE "KORISNIK" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "KORISNIK" ADD CONSTRAINT "KORISNIK_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REGISTRACIJA
--------------------------------------------------------

  ALTER TABLE "REGISTRACIJA" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "REGISTRACIJA" ADD CONSTRAINT "REGISTRACIJA_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "REGISTRACIJA" MODIFY ("IME" NOT NULL ENABLE);
  ALTER TABLE "REGISTRACIJA" MODIFY ("PREZIME" NOT NULL ENABLE);
  ALTER TABLE "REGISTRACIJA" MODIFY ("JMBG" NOT NULL ENABLE);
  ALTER TABLE "REGISTRACIJA" MODIFY ("ADRESA" NOT NULL ENABLE);
  ALTER TABLE "REGISTRACIJA" MODIFY ("KONTAKT_TELEFON" NOT NULL ENABLE);
  ALTER TABLE "REGISTRACIJA" MODIFY ("REGISTARSKA_OZNAKA" NOT NULL ENABLE);
  ALTER TABLE "REGISTRACIJA" MODIFY ("MARKA" NOT NULL ENABLE);
  ALTER TABLE "REGISTRACIJA" MODIFY ("MODEL" NOT NULL ENABLE);
  ALTER TABLE "REGISTRACIJA" MODIFY ("BOJA" NOT NULL ENABLE);
  ALTER TABLE "REGISTRACIJA" MODIFY ("BROJ_SASIJE" NOT NULL ENABLE);
  ALTER TABLE "REGISTRACIJA" MODIFY ("GODINA_PROIZVODNJE" NOT NULL ENABLE);
  ALTER TABLE "REGISTRACIJA" MODIFY ("ZAPREMINA_MOTORA" NOT NULL ENABLE);
  ALTER TABLE "REGISTRACIJA" MODIFY ("SNAGA_MOTORA" NOT NULL ENABLE);
