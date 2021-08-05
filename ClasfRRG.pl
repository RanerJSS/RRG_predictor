#!/usr/bin/perl
use List::Compare;
$SERTHR=`cat SERTHRK_dom.txt`; ###Ser-thr
@Ser=split ("\n", $SERTHR);
foreach $i(0..$#Ser){
	@serID= split("\t",$Ser[$i]);
$i=$i++;
push ( @ { $hser{$serID[0]."\n"} }, $Ser[$i] );
}
$NBS=`cat NBS_dom.txt`; ###NBS
@nbsD=split ("\n", $NBS);
foreach $i(0..$#nbsD){
	@nbsID= split("\t",$nbsD[$i]);
$i=$i++;
push ( @ { $hnbs{$nbsID[0]."\n"} }, $nbsD[$i] );
}
$CCD=`cat CC_dom.txt`; ####CC
@CC=split ("\n", $CCD);
foreach $i(0..$#CC){
	@CCID= split("\t",$CC[$i]);
$i=$i++;
push ( @ { $hcoil{$CCID[0]."\n"} }, $CC[$i] );
}
$GNK2=`cat GNK2_dom.txt`; ####GNK2
@GNK2D=split ("\n", $GNK2);
foreach $i(0..$#GNK2D){
	@GNK2ID= split("\t",$GNK2D[$i]);
$i=$i++;
push ( @ { $hgnk2{$GNK2ID[0]."\n"} }, $GNK2D[$i] );
}
$RECEPL=`cat RECEPL_dom.txt`; ####Receptor like
@RECEPLD=split ("\n", $RECEPL);
foreach $i(0..$#RECEPLD){
	@RECEPLID= split("\t",$RECEPLD[$i]);
$i=$i++;
push ( @ { $hrecepl{$RECEPLID[0]."\n"} }, $RECEPLD[$i] );
}
$LRR=`cat LRR_dom.txt`; ####LRR
@LRRD=split ("\n", $LRR);
foreach $i(0..$#LRRD){
	@LRRID= split("\t",$LRRD[$i]);
$i=$i++;
push ( @ { $hlrr{$LRRID[0]."\n"} }, $LRRD[$i] );
}
$MLO=`cat MLO_dom.txt`; ###MLO
@MLOD=split ("\n", $MLO);
foreach $i(0..$#MLOD){
	@MLOID= split("\t",$MLOD[$i]);
$i=$i++;
push ( @ { $hmlo{$MLOID[0]."\n"} }, $MLOD[$i] );
}
$PTOL=`cat PTOL_dom.txt`; ####ptolike
@PTOLD=split ("\n", $PTOL);
foreach $i(0..$#PTOLD){
	@PTOLID= split("\t",$PTOLD[$i]);
$i=$i++;
push ( @ { $hptol{$PTOLID[0]."\n"} }, $PTOLD[$i] );
}
$RPW8=`cat RPW8_dom.txt`; ####Rpw8
@RPW8D=split ("\n", $RPW8);
foreach $i(0..$#RPW8D){
	@RPW8ID= split("\t",$RPW8D[$i]);
$i=$i++;
push ( @ { $hrpw8{$RPW8ID[0]."\n"} }, $RPW8D[$i] );
}
$TIR=`cat TIR_dom.txt`; ####TIR
@TIRD=split ("\n", $TIR);
foreach $i(0..$#TIRD){
	@TIRID= split("\t",$TIRD[$i]);
$i=$i++;
push ( @ { $htir{$TIRID[0]."\n"} }, $TIRD[$i] );
}
@Lser=keys %hser;
@Lnbs=keys %hnbs;
@Lcois=keys %hcoil;
@Lgnk2=keys %hgnk2;
@Lrecepl=keys %hrecepl;
@LLRR=keys %hlrr;
@Lmlo=keys %hmlo;
@Lptol=keys %hptol;
@Lrpw8=keys %hrpw8;
@Ltir=keys %htir;
open (OUT,'>',"MLO_class.txt"); #### MLO ####
print OUT keys %hmlo;
close OUT;
$CN = List::Compare->new(\@Lcois, \@Lnbs);
@in1CN = $CN->get_intersection;
$CN1 = List::Compare->new(\@in1CN, \@LLRR);
@inCN = $CN1->get_unique; ####CN####
$CNL = List::Compare->new(\@Lcois, \@Lnbs, \@LLRR);
@inCNL = $CNL->get_intersection;#####CNL#####
$uNL = List::Compare->new(\@Lnbs, \@LLRR);
@uinNL = $uNL->get_intersection;
$NL = List::Compare->new(\@uinNL, \@Lcois);
@inNL = $NL->get_unique;#####NL#####
$RPW8NL = List::Compare->new(\@Lrpw8, \@Lnbs, \@LLRR);
@inRPW8NL = $RPW8NL->get_intersection;#####RPW8NL#####
$TN = List::Compare->new(\@Ltir, \@Lnbs);
@inTN = $TN->get_intersection;#####TN#####
$TNL = List::Compare->new(\@Ltir, \@Lnbs, \@LLRR);
@inTNL = $TNL->get_intersection;#####TNL#####
$RLK = List::Compare->new(\@Lrecepl, \@Lser);
@inRLK = $RLK->get_intersection;#####RLK#####
$RLKGNK2 = List::Compare->new(\@Lser, \@Lgnk2);
@inRLKGNK2 = $RLKGNK2->get_intersection;######RKLGNK2#####
$RLP = List::Compare->new(\@Lptol,\@Lser);
@inRLP = $RLP->get_unique;#####RLP#####
################################# Comparar #######################################
$T = List::Compare->new(\@Ltir, \@inTN, \@inTNL);
@inT = $T->get_unique;#####T#####
$N = List::Compare->new(\@Lnbs, \@inCN, \@inCNL, \@inNL, \@Lrpw8, \@inTN, \@inTNL);
@uniN = $N->get_unique; ####OK####
$faCN = List::Compare->new(\@in1CN, \@inCNL, \@inNL, \@uniN, \@Lrpw8, \@inTN, \@inTNL);
@famCN= $faCN->get_unique;####ok#####
$faCNL = List::Compare->new(\@inCNL, \@inCN, \@inNL, \@Lrpw8, \@inTNL, \@inTN, \@inRLK, \@inRLP);
@famCNL = $faCNL->get_unique;####ok#####
$faNL = List::Compare->new(\@inNL, \@inCN, \@inRLK, \@inRLP, \@Lrpw8, \@inTN, \@inTNL);
@famNL = $faNL->get_unique;####ok####
$faRLK = List::Compare->new(\@inRLK, \@inRLKGNK2, \@inRLP, \@Lrpw8, \@inCN, \@inCNL);
@famRLK = $faRLK->get_unique;#####ok#####
$faRLKGNK2 = List::Compare->new(\@inRLKGNK2, \@inRLP, \@inRLK);
@famRLKGNK2 = $faRLKGNK2->get_unique;#####ok####
$faRLP = List::Compare->new(\@inRLP, \@inRLK, \@inRLKGNK2, \@inCNL, \@inNL, \@Lrpw8, \@inTNL, \@Lser);
@famRLP = $faRLP->get_unique;######ok######
$faRPW8NL = List::Compare->new(\@Lrpw8, \@inCN, \@inTNL, \@uniN, \@inNL, \@inRLK, \@inRLP );
@famRPW8NL = $faRPW8NL->get_unique;#####ok#####
$faTN = List::Compare->new(\@inTN, \@inT, \@inRPW8NL, \@inNL, \@uniN, \@inCN, \@inCNL);
@famTN = $faTN->get_unique;####ok#####
$faTNL = List::Compare->new(\@inTNL, \@inCN, \@inCNL, \@uniN, \@inRLK, \@inRLP, \@inRPW8NL);
@famTNL = $faTNL->get_unique;####ok####
$faUNKNOWN = List::Compare->new(\@LLRR, \@inCNL, \@inNL, \@inRLK, \@inRLP, \@inRPW8NL, \@inTNL);
@famUNKNOWN = $faUNKNOWN->get_unique;
#################################### Imprimindo #########################################
open (OUT,'>',"T_class.txt");
foreach $i(0..$#inT){
	print OUT $inT[$i];
	$i=$i++
}
close OUT;
open (OUT,'>',"N_class.txt");
foreach $i(0..$#uniN){
	print OUT $uniN[$i];
	$i=$i++
}
close OUT;
open (OUT,'>',"CN_class.txt");
foreach $i(0..$#famCN){
	print OUT $famCN[$i];
	$i=$i++
}
close OUT;
open (OUT,'>',"CNL_class.txt");
foreach $i(0..$#famCNL){
	print OUT $famCNL[$i];
	$i=$i++
}
close OUT;
open (OUT,'>',"NL_class.txt");
foreach $i(0..$#famNL){
	print OUT $famNL[$i];
	$i=$i++
}
close OUT;
open (OUT,'>',"RLK_class.txt");
foreach $i(0..$#famRLK){
	print OUT $famRLK[$i];
	$i=$i++
}
close OUT;
open (OUT,'>',"RLKGNK2_class.txt");
foreach $i(0..$#famRLKGNK2){
	print OUT $famRLKGNK2[$i];
	$i=$i++
}
close OUT;
open (OUT,'>',"RLP_class.txt");
foreach $i(0..$#famRLP){
	print OUT $famRLP[$i];
	$i=$i++
}
close OUT;
open (OUT,'>',"RPW8NL_class.txt");
foreach $i(0..$#famRPW8NL){
	print OUT $famRPW8NL[$i];
	$i=$i++
}
close OUT;
open (OUT,'>',"TN_class.txt");
foreach $i(0..$#famTN){
	print OUT $famTN[$i];
	$i=$i++
}
close OUT;
open (OUT,'>',"TNL_class.txt");
foreach $i(0..$#famTNL){
	print OUT $famTNL[$i];
	$i=$i++
}
close OUT;
open (OUT,'>',"UNKNOWN_class.txt");
foreach $i(0..$#famUNKNOWN){
	print OUT $famUNKNOWN[$i];
	$i=$i++
}
close OUT;
