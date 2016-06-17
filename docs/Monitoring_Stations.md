# Hong Kong EPD Monitoring Stations

The [Hong Kong EPD](http://www.aqhi.gov.hk) gives a [guideline](http://www.aqhi.gov.hk/en/what-is-aqhi/faqs.html#e_11) of which monitoring station to use depending on your district. They also provide [more detailed information](http://www.aqhi.gov.hk/en/monitoring-network/air-quality-monitoring-stations.html) about where each monitoring station is.

## District to Station Map

District          | Correlated Monitoring Station
----------------- | -----------------------------------------------
Hong Kong Island  |
Central & Western | Central/Western
Eastern           | Eastern
Southern          | Central/Western or Eastern, whichever is nearer
Wan Chai          | Central/Western
Kowloon           |
Kowloon City      | Sham Shui Po
Kwun Tong         | Kwun Tong
Sham Shui Po      | Sham Shui Po
Yau Tsim Mong     | Sham Shui Po
Wong Tai Sin      | Kwun Tong
New Territories   |
Islands           | Tung Chung
Kwai Tsing        | Kwai Chung
North             | Tai Po
Sai Kung          | Tseung Kwan O
Sha Tin           | Sha Tin
Tai Po            | Tai Po
Tsuen Wan         | Tsuen Wan
Tuen Mun          | Tuen Mun
Yuen Long         | Yuen Long

## Available Stations

The [reportingStation config value](device-config-schema.coffee) will accept the following:

- "Central/Western"
- "Eastern"
- "Sham Shui Po"
- "Kwun Tong"
- "Tung Chung"
- "Kwai Chung"
- "Tai Po"
- "Tseung Kwan O"
- "Sha Tin"
- "Tsuen Wan"
- "Tsen Mum"
- "Yuen Long"

[Click here](Air_Quality_Readings.md) for a list of what each returned reading means.
