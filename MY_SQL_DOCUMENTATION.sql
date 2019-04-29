************************************************************ MYSQL DATABASE IN DOCKER CE ****************************************************

Prerequisite :

(A).Install Docker for your ubuntu version.
(B).Install AWS-CLI
(C).Install AWS-SAM-CLI
(D).Install SAM Local
(E).Install MYSQL in docker

A.INSTALL DOCKER CE :-

Install using the repository:-

Before you install Docker CE for the first time on a new host machine, you need to set up the Docker repository. Afterward, you can install and update Docker from the repository.

SET UP THE REPOSITORY:-

1.Update the apt package index:

     $ sudo apt-get update

2.Install packages to allow apt to use a repository over HTTPS:

     $ sudo apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg-agent \
     software-properties-common

3.Add Docker’s official GPG key:
     
     $ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
     $ sudo apt-key fingerprint 0EBFCD88

4.Use the following command to set up the stable repository.

     $ sudo add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
     $(lsb_release -cs) \stable"


5.INSTALL DOCKER CE:-
  -Update the apt package index.

     $ sudo apt-get update
  
  -Install the latest version of Docker CE and containerd, or go to the next step to install a specific version:

     $ sudo apt-get install docker-ce docker-ce-cli containerd.io

  -Verify that Docker CE is installed correctly by running the hello-world image.

     $ sudo docker run hello-world

-----------------------------------------------------------------------------------------------------------------------------------------------

B.INSTALL AWS-CLI:-

   -Before installing aws-cli please install python by given command:
   
     $ sudo apt install python3.pip
     $ pip3 --version

   -Install AWS-CLI :-
    
     $ sudo apt install aws-cli 
     $ sudo aws --version

C.INSTALL AWS-SAM-CLI:-
  
     $ pip3 install --user aws-sam-cli

_______________________________________________________________________________________________________________________________________________
NOTE: PLEASE DO'NT UNINSTALL PYTHON IF YOUR OS IS LINUX OR UBUNTU OTHER WISE YOUR OS WILL ALSO CURRUPTED BECAUSE UBUNTU IS ALSO MADE FROM THE PYTHON SO IT WILL DESTROY THE FUNCTIONALITY OF UBUNTU OS.
      -RESTART YOUR OPERATING SYSTEM AFTER INSTALLING DOCKER THEN GO FOR THE ANOTHER STEPS.
_______________________________________________________________________________________________________________________________________________ 
    
D.INSTALL SAM LOCAL:-
  
    -sam local is used for starting the lambda and starting the api locally user can send the requesting data by using postman then it will send the response of that request.. 

     $ sudo npm install -g aws-sam-local


E.INSTALL MY SQL IN DOCKER :-
----------------------------

    -To install and run mysql in docker we have to execute command given bellow:-
    
     $ docker pull mysql

     $ sudo docker run -v <installation_folder>:<destination_container_folder> -e MYSQL_<USER_NAME>_PASSWORD=<PASSWORD>
       --publish=3306:3306 -d<mysql:version>

     EXAMPLE:-
   
     $ docker run -v /home/force-laptop-11/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root --publish=3306:3306 -d mysql:5.6.41
     -------------------------------------------------------------------------------------------------------------------------

    -To start mysql run this commond:-
     
     $ sudo mysql -h 127.0.0.1 -u root -p

------->after pressing enter first it will ask for the system password then mysql password as given in example password is root and by default User_Name is also ROOT.

------->after running above commonds you will get the mysql command line now you can create  your data base and work with this command for   creating   databse:-

     mysql> create databse <database_name>;

------->if you want to show all databases then put the command:-

     mysql> show databases;
  
------->if you want to switch one database to another database the run following command:-
     
     mysql> use <database_name>;


************************************************************************************************************************************************

************************************************************************************************************************************************
                                              MAKING API WITH MY_SQL DATABASE USING NODE JS
------------------------------------------------------------------------------------------------------------------------------------------------

MAKING FLAT -API:

STEP 1. CREATE DATABASE APARTMENT AND MAKE FOLLOWING TABLES AND INSERT THE DATA INTO TABLES:-

############################################################# FLAT DATABASE AND QUERIES #######################################################

///FLAT TABLE

CREATE TABLE FLAT(
     FLAT_ID INT NOT NULL,
     BUILDING_ID INT NOT NULL,
     FLOOR_NO INT(1) NOT NULL,
     FLAT_TYPE ENUM('1-BHK','2-BHK','3-BHK','4-BHK') NOT NULL,
     FLAT_STATUS ENUM('AVAILABLE','RESERVED','SOLD') NOT NULL,
     FLAT_AREA FLOAT(10,2) NOT NULL,
     PRICE_PER_SQURE FLOAT(5,2) NOT NULL,
     TOTAL_PRICE FLOAT(10,2),
     PRIMARY KEY(FLAT_ID),
     FOREIGN KEY(BUILDING_ID) REFERENCES BUILDING(BUILDING_ID)
);


