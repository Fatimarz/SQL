select* from layoffs
select count(*) from layoffs

-- removing duplicates
with duplicate_cte as 
( select*, 
row_number() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions) as row_num
from layoffs)
select* from duplicate_cte
where row_num > 1
 
 -- creating another table with row number and deleting duplicates
 CREATE TABLE `layoff1` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT null,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
 insert layoff1
 ( select*, 
row_number() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions) as row_num
from layoffs)

-- removing duplicates
delete from layoff1
where row_num > 1

-- records after remvpving duplicates
select count(*) from layoff1

-- standardizing the data
select distinct(country) from layoff1

select* from layoff1
where country like 'united states.%'

-- updating united states. with united states
update layoff1
set country='United States'
where country='United States.'

select distinct(industry) from layoff1
select* from layoff1
where industry like 'Crypto Cu%'

update layoff1
set industry='Crypto'
where industry ='CryptoCurrency'

-- changing date from text to date
select 'date',
str_to_date('date', '%m/%d/%Y')
from layoff1

update layoff1
set `date` = str_to_date(`date`, '%m/%d/%Y') 

alter table layoff1
modify column `date` date

-- null and missing values 
select distinct(industry) from layoff1

select t2.company, t2.industry
from layoff1 t1
join layoff1 t2 
	on t1.company=t2.company
    where (t1.industry is null or t1.industry ='')
    and t2.industry is not null
    
update layoff1
set industry = 'Travel'
where company='Airbnb'

select* from layoff1
where company ='Airbnb'

update layoff1 
set industry='Transportation'
where company = 'Carvana'

update layoff1 
set industry = 'Consumer'
where company = 'Juul'
