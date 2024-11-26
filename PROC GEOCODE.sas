/* CITY method examples */
proc geocode
method=city
data=work.customers
out=work.geocoded
lookup=sashelp.zipcode
attributevar = (msa areacode) /* attribute values to bring in...optional */
;run;

proc geocode
method=city
data=work.customers
out=work.geocoded
lookup=mapsgfk.us_city_all
attributevar = (county_name) /* attribute values to bring in...optional */
;run;

proc geocode
method=city
data=work.sasoffices
out=work.geocoded
lookup=mapsgfk.world_cities
addresscityvar = city
addressstatevar = state
addresszipvar = postcode
;run;

/*ZIP+4 method examples*/
proc geocode
method=plus4
data=lookup.zip4
out=work.geocoded
lookup=mapsgfk.world_cities
attributevar=(tract)
;run;

/*STREET method examples*/
proc geocode
method=street
data=work.schools
out=work.geocoded
lookup=sashelp.geoexm
attributevar=(tractce00)
;run;

/*RANGE method examples*/

/*CUSTOM method*/
proc geocode
method=custom
data work.phones
out=work.geocoded
lookup=work.areacodes
lookupvar=areacode
addressvar=areacode
;run;
