#!/usr/bin/perl

my $path_to_file = "";
my @lines = ();

# Read files from input and store them in an array
for(my $i = 0; $i < @ARGV; $i++) {
    $path_to_file = $ARGV[$i];
    open $handle, '<', $path_to_file;
    chomp(@tmp = <$handle>);
    push @lines, @tmp;
    close $handle;
}


my %dictionary;

# Parse log files
foreach my $line (@lines) {
    # print("$line\n");
    my ($date, $hour) = ($line =~ /^\S+ - - \[(\d+\/\w+\/\d+):(\d+).+/);
    $date = convert_date($date);
    $hour = int($hour);
    $dictionary{$date}{$hour}++;
}

# Print final summary
print_summary(%dictionary);

sub print_summary {
    my (%dictionary) = @_;

    foreach my $date (sort keys %dictionary) {
        print("Datum: $date\n");
        print("Sat : broj pristupa\n");
        print("-----:---------\n");

        foreach my $hour (0..23) {
            $accesses = $dictionary{$date}{$hour};
            printf("%02d : %d\n", $hour, $accesses);
        }
        print("\n");
    }

}

sub convert_date {
    my ($date) = @_;
    my ($day, $month, $year) = split /\//, $date;
    my %months = (
        Jan => 1,
        Feb => 2,
        Mar => 3,
        Apr => 4,
        May => 5,
        Jun => 6,
        Jul => 7,
        Aug => 8,
        Sep => 9,
        Oct => 10,
        Nov => 11,
        Dec => 12,
    );
    return sprintf("%04d-%02d-%02d", $year, $months{$month}, $day);
}
