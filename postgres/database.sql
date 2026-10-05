DROP DATABASE IF EXISTS `deliber`;
CREATE DATABASE `deliber`; 
USE `deliber`;

CREATE TABLE Users (
        id                                              INT,
        name                                    VARCHAR(40),
        phone_number                    VARCHAR(20),
        PRIMARY KEY (id)
) engine=innodb;
                

CREATE TABLE Customers (
        cid                                             INT,
        address                                 VARCHAR(100),
    nickname                            VARCHAR(40),
        PRIMARY KEY (cid),
        FOREIGN KEY (cid) REFERENCES Users(id)
) engine=innodb;
                

CREATE TABLE Credit_cards (
        card_number                             VARCHAR(20), 
        expr_date                               CHAR(6),
        cid                                             INT,
        PRIMARY KEY (card_number),
        FOREIGN KEY (cid) REFERENCES Customers(cid)
) engine=innodb;
                

CREATE TABLE Drivers (
        did                                             INT,
        ssn                                             CHAR(9),
        bank_account_number             VARCHAR(20),
        bank_account_routing_number     VARCHAR(20),
        PRIMARY KEY (did),
        FOREIGN KEY (did) REFERENCES Users(id)
) engine=innodb;
                

CREATE TABLE Restaurants (
        rid                                                             INT,
        name                                                    VARCHAR(40),
        address                                                 VARCHAR(100),
        bank_account_number                             VARCHAR(20),
        bank_account_routing_number             VARCHAR(20),
        last_bank_transaction_datetime  DATETIME, 
        PRIMARY KEY (rid)
) engine=innodb;

CREATE TABLE Restaurants_cuisine (
        rid                             INT,
    cuisine_type        VARCHAR(20),                            
        PRIMARY KEY (rid, cuisine_type),
        FOREIGN KEY (rid) REFERENCES Restaurants(rid)
) engine=innodb;

CREATE TABLE Customers_review (
        cid                                     INT,
        rid                                     INT,
        rating                          INT,
    customer_comment    VARCHAR(100),                           
        PRIMARY KEY (cid,rid),
        FOREIGN KEY (cid) REFERENCES Customers(cid),
        FOREIGN KEY (rid) REFERENCES Restaurants(rid)
) engine=innodb;


CREATE TABLE Orders (
        oid                                     INT,
        cid                                     INT,  
        did                                     INT,  
        rid                                     INT, 
        order_datetime          DATETIME, 
        total_amount            DECIMAL(7,2), 
        PRIMARY KEY (oid),
        FOREIGN KEY (cid) REFERENCES Customers(cid),
        FOREIGN KEY (did) REFERENCES Drivers(did),
        FOREIGN KEY (rid) REFERENCES Restaurants(rid)
) engine=innodb;

CREATE TABLE Orders_status_code_text (
        order_status_code       INT,
        order_status_text       VARCHAR(40),
        PRIMARY KEY (order_status_code)
) engine=innodb;

CREATE TABLE Orders_track_status (
        oid                                             INT,
        order_status_code               INT,
        order_status_datetime   DATETIME,
        PRIMARY KEY (oid, order_status_code),
        FOREIGN KEY (oid) REFERENCES Orders(oid),
        FOREIGN KEY (order_status_code) REFERENCES Orders_status_code_text(order_status_code)
) engine=innodb;

CREATE TABLE Dishes (
        rid                                     INT,
        name                            VARCHAR(40),
        price                           DECIMAL(6,2),
        PRIMARY KEY (rid, name),
        FOREIGN KEY (rid) REFERENCES Restaurants(rid)
) engine=innodb;
                

CREATE TABLE Orders_Contain_Dishes (
        oid                                     INT,
        rid                                     INT,
        name                            VARCHAR(40),
        quantity                        INT,
        PRIMARY KEY (oid, rid, name),
        FOREIGN KEY (oid) REFERENCES Orders (oid),
        FOREIGN KEY (rid, name) REFERENCES Dishes(rid, name)
) engine=innodb;

