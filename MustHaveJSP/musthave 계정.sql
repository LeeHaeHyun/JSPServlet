-- 테이블 목록 조회
select * from tab; -- 계정에 테이블이 몇개인지

drop table member;
drop table board;
drop sequence seq_board_num;

-- 회원 테이블 만들기: id는 30~40 줘야 한다.
create table member(
    id varchar2(10) not null, 
    pass varchar2(10) not null,
    name varchar2(30) not null,
    regidate date default sysdate not null,
    primary key (id)
);

-- 모델1 방식의 게시판 테이블 만들기
create table board(
    num number primary key, -- 게시판 옆에 숫자를 의미
    title varchar2(200) not null,
    content varchar2(2000) not null, -- 내용
    id varchar2(10) not null,
    postdate date default sysdate not null, -- 작성일을 의미
    visitcount number(6)
);

-- 외래키 설정
alter table board 
    add constraint board_mem_fk foreign key (id)
    references member (id);

-- 시퀀스 생성
create sequence seq_board_num
    increment by 1 -- 1씩 증가
    start with 1 -- 시작값이 1
    minvalue 1 -- 최소값 1
    nomaxvalue -- 최대값은 무한대
    nocycle -- 순환하지 않음
    nocache; -- 캐시하지 않음

-- 더미 데이터 입력
insert into member (id, pass, name) values ('musthave','1234', '머스트해브');
insert into board (num,title, content,id, postdate, visitcount)
    values (seq_board_num.nextval, '제목1입니다.', '내용1입니다.','musthave',sysdate,0);
   
   -- 더미 데이터 입력
insert into member (id, pass, name) values ('musthave', '1234', '머스트헤브');
insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '제목1입니다.', '내용1입니다.', 'musthave', sysdate, 0);
commit;

SELECT COUNT(*) FROM board WHERE title like '%2%'; 
SELECT * FROM board WHERE title like '%1%' ORDER BY num DESC;

INSERT INTO board VALUES (seq_board_num.nextval, '지금은 봄입니다', '봄의왈츠', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '지금은 여름입니다', '여름향기', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '지금은 가을입니다', '가을동화', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '지금은 겨울입니다', '겨울연가', 'musthave', sysdate, 0);

SELECT * FROM MEMBER WHERE id='test1' AND pass=1111;
-- 중요 서버가 있으니 커밋 필수

SELECT COUNT(*) FROM BOARD WHERE TITLE LIKE "%1%";

desc member;
select * from member;
select id, pass, rownum from member;


select * from (
    select Tb.*, rownum rNum from(
        select * from board order by num desc
    )Tb
) --최신순부터 조회하기 위해서 
where rNum between 11 and 20;

create table myfile (
    idx number primary key,
    name varchar2(50) not null,
    title varchar2(200) not null,
    cate varchar2(30),
    ofile varchar2(100) not null,
    sfile varchar2(30) not null,
    postdate date default sysdate not null
);

drop table mvcboard;
-- 모델2 방식의 파일첨부형 게시판 테이블 생성
create table mvcboard (
    idx number primary key,
    name varchar2(50) not null,
    title varchar2(200) not null,
    content varchar2(2000) not null,
    postdate date default sysdate not null,
    ofile varchar2(200),
    sfile varchar2(30),
    downcount number(5) default 0 not null,
    pass varchar2(50) not null,
    visitcount number default 0 not null
);
desc mvcboard;

insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '김유신', '자료실 제목1 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '장보고', '자료실 제목2 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '이순신', '자료실 제목3 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '강감찬', '자료실 제목4 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '대조영', '자료실 제목5 입니다.','내용','1234');
commit;