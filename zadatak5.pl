#!/usr/bin/perl

my $path_to_file = shift @ARGV;

my @lines = ();
open $handle, '<', $path_to_file;
chomp(@lines = <$handle>);
close $handle;


my @inputs;
my @students;

foreach my $line (@lines) {
    chomp($line);

    if ($line =~ /^\s*$/) {
        next;
    }

    if ($line =~ /^\s*#/) {
        next;
    }

    push(@inputs, $line);
}

#First line is 0.15;0.20;0.30;0.10;0.10;0.10;0.05
my @components;
my $tmp = shift @inputs;
@components = split(';', $tmp);

foreach my $input (@inputs) {

    # Read the student data
    my @fields = split(';', $input);
    my $jmbag = $fields[0];
    my $surename = $fields[1];
    my $name = $fields[2];
    my @scores = @fields[3 .. $#fields];

    # Replace missing scores with 0
    for my $i (0 .. $#scores) {
        if ($scores[$i] eq '-') {
            $scores[$i] = 0;
        }
    }

    # Compute the total score
    my $total = 0;
    for my $i (0 .. $#components) {
        $total += $components[$i] * $scores[$i];
    }

    #Student object inside students array
    push @students, {
        jmbag    => $jmbag,
        surename => $surename,
        name  => $name,
        total => $total,
    };
}

# Sort the students by total score
@students = sort {$first->{total} <=> $second->{total}} @students;

# Print the ranking list
print "Lista po rangu:\n";
print "-------------------\n";
my $rank = 1;
for my $student (@students) {
    printf "%d. %s, %s (%s) : %.2f\n", $rank, $student->{surename}, $student->{name}, $student->{jmbag}, $student->{total};
    $rank++;
}
