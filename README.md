<h1 style="font-weight:normal">
  Olympic Athletes 
</h1>


[![Status](https://img.shields.io/badge/status-active-success.svg)]() [![GitHub Issues](https://img.shields.io/github/issues/wjsutton/olympic_athletics.svg)](https://github.com/wjsutton/olympic_athletics/issues) [![GitHub Pull Requests](https://img.shields.io/github/issues-pr/wjsutton/olympic_athletics.svg)](https://github.com/wjsutton/olympic_athletics/pulls) [![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

Collecting Olympic medal results in athletics for a dataviz project.

[Twitter][Twitter] :speech_balloon:&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[LinkedIn][LinkedIn] :necktie:&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[GitHub :octocat:][GitHub]&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Website][Website] :link:


<!--
Quick Link 
-->

[Twitter]:https://twitter.com/WJSutton12
[LinkedIn]:https://www.linkedin.com/in/will-sutton-14711627/
[GitHub]:https://github.com/wjsutton
[Website]:https://wjsutton.github.io/

### :a: About

This project involves webscraping Olympic results from two Wikipedia pages:
- Women's results: [https://en.wikipedia.org/wiki/List_of_Olympic_medalists_in_athletics_(women)](https://en.wikipedia.org/wiki/List_of_Olympic_medalists_in_athletics_(women))
- Men's results:   [https://en.wikipedia.org/wiki/List_of_Olympic_medalists_in_athletics_(men)](https://en.wikipedia.org/wiki/List_of_Olympic_medalists_in_athletics_(men))

And converting to individual results tables into one consolidated table (dataframe). Details of scripts are here:
- Script: [get_womens_results.R](get_womens_results.R) Output: [/data/womens_results.csv](data/womens_results.csv)
- Script: [get_mens_results.R](get_mens_results.R) Output: [/data/mens_results.csv](data/mens_results.csv)

The two results files are then merged together and followed by some data enrichment of parsing out countries and athletes from a combined field.
- Script: [merge_and_clean_results.R](merge_and_clean_results.R) Output: [/data/combined_results.csv](data/combined_results.csv)

See the viz on Tableau Public:<br>
<a href="https://public.tableau.com/profile/will7508#!/vizhome/RunningforOlympicGold/RunningforOlympicGold">
<img src="https://public.tableau.com/static/images/Ru/RunningforOlympicGold/RunningforOlympicGold/1.png">
</a>
