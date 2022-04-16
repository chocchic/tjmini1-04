alter table product modify phearts varchar2(5) default 0;
alter table product rename column prname to pname;

create sequence product_seq;
insert into product(pnum, pname, pprice, pstock, pdiet, pnutr1, ppdate, pexdate) 
values (product_seq.nextval, '기본된장찌개',  '20000',  '100', 'began', '단백질', sysdate, '2022/05/15');
insert into product(pnum, pname, pprice, pstock, pdiet, pnutr1, ppdate, pexdate) 
values (product_seq.nextval, '비건된장찌개',  '20000',  '100', 'began', '단백질', sysdate, '2022/05/15');
insert into product(pnum, pname, pprice, pstock, pdiet, pnutr1, ppdate, pexdate) 
values (product_seq.nextval, '두릅된장찌개',  '20000',  '100', 'began', '단백질', sysdate, '2022/05/15');
insert into product(pnum, pname, pprice, pstock, pdiet, pnutr1, ppdate, pexdate) 
values (product_seq.nextval, '두부김치찌개',  '24000',  '100', 'began', '단백질', sysdate, '2022/04/30');
insert into product(pnum, pname, pprice, pstock, pdiet, pnutr1, pnutr2, ppdate, pexdate) 
values (product_seq.nextval, '버섯된장찌개',  '26000',  '100', 'began', '단백질','섬유질', sysdate, '2022/05/15');

commit;

select * from product;
