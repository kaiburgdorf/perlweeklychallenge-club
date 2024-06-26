#!perl

###############################################################################
=comment

Perl Weekly Challenge 169
=========================

TASK #1
-------
*Brilliant Numbers*

Submitted by: Mohammad S Anwar

Write a script to generate first 20 Brilliant Numbers.

    Brilliant numbers are numbers with two prime factors of the same length.

The number should have _exactly_ two prime factors, i.e. it’s the product of
two primes of the same length.

For example,

  24287 = 149 x 163
  24289 = 107 x 227

  Therefore 24287 and 24289 are 2-brilliant numbers.
  These two brilliant numbers happen to be consecutive as there are no even
  brilliant numbers greater than 14.

Output

  4, 6, 9, 10, 14, 15, 21, 25, 35, 49, 121, 143, 169, 187, 209, 221, 247, 253,
  289, 299

=cut
###############################################################################

#--------------------------------------#
# Copyright © 2022 PerlMonk Athanasius #
#--------------------------------------#

#==============================================================================
=comment

Note
----
If an n-brilliant number is defined as a product of n primes of the same length
(i.e., of the same number of digits when represented in base 10), then this
Task is a search for 2-brilliant numbers. [2]

Algorithm
---------
The number of brilliant numbers required is specified in the constant $TARGET.
Although the number is given as 20 in the Task description, I have designed the
solution to accommodate larger numbers by making the generation of primes open-
ended.

Prime numbers are generated by get_primes(), which receives as input the number
of digits required, and returns a sorted list of all the primes with that num-
ber of digits. get_primes() uses a sieve of Eratosthenes, which on subsequent
calls is extended as needed.

The algorithm *constructs* brilliant numbers by producing all possible combina-
tions of prime numbers of a given number of digits. As the brilliant numbers
are produced out-of-order, they must be sorted to produce the required solu-
tion. However, note that when the number of digits per prime number increases,
the smallest new brilliant number is necessarily larger than the previously-
largest one; e.g., 101² > 97². Therefore, when a given number of prime digits
produces a total number of brilliant numbers greater than or equal to $TARGET,
no further generation of brilliant numbers is needed.

Reference
---------
[1] "A078972  Brilliant numbers: semiprimes (products of two primes, A001358)
     whose prime factors have the same number of decimal digits.", OEIS,
     https://oeis.org/A078972
[2]  Dario Alpern, "Brilliant numbers",
     https://www.alpertron.com.ar/BRILLIANT.HTM

=cut
#==============================================================================

use strict;
use warnings;
use feature         qw( state );
use Const::Fast;
use List::MoreUtils qw( after_incl );

const my $TARGET =>  20;
const my $USAGE  => "Usage:\n  perl $0\n";

#------------------------------------------------------------------------------
BEGIN
#------------------------------------------------------------------------------
{
    $| = 1;
    print "\nChallenge 169, Task #1: Brilliant Numbers (Perl)\n\n";
}

#==============================================================================
MAIN:
#==============================================================================
{
    my $args = scalar @ARGV;
       $args == 0 or die 'ERROR: Expected 0 command line arguments, found ' .
                         "$args\n$USAGE";

    my @brilliant;

    for (my $digits = 1; scalar @brilliant < $TARGET; ++$digits)
    {
        my $primes = get_primes( $digits );

        for my $p (@$primes)
        {
            for my $q (after_incl { $_ == $p } @$primes)
            {
                push @brilliant, $p * $q;
            }
        }
    }

    @brilliant = sort { $a <=> $b } @brilliant;

    printf "The first %d brilliant numbers:\n%s\n",
            $TARGET, join ', ', @brilliant[ 0 .. $TARGET - 1 ];
}

#------------------------------------------------------------------------------
sub get_primes                               # Extensible sieve of Eratosthenes
#------------------------------------------------------------------------------
{
    my   ($digits)  = @_;
    my    $max_idx  = 10 ** $digits - 1;
    state @sieve    = ((0, 0), (1) x ($max_idx - 1));
    my    $orig_end = $#sieve;
    state $first    = 1;

    if ($first || $max_idx > $orig_end)
    {
        push @sieve, (1) x ($max_idx - $orig_end) if !$first;    # Extend sieve

        for my $i (0 .. int sqrt $max_idx)
        {
            if ($sieve[ $i ])                                    # Prime
            {
                my $start = $first ? 2 : int( ($orig_end + 1) / $i );

                for my $j ($start .. int( $max_idx / $i ))
                {
                    $sieve[ $i * $j ] = 0;                       # Composite
                }
            }
        }

        $first = 0;
    }

    # @range contains all integers of the required number of digits:
    # e.g., if $digits = 2 then @range = 10 .. 99

    my @range = 10 ** ($digits - 1) .. $max_idx;

    return [ grep { $sieve[ $_ ] } @range ];                  # Apply the sieve
}

###############################################################################