INSERT INTO Users VALUES (1,'Patrick M. Tyler','8045437860');
INSERT INTO Users VALUES (2,'Danny C. Malveaux','2197757988');
INSERT INTO Users VALUES (3,'Kenneth B. Knight','8177123731');
INSERT INTO Users VALUES (4,'Richard A. Delvalle','8503387148');
INSERT INTO Users VALUES (5,'Gladys B. Hopper','7249386285');
INSERT INTO Users VALUES (6,'Sara T. Wilson','9544657930');
INSERT INTO Users VALUES (7,'Charles M. Gunter','8476474341');
INSERT INTO Users VALUES (8,'Michelle L. Nye','5089838873');
INSERT INTO Users VALUES (9,'Joseph A. Obrien','7128344242');
INSERT INTO Users VALUES (10,'James M. Schwan','9416555246');
INSERT INTO Users VALUES (11,'Kristy H. Hilliard','5108968715');
INSERT INTO Users VALUES (12,'Joyce J. Rayo','7655488979');
INSERT INTO Users VALUES (13,'Roy T. Herbert','3144716335');
INSERT INTO Users VALUES (14,'Sophia D. Williams','6232172561');
INSERT INTO Users VALUES (15,'Timothy M. Wilhelm','6064597158');
INSERT INTO Users VALUES (16,'Michael R. Deane','7249012724');
INSERT INTO Users VALUES (17,'Guadalupe C. Necaise','3303786111');
INSERT INTO Users VALUES (18,'Raul A. Dicarlo','3045556200');
INSERT INTO Users VALUES (19,'Kendrick S. Craig','7145330674');
INSERT INTO Users VALUES (20,'Timothy A. German','4806508364');
INSERT INTO Users VALUES (21,'Kathleen T. Shelly','4193083429');
INSERT INTO Users VALUES (22,'Joel A. Lozano','6127183747');
INSERT INTO Users VALUES (23,'Jeffrey C. Shields','6168348281');
INSERT INTO Users VALUES (24,'Nora W. Hardy','4122207647');
INSERT INTO Users VALUES (25,'Rolando K. Smith','2153675184');
INSERT INTO Users VALUES (26,'James K. McGaha','8307987830');
INSERT INTO Users VALUES (27,'Elizabeth S. Bongiorno','5188786207');
INSERT INTO Users VALUES (28,'Anne M. Gurley','6065142942');
INSERT INTO Users VALUES (29,'Janet A. Ricker','6508792045');
INSERT INTO Users VALUES (30,'Nathan M. Schneider','3122981148');


INSERT INTO Customers VALUES (1,'9091 Spectrum Pointe Drive, Ste. 320, Lake Forest, CA, 92630-228899','Forsaken Captain');
INSERT INTO Customers VALUES (2,'9091 Watermarke Place, Irvine, CA, 92612-168199','Gargoyle Bad');
INSERT INTO Customers VALUES (3,'9091290 North Hancock Street, Ste. 103, Anaheim, CA, 92807-198299','Alien Leader');
INSERT INTO Customers VALUES (4,'90914780 Pipeline Avenue, Chino Hills, CA, 91709-602999','Poseidon Arrow');
INSERT INTO Customers VALUES (5,'90914851 Jeffrey Road, Spc. 187, Irvine, CA, 92618-818799','El Agent');
INSERT INTO Customers VALUES (6,'90915241 Laguna Canyon Road, Irvine, CA, 9261899','Stony Prince');
INSERT INTO Customers VALUES (7,'9091536 East Warner Avenue, Ste. A, Santa Ana, CA, 92705-547499','The Gladiator');
INSERT INTO Customers VALUES (8,'9091536 West Warner Avenue, Ste. F, Santa Ana, CA, 92705-547499','The Oyster');
INSERT INTO Customers VALUES (9,'90915661 Red Hill Avenue, Ste. 201, Tustin, CA, 92780-732899','Elastic Mustard');
INSERT INTO Customers VALUES (10,'90916470 Bake Parkway, Irvine, CA, 92618-466599','Mars Lieutenant');
INSERT INTO Customers VALUES (12,'90924367 Von Karman Avenue, Ste. 200, Irvine, CA, 92606-496099','Heavy Major');
INSERT INTO Customers VALUES (14,'90917772 17th Street, Ste. 204, Tustin, CA, 92780-194599','Nana Deadwood');
INSERT INTO Customers VALUES (16,'909195 North Euclid Avenue, Ste. 100, Upland, CA, 91786-605799','Dana Hawkins');
INSERT INTO Customers VALUES (18,'90937654 Savi Ranch Pkwy, Ste 997, Yorba Linda, CA, 92887-465667','Gold Kala Fargloom');
INSERT INTO Customers VALUES (20,'90923046 Avenida De La Carlota, Ste. 700, Laguna Hills, CA, 92653-153799','Bloody Lena Stoker');
INSERT INTO Customers VALUES (22,'90923726 Birtcher Drive, Lake Forest, CA, 92630-177199','Gold Jacob Silverbeard');
INSERT INTO Customers VALUES (24,'9092603 Main Street, Ste. 500, Irvine, CA, 92614-426199','Blimey Billy Blackstroker');
INSERT INTO Customers VALUES (26,'90927261 Las Ramblas, Ste. 100, Mission Viejo, CA, 92691-646999','Joe Harker');
INSERT INTO Customers VALUES (28,'90931 Creek Road, Irvine, CA, 92604-479399','Brutus Pale Klek');
INSERT INTO Customers VALUES (30,'90932565 Golden Lantern St., Dana Point, CA, 9262999','The Brave Boy');


