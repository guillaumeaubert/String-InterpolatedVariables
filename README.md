# NAME

String::InterpolatedVariables - Extract variable names from interpolated strings.

# VERSION

version 2.000000

# SYNOPSIS

        use String::InterpolatedVariables;

        my $variables = String::InterpolatedVariables::extract(
                'A $test->{string} from a PPI::Token::Quote::Double $object.'
        );

        # $variables now contains:
        # [
        #     '$test->{string}',
        #     '$object',
        # ]

# DESCRIPTION

String::InterpolatedVariables offers a way to extract the name of the variables
that are present in interpolated strings.

This is particularly useful if you are using [PPI](https://metacpan.org/pod/PPI) to parse Perl documents,
and you want to know what variables would be interpolated inside the
[PPI::Token::Quote::Double](https://metacpan.org/pod/PPI%3A%3AToken%3A%3AQuote%3A%3ADouble) and [PPI::Token::Quote::Interpolate](https://metacpan.org/pod/PPI%3A%3AToken%3A%3AQuote%3A%3AInterpolate) objects you
find there. A practical example of this use can be found in
[Perl::Critic::Policy::ValuesAndExpressions::PreventSQLInjection](https://metacpan.org/pod/Perl%3A%3ACritic%3A%3APolicy%3A%3AValuesAndExpressions%3A%3APreventSQLInjection).

# FUNCTIONS

## extract()

Extract variables from interpolated strings.

        my $variables = String::InterpolatedVariables::extract(
                'A $test->{string} from a PPI::Token::Quote::Double $object.'
        );

        # $variables now contains:
        # [
        #     '$test->{string}',
        #     '$object',
        # ]

Note that you need to pass the text of the string, even if the string itself is
destined to be interpolated. In other words, passing `"Test $test"` would not
find any variables, as `$test` would get interpolated by Perl before the
string is passed to the `extract()` function. This function is thus more
useful if you are using using a tool such as [PPI](https://metacpan.org/pod/PPI) to read Perl code, since
PPI will give you access to the text of the string itself for strings that
would otherwise be interpolated during execution.

# BUGS

Please report any bugs or feature requests through the web interface at
[https://github.com/guillaumeaubert/String-InterpolatedVariables/issues](https://github.com/guillaumeaubert/String-InterpolatedVariables/issues).
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

# SUPPORT

You can find documentation for this module with the perldoc command.

        perldoc String::InterpolatedVariables

You can also look for information at:

- GitHub (report bugs there)

    [https://github.com/oalders/String-InterpolatedVariables/issues](https://github.com/oalders/String-InterpolatedVariables/issues)

- MetaCPAN

    [https://metacpan.org/release/String-InterpolatedVariables](https://metacpan.org/release/String-InterpolatedVariables)

# AUTHOR

Guillaume Aubert <aubertg@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Guillaume Aubert.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
