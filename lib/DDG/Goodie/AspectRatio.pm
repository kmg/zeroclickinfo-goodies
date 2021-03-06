package DDG::Goodie::AspectRatio;
# ABSTRACT: Calculates aspect ratio based on previously defined one

use DDG::Goodie;

triggers start => "aspect ratio";

zci is_cached => 1;
zci answer_type => "aspect_ratio";

primary_example_queries 'aspect ratio 4:3 640:?';
description 'complete the missing value with a given ratio';
name 'AspectRatio';
code_url 'https://github.com/duckduckgo/zeroclickinfo-goodies/blob/master/lib/DDG/Goodie/AspectRatio.pm';
category 'calculations';
topics 'math';
attribution github => [ 'https://github.com/mrshu', 'mrshu' ],
            twitter => [ 'https://twitter.com/mr__shu', 'mr__shu' ];

handle remainder => sub {
    my $input = $_;
    my $result = 0;
    my $ratio = 0;

    if ($input =~ /^(\d+(?:\.\d+)?)\s*\:\s*(\d+(?:\.\d+)?)\s*(?:(?:(\?)\s*:\s*(\d+(?:\.\d+)?))|(?:(\d+(?:\.\d+)?)\s*:\s*(\?)))$/){
        $ratio = $1 / $2;

        if ($6 && $6 eq "?") {
            $result = $5 / $ratio;
            return "Aspect ratio: $5:$result ($1:$2)";
        } elsif ($3 && $3 eq "?") {
            $result = $4 * $ratio;
            return "Aspect ratio: $result:$4 ($1:$2)";
        }
    }
    return;
};

1;
