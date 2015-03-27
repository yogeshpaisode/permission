drop database if exists permision;

create database permision;

use permision;

create table personalDetail (
   id int NOT NULL auto_increment,
   
   name text,
   address text,
   emailId text,
   contact text,
   profileId text,
   
   
   PRIMARY KEY (id)
);

create table permisionDetail (
   id int NOT NULL auto_increment,
   
   profileId text,
   nature text,
   address text,
   pincode text,
   peopleNumber int,
   document text,
   processionFrom text,
   processionTo text,
   permisionId text,   
   
   PRIMARY KEY (id)
);

create table dateTime (
   id int NOT NULL auto_increment,
   
   profileId text,
   dateData text,
   startTimeData text,
   endTimeData text,
   dateTimeId text,   
   
   PRIMARY KEY (id)
);

create table paymentStatus (
   id int NOT NULL auto_increment,
   
   profileId text,
   paymentStatus boolean,
   dateData date,   
   
   PRIMARY KEY (id)
);


