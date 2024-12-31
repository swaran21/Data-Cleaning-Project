SELECT * FROM layoffs_staging2;

SELECT MAX(total_laid_off) ,MAX(percentage_laid_off)
FROM layoffs_staging2;

SELECT * FROM layoffs_staging2
WHERE percentage_laid_off=1;

SELECT company,SUM(total_laid_off)
FROM layoffs_staging2
group by company ORDER BY 2 DESC;


SELECT country,SUM(total_laid_off)
FROM layoffs_staging2
group by country ORDER BY 2 DESC;


SELECT `date`,SUM(total_laid_off)
FROM layoffs_staging2
group by `date` ORDER BY 1 DESC;


SELECT YEAR(`date`),SUM(total_laid_off)
FROM layoffs_staging2
group by YEAR(`date`) ORDER BY 1 DESC;

SELECT SUBSTRING(date,1,7) as dates, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
GROUP BY dates
ORDER BY dates ASC;


WITH Rolling_Total AS
(
	SELECT SUBSTRING(`date`,1,7) as `MONTH`, SUM(total_laid_off) AS total_off
	FROM layoffs_staging2
    WHERE SUBSTRING(`date`,1,7) IS NOT NULL
	GROUP BY `MONTH`
	ORDER BY 1 ASC
)
SELECT `MONTH`,total_off,SUM(total_off) OVER (ORDER BY `MONTH`) AS rolling_total
FROM Rolling_total;


SELECT company,YEAR(`date`),SUM(total_laid_off)
FROM layoffs_staging2
group by company,YEAR(`date`)
ORDER BY company ASC
;

WITH Company_Year AS 
(
  SELECT company, YEAR(date) AS years, SUM(total_laid_off) AS total_laid_off
  FROM layoffs_staging2
  GROUP BY company, YEAR(date)
)
, Company_Year_Rank AS (
  SELECT company, years, total_laid_off, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
  FROM Company_Year
)
SELECT company, years, total_laid_off, ranking
FROM Company_Year_Rank
WHERE ranking <= 3
AND years IS NOT NULL
ORDER BY years ASC, total_laid_off DESC;
