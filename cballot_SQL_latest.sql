CREATE DATABASE cballotnew;
USE cballotnew;

CREATE TABLE `person` (
    `idperson` BIGINT  NOT NULL ,
    `email` VARCHAR(30)  NOT NULL ,
    `password` VARCHAR(30)  NOT NULL ,
    `firstname` VARCHAR(30)  NOT NULL ,
    `lastname` VARCHAR(30)  NOT NULL ,
    `birthdate` DATE  NOT NULL ,
    PRIMARY KEY (
        `idperson`
    ),
    CONSTRAINT `uc_person_email` UNIQUE (
        `email`
    )
);

CREATE TABLE `vote` (
    `idcampaign` BIGINT  NOT NULL ,
    `idvoter` BIGINT  NOT NULL ,
    `idchoice` BIGINT  NOT NULL ,
    `emailsent` BOOLEAN  NOT NULL ,
    `voted` DATETIME  NOT NULL
);

CREATE TABLE `campaign` (
    `idcampaign` BIGINT  NOT NULL ,
    `idorganization` BIGINT  NOT NULL ,
    `name` VARCHAR(30)  NOT NULL ,
    `startdate` DATETIME  NOT NULL ,
    `enddate` DATETIME  NOT NULL ,
    PRIMARY KEY (
        `idcampaign`
    )
);

CREATE TABLE `option` (
    `idoption` BIGINT  NOT NULL ,
    `idcampaign` BIGINT  NOT NULL ,
    `name` VARCHAR(30)  NOT NULL ,
    PRIMARY KEY (
        `idoption`
    )
);

CREATE TABLE `organization` (
    `idorganization` BIGINT  NOT NULL ,
    `idorganizer` BIGINT  NOT NULL ,
    `name` VARCHAR(30)  NOT NULL ,
    PRIMARY KEY (
        `idorganization`
    )
);

CREATE TABLE `retention` (
    `idretention` BIGINT  NOT NULL ,
    `email` VARCHAR(30)  NOT NULL ,
    `firstname` VARCHAR(30)  NOT NULL ,
    `lastname` VARCHAR(30)  NOT NULL ,
    `birthdate` DATE  NOT NULL ,
    PRIMARY KEY (
        `idretention`
    )
);

CREATE TABLE `email` (
    `voteremail` VARCHAR(30)  NOT NULL ,
    `idcampaign` BIGINT  NOT NULL ,
    PRIMARY KEY (
        `voteremail`
    )
);

ALTER TABLE `vote` ADD CONSTRAINT `fk_vote_idcampaign` FOREIGN KEY(`idcampaign`)
REFERENCES `campaign` (`idcampaign`);

ALTER TABLE `vote` ADD CONSTRAINT `fk_vote_idchoice` FOREIGN KEY(`idchoice`)
REFERENCES `option` (`idoption`);

ALTER TABLE `campaign` ADD CONSTRAINT `fk_campaign_idorganization` FOREIGN KEY(`idorganization`)
REFERENCES `organization` (`idorganization`);

ALTER TABLE `option` ADD CONSTRAINT `fk_option_idcampaign` FOREIGN KEY(`idcampaign`)
REFERENCES `campaign` (`idcampaign`);

ALTER TABLE `organization` ADD CONSTRAINT `fk_organization_idorganizer` FOREIGN KEY(`idorganizer`)
REFERENCES `person` (`idperson`);

ALTER TABLE `email` ADD CONSTRAINT `fk_email_idcampaign` FOREIGN KEY(`idcampaign`)
REFERENCES `campaign` (`idcampaign`);
