package zadatak1;

print("Unesite ulaz: ");
$line = <STDIN>;

print("Unesite broj ponavljanjima: ");
$number = <STDIN>;

for (my $i = 0; $i < $number; $i++) {
    print($line);
}
