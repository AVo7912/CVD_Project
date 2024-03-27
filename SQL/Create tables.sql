/*Created the table for non-consumption factors */
CREATE TABLE generalhealth (
    UniqueID INT NOT NULL,
	General_Health VARCHAR (20) NOT NULL,
	Checkup VARCHAR (30) NOT NULL,
	Exercise VARCHAR (10) NOT NULL,
	Heart_Disease VARCHAR (10) NOT NULL,
	Skin_Cancer VARCHAR (10) NOT NULL,
	Other_Cancer VARCHAR (10) NOT NULL,
	Depression VARCHAR (10) NOT NULL,
	Diabetes VARCHAR (50) NOT NULL,
	Arthritis VARCHAR (10) NOT NULL,
	Sex VARCHAR (15) NOT NULL,
	Age_Category VARCHAR (10) NOT NULL,
	Height_cm FLOAT NOT NULL,
	Weight_kg FLOAT NOT NULL,
	BMI FLOAT NOT NULL,
	Smoking_History VARCHAR (10) NOT NULL,
    PRIMARY KEY (UniqueID)
	);

/*Created the table for consumption factors */
	CREATE TABLE health_consumption (
    UniqueID INT NOT NULL,
	Alcohol_Consumption FLOAT NOT NULL,
	Fruit_Consumption FLOAT NOT NULL,
	Green_Vegetables_Consumption FLOAT NOT NULL,
	FriedPotato_Consumption FLOAT NOT NULL,
    PRIMARY KEY (UniqueID)
	);
	
/*Verified non-consumption table created with matching number of records */
select count (*) from health_consumption

/*Verified consumption table created with matching number of records */
Select count (*) from generalhealth

/*Health data to be used for visuals using the data from consumption table */
select * from health_consumption

/*Health data to be used for visuals using the data from non-consumption table */
Select * from generalhealth

/*Combined both tables in one large data set; ordered by heart disease  */
select gh.uniqueid, general_health, checkup, exercise, heart_disease, skin_cancer, other_cancer, depression,
	diabetes, arthritis, sex, age_category, height_cm, weight_kg, bmi, smoking_history, alcohol_consumption,
	fruit_consumption, green_vegetables_consumption, friedpotato_consumption
from generalhealth as gh
inner join health_consumption as hc
	on hc.uniqueid = gh.uniqueid
order by heart_disease desc

/*Combined both tables in one large data set. Excluded rows where diabetes equals "No, pre-diabetes or borderline diabetes" and 
"Yes, but female told only during pregnancy" */
select gh.uniqueid, general_health, checkup, exercise, heart_disease, skin_cancer, other_cancer, depression,
	diabetes, arthritis, sex, age_category, height_cm, weight_kg, bmi, smoking_history, alcohol_consumption,
	fruit_consumption, green_vegetables_consumption, friedpotato_consumption
from generalhealth as gh
inner join health_consumption as hc
	on hc.uniqueid = gh.uniqueid
where diabetes = 'No' or 
	diabetes = 'Yes'

/*Combined both tables in one large data set. Only display rows where diabetes equals "No, pre-diabetes or borderline diabetes" and 
"Yes, but female told only during pregnancy" */
select gh.uniqueid, general_health, checkup, exercise, heart_disease, skin_cancer, other_cancer, depression,
	diabetes, arthritis, sex, age_category, height_cm, weight_kg, bmi, smoking_history, alcohol_consumption,
	fruit_consumption, green_vegetables_consumption, friedpotato_consumption
from generalhealth as gh
inner join health_consumption as hc
	on hc.uniqueid = gh.uniqueid
where diabetes = 'No, pre-diabetes or borderline diabetes' or 
	diabetes = 'Yes, but female told only during pregnancy'
