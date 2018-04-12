#!/bin/bash

do
psql -U postgres -h db.fivetwentyseven.com -f create.sql -d broadband
psql -U postgres -h db.fivetwentyseven.com -c "COPY deployment_2016 FROM STDIN WITH CSV HEADER DELIMITER ','" < "data/fbd_us_with_satellite_dec2016_v1.csv" broadband
psql -U postgres -h db.fivetwentyseven.com -c "COPY deployment_2014 FROM STDIN WITH CSV HEADER DELIMITER ','" < "data/fbd_us_with_satellite_dec2014_V2.csv" broadband
psql -U postgres -h db.fivetwentyseven.com -c "COPY deployment_2012 FROM STDIN WITH CSV HEADER DELIMITER '|'" < "data/December-2012-Census_Block.txt" broadband
psql -U postgres -h db.fivetwentyseven.com -c "COPY deployment_2012 (
	objectid,
	random_pt_objectid,
	datasource,
	frn,
	provname,
	dbaname,
	hoconum,
	hoconame,
	stateabbr,
	fullfipsid,
	county_fips,
	transtech,
	maxaddown,
	maxadup,
	typicdown,
	typicup,
	downloadspeed,
	uploadspeed,
	provider_type,
	end_user_cat
	)
	FROM STDIN WITH CSV HEADER DELIMITER '|'" < "data/December-2012-Random_pt.txt" broadband
done