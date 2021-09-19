

--1 Global numbers

Select SUM(new_cases) as total_cases,SUM(new_deaths) as total_deaths, 
(SUM(new_deaths)/SUM(new_cases))* 100 as Deathpercentage
from Portfolio..coviddeaths
where continent is not NULL 


--2 Death Count Per continent

Select location, SUM(new_deaths) as TotalDeathCount
From Portfolio..coviddeaths
Where continent is null 
and location not in ('World', 'European Union', 'International')
Group by location
order by TotalDeathCount desc

--3 Population Infected Per Country

Select location, population,MAX(total_cases) as HighestInfection, MAX((total_cases/population))*100 as percentagepopulationInfected
from Portfolio..coviddeaths
group by location, population
order by percentagepopulationInfected desc

--4 Infected Population

Select location, population,date,MAX(total_cases) as HighestInfection, MAX((total_cases/population))*100 as percentagepopulationInfected
from Portfolio..coviddeaths
group by location, population,date
order by percentagepopulationInfected desc