// This file is designed to collect data from the US Census website.
// After a short cleaning routine the resulting dataset provides state-by-state
// and some regional information about populations in the United States.

// By: Adam Ross Nelson JD PhD
// Initial draft: September 2017

set more off
clear all

cd c:\statadata

copy https://www2.census.gov/programs-surveys/popest/tables/2010-2016/state/totals/nst-est2016-01.xlsx .

import excel "C:\statadata\nst-est2016-01.xlsx", sheet("NST01") cellrange(A4:J62) firstrow

// Clean up variable names.
rename A region
label variable region "U.S. State, region of record"
local i = 2010
foreach varname in D E F G H I J {
	rename `varname' yr`i'
	local i = `i' + 1
}
gen isState = (_n > 5)
label variable isState "Indicator true if region is a U.S. State"

// Remove leading "." in state names & encode for tabluation.
sum yr2016 if isState == 1, detail
replace region = subinstr(region,".","",1)
encode(region), gen(tempregion)
drop region
rename tempregion region
order region, first

sort yr2016
list region yr2016

// To reshape long, try:

/* reshape long yr, i(region) j(isYr)
