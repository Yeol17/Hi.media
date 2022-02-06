drop table score;
drop sequence score_seq;
--create
create table score(
	num number primary key,
	name varchar2(30) unique not null,
	kor number not null,
	eng number not null,
	math number not null
);
--create sequence score_seq;
--dummy data
insert into score values (1,'홍길동',90,80,70);
insert into score values (2,'전우치',80,70,60);
commit;
select * from score;