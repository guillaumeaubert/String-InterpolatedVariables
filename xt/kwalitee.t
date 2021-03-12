#!perl

use strict;
use warnings;

use Test::More;
use Test::Needs qw( Test::Kwalitee::Extra );

# Run extra tests.
Test::Kwalitee::Extra->import(
    qw(
        :optional
    )
);

## no critic (InputOutput::RequireCheckedSyscalls)
# Clean up the additional file Test::Kwalitee::Extra generates.
END {
    unlink 'Debian_CPANTS.txt'
        if -e 'Debian_CPANTS.txt';
}
