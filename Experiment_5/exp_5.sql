drop table if exists employee;
create table employee
(
    emp_id int primary key,
    emp_name varchar(50),
    salary int
);

insert into employee values(101, 'alice', 50024);
insert into employee values(102, 'akash', 25001);
insert into employee values(103, 'bimlesh', 45120);
insert into employee values(104, 'charlie', 48203);
insert into employee values(105, 'david', 68103);
insert into employee values(106, 'kelly', 79536);

select * ,
case
    when  salary%2 = 0 then 'Even Salary'
    else 'Odd Salary'
end as salary_type
from employee;