INSERT INTO Credit_cards VALUES ('4556329565920130','201804',1);
INSERT INTO Credit_cards VALUES ('4916175130886590','201709',2);
INSERT INTO Credit_cards VALUES ('4916175130886591','201710',2);
INSERT INTO Credit_cards VALUES ('5494093856148590','201901',3);
INSERT INTO Credit_cards VALUES ('4929563261427360','201708',4);
INSERT INTO Credit_cards VALUES ('5237873244022850','202001',5);
INSERT INTO Credit_cards VALUES ('5287354623187220','202006',6);
INSERT INTO Credit_cards VALUES ('5148653950065040','201703',7);
INSERT INTO Credit_cards VALUES ('5342606261361020','201701',8);
INSERT INTO Credit_cards VALUES ('4539892939905710','202002',9);
INSERT INTO Credit_cards VALUES ('5206799068889840','201611',10);
INSERT INTO Credit_cards VALUES ('5440924209076610','202010',12);
INSERT INTO Credit_cards VALUES ('5440924209076611','202011',12);
INSERT INTO Credit_cards VALUES ('5440924209076612','202012',12);
INSERT INTO Credit_cards VALUES ('5183019558389940','202003',12);
INSERT INTO Credit_cards VALUES ('4916338029614760','201607',14);
INSERT INTO Credit_cards VALUES ('5517686192491710','201904',14);
INSERT INTO Credit_cards VALUES ('4716312146481090','201710',16);
INSERT INTO Credit_cards VALUES ('4539184923748880','202002',16);
INSERT INTO Credit_cards VALUES ('5504563047715920','202007',18);
INSERT INTO Credit_cards VALUES ('5504563047715921','202007',18);
INSERT INTO Credit_cards VALUES ('5504563047715922','202007',18);
INSERT INTO Credit_cards VALUES ('5569446663631670','202006',20);
INSERT INTO Credit_cards VALUES ('5430997849413460','202007',20);
INSERT INTO Credit_cards VALUES ('5152075490618730','201903',20);
INSERT INTO Credit_cards VALUES ('4485878465097330','201709',22);
INSERT INTO Credit_cards VALUES ('5334863767315230','201909',22);
INSERT INTO Credit_cards VALUES ('4556861362281150','202003',24);
INSERT INTO Credit_cards VALUES ('5196225374931750','201706',24);
INSERT INTO Credit_cards VALUES ('5203516642249650','202009',26);
INSERT INTO Credit_cards VALUES ('4716092000501320','201909',26);
INSERT INTO Credit_cards VALUES ('5298629173124740','201802',28);
INSERT INTO Credit_cards VALUES ('4532276170921090','201710',28);
INSERT INTO Credit_cards VALUES ('5163586608690700','201708',30);
INSERT INTO Credit_cards VALUES ('5455323415765240','202010',30);


