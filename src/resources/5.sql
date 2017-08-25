use homework_1_2;

create temporary table temp
select companies.name, customers.id, sum(projects.cost) summ
from companies
	join projects on projects.company_id = companies.id
    join customers on customers.id = projects.customer_id
group by companies.name, customers.name;
select * from temp;

select temp.name, customers.*, min(temp.summ)
from temp, customers, companies
where temp.name = companies.name and customers.id = temp.id
group by companies.name