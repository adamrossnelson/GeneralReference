# GeneralReference
A place to keep general reference data resources

## Aspired for additions

- [ ] [Fips crosswalk.](https://github.com/adamrossnelson/GeneralReference/issues/1)
- [ ] [City, county, state level crime rates.](https://github.com/adamrossnelson/GeneralReference/issues/2)
- [ ] [City, county, state level costs of living.](https://github.com/adamrossnelson/GeneralReference/issues/3)

## StatePop.do
StatePop.do collects from census.gov (https://www.census.gov/data/tables/2016/demo/popest/state-total.html) "Annual Estimates of the Resident Population for the United States, Regions, and Puerto Rico: April 1, 2010 to July 1, 2016." After copying that to c:\statadata it cleans the data for easy reference.
To convert the data from wide formate to long, try:

```
reshape long yr, i(region) j(isYr)
```
