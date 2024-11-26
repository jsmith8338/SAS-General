/* gmap - legacy, part of SAS/GRAPH */

/* sgmap - incorporates openstreepmap or esri backgrounds to enhance maps */
proc sgmap
mapdata=map_data_set plotdata=plot_data_set maprespdata=response_data_set noautolegend;
scatter x=x y=y / datalabel = zip
markerattrs=(color=red size=10 symbol=circlefilled);
openstreetmap;
run;

proc sgmap mapdata=states;
esrimap url='http://....';
choromap population_2010 / mapid=state density=2 transparency=.4 name='choro';
text x=long y=lat text=statename / textattrs=(size=6pt);
gradlegend 'choro';
run;
