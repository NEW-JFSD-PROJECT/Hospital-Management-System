--------------------------------------------------------
--  File created - Wednesday-December-21-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table APPOINTMENT
--------------------------------------------------------

  CREATE TABLE "HOSPITAL"."APPOINTMENT" 
   (	"ID" NUMBER, 
	"USERID" VARCHAR2(55 BYTE), 
	"FULLNAME" VARCHAR2(50 BYTE), 
	"GENDER" VARCHAR2(50 BYTE), 
	"AGE" VARCHAR2(50 BYTE), 
	"APPOINT_DATE" VARCHAR2(50 BYTE), 
	"EMAIL" VARCHAR2(50 BYTE), 
	"PHNO" VARCHAR2(50 BYTE), 
	"DISEASES" VARCHAR2(50 BYTE), 
	"DOCTOR_ID" NUMBER, 
	"ADDRESS" VARCHAR2(500 BYTE), 
	"STATUS" VARCHAR2(500 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into HOSPITAL.APPOINTMENT
SET DEFINE OFF;
Insert into HOSPITAL.APPOINTMENT (ID,USERID,FULLNAME,GENDER,AGE,APPOINT_DATE,EMAIL,PHNO,DISEASES,DOCTOR_ID,ADDRESS,STATUS) values (1,'2','Soumya','male','22','2023-01-05','debadattadas33@gmail.com','9090746993','heart',1,'Bandhpur,samitanga,cuttack,odisha,754131','ok
');
Insert into HOSPITAL.APPOINTMENT (ID,USERID,FULLNAME,GENDER,AGE,APPOINT_DATE,EMAIL,PHNO,DISEASES,DOCTOR_ID,ADDRESS,STATUS) values (2,'1','Debadutta Das','male','18','2022-12-22','debadattadas33@gmail.com','9090746993','heart',1,'Bandhpur,samitanga,cuttack,odisha,754131','Pending');
Insert into HOSPITAL.APPOINTMENT (ID,USERID,FULLNAME,GENDER,AGE,APPOINT_DATE,EMAIL,PHNO,DISEASES,DOCTOR_ID,ADDRESS,STATUS) values (3,'2','Sasmita Nayak','female','20','2022-12-16','sasmita@gmail.com','7848837670','dental',2,'SOGALA,SAMITANGA,CUTTCK,ODISHA,754131','Pending');
Insert into HOSPITAL.APPOINTMENT (ID,USERID,FULLNAME,GENDER,AGE,APPOINT_DATE,EMAIL,PHNO,DISEASES,DOCTOR_ID,ADDRESS,STATUS) values (4,'3','Prabhu','male','21','2022-12-22','prabhu1@gmail.com','7848041006','dibetis',4,'Near Gandhi clg','Checkup Complete');
--------------------------------------------------------
--  DDL for Index APPOINTMENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "HOSPITAL"."APPOINTMENT_PK" ON "HOSPITAL"."APPOINTMENT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Trigger APPOINTMENT_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "HOSPITAL"."APPOINTMENT_TRG" 
BEFORE INSERT ON APPOINTMENT 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT APPOINTMENT_SEQ4.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "HOSPITAL"."APPOINTMENT_TRG" ENABLE;
--------------------------------------------------------
--  Constraints for Table APPOINTMENT
--------------------------------------------------------

  ALTER TABLE "HOSPITAL"."APPOINTMENT" ADD CONSTRAINT "APPOINTMENT_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "HOSPITAL"."APPOINTMENT" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "HOSPITAL"."APPOINTMENT" MODIFY ("ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "HOSPITAL"."APPOINTMENT" MODIFY ("DOCTOR_ID" NOT NULL ENABLE);
  ALTER TABLE "HOSPITAL"."APPOINTMENT" MODIFY ("DISEASES" NOT NULL ENABLE);
  ALTER TABLE "HOSPITAL"."APPOINTMENT" MODIFY ("PHNO" NOT NULL ENABLE);
  ALTER TABLE "HOSPITAL"."APPOINTMENT" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "HOSPITAL"."APPOINTMENT" MODIFY ("APPOINT_DATE" NOT NULL ENABLE);
  ALTER TABLE "HOSPITAL"."APPOINTMENT" MODIFY ("AGE" NOT NULL ENABLE);
  ALTER TABLE "HOSPITAL"."APPOINTMENT" MODIFY ("GENDER" NOT NULL ENABLE);
  ALTER TABLE "HOSPITAL"."APPOINTMENT" MODIFY ("FULLNAME" NOT NULL ENABLE);
  ALTER TABLE "HOSPITAL"."APPOINTMENT" MODIFY ("USERID" NOT NULL ENABLE);
  ALTER TABLE "HOSPITAL"."APPOINTMENT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table APPOINTMENT
--------------------------------------------------------

  ALTER TABLE "HOSPITAL"."APPOINTMENT" ADD CONSTRAINT "DID" FOREIGN KEY ("DOCTOR_ID")
	  REFERENCES "HOSPITAL"."DOCTOR" ("ID") ENABLE;
