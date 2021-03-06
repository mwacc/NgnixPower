create database test1;

use test1; 

CREATE TABLE IF NOT EXISTS cnt (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  appFrom DATE NOT NULL,
  appTill DATE NOT NULL,
  age INT NOT NULL,
  sex CHAR(1) NOT NULL,
  tcnt VARCHAR(1024) NOT NULL,
  tlimit int not null,
  createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  INDEX USING BTREE (appFrom),
  INDEX USING BTREE (appTill),
  INDEX USING HASH (age),
  INDEX USING BTREE (sex) 
) ENGINE = InnoDB DEFAULT CHARACTER SET 'utf8';

