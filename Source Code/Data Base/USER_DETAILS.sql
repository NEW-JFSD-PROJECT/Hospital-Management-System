--------------------------------------------------------
--  File created - Wednesday-December-21-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table USER_DETAILS
--------------------------------------------------------

  CREATE TABLE "HOSPITAL"."USER_DETAILS" 
   (	"ID" NUMBER, 
	"FULL_NAME" VARCHAR2(50 BYTE), 
	"EMAIL" VARCHAR2(50 BYTE), 
	"PASSWORD" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into HOSPITAL.USER_DETAILS
SET DEFINE OFF;
Insert into HOSPITAL.USER_DETAILS (ID,FULL_NAME,EMAIL,PASSWORD) values (1,'Debadutta Das','debadatta2468.info@gmail.cm','1234');
Insert into HOSPITAL.USER_DETAILS (ID,FULL_NAME,EMAIL,PASSWORD) values (2,'Sasmita Nayak','sasmita@12','1234');
Insert into HOSPITAL.USER_DETAILS (ID,FULL_NAME,EMAIL,PASSWORD) values (3,'Prabhu','prabhu1@gmail.com','1234');
--------------------------------------------------------
--  DDL for Index USER_DETAILS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HOSPITAL"."USER_DETAILS_PK" ON "HOSPITAL"."USER_DETAILS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Trigger USER_DETAILS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HOSPITAL"."USER_DETAILS_TRG" 
BEFORE INSERT ON USER_DETAILS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT USER_DETAILS_SEQ4.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "HOSPITAL"."USER_DETAILS_TRG" ENABLE;
--------------------------------------------------------
--  Constraints for Table USER_DETAILS
--------------------------------------------------------

  ALTER TABLE "HOSPITAL"."USER_DETAILS" ADD CONSTRAINT "USER_DETAILS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "HOSPITAL"."USER_DETAILS" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "HOSPITAL"."USER_DETAILS" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "HOSPITAL"."USER_DETAILS" MODIFY ("FULL_NAME" NOT NULL ENABLE);
  ALTER TABLE "HOSPITAL"."USER_DETAILS" MODIFY ("ID" NOT NULL ENABLE);
