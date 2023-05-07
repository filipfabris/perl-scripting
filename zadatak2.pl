#!/usr/bin/perl

print("Upisite niz brojeva odvojenih razmakom: ");

$line = <STDIN>;

@polje = split(" ", $line);

$sum = 0;
foreach $broj (@polje) {
    $sum += $broj;
}
$avg = $sum / @polje;

print("Suma: $sum\n");
print("Prosjek: $avg\n");
