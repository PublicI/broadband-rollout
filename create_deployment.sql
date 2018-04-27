CREATE TABLE IF NOT EXISTS deployment_2016 (
	LogRecNo text,
	Provider_Id text,
	FRN text,
	ProviderName text,
	DBAName text,
	HoldingCompanyName text,
	HocoNum text,
	HocoFinal text,
	StateAbbr text,
	BlockCode text,
	TechCode text,
	Consumer text,
	MaxAdDown real,
	MaxAdUp real,
	Business text,
	MaxCIRDown real,
	MaxCIRUp real
);

TRUNCATE deployment_2016;

CREATE TABLE IF NOT EXISTS deployment_2014 (
	LogRecNo text,
	Provider_Id text,
	FRN text,
	ProviderName text,
	DBAName text,
	HoldingCompanyName text,
	HocoNum text,
	HocoFinal text,
	StateAbbr text,
	BlockCode text,
	TechCode text,
	Consumer text,
	MaxAdDown real,
	MaxAdUp real,
	Business text,
	MaxCIRDown real,
	MaxCIRUp real
);

TRUNCATE deployment_2014;

CREATE TABLE IF NOT EXISTS deployment_2012 (
	objectid text,
	random_pt_objectid text,
	datasource text,
	frn text,
	provname text,
	dbaname text,
	hoconum text,
	hoconame text,
	stateabbr text,
	fullfipsid text,
	county_fips text,
	transtech text,
	maxaddown text,
	maxadup text,
	typicdown text,
	typicup text,
	downloadspeed text,
	uploadspeed text,
	provider_type text,
	end_user_cat text
);

TRUNCATE deployment_2012;