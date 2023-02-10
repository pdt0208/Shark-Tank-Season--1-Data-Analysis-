SELECT * FROM shark_tank_dataa;

#Find out the total number of Episodes:
SELECT COUNT(DISTINCT Ep)
FROM shark_tank_dataa;

#Find out the total number of Pitchers:
SELECT COUNT(DISTINCT Brand)
FROM shark_tank_dataa;

#Find if the investment . 0 then the result is 1 if not then 0:
SELECT Amount_Invested_lakhs,
CASE WHEN Amount_Invested_lakhs > 0 THEN 1 ELSE 0 END AS Binomial_Result FROM shark_tank_dataa;
SELECT SUM(b.Binomial_Result) Funding_received,COUNT(*) Total_Pitches FROM(
SELECT Amount_Invested_lakhs , CASE WHEN Amount_Invested_lakhs > 0 THEN 1 ELSE 0 END AS Binomial_Result FROM shark_tank_dataa) b;

#Find the total number of Male and Female in the table:
SELECT SUM(Male) FROM shark_tank_dataa;

SELECT SUM(FEMALE) FROM shark_tank_dataa;

#Find out the gender ratio of female and male:
SELECT SUM(Female)/SUM(Male) FROM shark_tank_dataa;

#Find Total Invested in Shark_tank_dataa:
SELECT SUM(Amount_Invested_lakhs) FROM shark_tank_dataa;

#Find Out the avg equity:
SELECT AVG(e.Equity_Taken) FROM(
SELECT * FROM shark_tank_dataa WHERE Equity_Taken >0) e;

#Find Out the Highest Deal Taken:
SELECT MAX(Amount_Invested_lakhs) FROM shark_tank_dataa;

#Find the Highest Equity Taken By Shark:
SELECT MAX(Equity_Taken) FROM shark_tank_dataa;

#Find that in How many pitches there should be atleast 1 female:
SELECT SUM(a.Female_Count) AS Sum_of_Female_Pitchers FROM(
SELECT Female, CASE WHEN Female>0 then 1 ELSE 0 END AS Female_Count FROM shark_tank_dataa) a;

#Find the avg age group of Contestents:
SELECT Avg_Age, COUNT(Avg_Age) cnt FROM shark_tank_dataa GROUP BY Avg_Age ORDER BY cnt DESC;

#Find the avg Location group of Location:
SELECT Location, COUNT(Location) cnt FROM shark_tank_dataa GROUP BY Location ORDER BY cnt DESC;

#Find Partners Deal:
SELECT Partners,COUNT(Partners) cnt FROM shark_tank_dataa WHERE Partners !='-' GROUP BY Partners ORDER BY cnt;

#Find the Matrix used for all the sharks with their investment details:
SELECT * FROM shark_tank_dataa;

SELECT 'Ashneer' AS Keyy, COUNT(Ashneer_Amount_Invested) Total_Amount_Invested FROM shark_tank_dataa WHERE Ashneer_Amount_Invested !=0;

SELECT 'Ashneer' AS Keyy, AVG(Ashneer_Equity_Taken) Avg_Equity_Taken FROM shark_tank_dataa;
SELECT m.Keyy, m.Total_Deals,m.Total_Deals_Present,n.Total_Amount_Invested,n.Avg_Equity_Taken FROM(
SELECT a.Keyy,b.Total_Deals,a.Total_Deals_Present FROM(
SELECT 'Ashneer' AS Keyy, COUNT(Ashneer_Amount_Invested) Total_Deals_Present  FROM shark_tank_dataa WHERE Ashneer_Amount_Invested !=0) a
INNER JOIN ( 
SELECT 'Ashneer' AS Keyy, COUNT(Ashneer_Amount_Invested) Total_Deals FROM shark_tank_dataa WHERE Ashneer_Amount_Invested !=0) b
ON a.Keyy=b.Keyy) m
INNER JOIN 
(SELECT 'Ashneer' AS Keyy, SUM(C.Ashneer_Amount_Invested) Total_Amount_Invested,
AVG(C.Ashneer_Equity_Taken) Avg_Equity_Taken
FROM (SELECT * FROM shark_tank_dataa WHERE Ashneer_Amount_Invested !=0 AND Ashneer_Equity_Taken!=0) C) n
ON m.Keyy=n.Keyy;
SELECT m.Keyy, m.Total_Deals,m.Total_Deals_Present,n.Total_Amount_Invested,n.Avg_Equity_Taken FROM(
SELECT a.Keyy,b.Total_Deals,a.Total_Deals_Present FROM(
SELECT 'Anupam' AS Keyy, COUNT(Anupam_Amount_Invested) Total_Deals_Present  FROM shark_tank_dataa WHERE Anupam_Amount_Invested !=0) a
INNER JOIN ( 
SELECT 'Anupam' AS Keyy, COUNT(Anupam_Amount_Invested) Total_Deals FROM shark_tank_dataa WHERE Anupam_Amount_Invested !=0) b
ON a.Keyy=b.Keyy) m
INNER JOIN 
(SELECT 'Anupam' AS Keyy, SUM(C.Anupam_Amount_Invested) Total_Amount_Invested,
AVG(C.Anupam_Equity_Taken) Avg_Equity_Taken
FROM (SELECT * FROM shark_tank_dataa WHERE Anupam_Amount_Invested !=0 AND Anupam_Equity_Taken!=0) C) n
ON m.Keyy=n.Keyy;


SELECT * FROM shark_tank_dataa;






