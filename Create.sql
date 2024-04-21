create database BookShop
use BookShop

drop databaseBookShop;



drop table if exists Genre;
create table Genres
(
	id_genre int primary key ,
	GenreName nvarchar(50) not null
	
);


drop table if exists Authors;
create table Authors
(
	id_author int primary key,
	AuthorName nvarchar(50) not null,	
	Country nvarchar(50)
);

drop table if exists Books;
create table Books
(
	id_book int primary key ,
	BookName nvarchar(50) not null,	
	Quanity nvarchar(50) null,
	price nvarchar(50) not null
);

drop table if exists Workers;
create table Workers
(
	id_worker int primary key ,
	SurName nvarchar(50) NOT null,
    NamePerson nvarchar(50) NOT null,
    Patronymic nvarchar(50) NOT null,
    Sex bit not null,
	salary int not null
);



drop table if exists Genres_Authors;
create table Genres_Authors
(
	genre int,
	author int,
	foreign key (genre) references Genres (id_genre) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (author) references Authors (id_author) ON DELETE CASCADE ON UPDATE CASCADE
);

drop table if exists Genres_Authors;
create table Authors_Books
(
	author int,
	book int ,
	foreign key (author) references Authors (id_author) ON DELETE CASCADE ON UPDATE CASCADE,
	foreign key (book) references Books (id_book) ON DELETE CASCADE ON UPDATE CASCADE
);

drop table if exists Curiers;
create table Curiers
(
id_curier int,
SurName nvarchar(50) NOT null,
NamePerson nvarchar(50) NOT null,
Patronymic nvarchar(50) NOT null,
foreign key (id_curier) references Workers (id_worker) ON DELETE CASCADE ON UPDATE CASCADE,
foreign key (SurName) references Workers (SurName) ON DELETE CASCADE ON UPDATE CASCADE,
foreign key (NamePerson) references Workers (NamePerson) ON DELETE CASCADE ON UPDATE CASCADE,
foreign key (Patronymic) references Workers (Patronymic) ON DELETE CASCADE ON UPDATE CASCADE
);


drop table if exists Orders;
create table Orders
(
id_order int primary key, 
id_curier int,
sum int,
orderdate date
);

drop table if exists OrderBook;
CREATE TABLE OrderBook
(
    id_order INT,
    id_book INT,
    quantity INT,
    foreign key (id_order) references Orders (id_order) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (id_book) references Books (id_book) ON DELETE CASCADE ON UPDATE CASCADE
);

drop database BookShop
