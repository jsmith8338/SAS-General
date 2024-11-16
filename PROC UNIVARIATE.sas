/* PROC UNIVARIATE */
/* Creates a univariate analysis of variable(s) listed */

* Basic univariate *;
* plot option - creates a plot chart of the possible values in the dataset for that variable *;
* histogram option - creates a histogram (HTML) of the possible values in the dataset for that variable *;
proc univariate data=zipdiff plot;
var agediffmean;
histogram agediffmean;
run;

* proc option - won't cut off graphs, automatically centers;
options=nocenter; 	

* Output the percentages in 5% incrementals to a dataset and run a means to understand the cutoffs *;
proc univariate data=TTS.Analysis_File plot;
where Segment = "Consumer" and TotalSpend2017>0;
var TotalSpend2017;
output out=Cons_2017 pctlpre=P_ pctlpts=0 to 100 by 5;
histogram;
run;

proc means max; run;
