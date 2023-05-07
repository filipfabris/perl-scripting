#!/usr/bin/perl
use List::Util qw(min);

$path_to_file = "";
my @lines = ();
# Read files from input and store them in an array
for($i = 0; $i < @ARGV; $i++) {
    $path_to_file = $ARGV[$i];
    open $handle, '<', $path_to_file;
    chomp(@tmp = <$handle>);
    push @lines, @tmp;
    close $handle;
}

# Print the array
# foreach $line (@lines) {
#     print "$line\n";
# }

#Skip first line
shift @lines;

for (my $i = 0; $i < @lines; $i++) {
    my $line = $lines[$i];
    my ($jmbag, $prezime, $ime, $termin, $zakljucano) = $line =~ /^(.+);(.+);(.+);(\d+-\d+-\d+ \d+:\d+ \d+:\d+).*;(\d+-\d+-\d+ \d+:\d+:\d+)$/;
    # print("$jmbag $prezime $ime $termin $zakljucano\n")

    my @tmp = split(/ /, $termin);
    $termin = $tmp[0] . " " . $tmp[1];

    if (closedOnTime($termin, $zakljucano) == 0) {
        printf("%s %s %s - PROBLEM: %s --> %s\n", $jmbag, $prezime, $ime, $termin, $zakljucano)
    }
}

#Check if $termin is in the past from $zakljucano
sub closedOnTime(){
    my ($termin, $zakljucano) = @_;
    my @period1 = split(/ /, $termin);
    my @period2 = split(/ /, $zakljucano);

    my @date1 = split(/-/, $period1[0]);
    my @date2 = split(/-/, $period2[0]);

    for($i = 0; $i < @date1; $i++) {
        if ($date1[$i] < $date2[$i]) {
            return 0;
        }
    }

    my @time1 = split(/:/, $period1[1]);
    my @time2 = split(/:/, $period2[1]);

    # my $size = min(scalar(@time1), scalar(@time2));

    # for($i = 0; $i < $size; $i++) {
    #     if ($time1[$i] > $time2[$i]) {
    #         last;
    #     }elsif($time1[$i] == $time2[$i]){
    #         next;
    #     }
    #     return 0;
    # }

    my $a = int($time1[0]) + 1;
    my $b = int($time2[0]);
    if($a <= $b) {
        return 0;
    }
    return 1;
}

