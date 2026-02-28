CREATE OR REPLACE PACKAGE BODY SKYT_DEBUG AS
-- BTC DEBUG po vzoru GOLD tb_dbg


PROCEDURE write_dbg(message IN VARCHAR2, obd_type IN NUMBER ,prog IN VARCHAR2) IS
    PRAGMA AUTONOMOUS_TRANSACTION;

BEGIN
    -- Debut de la transaction autonome
    INSERT INTO TMY_erreurprg (dbgnum,
                        errlog,
                        errprog,
                        errmess,
                        errdcre,
                        errstat,
                        errtrid,
                        errord,
                        errutil
                        )
                  VALUES (
                         TMYSEQERRPRG.nextval
                         ,'1' ---    errlog,
                         ,prog ---    errprog,
                         ,message ---    errmess, notr sporoeilo
                         ,current_date ---    errdcre,
                         ,'1' ---    errstat,
                         ,obd_type ---    errtrid,
                         ,'1' ---    errord,
                         ,'1' ---    errutil
                        );
    COMMIT;
END write_dbg;


PROCEDURE debug(message IN VARCHAR2, obd_type IN NUMBER, prog IN VARCHAR2 DEFAULT NULL) AS
--
w_sens VARCHAR2(1);
w_mess VARCHAR2(250);
w_prog VARCHAR2(35);
w_obd_type NUMBER;
--
erreur  VARCHAR2(250);
--
BEGIN

        w_mess := SUBSTR(message,0,250);
        w_prog := SUBSTR(prog,0,35);
        w_obd_type:=obd_type;

      write_dbg(w_mess, w_obd_type, w_prog);

    --
EXCEPTION
      WHEN OTHERS THEN NULL;
END debug;
--
--

PROCEDURE purge(obd_type IN NUMBER,prog IN VARCHAR2 DEFAULT NULL)  is

v_delay_days number := 365;
prog_name varchar2(20) := 'BTC_debug.Purge';

begin

  --
  select 1 into v_delay_days from dual;
/*select PR_TAUXXX
  into v_delay_days
  from tb_par
 where pr_tablex = 'PUR'
   and pr_postex = 'BTCER';

   delete from BTC_erreurprg
   where errdcre < sysdate - v_delay_days;

   SKYT_DEBUG.debug('BTC ERREURPRG purged for delay days : '||v_delay_days||' klicano z: '||prog ,
                  1,
                  prog_name);*/


end purge;

--
END SKYT_DEBUG;
