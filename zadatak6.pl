#!/usr/bin/perl
use open ':locale';
use locale;
use utf8;

my $prefLen = pop @ARGV;
my %counts;
my @lines;

# if there is no files in input read from STDIN
if(scalar @ARGV == 0) {
    @lines = <STDIN>;
    findPrefixes();
    # There is files in input
}else{
    my @files = @ARGV;
    foreach my $file (@files) {
        open(my $handle, "<:encoding(utf-8)", $file);
        chomp(@lines = <$handle>);
        close $handle;
        findPrefixes();
    }
}

# There is files in input

foreach my $prefix (keys %counts) {
    printf "%s : %d\n", $prefix, $counts{$prefix};
}

sub findPrefixes{
    foreach my $line (@lines) {
        chomp $line;
        my @words = split /\W+/, lc $line;
        foreach my $word (@words) {
            my $prefix = substr($word, 0, $prefLen);
            #if prefix size is smaler than prefLen then skip it
            if(length($prefix) < $prefLen){
                next;
            }
            $counts{$prefix}++;
        }
    }
}
