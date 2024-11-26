/***** DATE AND TIME HANDLING *****
Time - 86400 is max - number of seconds since midnight of current day
Datetime - 3162240086400 is max - number of seconds between midnight 1/1/60 and current day
*/
/* SAS DOC: 
https://go.documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/lrcon/p1wj0wt2ebe2a0n1lv4lem9hdc0v.htm */


/*changing a date from character 10/12/2010 to a true numeric date*/
SASDate1 = input(Date1,mmddyy10.);
format SASDate1 mmddyy10.;

/*changing a date from character 20101012 to a true numeric date*/
SASDate2 = input(Date2,yymmdd8.);
format SASDate2 yymmdd10.;

/*weekday
weekdate. - outputs the vernacular (Wednesday, October 15, 2020)
weekday. - outputs the numeric for the weekday (1=Sunday, 2=Monday, etc.)
*/

/*internal SAS functions
today(); - gives current date
time(); - gives current time
datetime(); - gives current date and time
*/

/*hms function - works like mdy, but with hours/minutes/seconds
hours after noon are in military*/
time1 = hms(10,55,3);
time2 = hms(22,55,49);


/* dhms function - includes all four components - day (would be a SAS date), hour, minutes, seconds*/
datetime1 = dhms(today(),11,15,49);

/* creating constants */
Birthday = '19Oct2022'd; /*day*/
format Birthday date9.;

Time = '10:20:05pm't; /*time*/
format Time timeampm.;

DateTime = '19Oct2022 20:20:05'dt; /*datetime*/
