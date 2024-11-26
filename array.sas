 /* do over */
 array areverse 
	cesd4 cesd8 cesd12 cesd16;
 do over areverse;
 areverse=3-areverse;
 end;

 /*4 Types of Do Loops
Do Index - Iterative
Do Until - until a condition is satisfied
Do While - while a condition is satisfied
Do Over - over all elements in array
*/

/* General Setup:
ARRAY arrayname {n} [$] [length] list_of_array_elements;

arrayname - a valid SAS name that is not a variable name in the data set
{n} - the number of elements in the array (optional)
[$] - if all elements in array are character, the default type is numeric (optional)
[length] - used to define the length of new variables being created in the array (optional)
list_of_array_elements - list of variables of the same type to be included in the array (have to ALL be the same type)
*/

/******** INDEX/ITERATIVE *******/
array testarray $ HSDIAG1-HSDIAG26;
do i=1 to 26;
if substr(testarray[i],i,3) in ('410','412') then hccimi=1;
end;

/******* WHILE *******/
hccimi=0;
i = 1; /* counter to start at the first element of the array */
array testarray $ HSDIAG1-HSDIAG26;
do while (hccimi=0 and i<27);
if substr(testarray[i],i,3) in ('410','412') then hccimi=1;
i=i+1; /* incrementa i to go to the next element of the array */
end;

/******* UNTIL *******/
hccimi=0;
i = 1; /* counter to start at the first element of the array */
array testarray $ HSDIAG1-HSDIAG26;
do until (hccimi=1 or i=27);
if substr(testarray[i],i,3) in ('410','412') then hccimi=1;
i=i+1; /* incrementa i to go to the next element of the array */
end;

/****** OVER ******/
/*
array arrayname [$] [length] list_of_array_elements;

arrayname - valid SAS name not a variable name in the dataset
[$] - if all elements in array are character, the default type is numeric (optional)
[length] - used to define the length of new variables being created in the array (optional)
list_of_array_elements - list of variables of the same type to be included in the array (have to ALL be the same type)

WARNING:
EACH array must have SAME number of elements, and when assigning values from elements of one array to elements of another 
array, MUST make sure elements are in the correct corresponding order in both arrays
*/

array adiag hsdiag1-hsdiag26;

array ahsdiag $ HSDIAG1-HSDIAG26;
do over ahsdiag;
if substr(ahsdiag[i],i,3) in ('410','412') then hccimi=1;
end;

/* Adjusts a Short and Wide file to a Long and Skinny file for each interaction combo */
/* In this example - by animal and group */
array aufr ...;
array ana ...;
array ak ...;
do i=1 to 7;
	timept=(i-1)*30;
	ufr=aufr[i];
	na=ana[i];
	k=ak[i];
	output; /* moves the short-wide to long-skinny after each interation */
end;
keep animal group timept ufr na k;
run;


