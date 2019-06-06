# mapster.R 20190304 dchiang
# Map Service JSON data request, retrieval, response, result
library(jsonlite)
?jsonlite
msres <- fromJSON('https://seamlessrnc.nauticalcharts.noaa.gov/arcgis/rest/services/RNC/NOAA_RNC/MapServer?f=pjson')
# cat(msres)
# Error in cat(msres) : argument 1 (type 'list') cannot be handled by 'cat'
msres