INSERT INTO Drivers VALUES (1,'224809901','32956592','01304556');
INSERT INTO Drivers VALUES (2,'315109902','17513088','65904916');
INSERT INTO Drivers VALUES (3,'594769903','09385614','85905494');
INSERT INTO Drivers VALUES (4,'179589904','56326142','73604929');
INSERT INTO Drivers VALUES (5,'044209905','87324402','28505237');
INSERT INTO Drivers VALUES (6,'266889906','35462318','72205287');
INSERT INTO Drivers VALUES (7,'337489907','65395006','50405148');
INSERT INTO Drivers VALUES (8,'028849908','60626136','10205342');
INSERT INTO Drivers VALUES (9,'480769909','89293990','57104539');
INSERT INTO Drivers VALUES (10,'771369910','79906888','98405206');
INSERT INTO Drivers VALUES (11,'557559911','92420907','66105440');
INSERT INTO Drivers VALUES (13,'494329913','33802961','47604916');
INSERT INTO Drivers VALUES (15,'401049915','31214648','10904716');
INSERT INTO Drivers VALUES (17,'270019917','56304771','59205504');
INSERT INTO Drivers VALUES (19,'624459919','99784941','34605430');
INSERT INTO Drivers VALUES (21,'268129921','87846509','73304485');
INSERT INTO Drivers VALUES (23,'365709923','86136228','11504556');
INSERT INTO Drivers VALUES (25,'172039925','51664224','96505203');
INSERT INTO Drivers VALUES (27,'063769927','62917312','47405298');
INSERT INTO Drivers VALUES (29,'608249929','58660869','07005163');


INSERT INTO Restaurants VALUES (1,'Pat Urban Seoul','82750 Alton Pkwy, Irvine, CA, 926069','32950130','65924556','2015-01-01 01:11:01');
INSERT INTO Restaurants VALUES (2,'Dan Urban Plates','993972 Barranca Pkwy, Irvine, CA, 926059','17516590','30884916','2015-01-02 02:22:02');
INSERT INTO Restaurants VALUES (3,'Ken Fish Grill','953988 Barranca Pkwy, Irvine, CA, 926078','09388590','56145494','2015-01-03 03:33:03');
INSERT INTO Restaurants VALUES (4,'Ric Miyabi Shabu Shabu Grill','9815435 Jeffrey Rd, Irvine, CA, 926187','56327360','61424929','2015-01-04 04:04:04');
INSERT INTO Restaurants VALUES (5,'Sar Tang 190','194218 Jeffrey Rd, Irvine, CA, 926549','87322850','44025237','2015-01-05 05:55:05');
INSERT INTO Restaurants VALUES (6,'Ann Falasophy','541923 Construction Circle, Irvine, CA, 926732','35467220','23185287','2015-01-06 06:06:06');
INSERT INTO Restaurants VALUES (7,'Nat Sandwich Plus','435216 Technology Dr, Irvine, CA, 926431','65395040','50065148','2015-01-07 07:07:07');
INSERT INTO Restaurants VALUES (8,'Rom Del Sushi','994243 Campus Dr, Irvine, CA, 924325','60621020','61365342','2015-01-08 08:08:08');
INSERT INTO Restaurants VALUES (9,'Kri Dhaba','952231 Michelson Dr, Irvine, CA, 926652','89295710','39904539','2015-01-09 09:09:09');
INSERT INTO Restaurants VALUES (10,'Nor Kingchops','914463 Culver Dr, Irvine, CA, 924553','79909840','68885206','2015-01-10 10:10:10');

INSERT INTO Restaurants_cuisine VALUES (1,'American');
INSERT INTO Restaurants_cuisine VALUES (1,'Mexican');
INSERT INTO Restaurants_cuisine VALUES (2,'Asian');
INSERT INTO Restaurants_cuisine VALUES (2,'Indian');
INSERT INTO Restaurants_cuisine VALUES (2,'Mexican');
INSERT INTO Restaurants_cuisine VALUES (3,'Mexican');
INSERT INTO Restaurants_cuisine VALUES (3,'Italian');
INSERT INTO Restaurants_cuisine VALUES (4,'Greek');
INSERT INTO Restaurants_cuisine VALUES (4,'French');
INSERT INTO Restaurants_cuisine VALUES (5,'French');
INSERT INTO Restaurants_cuisine VALUES (5,'Italian');
INSERT INTO Restaurants_cuisine VALUES (5,'Greek');
INSERT INTO Restaurants_cuisine VALUES (6,'American');
INSERT INTO Restaurants_cuisine VALUES (7,'American');
INSERT INTO Restaurants_cuisine VALUES (7,'French');
INSERT INTO Restaurants_cuisine VALUES (8,'Asian');
INSERT INTO Restaurants_cuisine VALUES (9,'Indian');
INSERT INTO Restaurants_cuisine VALUES (10,'Italian');

