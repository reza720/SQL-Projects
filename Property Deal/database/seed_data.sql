use property_deal;

-- Populate Users
insert into Users(email, fullName, phone, city, district, street)
values
('AliReza@gmail.com','Ali Reza Dawodi','0093779089786','Kabul','13th','11'),
('Shams@gmail.com','Jalal Shams', '0093783423452','Mazar','11th',123),
('JawadAli@gmail.com','Ali Jawad','0093790909876','Herat','2nd',14);

-- Populate Categories
insert into Categories(name,description)
values
('House','Includes Houses'),
('Cars','Includes any types of transport vehicles');

-- Populate Properties 
insert into Properties(name, description, category, owner, price, imageURL)
values
('200 Corola','German Tyota 2000 model','Cars','AliReza@gmail.com',6500,'https://reza.api.developer.com'),
('HiLux','Japan Produced 2009, SUV model','Cars','JawadAli@gmail.com',90000,'https://reza.api.developer.com');

-- populate Offers
insert into Offers(property, user, amount)
values
(2,'Shams@gmail.com',75000),
(2, 'AliReza@gmail.com','81000');

-- Populate Deals
insert into Deals(property, date, amount)
values
(2,current_date, 85000);

-- Populate Payments
insert into Payments(deal)
values
(2);


