#!/usr/bin/perl
$CC="Coil|G3DSA:1.20.5.170|SSF57959";
$GNK2="PS51473|IPR002902";
$LRR="IPR032675|PF13855|SSF52058|SM00369|SM00365|PS51450|PF13855|PF13516|PF12799|PF08263|PF07725|PF00560|IPR013210|IPR011713|IPR003591|IPR001611";
$MLO="PF03094|IPR004326";
$NBS="PF00931|IPR002182";
$PTOL="G3DSA:3.30.200.20|G3DSA:1.10.510.10|G3DSA:3.30.200.20|PF07714|PS00107|SM00220|SSF56112|PS50011|PS00108|PS00107|IPR011009|IPR000719|IPR001245|IPR017441|IPR008271";
$RECEPL="SSF51110|PS50927|SM00108|IPR001480|G3DSA:2.90.10.10|IPR036426|PF01453|PS50927|IPR024171";
$RPW8="IPR008808|PS51153";
$SERTHRK="SM00219|G3DSA:3.30.200.20|IPR000719|IPR001245|IPR008271|IPR011009|IPR017441|IPR020635|IPR021820|IPR022126|PF00069|PF07714|PS00107|PS00108|PS50011|SM00219|SM00220|SSF56112";
$TIR="IPR000157|PF01582|PS50104|SM00255|SSF52200";
die "ERRO! isert the TSV archive\n Eg: ./RRG_DomainDetector.pl archive.tsv \n" unless @ARGV ==1;
($arquivo) = @ARGV[0];
open (IN,"<$arquivo") or die "ERRO! invalid file \n ";
close IN;
open (OUT,'>',"CC_dom.txt");
@cont=`cat @ARGV | egrep "$CC" `;
$i=0;
foreach $i(0..$#cont){
print OUT $cont[$i];
	$i=$i++;
}
close OUT;
open (OUT,'>',"GNK2_dom.txt");
@cont=`cat @ARGV | egrep "$GNK2" `;
$i=0;
foreach $i(0..$#cont){
print OUT $cont[$i];
	$i=$i++;
}
close OUT;
open (OUT,'>',"LRR_dom.txt");
@cont=`cat @ARGV | egrep "$LRR" `;
$i=0;
foreach $i(0..$#cont){
print OUT $cont[$i];
	$i=$i++;
}
close OUT;
open (OUT,'>',"MLO_dom.txt");
@cont=`cat @ARGV | egrep "$MLO" `;
$i=0;
foreach $i(0..$#cont){
print OUT $cont[$i];
	$i=$i++;
}
close OUT;
open (OUT,'>',"NBS_dom.txt");
@cont=`cat @ARGV | egrep "$NBS" `;
$i=0;
foreach $i(0..$#cont){
print OUT $cont[$i];
	$i=$i++;
}
close OUT;
open (OUT,'>',"PTOL_dom.txt");
@cont=`cat @ARGV | egrep "$PTOL" `;
$i=0;
foreach $i(0..$#cont){
print OUT $cont[$i];
	$i=$i++;
}
close OUT;
open (OUT,'>',"RECEPL_dom.txt");
@cont=`cat @ARGV | egrep "$RECEPL" `;
$i=0;
foreach $i(0..$#cont){
print OUT $cont[$i];
	$i=$i++;
}
close OUT;
open (OUT,'>',"RPW8_dom.txt");
@cont=`cat @ARGV | egrep "$RPW8" `;
$i=0;
foreach $i(0..$#cont){
print OUT $cont[$i];
	$i=$i++;
}
close OUT;
open (OUT,'>',"SERTHRK_dom.txt");
@cont=`cat @ARGV | egrep "$SERTHRK" `;
$i=0;
foreach $i(0..$#cont){
print OUT $cont[$i];
	$i=$i++;
}
close OUT;
open (OUT,'>',"TIR_dom.txt");
@cont=`cat @ARGV | egrep "$TIR" `;
$i=0;
foreach $i(0..$#cont){
print OUT $cont[$i];
	$i=$i++;
}
close OUT;	
