SHELL := /bin/bash
DIR=.

all: download extract simplify load clean

download:
	wget -P $(DIR)/downloads -r -l 2 -H -t 1 -nd -N -np -e robots=off ftp://ftp2.census.gov/geo/tiger/TIGER2017/TABBLOCK/;

extract:
	mkdir $(DIR)/extracts/; \
	for file in $(DIR)/downloads/*.zip; do \
		unzip -u -d $(DIR)/extracts/$$(basename "$$file" .zip) $$file; \
	done

simplify:
	mkdir ./simplified; \
	for file in $(DIR)/extracts/*; do \
		if [ -d "$$file" ]; then \
			mkdir $${file/extracts/simplified}; \
			for file2 in "$$file"/*.shp; do \
				mapshaper "$$file2" \
					-simplify keep-shapes 30% \
					-o "$${file2/extracts/simplified}"; \
			done; \
		fi; \
	done \

load:
	FLAGS="-I"; \
	for file in $(DIR)/simplified/*; do \
		if [ -d "$$file" ]; then \
			for file2 in "$$file"/*.shp; do \
				shp2pgsql $$FLAGS -s 4326 "$$file2" censusblocks | psql -h db.fivetwentyseven.com -U postgres -d broadband; \
				FLAGS="-a"; \
			done; \
		fi; \
	done \

clean:
	rm -rf ./$(DIR)/extracts/