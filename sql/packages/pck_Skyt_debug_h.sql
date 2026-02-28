CREATE OR REPLACE PACKAGE SKYT_debug AS
   --#########################################################
  -- Author  : SKYT Consulting
  -- File = $RCSfile: PCK_SKYT_debug_h.sql,PCK_SKYT_debug_b.sql,
  -- Created : Februar 2026
  -- Purpose : SKYT_debug 
  --         
  --#########################################################
PROCEDURE debug(message IN VARCHAR2,obd_type IN NUMBER,prog IN VARCHAR2 DEFAULT NULL)  ; -- debug simple
--

PROCEDURE purge(obd_type IN NUMBER,prog IN VARCHAR2 DEFAULT NULL)  ;
--
END SKYT_debug;
