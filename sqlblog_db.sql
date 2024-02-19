create database blog_db

create table users (
id serial primary key,
first_name varchar(50),
last_name varchar(50),
email varchar(50) ) ;

insert into users (first_name, last_name, email) values
('Sergio','Delgado','sergio@gmail.com'),
('Giancarlo','Maco','giancarlo@gmail.com'),
('Claudia','Paredes','claudia@gmail.com');

create table posts (
id serial primary key,
creator_id int references users(id),
title varchar(50),
text varchar(100) ) ;

insert into posts (creator_id, title, text) values
(1,'Contaminación ambiental','lorem ipsum dolor contaminacion'),
(1,'El agua en el mundo','lorem ipsum dolor agua'),
(2,'Los terremotos','lorem ipsum dolor teremotos'),
(3,'Los huracanes','lorem ipsum dolor huracanes'),
(3,'La paz mundial','lorem ipsum dolor paz mundial');

create table likes (
id serial primary key,
user_id int references users(id),
post_id int references posts(id) );

insert into likes (user_id, post_id) values
(1,4),
(1,5),
(2,1),
(2,5),
(3,1);

select * from posts inner join users
on posts.creator_id = users.id;

select * from posts
inner join likes
on posts.id = likes.post_id
inner join users
on likes.user_id= users.id;



