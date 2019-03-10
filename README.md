# MATLAB
ODI- Cricket-2019 Predictor
2019 ODI Cricket World Cup PREDICTOR
Using MATLAB

The data for the various types of matches has been scrapped from the internet through the website on ESPN network stats guru.  The data can be scrapped using python program and brought it into CSV files.
Once the data is in the CSV files we have to fetch the data using the MATLAB program. Hence there are following procedure
•	Data fetching.
•	Data pre-processing.
•	Data plotting
•	Decision making.
The decision is been made on the reference of the calculations based on the probability. Then we have calculated the win factor and lose factor on the basis of the data extracted from the website.
All the data that is taken here in the simulation is of number of countries who have played matches with each other, and also their individual performance have been sorted out. Now gather all the data and then using it to calculate for performance in general and in opponent from the beginning as well as since last 10, 5, 4, 3, 2, and 1 year is calculated from the given data.
The win probability is considered as 0.4 and lose probability is considered as 0.4 and tie is 0.2. It can be change according to the personal analysis. One the pre-processing is done we have to plot this data using the app designer guide (an extension in MATLAB) to design an App which is having the looks as follow:
 

Once this App is design we have to program its various components such as WHERE drop down menu consisting of all competitions, venue and world cup. Similarly Time Span, Radio bar button of PERFORMANCE AGAINST and normal buttons of start stop reset and get data.
Once the calculation are done we need to insert it into the app so that as per the conditions it will use the probabilistic approach to find which country is going to win on the basis of last year’s performance and the selected time span. To prepare a score board table in the code I have introduce a parameter call tdata which is use to design a new app call as Scoreboard. This app uses the points in the tdata parameter to rank the countries after the calculations and iterations are done. They are ranked in the descending order.
The win percentage and the loosing percentage is calculated during the league stage is on. Then 4 semifinalist teams are sorted and then amongst them the win factor of those four countries are calculated with each other simultaneously and then those 2 which are having high probability of wining are called as finalist teams.
At the end the win factor is calculated and the country which is having high probability is declared as the winner and automatically the scoreboard app gets open. Then it displays the world cup tournament scores of all the ten countries which have participated.
We can customize the app as per our requirement. For e.g. when the stop button is pressed the scoreboard at that iteration will open and then again when start button is pressed the scoreboard gets closed and the iterations starts and finally after all the 45 matches it will get display again.
The World-Cup schedule data is also used and the flags are using in the program to give a good graphical interface to it.

