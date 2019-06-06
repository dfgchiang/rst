# Stat 128 Week 7 Yellow Taxi data class work 20190311
STA128_YellowTaxi <- read.delim("~/Downloads/stat128/STA128_YellowTaxi.dat")
View(STA128_YellowTaxi)
summary(STA128_YellowTaxi)
hist(STA128_YellowTaxi$trip_distance)
nyyt <- STA128_YellowTaxi
str(nyyt)
summary(nyyt)
# 1. Outlier records
# Negative fare_amount, trip_distance == 0, latitudes and longitudes of zero
# 2. Distrib of trip distance
hist(nyyt$trip_distance)
# 3. Suspicious longitude and latitudes
# FAIL badll <- nyyt[which(c(nyyt$pickup_latitude == 0, nyyt$pickup_longitude == 0, nyyt$dropoff_latitude == 0, nyyt$dropoff_longitude == 0))]
which(nyyt$pickup_latitude == 0)
lat1z <- which(nyyt$pickup_latitude == 0)
length(lat1z)
lat1out <- nyyt[lat1z,]
badplat <- nyyt[which(nyyt$pickup_latitude == 0)]
# 4. 
# ANSWER: 
# [New York City Approves 30¢ Surcharge to Pay for Accessible Taxis](https://www.nytimes.com/2014/05/01/nyregion/city-approves-30-surcharge-to-pay-for-accessible-taxis.html)
# 5. 
# [](https://chih-ling-hsu.github.io/2018/05/14/NYC)
# Rate code ID 1=Standard, 99=UNKNOWN
# 6. 
typeof(nyyt$tpep_pickup_datetime)
# [1] "integer"
# hist(nyyt$tpep_pickup_datetime)
# Error in hist.default(nyyt$tpep_pickup_datetime) : 'x' must be numeric
dts <- strsplit(toString(nyyt$tpep_pickup_datetime), ' ')
hist(as.integer(nyyt$tpep_pickup_datetime))
