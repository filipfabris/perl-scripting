# perl-scripting

## Task 3.
* for each hour of the day, print the server request access number:
``` bash perl zadatak3.pl logs.txt logs.txt```
* Output:
```
Datum: 2008-02-24
Sat : broj pristupa
-----:---------
00 : 198
01 : 124
02 : 30
03 : 100
04 : 30
05 : 54
06 : 66
07 : 22
08 : 78
09 : 166
10 : 548
11 : 522
12 : 440
13 : 766
14 : 650
15 : 420
16 : 656
17 : 692
18 : 472
19 : 840
20 : 972
21 : 1198
22 : 1230
23 : 1186
```

## Task 4.
* for each student, check that he/she has his/her exit key during the first hours of the laboratory session:
``` bash perl zadatak4.pl students.txt```
* Output:
```
0036436684 Lombarovic Mladen - PROBLEM: 2011-03-14 11:00 --> 2011-03-14 12:08:26
0036325839 Mato┼íic Luka - PROBLEM: 2011-03-14 11:00 --> 2011-03-15 11:49:26

```

## Task 5.
* Generate a ranking list of students:
``` bash perl zadatak5.pl ocjene.txt```
* Output:
```
Lista po rangu:
-------------------                       
1. Bagaric, Magdalena (0036438919) : 90.35
2. Bajer, Goran (0036439578) : 66.46      
3. Lombarovic, Mladen (0036436684) : 19.86

```

## Task 6.
* Count words with a common prefix:
``` bash perl zadatak6.pl prefix.txt 4```
* Output:
```
ozar : 1
stra : 1
umri : 3
noća : 3
noći : 1
dubi : 1
čelo : 1
plač : 2
moje : 3
duša : 1
samo : 1
pote : 1
zubl : 1
žari : 1
misl : 1
ljep : 1
vjed : 1
tiši : 1
```
