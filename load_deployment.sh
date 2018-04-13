#!/bin/bash

psql -U postgres -h db.fivetwentyseven.com -f create.sql -d broadband
psql -U postgres -h db.fivetwentyseven.com -c "COPY deployment_2016 FROM STDIN WITH CSV HEADER DELIMITER ','" < "data/test_2016.csv" broadband
psql -U postgres -h db.fivetwentyseven.com -c "COPY deployment_2014 FROM STDIN WITH CSV HEADER DELIMITER ','" < "data/test_2014.csv" broadband
psql -U postgres -h db.fivetwentyseven.com -c "COPY deployment_2012 FROM STDIN WITH CSV HEADER DELIMITER '|'" < "data/test_2012_small.txt" broadband
psql -U postgres -h db.fivetwentyseven.com -c "COPY deployment_2012 (
	objectid,
	frn,
	provname,
	dbaname,
	hoconum,
	hoconame,
	stateabbr,
	fullfipsid,
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
	FROM STDIN WITH CSV HEADER DELIMITER '|'" < "data/test_2012_large.txt" broadband