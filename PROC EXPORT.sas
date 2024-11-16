/* PROC EXPORT */
/* Exports a SAS dataset into a flat file of your choice */

* exports a dataset to .csv file *;
proc export data=fileprep
	outfile='c:\temp\score_world.csv'
	dbms=CSV
	replace;
run;

* exports a dataset to a tab-delimited file *;
PROC EXPORT DATA= WORK.NMORD 
            OUTFILE= "h:\testing.txt" 
            DBMS=TAB REPLACE;
     PUTNAMES=YES;
RUN;


/* DBMS POSSIBILITIES */
* option is in quotes that should be used in the dbms statement *;
"ACCESS" Microsoft Access 2000 or 2002 table .mdb Microsoft Windows * 2000 
"ACCESS97" Microsoft Access 97 table .mdb Microsoft Windows * 97 
"ACCESSCS" Microsoft Access table .mdb UNIX 2000** 
"CSV" delimited file (comma-separated values) .csv OpenVMS Alpha, UNIX, Microsoft Windows 
"DBF" dBASE 5.0, IV, III+, and III files .dbf UNIX, Microsoft Windows 5.0 
"DLM" delimited file (default delimiter is a blank) .* OpenVMS Alpha, UNIX, Microsoft Windows 
"EXCEL" Excel 97 or 2000 or 2002 spreadsheet .xls Microsoft Windows * 97 
"EXCEL4" Excel 4.0 spreadsheet .xls Microsoft Windows 4.0 
"EXCEL5" Excel 5.0 or 7.0 (95) spreadsheet .xls Microsoft Windows 5.0 
"EXCELCS" Excel spreadsheet .xls UNIX 97** 
"JMP" JMP table .jmp UNIX, Microsoft Windows 
"PCFS" Files on PC server .* UNIX 
"TAB" delimited file (tab-delimited values) .txt OpenVMS Alpha, UNIX, Microsoft Windows 
"WK1" Lotus 1-2-3 Release 2 spreadsheet .wk1 Microsoft Windows 
"WK3" Lotus 1-2-3 Release 3 spreadsheet .wk3 Microsoft Windows 
"WK4" Lotus 1-2-3 Release 4 and 5 spreadsheet .wk4 Microsoft Windows 
 ;

* exports a delimited file with a specified delimiter (in this example, ampersand)*;
proc export data=sashelp.class
   outfile='c:\myfiles\class.txt'
   dbms=dlm; 
     delimiter='&';
run;

/* exports file into Excel format */
/* initial SQL step puts the file in the appropriate format first before exporting */
proc sql;
create table control as
select 
	mc as Unique_ID,
	First_Name,
	Last_Name,
	Company_Name,
	Address_1,
	" " as Address_2,
	City,
	State,
	ZIP
from COMBINE_FINAL
where control=1;
quit;

%ExpExcel(data=control,path="&ctrlout.",sheet='Control');
 
