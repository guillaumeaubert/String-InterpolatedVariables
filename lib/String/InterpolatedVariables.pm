package String::InterpolatedVariables;

use strict;
use warnings;

use Readonly;


=head1 NAME

String::InterpolatedVariables - extract variable names from interpolated strings.


=head1 VERSION

Version 1.0.0

=cut

our $VERSION = '1.0.0';


Readonly::Scalar my $VARIABLES_REGEX => qr/
	# Ignore escaped sigils, since those wouldn't get interpreted as variables to interpolate.
	(?<!\\)
	# Allow literal, non-escapy backslashes.
	(?:\\\\)*
	(
		# The variable needs to start with a sigil.
		[\$\@]
		# Account for the dereferencing, such as "$$" or "@$".
		\$?
		# Variable name.
		(?:
			# Note: include '::' to support package variables here.
			\{(?:\w+|::)\} # Explicit {variable} name.
			|
			(?:\w|::)+     # Variable name.
		)
		# Catch nested data structures.
		(?:
			# Allow for a dereferencing ->.
			(?:->)?
			# Can be followed by either a hash or an array.
			(?:
				\{(?:\w+|'[^']+'|"[^"]+")\}  # Hash element.
				|
				\[['"]?\d+['"]?\]            # Array element.
			)
		)*
	)
/x;


=head1 FUNCTIONS


=head1 BUGS

Please report any bugs or feature requests through the web interface at
L<https://github.com/guillaumeaubert/String-InterpolatedVariables/issues>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

	perldoc String::InterpolatedVariables


You can also look for information at:

=over 4

=item * GitHub (report bugs there)

L<https://github.com/guillaumeaubert/String-InterpolatedVariables/issues>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/String-InterpolatedVariables>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/String-InterpolatedVariables>

=item * MetaCPAN

L<https://metacpan.org/release/String-InterpolatedVariables>

=back


=head1 AUTHOR

L<Guillaume Aubert|https://metacpan.org/author/AUBERTG>,
C<< <aubertg at cpan.org> >>.


=head1 COPYRIGHT & LICENSE

Copyright 2014 Guillaume Aubert.

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License version 3 as published by the Free
Software Foundation.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program. If not, see http://www.gnu.org/licenses/

=cut

1;
