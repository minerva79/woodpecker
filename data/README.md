`woodpecker` is a repository of scripts which I have worked on from :fallen_leaf: miscellaneous tasks :fallen_leaf:.

### Content:
* `day_minmax_sg_11_17.txt`: deposit of summarised daily weather data for 3 Singapore weather stations `WSAP, WSSL, WSSS` using `weatherData` R-package:
  * Steps on retrieving weather data published at [Minerva's Alcove](https://minerva79.github.io/weatherData/)
  * Location of three airport based wether stations:
    * `WSAP` - Paya Lebar Airport (South-east Singapore)
    * `WSSL` - Seletar Airport (North Singapore)
    * `WSSS` - Changi Airport (East Singapore)

* `SGS - Historical Prices and Yields - Benchmark Issues.csv`: raw data set of SGS benchmark issue for 10-Year Bond Price and Yield from 1998 to 2017
  * data retrieved as on 20th April from [Singapore Government Securities](https://secure.sgs.gov.sg/fdanet/BenchmarkPricesAndYields.aspx)

* `SGS_benchmark_1998_2017.txt`: data-ready format for `SGS - Historical Prices and Yields - Benchmark Issues.csv`

* `example.csv`: contain a an example of badly formatted data seen in excel workbook format. The data was hosted as part of a solution for SO answer.

* `bgg_db_2017_04.csv`:  a collection of board game information from Board Game Geek
  * data taken from [Board Game Data - March 2017](https://www.kaggle.com/mrpantherson/board-game-data) hosted on Kaggle
  * example of visualising the game categories as wordcloud and dual-axis plots are explored at [Minerva's Alcove](https://minerva79.github.io/board_game/)

* `homicide_by_state`: Total and proportion of homicides reported across 51 states in America. This tsv data is uploaded as a exercise to visually "bin" states to present the data in a neater manner
  * Tab-separated data with 51 row (each representing a State in USA) and 3 columns:
    * State
    * Freq - total number of reported homicides between 1980-2014 at each state
    * prop - number of reported homicide for state/ total number of homicides
  * data taken from [Homicide Reports, 1980-2014](https://www.kaggle.com/murderaccountability/homicide-reports). This dataset includes murders from the FBI's Supplementary Homicide Report from 1976 to the present and Freedom of Information Act data on more than 22,000 homicides that were not reported to the Justice Department. 
