create table product(
    pnum number primary key,
    prname varchar2(50) not null,
    pprice number not null,
    pstock number not null,
    prdate date default sysdate,
    phearts number not null,
    pstar float default 0,
    pdiet varchar2(20) not null,
    pnutr1 varchar2(20),
    pnutr2 varchar2(20),
    pnutr3 varchar2(20),
    ppdate date not null,
    pexdate date not null,
    is_sale varchar(20) default 'n' not null ,
    status number default 0 not null
);

desc product;
create sequence seq_num;
commit;

create table product_img_file(
    inum	number primary key, 
    pnum	number not null,
    iname	varchar2(50) not null,
    itype	varchar2(50) not null,
    foreign key (pnum) references product(pnum)
);
create sequence seq_inum;
desc product_img_file;

create table phearts_count(
    pnum	number not null,
    mnum	varchar2(50) not null,
    foreign key (pnum)references product(pnum)
);

create table site_img_file(
    inum2	number primary key,
    iname	varchar2(50) not null
);
create sequence seq_inum2;
commit;

create table qna (
qnum	number primary key,
qtitle	varchar2(50) not null,
qcnt	varchar2(500) not null,
qcat	varchar2(50) not null,
qmnum	number not null,
qpnum	number not null,
rdate	date not null,
is_replyed	varchar2(20) default 'n' not null,
foreign key (qmnum) references member(mnum),
foreign key (qpnum) references product(pnum)
);
create sequence seq_qna;

create table qna_reply (
    qrno	number primary key,
    qbno	number not null,
    qrdate	date not null,
    qreplydate	date,
    foreign key (qbno) references qna(qnum)
);
commit;

alter table product modify PRDATE not null;