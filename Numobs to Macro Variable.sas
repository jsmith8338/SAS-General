/* Determine number of observations on dataset for later calculations */
%let dsid=%sysfunc(open(all,i)); 
%let numobs=%sysfunc(attrn(&dsid,nobs));
%put Number of observations is &numobs..;
