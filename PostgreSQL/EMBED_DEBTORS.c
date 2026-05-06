/* Processed by ecpg (16.4) */
/* These include files are added by the preprocessor */
#include <ecpglib.h>
#include <ecpgerrno.h>
#include <sqlca.h>
/* End of automatic include section */

#line 1 "EMBED_DEBTORS.pgc"
#include <stdio.h>

/* exec sql begin declare section */
     
     

#line 4 "EMBED_DEBTORS.pgc"
 char sel_name [ 20 ] ;
 
#line 5 "EMBED_DEBTORS.pgc"
 char shop [ 20 ] ;
/* exec sql end declare section */
#line 6 "EMBED_DEBTORS.pgc"



#line 1 "/usr/include/sqlca.h"
#ifndef POSTGRES_SQLCA_H
#define POSTGRES_SQLCA_H

#ifndef PGDLLIMPORT
#if  defined(WIN32) || defined(__CYGWIN__)
#define PGDLLIMPORT __declspec (dllimport)
#else
#define PGDLLIMPORT
#endif							/* __CYGWIN__ */
#endif							/* PGDLLIMPORT */

#define SQLERRMC_LEN	150

#ifdef __cplusplus
extern "C"
{
#endif

struct sqlca_t
{
	char		sqlcaid[8];
	long		sqlabc;
	long		sqlcode;
	struct
	{
		int			sqlerrml;
		char		sqlerrmc[SQLERRMC_LEN];
	}			sqlerrm;
	char		sqlerrp[8];
	long		sqlerrd[6];
	/* Element 0: empty						*/
	/* 1: OID of processed tuple if applicable			*/
	/* 2: number of rows processed				*/
	/* after an INSERT, UPDATE or				*/
	/* DELETE statement					*/
	/* 3: empty						*/
	/* 4: empty						*/
	/* 5: empty						*/
	char		sqlwarn[8];
	/* Element 0: set to 'W' if at least one other is 'W'	*/
	/* 1: if 'W' at least one character string		*/
	/* value was truncated when it was			*/
	/* stored into a host variable.             */

	/*
	 * 2: if 'W' a (hopefully) non-fatal notice occurred
	 */	/* 3: empty */
	/* 4: empty						*/
	/* 5: empty						*/
	/* 6: empty						*/
	/* 7: empty						*/

	char		sqlstate[5];
};

struct sqlca_t *ECPGget_sqlca(void);

#ifndef POSTGRES_ECPG_INTERNAL
#define sqlca (*ECPGget_sqlca())
#endif

#ifdef __cplusplus
}
#endif

#endif

#line 8 "EMBED_DEBTORS.pgc"

int main(void) {


      { ECPGconnect(__LINE__, 0, "debtors" , "blue" , NULL , NULL, 0); }
#line 12 "EMBED_DEBTORS.pgc"


    { ECPGdo(__LINE__, 0, 1, NULL, 0, ECPGst_normal, "select \"SEL_NAME\" , \"SHOP\" from \"SELLER\" where \"SEL_NAME\" = 'DAVID'", ECPGt_EOIT, 
	ECPGt_char,(sel_name),(long)20,(long)1,(20)*sizeof(char), 
	ECPGt_NO_INDICATOR, NULL , 0L, 0L, 0L, 
	ECPGt_char,(shop),(long)20,(long)1,(20)*sizeof(char), 
	ECPGt_NO_INDICATOR, NULL , 0L, 0L, 0L, ECPGt_EORT);}
#line 17 "EMBED_DEBTORS.pgc"


    printf("Seller: %s\nShop: %s\n", sel_name, shop);

    { ECPGdisconnect(__LINE__, "CURRENT");}
#line 21 "EMBED_DEBTORS.pgc"


}
