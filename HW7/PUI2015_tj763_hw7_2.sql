{\rtf1\ansi\ansicpg1252\cocoartf1404\cocoasubrtf130
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 SELECT start_station_id,\
start_station_name,\
CDB_TransformToWebmercator(CDB_LatLng(\
        start_station_latitude,\
        start_station_longitude\
        )\
) as start_station_location,\
\
COUNT(tripduration) as trip_count\
\
FROM citibike\
\
WHERE\
ST_DWithin(\
  CDB_LatLng(\
         end_station_latitude,\
    end_station_longitude\
  )::geography,\
     CDB_LatLng(40.7307602,-73.9974086)::geography, 1000)\
\
AND\
extract(DOW FROM starttime) IN (0,6)\
\
group by\
start_station_id,\
start_station_name,\
start_station_latitude,\
start_station_longitude\
\
\
order by trip_count DESC}