///INSERT INTO FLAT

INSERT INTO FLAT VALUES(111,1,3,'2-BHK','AVAILABLE','100.00','800.00','80000.00');
INSERT INTO FLAT VALUES(212,2,5,'3-BHK','RESERVED','90.00','700.00','63000.00');
INSERT INTO FLAT VALUES(112,1,4,'4-BHK','AVAILABLE','150.00','990.00','148500.00');
INSERT INTO FLAT VALUES(310,3,7,'1-BHK','SOLD','40.00','500.00','20000.00');
INSERT INTO FLAT VALUES(211,2,0,'2-BHK','RESERVED','85.00','810.00','68850.00');
INSERT INTO FLAT VALUES(311,3,4,'3-BHK','AVAILABLE','120.00','800.00','96000.00');
INSERT INTO FLAT VALUES(411,4,7,'4-BHK','AVAILABLE','140.00','800.00','112000.00');
INSERT INTO FLAT VALUES(412,4,3,'1-BHK','SOLD','90.00','600.00','63000.00');
INSERT INTO FLAT VALUES(511,5,2,'3-BHK','SOLD','100.00','800.00','80000.00');
INSERT INTO FLAT VALUES(612,6,9,'4-BHK','AVAILABLE','150.00','990.00','148500.00');
INSERT INTO FLAT VALUES(512,5,3,'3-BHK','RESERVED','80.00','800.00','64000.00');
INSERT INTO FLAT VALUES(611,6,1,'2-BHK','SOLD','70.00','800.00','56000.00');

################################################################################################################################################

///FLAT_FEATURES TABLE

CREATE TABLE FLAT_FEATURES(
     FLAT_ID INT NOT NULL,
     FEATURE_ID INT NOT NULL,
     FOREIGN KEY(FLAT_ID) REFERENCES FLAT(FLAT_ID),
     FOREIGN KEY(FEATURE_ID) REFERENCES FEATURES(FEATURE_ID)
);


///INSERT INTO FLAT_FEATURES

INSERT INTO FLAT_FEATURES VALUES(111,1);
INSERT INTO FLAT_FEATURES VALUES(111,2);
INSERT INTO FLAT_FEATURES VALUES(111,3);
INSERT INTO FLAT_FEATURES VALUES(112,2);
INSERT INTO FLAT_FEATURES VALUES(112,3);
INSERT INTO FLAT_FEATURES VALUES(112,4);
INSERT INTO FLAT_FEATURES VALUES(211,1);
INSERT INTO FLAT_FEATURES VALUES(211,4);
INSERT INTO FLAT_FEATURES VALUES(211,3);
INSERT INTO FLAT_FEATURES VALUES(212,3);
INSERT INTO FLAT_FEATURES VALUES(212,1);
INSERT INTO FLAT_FEATURES VALUES(310,1);
INSERT INTO FLAT_FEATURES VALUES(310,2);
INSERT INTO FLAT_FEATURES VALUES(310,3);
INSERT INTO FLAT_FEATURES VALUES(310,4);
INSERT INTO FLAT_FEATURES VALUES(311,2);
INSERT INTO FLAT_FEATURES VALUES(311,4);
INSERT INTO FLAT_FEATURES VALUES(412,3);
INSERT INTO FLAT_FEATURES VALUES(412,1);
INSERT INTO FLAT_FEATURES VALUES(412,4);
INSERT INTO FLAT_FEATURES VALUES(411,1);
INSERT INTO FLAT_FEATURES VALUES(411,3);
INSERT INTO FLAT_FEATURES VALUES(511,4);
INSERT INTO FLAT_FEATURES VALUES(512,2);
INSERT INTO FLAT_FEATURES VALUES(512,3);
INSERT INTO FLAT_FEATURES VALUES(611,1);
INSERT INTO FLAT_FEATURES VALUES(612,4);

###############################################################################################################################################


///FEATURES TABLE

CREATE TABLE FEATURES(
     FEATURE_ID INT NOT NULL,
     FEATURE_NAME VARCHAR(30) NOT NULL,
     PRIMARY KEY(FEATURE_ID)
);


////INSERT INTO FEATURES

INSERT INTO FEATURES VALUES(1,'PARKING');
INSERT INTO FEATURES VALUES(2,'BALCONY');
INSERT INTO FEATURES VALUES(3,'GYM');
INSERT INTO FEATURES VALUES(4,'TERRISE');

###############################################################################################################################################


///BUILDING TABLE

CREATE TABLE BUILDING(
     BUILDING_ID INT NOT NULL,
     BUILDING_NAME VARCHAR(30) NOT NULL,
     NO_OF_FLOOR INT(1) NOT NULL,
     PRIMARY KEY(BUILDING_ID)
);


///INSERT INTO BUILDING

