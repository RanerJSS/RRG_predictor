# RRG_predictor
RRGPredictor is a texmining-based tool for predicting molecular pattern receptors (PRRs) and R proteins
By: Raner José Santana Silva - SILVA.R.J.S

If you use RRG_predictor please cite: 

SILVA, Raner José Santana; MICHELI, Fabienne. RRGPredictor, a set-theory-based tool for predicting pathogen-associated molecular pattern receptors (PRRs) and resistance (R) proteins from plants. Genomics, 2020.

Silva, Raner José Santana, and Fabienne Micheli. "RRGPredictor, a set-theory-based tool for predicting pathogen-associated molecular pattern receptors (PRRs) and resistance (R) proteins from plants." Genomics (2020).

Silva, R. J. S., & Micheli, F. (2020). RRGPredictor, a set-theory-based tool for predicting pathogen-associated molecular pattern receptors (PRRs) and resistance (R) proteins from plants. Genomics.

https://doi.org/10.1016/j.ygeno.2020.03.001


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



