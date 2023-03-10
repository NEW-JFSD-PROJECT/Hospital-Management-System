--------------------------------------------------------
--  File created - Wednesday-December-21-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table SPECIALIST
--------------------------------------------------------

  CREATE TABLE "HOSPITAL"."SPECIALIST" 
   (	"ID" VARCHAR2(20 BYTE), 
	"SPEC_NAME" VARCHAR2(45 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into HOSPITAL.SPECIALIST
SET DEFINE OFF;
Insert into HOSPITAL.SPECIALIST (ID,SPEC_NAME) values ('1','Dentist');
Insert into HOSPITAL.SPECIALIST (ID,SPEC_NAME) values ('2','heart');
Insert into HOSPITAL.SPECIALIST (ID,SPEC_NAME) values ('3','caridology');
Insert into HOSPITAL.SPECIALIST (ID,SPEC_NAME) values ('4','dibetis');
Insert into HOSPITAL.SPECIALIST (ID,SPEC_NAME) values ('5','dibetis');
--------------------------------------------------------
--  DDL for Index SPECIALIST_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HOSPITAL"."SPECIALIST_PK" ON "HOSPITAL"."SPECIALIST" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Trigger SPECIALIST_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HOSPITAL"."SPECIALIST_TRG" 
BEFORE INSERT ON SPECIALIST 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT SPECIALIST_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "HOSPITAL"."SPECIALIST_TRG" ENABLE;
--------------------------------------------------------
--  Constraints for Table SPECIALIST
--------------------------------------------------------

  ALTER TABLE "HOSPITAL"."SPECIALIST" ADD CONSTRAINT "SPECIALIST_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "HOSPITAL"."SPECIALIST" MODIFY ("SPEC_NAME" NOT NULL ENABLE);
  ALTER TABLE "HOSPITAL"."SPECIALIST" MODIFY ("ID" NOT NULL ENABLE);
