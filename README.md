# RRG_predictor
RRGPredictor is a texmining-based tool for predicting molecular pattern receptors (PRRs) and R proteins
By: Raner José Santana Silva - SILVA.R.J.S


**Note**

this scripti use the List::Compare perl module (https://metacpan.org/pod/List::Compare)

for instalation of List::Compare module use:
```sh
$ sudo cpan -i List::Compare
```
This tool use a InterProScan output analysis in TSV format.

**Runnign RRG_predictor test**

Unzip the Arabidopsis_thaliana.TAIR10.pep.all.fa.rar file to the same folder as the RRG_DomainDetect.pl and ClasfRRG.pl scripts
```sh
$ perl RRG_DomainDetect.pl Arabidopsis_thaliana.TAIR10.pep.all.fa.tsv

$ perl ClasfRRG.pl
```
 **How to use RRG_predictor**
 
Place the .tsv file in the same folder as the RRG_DomainDetect.pl and ClasfRRG.pl scripts.
```sh
$ perl RRG_DomainDetect.pl *.tsv

$ perl ClasfRRG.pl
```
The lists will be generated for each class in txt format.



