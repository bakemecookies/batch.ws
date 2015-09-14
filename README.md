# [batch.ws](http://batch.ws/)

[![Build Status](https://travis-ci.org/bakemecookies/batch.ws.svg?branch=master)](https://travis-ci.org/bakemecookies/batch.ws)
[![Code Climate](https://codeclimate.com/github/bakemecookies/batch.ws/badges/gpa.svg)](https://codeclimate.com/github/bakemecookies/batch.ws)
[![Coverage Status](https://coveralls.io/repos/bakemecookies/batch.ws/badge.svg?branch=master&service=github)](https://coveralls.io/github/bakemecookies/batch.ws?branch=master)
[![Dependency Status](https://gemnasium.com/bakemecookies/batch.ws.svg)](https://gemnasium.com/bakemecookies/batch.ws)

## Deployment

Use the instructions in [server-guide](https://github.com/bakemecookies/server-guide).

## [MySQL](http://www.mysql.com/)

### Database
```
CREATE DATABASE batch CHARACTER SET utf8;
```

### User
```
CREATE USER 'batch' IDENTIFIED BY 'test';
GRANT ALL ON batch.* to 'batch';
```

### Tables
```
CREATE TABLE episode
  (number TINYINT NOT NULL,
  date DATE NOT NULL,
  media_url VARCHAR(1024) NOT NULL,
  PRIMARY KEY (number),
  INDEX (date));
```
```
CREATE TABLE track (episode_number TINYINT NOT NULL,
  start_time TIME NOT NULL,
  title VARCHAR(255) NOT NULL,
  artist VARCHAR(255) NOT NULL,
  PRIMARY KEY (episode_number, start_time),
  FOREIGN KEY (episode_number) REFERENCES episode (number) ON DELETE CASCADE);
```

[![Creative Commons Attribution 4.0 International License](http://mirrors.creativecommons.org/presskit/buttons/88x31/svg/by.svg)](http://creativecommons.org/licenses/by/4.0/)
