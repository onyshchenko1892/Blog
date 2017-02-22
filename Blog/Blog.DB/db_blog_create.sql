CREATE TABLE MediaFile
(
MediaFileId int identity(1,1) primary key,
FileName varchar(150) not null
)
go

CREATE TABLE Member
(
MemberId int identity(1,1) primary key,
Email varchar(20) not null,
Password varchar(32) not null,
UserPhoto int references MediaFile(MediaFileId),
IsAdmin bit not null default 0,
IsEnabled bit not null default 1
)
go

CREATE TABLE Category
(
CategoryId int identity(1,1) primary key,
Name varchar(100) not null
)
go

CREATE TABLE Article
(
ArticleId int identity(1,1) primary key,
MemberId int references Member(MemberId),
CategoryId int references Category(CategoryId),
Title varchar(100) not null,
ArticleCover int references MediaFile(MediaFileId),
UserPhoto int references MediaFile(MediaFileId),
PublishDate date null,
Content text not null
)
go

CREATE TABLE Comment
(
CommentId int identity(1,1) primary key,
ArticleId int references Article(ArticleId),
MemberId int references Member(MemberId),
PublishDate date not null,
Content text not null
)
go