% Kengroo.com, 2017 - % Author: Ashish Jagtiani (ashishvjagtiani@gmail.com)% Tutorial Series: Progamming in Octave%%% Octave Script scrapes data from the NASDAQ website% and prints current price% New from p1: Checks previous close value and todays high/low values% 52 week high/low, net change in price (relative and percent change)% This script simply checks for one stock when run%% Part 2 of financial data analysisclear;clc;close all;% Define the stock you want to checkticker=["AAPL"];%Based on the website link, use string concantation to define the web linkdata_link = cstrcat("http://www.nasdaq.com/symbol/",ticker,"/real-time");%Read the data, this pull all html datastockData_html=urlread(data_link);%-------------Get Values-------------------stockData_current = getStockVals(stockData_html, "quotes_content_left__LastSale",0,0);stockData_previousClose = getStockVals(stockData_html, "quotes_content_left__PreviousClose",0,0);stockData_todaysHigh = getStockVals(stockData_html, "quotes_content_left__TodaysHigh",0,0);stockData_todaysLow = getStockVals(stockData_html, "quotes_content_left__TodaysLow",0,0);stockData_52weekHigh = getStockVals(stockData_html, "quotes_content_left__52WeekHigh",1,0);stockData_52weekLow = getStockVals(stockData_html, "quotes_content_left__52WeekLow",1,0);stockData_Header = getStockVals(stockData_html, "h1", 0,0);stockData_netChange = getStockVals(stockData_html, "quotes_content_left__NetChange",0,0);stockData_netDirection = getStockVals(stockData_html, "_updownImage",1,0);stockData_netPercentChange = getStockVals(stockData_html, "quotes_content_left__PctChange",0,0)if (stockData_netDirection =="#9660;")stockData_netDirection_sign="-";elsestockData_netDirection_sign="+";endif%%-----------Final printing----------------------------------------------%%%Getting local time and dateretrieve_time=strftime("%Y-%m-%d %H:%M:%S", localtime (time ()));%print the stock pricefprintf("%s\n",stockData_Header);fprintf("Stock price for %s on %s (local time)\n\n",ticker, retrieve_time);fprintf("Stock price = $%s \n",stockData_current);fprintf("Net Change %s%s\n",stockData_netDirection_sign, stockData_netChange);fprintf("Net Percent Change %s%s\n\n",stockData_netDirection_sign, stockData_netPercentChange);fprintf("Previous close = $%s\n\n",stockData_previousClose);fprintf("Today's High = $%s\n",stockData_todaysHigh);fprintf("Today's Low = $%s\n\n",stockData_todaysLow);fprintf("52 Week High = $%s\n",stockData_52weekHigh);fprintf("52 Week Low = $%s\n\n",stockData_52weekLow);