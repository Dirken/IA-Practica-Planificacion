/*********************************************************************
 * Generator of tests
 * based on the hanoi's tower example given here: 
 * http://fai.cs.uni-saarland.de/hoffmann/ff-domains.html
 *********************************************************************/


#include <stdlib.h>
#include <stdio.h>
#include <sys/timeb.h>




/* data structures ... (ha ha)
 */
typedef unsigned char Bool;
#define TRUE 1
#define FALSE 0



/* helpers
 */


/* command line
 */
void usage( void );
Bool process_command_line( int argc, char *argv[] );



/* globals
 */

/* command line params
 */
int gobjects;


int main( int argc, char *argv[] )

{

  int i, j;

  /* seed the random() function
   */
  struct timeb tp;
  ftime( &tp );
  srandom( tp.millitm );


  /* command line treatment, first preset values
   */
  gobjects = -1;

  if ( argc == 1 || ( argc == 2 && *++argv[0] == '?' ) ) {
    usage();
    exit( 1 );
  }
  if ( !process_command_line( argc, argv ) ) {
    usage();
    exit( 1 );
  }

  /* now output problem in PDDL syntax
   */
  printf("\n\n\n");

  /* header
   */
  printf("(define (problem hanoi-%d)", gobjects);
  printf("\n(:domain hanoi)");

  printf("\n(:objects peg1 peg2 peg3 ");
  for ( i = 0; i < gobjects; i++ ) {
    printf("d%d ", i + 1);
  }
  printf(")");

  printf("\n(:init");
  for ( i = 0; i < gobjects; i++ ) {
    printf("\n(smaller peg1 d%d)", i+1);
  }
  for ( i = 0; i < gobjects; i++ ) {
    printf("\n(smaller peg2 d%d)", i+1);
  }
  for ( i = 0; i < gobjects; i++ ) {
    printf("\n(smaller peg3 d%d)", i+1);
  }
  for ( i = 0; i < gobjects - 1; i++ ) {
    for ( j = i; j < gobjects; j++ ) {
      printf("\n(smaller d%d d%d)", j+1, i+1);
    }
  }
  printf("\n(clear peg2)
            (clear peg3)
            (clear d1)");

  printf("\n(on d%d peg1)", gobjects);
  for ( i = gobjects-1; i >= 1; i-- ) {
    printf("\n(on d%d d%d)", i, i+1);
  }
  printf("\n)");

  printf("\n(:goal");
  printf("\n(and ");
  printf("\n(on d%d peg3)", gobjects);
  for ( i = gobjects-1; i >= 1; i-- ) {
    printf("\n(on d%d d%d)", i, i+1);
  }
  printf("\n)");
  printf("\n)");
  printf("\n)");

  printf("\n\n\n");

  exit( 0 );

}