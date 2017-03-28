DROP SCHEMA IF EXISTS part1 CASCADE;
CREATE SCHEMA part1;
SET search_path TO part1;

CREATE TYPE DegLevel AS ENUM ('certificate', 'undergraduate', 'professional', 'masters', 'doctoral');
CREATE TYPE SkillWhat AS ENUM ('SQL', 'Scheme', 'Python', 'R', 'LaTeX');
CREATE TYPE Numbers AS ENUM ('1', '2', '3', '4', '5');

--Resume--
CREATE TABLE Resume (
	resume_id integer NOT NULL,
	description varchar(100),
	PRIMARY KEY(resume_id)
) ;

CREATE TABLE Period (
	period_id integer PRIMARY KEY NOT NULL,
	startDate timestamp NOT NULL,
	endDate timeStamp NOT NULL
) ;
CREATE TABLE Skill(
	skill_id integer NOT NULL,
	what SkillWhat NOT NULL,
	PRIMARY KEY(skill_id),
   UNIQUE (skill_id, what)
) ;

CREATE TABLE SetResumeSkill(
	resume_id integer REFERENCES Resume(resume_id) NOT NULL,
	skill_id integer REFERENCES Skill(skill_id) NOT NULL,
	skill_level Numbers NOT NULL,
	PRIMARY KEY(resume_id,skill_id)
) ;

CREATE TABLE Position (
	position_id integer PRIMARY KEY NOT NULL,
	title varchar(10) NOT NULL,
	description varchar(100),
	period_id integer REFERENCES Period
) ;

CREATE TABLE SetExperience (
	resume_id integer REFERENCES Resume(resume_id) NOT NULL,
	position_id integer REFERENCES Position NOT NULL,
	PRIMARY KEY(resume_id,position_id)
) ;

CREATE TABLE Degree (
	degree_id integer NOT NULL,
	degreeLevel DegLevel NOT NULL,
	degreeName varchar(30),
	institution varchar(30),
	honours boolean DEFAULT false,
	period_id integer REFERENCES Period,
	PRIMARY KEY(degree_id)
) ;


CREATE TABLE Minor (
	degree_id integer REFERENCES Degree(degree_id) NOT NULL,
	minor varchar(20) NOT NULL,
	PRIMARY KEY(degree_id, minor)
) ;

CREATE TABLE Major (
degree_id integer REFERENCES Degree(degree_id) NOT NULL,
	major varchar(20) NOT NULL,
	PRIMARY KEY(degree_id, major)
) ;

CREATE TABLE Education (
	resume_id integer REFERENCES Resume(resume_id) NOT NULL,
	degree_id integer REFERENCES Degree,
	PRIMARY KEY(resume_id)
) ;

CREATE TABLE Identity (
  resume_id integer PRIMARY KEY REFERENCES Resume(resume_id) NOT NULL,
	name varchar(20) NOT NULL,
	DOB timestamp NOT NULL,
	citizenship varchar(10) NOT NULL,
	address varchar(20) NOT NULL,
	telephone varchar(20) NOT NULL,
	email varchar(20) NOT NULL,
	UNIQUE(name,email)
) ;

--Posting--


CREATE TABLE Posting (
	posting_id integer NOT NULL,
	PRIMARY KEY(posting_id)
) ;

CREATE TABLE Question(
	question_id integer PRIMARY KEY NOT NULL,
	question varchar(100) NOT NULL
) ;

CREATE TABLE SetQuestions(
	posting_id integer REFERENCES Posting(posting_id) NOT NULL,
	question integer REFERENCES Question NOT NULL,
	PRIMARY KEY(Posting_id, question)
) ;

CREATE TABLE SetRequiredSkills(
	posting_id integer REFERENCES Posting(posting_id) NOT NULL,
	skill_id integer REFERENCES Skill NOT NULL,
	req_level Numbers NOT NULL,
	importance Numbers NOT NULL,
	PRIMARY KEY(Posting_id, skill_id, req_level, importance)
) ;



--interview--

CREATE TABLE Interview (
	interview_id integer PRIMARY KEY NOT NULL,
	InterviewDate timestamp NOT NULL,
	location varchar(40) NOT NULL
) ; 

CREATE TABLE Interviewer (
	interview_id integer PRIMARY KEY REFERENCES Interview(interview_id) NOT NULL,
	forename varchar(20) NOT NULL,
	surname varchar(20) NOT NULL,
	honorific varchar(20) NOT NULL,
	title varchar(20) NOT NULL
) ;

CREATE TABLE Assessment(
	interview_id integer PRIMARY KEY REFERENCES Interview(interview_id) NOT NULL,
	Assessment_id integer UNIQUE NOT NULL,
	techProficiency integer NOT NULL,
	communication integer NOT NULL,
	enthusiasm integer NOT NULL,
	collegiality integer
);

CREATE TABLE Answer (
	question_id integer REFERENCES Question NOT NULL,
	answer varchar(100) NOT NULL,
	PRIMARY KEY(question_id)
) ;

CREATE TABLE Answers (
	assessment_id integer REFERENCES Assessment NOT NULL,
	question_id integer REFERENCES Answer NOT NULL,
	PRIMARY KEY(answers_id,question_id)
) ;

--CREATE TABLE Interviews(
--	interview_id integer PRIMARY KEY REFERENCES Interview NOT NULL,
--	interviewer_id integer REFERENCES Interviewer NOT NULL
--) ;

