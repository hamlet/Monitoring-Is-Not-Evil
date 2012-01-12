EESchema Schematic File Version 2  date mer. 11 janv. 2012 23:56:44 CET
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:SymbolsSimilarEn60617-RevE4
LIBS:jee
LIBS:ampop-cache
EELAYER 25  0
EELAYER END
$Descr A4 11700 8267
encoding utf-8
Sheet 1 1
Title "First set-up for electret mic, using ampli-op"
Date "11 jan 2012"
Rev "1"
Comp ""
Comment1 "Electret part from http://www.arduino.cc/cgi-bin/yabb2/YaBB.pl?num=1263440809"
Comment2 "Ampli-op part from LM358 datasheet, first example"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L R R5
U 1 1 4F0E12C0
P 4700 3800
F 0 "R5" V 4780 3800 50  0000 C CNN
F 1 "68k" V 4700 3800 50  0000 C CNN
	1    4700 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 2400 2900 1900
Wire Wire Line
	4100 1850 4100 1900
Wire Wire Line
	4100 1900 2900 1900
Wire Wire Line
	4100 1550 3850 1550
Wire Wire Line
	3850 1550 3850 2850
Wire Wire Line
	3850 2850 5100 2850
Wire Wire Line
	5700 2900 5700 4050
Wire Wire Line
	4400 4050 4400 4300
Wire Wire Line
	5100 3650 5100 4300
Wire Wire Line
	4400 3550 4700 3550
Connection ~ 5700 3250
Wire Wire Line
	5700 4050 4700 4050
Connection ~ 4100 3150
Wire Wire Line
	4100 3550 4100 3150
Wire Wire Line
	4100 1950 4000 1950
Wire Wire Line
	5700 2400 5700 2250
Wire Wire Line
	4700 3150 3800 3150
Wire Wire Line
	3400 3150 2900 3150
Wire Wire Line
	2900 3550 2900 2900
Wire Wire Line
	2900 4450 2900 3900
Connection ~ 2900 3150
Connection ~ 2900 4300
Wire Wire Line
	4700 3550 4700 3350
Wire Wire Line
	4100 4300 4100 4050
Connection ~ 4100 4300
Wire Wire Line
	5100 4300 2900 4300
Connection ~ 4400 4300
Wire Wire Line
	4000 1950 4000 2250
Wire Wire Line
	4000 2250 5700 2250
Wire Wire Line
	3950 1800 3950 1750
Wire Wire Line
	3950 1750 4100 1750
$Comp
L PWR_FLAG #FLG01
U 1 1 4EF21551
P 2900 1900
F 0 "#FLG01" H 2900 1995 30  0001 C CNN
F 1 "PWR_FLAG" H 2900 2080 30  0000 C CNN
	1    2900 1900
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG02
U 1 1 4EF2153B
P 3850 1550
F 0 "#FLG02" H 3850 1645 30  0001 C CNN
F 1 "PWR_FLAG" H 3850 1730 30  0000 C CNN
	1    3850 1550
	1    0    0    -1  
$EndComp
$Comp
L JEEPORT P1
U 1 1 4EF21430
P 4450 1800
F 0 "P1" V 4400 1800 60  0000 C CNN
F 1 "JEEPORT" V 4500 1800 60  0000 C CNN
	1    4450 1800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 4EF2118F
P 3950 1800
F 0 "#PWR03" H 3950 1800 30  0001 C CNN
F 1 "GND" H 3950 1730 30  0001 C CNN
	1    3950 1800
	1    0    0    -1  
$EndComp
NoConn ~ 4100 1650
NoConn ~ 4100 2050
$Comp
L LM358N U1
U 1 1 4EF1EFBA
P 5200 3250
F 0 "U1" H 5150 3450 60  0000 L CNN
F 1 "LM358N" H 5150 3000 60  0000 L CNN
	1    5200 3250
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 4EF1F07A
P 2900 2650
F 0 "R1" V 2980 2650 50  0000 C CNN
F 1 "10k" V 2900 2650 50  0000 C CNN
	1    2900 2650
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 4EF1F076
P 5700 2650
F 0 "R2" V 5780 2650 50  0000 C CNN
F 1 "10k" V 5700 2650 50  0000 C CNN
	1    5700 2650
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 4EF1F073
P 4400 3800
F 0 "R4" V 4480 3800 50  0000 C CNN
F 1 "0.1k" V 4400 3800 50  0000 C CNN
	1    4400 3800
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 4EF1F070
P 4100 3800
F 0 "R3" V 4180 3800 50  0000 C CNN
F 1 "10k" V 4100 3800 50  0000 C CNN
	1    4100 3800
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 4EF1F01B
P 3600 3150
F 0 "C1" H 3650 3250 50  0000 L CNN
F 1 "10µF" H 3650 3050 50  0000 L CNN
	1    3600 3150
	0    1    1    0   
$EndComp
$Comp
L ELECTRET_REVE_DATE15JUN2010 MIC1
U 1 1 4EF1EF27
P 2900 3700
F 0 "MIC1" H 2900 3850 30  0000 C CNN
F 1 "ELECTRET" H 2900 3550 30  0000 C CNN
	1    2900 3700
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR04
U 1 1 4EF1E149
P 2900 4450
F 0 "#PWR04" H 2900 4450 30  0001 C CNN
F 1 "GND" H 2900 4380 30  0001 C CNN
	1    2900 4450
	1    0    0    -1  
$EndComp
$EndSCHEMATC