INSERT INTO Customers_review VALUES (1,1,4,'Delicious food');
INSERT INTO Customers_review VALUES (1,3,3,'Nothing special');
INSERT INTO Customers_review VALUES (1,5,5,'Awesome. Will order again.');
INSERT INTO Customers_review VALUES (2,3,1,'Terrible. Do not recommend at all.');
INSERT INTO Customers_review VALUES (18,10,4,'ordinary food');
INSERT INTO Customers_review VALUES (3,2,4,'Wonderful');
INSERT INTO Customers_review VALUES (3,3,1,'too bad I ordered this');
INSERT INTO Customers_review VALUES (28,1,1,'I am not sure why I ordered this.');
INSERT INTO Customers_review VALUES (26,4,5,'Fantastic food');
INSERT INTO Customers_review VALUES (20,6,2,'I am not satisfied at all.');
INSERT INTO Customers_review VALUES (18,5,5,'Soooo delicious');
INSERT INTO Customers_review VALUES (16,8,4,'I am a big fan of this restaurant.');
INSERT INTO Customers_review VALUES (14,7,5,'Perfect food');
INSERT INTO Customers_review VALUES (12,6,1,'Not a good meal');
INSERT INTO Customers_review VALUES (1,2,1,'Really disappointed');
INSERT INTO Customers_review VALUES (12,2,2,'Disappointed');
INSERT INTO Customers_review VALUES (14,2,3,'Better than I expected');
INSERT INTO Customers_review VALUES (16,2,4,'Tried many times. So good');
INSERT INTO Customers_review VALUES (18,2,5,'What can I say? Order now.');

INSERT INTO Dishes VALUES (1,'kalbi burger',7.95);
INSERT INTO Dishes VALUES (1,'tacos',7.50);
INSERT INTO Dishes VALUES (1,'japchae mari',6.50);
INSERT INTO Dishes VALUES (2,'grilled free range chicken',10.50);
INSERT INTO Dishes VALUES (2,'grilled steak',10.50);
INSERT INTO Dishes VALUES (2,'oven baked salmon',12.50);
INSERT INTO Dishes VALUES (3,'swordfish',11.50);
INSERT INTO Dishes VALUES (3,'skewered shrimp',10.99);
INSERT INTO Dishes VALUES (3,'salmon',13.00);
INSERT INTO Dishes VALUES (4,'seafood salad',12.00);
INSERT INTO Dishes VALUES (4,'wafu steak',14.00);
INSERT INTO Dishes VALUES (4,'surf and turf',23.99);
INSERT INTO Dishes VALUES (5,'yukgejang',12.99);
INSERT INTO Dishes VALUES (5,'galbitang',16.00);
INSERT INTO Dishes VALUES (5,'samgyetang',29.99);
INSERT INTO Dishes VALUES (6,'the burger combo',32.99);
INSERT INTO Dishes VALUES (6,'the karma burger',18.00);
INSERT INTO Dishes VALUES (6,'hummus',13.99);
INSERT INTO Dishes VALUES (7,'fresh lemonade',12.99);
INSERT INTO Dishes VALUES (7,'the thai wrap',13.00);
INSERT INTO Dishes VALUES (7,'sandwich',16.99);
INSERT INTO Dishes VALUES (8,'bacon relish',35.50);
INSERT INTO Dishes VALUES (8,'alioi spanish',19.00);
INSERT INTO Dishes VALUES (8,'burger',11.99);
INSERT INTO Dishes VALUES (9,'tempura',31.50);
INSERT INTO Dishes VALUES (9,'sesame chicken',11.00);
INSERT INTO Dishes VALUES (9,'seafood salad',17.99);
INSERT INTO Dishes VALUES (10,'king prawn',97.10);
INSERT INTO Dishes VALUES (10,'grilled steak',49.00);
INSERT INTO Dishes VALUES (10,'wafu steak',45.99);


