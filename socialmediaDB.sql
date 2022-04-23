create database if not exists application;

use application;

drop table if exists users;
drop table if exists posts;
drop table if exists comments;

create table users (
	user_id int(11) not null auto_increment,
	user_name varchar(20) not null,
	first_name varchar(40) not null,
	last_name varchar(40) not null,
	email varchar(64) not null,
	phone_number varchar(10),
	password varchar(60) not null,
	primary key (user_id)
);

create table posts (
	post_id int not null auto_increment,
	user_id int not null,
	post text not null,
	publish_timestamp timestamp not null default CURRENT_TIMESTAMP,
	primary key (post_id),
	foreign key (user_id) references users (user_id)
);

create table comments (
	comment_id int not null auto_increment,
	user_id int not null,
	post_id int not null,
	comment text not null,
	publish_timestamp timestamp not null default CURRENT_TIMESTAMP,
	primary key (comment_id),
	foreign key (user_id) references users (user_id),
	foreign key (post_id) references posts (post_id)
);