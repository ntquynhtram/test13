

drop database if exists fresher_traning_management;
create database if not exists fresher_training_management;
use fresher_training_management;
create table  trainee(
traineeid int auto_increment primary key,
full_name varchar(50) not null,
birth_date date,
gender enum ('male','female','other'),
ET_IQ INT CHECK (ET_IQ >=0 AND ET_IQ <=20),
ET_Gmath INT CHECK (ET_Gmath >=0 AND ET_Gmath <=20),
ET_English Int check (ET_English >=0 and ET_English <=50),
Training_class Char(3),
Evaluation_note varchar(100)
);

alter table trainee
add column VTI_account varchar(50) not null unique;