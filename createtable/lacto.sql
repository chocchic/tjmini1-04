
insert into product(pnum, pname, pprice, pstock, pdiet, pnutr1, ppdate, pexdate) 
values (product_seq.nextval, '리코타 치즈 샐러드',  '11000',  '50', 'lacto', '단백질', sysdate, '2022/04/23');

insert into product(pnum, pname, pprice, pstock, pdiet, pnutr1, pnutr2,pnutr3, ppdate, pexdate) 
values (product_seq.nextval, '베지 치즈 버거',  '17000',  '100', 'lacto', '단백질', '탄수화물','지방',  sysdate, '2022/04/30');

insert into product(pnum, pname, pprice, pstock, pdiet, pnutr1, pnutr2, ppdate, pexdate) 
values (product_seq.nextval, '렌틸콩 버터 커리',  '15500',  '50', 'lacto', '단백질','탄수화물', sysdate, '2022/04/27');

insert into product(pnum, pname, pprice, pstock, pdiet, pnutr1,pnutr2, ppdate, pexdate) 
values (product_seq.nextval, '사워크림 부리또 보울',  '12000',  '100', 'lacto', '단백질','탄수화물', sysdate, '2022/04/25');

insert into product(pnum, pname, pprice, pstock, pdiet, pnutr1,pnutr2, ppdate, pexdate) 
values (product_seq.nextval, '두유 머쉬룸 리조또',  '13900',  '60', 'lacto', '단백질','탄수화물', sysdate, '2022/04/30');

select * from product;