INSERT INTO Orders VALUES (1,1,3,1,'2015-01-01 12:34:34',22.50);
INSERT INTO Orders VALUES (2,2,1,3,'2015-01-02 11:11:11',115.00);
INSERT INTO Orders VALUES (3,3,2,3,'2015-01-03 12:22:22',96.50);
INSERT INTO Orders VALUES (4,1,4,7,'2015-01-04 13:33:33',85.96);
INSERT INTO Orders VALUES (5,2,5,5,'2015-01-05 16:33:33',153.97);
INSERT INTO Orders VALUES (6,3,6,2,'2015-01-06 17:17:17',62.50);
INSERT INTO Orders VALUES (7,12,13,4,'2015-01-07 15:34:34',22.50);
INSERT INTO Orders VALUES (8,14,15,6,'2015-01-08 18:34:34',358.85);
INSERT INTO Orders VALUES (9,16,17,8,'2015-01-09 19:34:34',59.95);
INSERT INTO Orders VALUES (10,18,19,10,'2015-01-10 20:01:01',1379.70);
INSERT INTO Orders VALUES (11,1,5,9,'2015-01-11 08:01:01',173.94);
INSERT INTO Orders VALUES (12,1,13,3,'2015-01-12 09:22:22',709.8);
INSERT INTO Orders VALUES (13,1,19,4,'2015-01-13 11:45:45',1199.5);
INSERT INTO Orders VALUES (14,1,17,8,'2015-01-14 13:24:24',569.88);
INSERT INTO Orders VALUES (15,1,15,5,'2015-01-15 14:22:22',129.9);
INSERT INTO Orders VALUES (16,1,29,6,'2015-01-16 15:31:31',41.97);
INSERT INTO Orders VALUES (17,1,6,9,'2015-01-17 22:56:56',315.0);
INSERT INTO Orders VALUES (18,1,25,10,'2015-01-18 21:00:00',2913);
INSERT INTO Orders VALUES (19,28,1,1,'2015-01-19 21:12:12',32.5);
INSERT INTO Orders VALUES (20,1,27,2,'2015-01-20 20:54:54',210);

INSERT INTO Orders_status_code_text VALUES (1, "Initialized");
INSERT INTO Orders_status_code_text VALUES (2, "Being prepared");
INSERT INTO Orders_status_code_text VALUES (3, "Being delivered");
INSERT INTO Orders_status_code_text VALUES (4, "Delivery is done");

