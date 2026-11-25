/* make some data */

cas;

data casuser.mts_PC_ttrain;
    do id=1 to 50;
        v1=ranuni(12);
        v2=ranuni(234)*10;
        v3=v1/ranuni(.3);
        output ;
    end;
run;

data casuser.mts_PC_tscore;
    do id=1 to 100;
        v1=ranuni(41)*ranuni(.01);
        v2=ranuni(987)*10;
        v3=v1/ranuni(.23);
        output ;
    end;
run;

/**************************/
/*  proc mts              */

/**************************/
proc mts data=casuser.mts_PC_ttrain;
    input v1-v3 ; *by engine;
    id id;
    output out=casuser.out mean=casuser.mean cov=casuser.cov stat=casuser.stat
        scoreinfo=casuser.scoreinfo;
    savestate rstore=casuser.model123;
run;

/**************************/
/*  proc mtsscore         */

/**************************/
proc mtsscore data=casuser.mts_PC_tscore model=casuser.model123;
    output out=casuser.outscore gains=casuser.outgains stat=casuser.outstats;
run;