INSERT INTO BUILDING VALUES(1,'MANNAT',9);
INSERT INTO BUILDING VALUES(2,'GALEXY',9);
INSERT INTO BUILDING VALUES(3,'SAHARA',9);
INSERT INTO BUILDING VALUES(4,'JALSA',9);
INSERT INTO BUILDING VALUES(5,'PRATIKSHA',9);
INSERT INTO BUILDING VALUES(2,'INTALIYA',9);


################################################################################################################################################

//////QUERRY FOR GETTING FEATURES OF THE FLAT

SELECT FLAT.FLAT_ID,FLAT.FLAT_TYPE,FEATURES.FEATURE_NAME FROM ((FLAT INNER JOIN FLAT_FEATURES ON FLAT.FLAT_ID=FLAT_FEATURES.FLAT_ID) INNER JOIN FEATURES ON FLAT_FEATURES.FEATURE_ID=FEATURES.FEATURE_ID);

************************************************************************************************************************************************
/////QUERY FOR SEARCHING FLAT ACCORDING TO THE FEATURE_NAME

SELECT FLAT.FLAT_ID,FLAT.FLAT_TYPE,FEATURES.FEATURE_NAME FROM ((FLAT INNER JOIN FLAT_FEATURES ON FLAT.FLAT_ID=FLAT_FEATURES.FLAT_ID) INNER JOIN FEATURES ON FLAT_FEATURES.FEATURE_ID=FEATURES.FEATURE_ID) WHERE FEATURES.FEATURE_NAME='PARKING' OR FEATURES.FEATURE_NAME='BALCONY';

************************************************************************************************************************************************

/////QUERY FOR SEARCHING FLAT ACCORDING TO THE FLAT_TYPE

SELECT * FROM FLAT WHERE FLAT_TYPE='2-BHK';

************************************************************************************************************************************************

/////QUERY FOR SEARCHING FLAT ACCORDING TO THE FLOOR NUMBER

SELECT * FROM FLAT  WHERE FLOOR_NO=2 OR FLOOR_NO=5;

************************************************************************************************************************************************

/////QUERY FOR SEARCHING FLAT ACCORDING TO THE SORTED PRICE ACE OR DESC

SELECT * FROM FLAT ORDER BY TOTAL_PRICE;
////OR
SELECT * FROM FLAT ORDER BY TOTAL_PRICE DESC;

************************************************************************************************************************************************

/////QUERY FOR SEARCHING FLAT ACCORDING TO THE AVAILABLE FLAT

SELECT * FROM FLAT WHERE FLAT_STATUS='AVAILABLE';

************************************************************************************************************************************************

/////QUERY FOR SEARCHING FLAT ACCORDING TO THE FLAT_STATUS AND FLAT_TYPE WITH LIMIT

SELECT * FROM FLAT WHERE FLAT_STATUS='AVAILABLE' AND (FLAT_TYPE='2-BHK' OR FLAT_TYPE='3-BHK') LIMIT 5;

################################################################################################################################################


STEP-2: follow the gitHub link given bellow FOR COMPLETE FILES AND FOLDER STRUCTURES :

https://github.com/pushpendra971/MY_SQL-FLAT-API/blob/master/FLAT_API_TEST_updated.zip


_________________________________________________________________________________________________________________________________________________

                                                          EXECUTION OF THE API
------------------------------------------------------------------------------------------------------------------------------------------------
1.open the editor and import the code in visual studio code 
2.open the project terminal and set the port using command given bellow:-

       $ sudo fuser -k 3000/tcp

       $ sam local start-api

it will start the api locally.

3.install postman and send the request (GET/PUT/POST/DELETE) FROM USING URL: localhost:3000/Apartments 

NOTE: for get give key_value from params and for other operation provide schema of key and value in body portion.

4.After sending request wait for few seconds and it will return the result of your request in the response portion.

------------------------------------------------------------------------------------------------------------------------------------------------

                                                          ERRORS AND THEIR SOLUTIONS
------------------------------------------------------------------------------------------------------------------------------------------------


      SN.           Problems                                                              Solutions
      

      1.  Execute is not defined                        ->                          See the index.js file

      2.  Should be object                              ->                          Check query-attribute                    

      3.  Internal server error                         ->                          Check that particular api foramt of query

      4.  My-sql Syntax error                           ->                          Check your my-sql query

      5.  Type not defined                              ->                          Check the type of addtional values

      6.  Additional values not allowed                 ->                          Check ur schemas set additional properties.
 
      7.  Atleast should be required values             ->                          Give the required field

      8.  Token is missing                              ->                          postman REQUEST is not valid

      9.  validation failed                             ->                          Check the value because its not valid.

      10. ajv is not found                              ->                          Install ajv with npm in your project folder.


***********************************************************************************************************************************************
                                                            ALL THE BEST
***********************************************************************************************************************************************

                                                                                                                             : PUSHPENDRA SINGH









     