INSERT INTO Orders_track_status VALUES (1, 1, '2015-01-01 12:34:34');
INSERT INTO Orders_track_status VALUES (1, 2, '2015-01-01 12:44:34');
INSERT INTO Orders_track_status VALUES (1, 3, '2015-01-01 12:54:34');
INSERT INTO Orders_track_status VALUES (1, 4, '2015-01-01 13:24:34');
INSERT INTO Orders_track_status VALUES (2, 1, '2015-01-02 11:11:11');
INSERT INTO Orders_track_status VALUES (2, 2, '2015-01-02 11:12:11');
INSERT INTO Orders_track_status VALUES (2, 3, '2015-01-02 11:19:11');
INSERT INTO Orders_track_status VALUES (2, 4, '2015-01-02 11:24:11');
INSERT INTO Orders_track_status VALUES (3, 1, '2015-01-03 12:22:22');
INSERT INTO Orders_track_status VALUES (3, 2, '2015-01-03 12:28:22');
INSERT INTO Orders_track_status VALUES (3, 3, '2015-01-03 12:32:22');
INSERT INTO Orders_track_status VALUES (3, 4, '2015-01-03 12:52:22');
INSERT INTO Orders_track_status VALUES (4, 1, '2015-01-04 13:33:33');
INSERT INTO Orders_track_status VALUES (4, 2, '2015-01-04 13:53:33');
INSERT INTO Orders_track_status VALUES (4, 3, '2015-01-04 14:23:33');
INSERT INTO Orders_track_status VALUES (4, 4, '2015-01-04 15:33:33');
INSERT INTO Orders_track_status VALUES (5, 1, '2015-01-05 16:33:33');
INSERT INTO Orders_track_status VALUES (5, 2, '2015-01-05 17:33:33');
INSERT INTO Orders_track_status VALUES (5, 3, '2015-01-05 18:33:33');
INSERT INTO Orders_track_status VALUES (5, 4, '2015-01-05 19:33:33');
INSERT INTO Orders_track_status VALUES (6, 1, '2015-01-06 17:17:17');
INSERT INTO Orders_track_status VALUES (6, 2, '2015-01-06 17:27:17');
INSERT INTO Orders_track_status VALUES (6, 3, '2015-01-06 17:37:17');
INSERT INTO Orders_track_status VALUES (6, 4, '2015-01-06 17:47:17');
INSERT INTO Orders_track_status VALUES (7, 1, '2015-01-07 15:34:34');
INSERT INTO Orders_track_status VALUES (7, 2, '2015-01-07 15:35:34');
INSERT INTO Orders_track_status VALUES (7, 3, '2015-01-07 15:46:34');
INSERT INTO Orders_track_status VALUES (7, 4, '2015-01-07 15:59:34');
INSERT INTO Orders_track_status VALUES (8, 1, '2015-01-08 18:34:34');
INSERT INTO Orders_track_status VALUES (8, 2, '2015-01-08 18:54:34');
INSERT INTO Orders_track_status VALUES (8, 3, '2015-01-08 19:14:34');
INSERT INTO Orders_track_status VALUES (8, 4, '2015-01-08 19:34:34');
INSERT INTO Orders_track_status VALUES (9, 1, '2015-01-09 19:34:34');
INSERT INTO Orders_track_status VALUES (9, 2, '2015-01-09 19:39:34');
INSERT INTO Orders_track_status VALUES (9, 3, '2015-01-09 19:43:34');
INSERT INTO Orders_track_status VALUES (9, 4, '2015-01-09 20:12:34');
INSERT INTO Orders_track_status VALUES (10, 1, '2015-01-10 20:01:01');
INSERT INTO Orders_track_status VALUES (10, 2, '2015-01-10 21:04:01');
INSERT INTO Orders_track_status VALUES (10, 3, '2015-01-10 22:02:01');
INSERT INTO Orders_track_status VALUES (10, 4, '2015-01-10 23:03:01');
INSERT INTO Orders_track_status VALUES (11, 1, '2015-01-11 08:01:01');
INSERT INTO Orders_track_status VALUES (11, 2, '2015-01-11 08:13:01');
INSERT INTO Orders_track_status VALUES (11, 3, '2015-01-11 08:25:01');
INSERT INTO Orders_track_status VALUES (11, 4, '2015-01-11 08:39:01');
INSERT INTO Orders_track_status VALUES (12, 1, '2015-01-12 09:22:22');
INSERT INTO Orders_track_status VALUES (12, 2, '2015-01-12 09:29:22');
INSERT INTO Orders_track_status VALUES (12, 3, '2015-01-12 09:45:22');
INSERT INTO Orders_track_status VALUES (12, 4, '2015-01-12 11:22:22');
INSERT INTO Orders_track_status VALUES (13, 1, '2015-01-13 11:45:45');
INSERT INTO Orders_track_status VALUES (13, 2, '2015-01-13 11:55:45');
INSERT INTO Orders_track_status VALUES (13, 3, '2015-01-13 12:25:45');
INSERT INTO Orders_track_status VALUES (13, 4, '2015-01-13 12:55:45');
INSERT INTO Orders_track_status VALUES (14, 1, '2015-01-14 13:24:24');
INSERT INTO Orders_track_status VALUES (14, 2, '2015-01-14 14:14:24');
INSERT INTO Orders_track_status VALUES (14, 3, '2015-01-14 14:34:24');
INSERT INTO Orders_track_status VALUES (14, 4, '2015-01-14 14:55:24');
INSERT INTO Orders_track_status VALUES (15, 1, '2015-01-15 14:22:22');
INSERT INTO Orders_track_status VALUES (15, 2, '2015-01-15 14:24:22');
INSERT INTO Orders_track_status VALUES (15, 3, '2015-01-15 14:28:22');
INSERT INTO Orders_track_status VALUES (15, 4, '2015-01-15 14:53:22');
INSERT INTO Orders_track_status VALUES (16, 1, '2015-01-16 15:31:31');
INSERT INTO Orders_track_status VALUES (16, 2, '2015-01-16 16:31:31');
INSERT INTO Orders_track_status VALUES (16, 3, '2015-01-16 17:31:31');
INSERT INTO Orders_track_status VALUES (16, 4, '2015-01-16 18:31:31');
INSERT INTO Orders_track_status VALUES (17, 1, '2015-01-17 22:56:56');
INSERT INTO Orders_track_status VALUES (17, 2, '2015-01-17 22:59:56');
INSERT INTO Orders_track_status VALUES (17, 3, '2015-01-17 23:12:56');
INSERT INTO Orders_track_status VALUES (17, 4, '2015-01-17 23:46:56');
INSERT INTO Orders_track_status VALUES (18, 1, '2015-01-18 21:00:00');
INSERT INTO Orders_track_status VALUES (18, 2, '2015-01-18 21:11:00');
INSERT INTO Orders_track_status VALUES (18, 3, '2015-01-18 21:22:00');
INSERT INTO Orders_track_status VALUES (18, 4, '2015-01-18 21:30:00');
INSERT INTO Orders_track_status VALUES (19, 1, '2015-01-19 21:12:12');
INSERT INTO Orders_track_status VALUES (19, 2, '2015-01-19 21:33:12');
INSERT INTO Orders_track_status VALUES (19, 3, '2015-01-19 21:43:12');
INSERT INTO Orders_track_status VALUES (19, 4, '2015-01-19 21:58:12');
INSERT INTO Orders_track_status VALUES (20, 1, '2015-01-20 20:54:54');
INSERT INTO Orders_track_status VALUES (20, 2, '2015-01-20 20:57:54');
INSERT INTO Orders_track_status VALUES (20, 3, '2015-01-20 20:59:54');
INSERT INTO Orders_track_status VALUES (20, 4, '2015-01-20 21:34:54');


