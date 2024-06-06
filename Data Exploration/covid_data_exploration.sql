-- country with max deaths
select country, max(deaths) from data
group by country
order by max(deaths) desc

-- country with highest active cases
select country, max(Active) as active_cases from data
group by country
order by active_cases desc

-- death percentage by country
select country,(Deaths/Confirmed)*100 as deathpercentage from data
order by  deathpercentage DESC

-- percentage of people recovered by country
select country,(Recovered/Confirmed)*100 as recoveredpercentage from data
order by recoveredpercentage desc

-- total cases group by continent
select 	continent, max(Confirmed) as confirmed_cases from data
group by continent
order by confirmed_cases desc

-- total death by continent
select continent, max(deaths) as no_of_deaths from data
group by continent
order by no_of_deaths desc

-- % of cases increase in one week
select country, (last_week_cases-week_change)/last_week_cases as percent_increase
from data