INSERT INTO Orders_Contain_Dishes VALUES (1,1,'tacos',3);
INSERT INTO Orders_Contain_Dishes VALUES (2,3,'swordfish',10);
INSERT INTO Orders_Contain_Dishes VALUES (3,3,'swordfish',5);
INSERT INTO Orders_Contain_Dishes VALUES (3,3,'salmon',3);
INSERT INTO Orders_Contain_Dishes VALUES (4,7,'fresh lemonade',2);
INSERT INTO Orders_Contain_Dishes VALUES (4,7,'the thai wrap',2);
INSERT INTO Orders_Contain_Dishes VALUES (4,7,'sandwich',2);
INSERT INTO Orders_Contain_Dishes VALUES (5,5,'galbitang',4);
INSERT INTO Orders_Contain_Dishes VALUES (5,5,'samgyetang',3);
INSERT INTO Orders_Contain_Dishes VALUES (6,2,'oven baked salmon',5);
INSERT INTO Orders_Contain_Dishes VALUES (7,4,'wafu steak',1);
INSERT INTO Orders_Contain_Dishes VALUES (8,6,'the burger combo',5);
INSERT INTO Orders_Contain_Dishes VALUES (8,6,'hummus',10);
INSERT INTO Orders_Contain_Dishes VALUES (8,6,'the karma burger',3);
INSERT INTO Orders_Contain_Dishes VALUES (9,8,'burger',5);
INSERT INTO Orders_Contain_Dishes VALUES (10,10,'wafu steak',30);
INSERT INTO Orders_Contain_Dishes VALUES (11,9,'seafood salad',6);
INSERT INTO Orders_Contain_Dishes VALUES (11,9,'sesame chicken',6);
INSERT INTO Orders_Contain_Dishes VALUES (12,3,'salmon',20);
INSERT INTO Orders_Contain_Dishes VALUES (12,3,'skewered shrimp',20);
INSERT INTO Orders_Contain_Dishes VALUES (12,3,'swordfish',20);
INSERT INTO Orders_Contain_Dishes VALUES (13,4,'surf and turf',50);
INSERT INTO Orders_Contain_Dishes VALUES (14,8,'bacon relish',12);
INSERT INTO Orders_Contain_Dishes VALUES (14,8,'burger',12);
INSERT INTO Orders_Contain_Dishes VALUES (15,5,'yukgejang',10);
INSERT INTO Orders_Contain_Dishes VALUES (16,6,'hummus',3);
INSERT INTO Orders_Contain_Dishes VALUES (17,9,'tempura',10);
INSERT INTO Orders_Contain_Dishes VALUES (18,10,'king prawn',30);
INSERT INTO Orders_Contain_Dishes VALUES (19,1,'japchae mari',5);
INSERT INTO Orders_Contain_Dishes VALUES (20,2,'grilled free range chicken',20);
