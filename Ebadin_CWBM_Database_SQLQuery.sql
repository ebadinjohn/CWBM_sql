/*	ADVANCED DATABASES (ADB) ASSIGNMENT SEMESTER 2
	SQL QUERIES
	EBADIN EKHOYE JOHN - MSC DATA SCIENCE, @00611796 */

	/*	TASK ONE: TO DESIGN "CHILD WELL-BEING MONITOR" 
		A DATABASE THAT WILL BE USED TO ANALYSE CHILD POVERTY IN DEVELOPING COUNTRIES; 
		A CASE STUDY OF ETHIOPIA, INDIA, PERU AND VIETNAM */
	
	--	STEP ONE: CREATING A DATABASE FOR THIS PROJECT AND IMPORTING FULL DATASETS AS EXCEL FILES INTO CREATED DATABASE.

			USE master;
			GO

			CREATE DATABASE Ebadin_CWBM_Database;
			GO

		
	-- STEP TWO : SET TRANSACTION ISOLATION LEVEL

			SET TRANSACTION ISOLATION LEVEL READ COMMITTED
			GO

	--	STEP THREE: CREATING A MAINTENANCE PLAN CALLED "EBADIN_CWBM_MAINTENANCE_PLAN" 
	--			TO ENSURE A FULL BACKUP OF THE DATABASE (EBADIN_CWBM_DATABASE)

	--	STEP FOUR: CREATING A DATABASE SCHEMA TO HOUSE THE DATABASE TABLES

			USE Ebadin_CWBM_Database;
			GO

			CREATE SCHEMA CWBM
			GO

	--	STEP FIVE: CREATING A TABLE "CWBM.Complete" TO HOLD REQUIRED PORTIONS OF THE DATASET IMPORTED FROM EXCEL.

			CREATE TABLE CWBM.Complete
			   (ChildID NVARCHAR(100) NOT NULL,
				Cohort NVARCHAR(100) NULL,
				RoundOfSurvey INT NOT NULL,
				ChildHasDied NVARCHAR(100) NULL,
				ChildPresInAllRounds NVARCHAR(100) NULL,
				RegionOfResidence NVARCHAR(100) NULL,
				AreaOfResidence NVARCHAR(100) NULL,
				ChildAge INT NULL,
				ChildSex NVARCHAR(100) NULL,
				ChildReligion NVARCHAR(100) NULL,
				LocationOfChild NVARCHAR(100) NULL,
				LocationOfFather NVARCHAR(100) NULL,
				LocationOfMother NVARCHAR(100) NULL,
				HhHeadRelationToChild NVARCHAR(100) NULL,
				HhHeadAge INT NULL,
				HhHeadSex NVARCHAR(100) NULL,
				HhSize INT NULL,
				ParentsDivorced NVARCHAR(100) NULL,
				BirthOfNewHhMember NVARCHAR(100) NULL, 
				DateOfInterview DATETIME NULL,
				ChildAgeGrade1 INT NULL,
				ChildEnrolledInSch NVARCHAR(100) NULL,
				SchoolType NVARCHAR(100) NULL,
				ChildIsLiterate NVARCHAR(100) NULL,
				HighestGradeAcheived NVARCHAR(100) NULL,
				AttendedNurseryCreche NVARCHAR(100) NULL,
				TravelTimeToSchoolMin FLOAT NULL,
				ReproductiveEduc NVARCHAR(100) NULL,
				SleepingHPD FLOAT NULL,
				DomesticTasksHPD FLOAT NULL,
				PaidActivityHPD FLOAT NULL,
				SchoolHPD FLOAT NULL,
				AfterSchStudyHPD FLOAT NULL,
				ChoresHPD FLOAT NULL,
				CaringForHhMemberHPD FLOAT NULL,
				PlayHPD FLOAT NULL,
				ChildMarriageCohabition NVARCHAR(100) NULL,
				ChildHasChild NVARCHAR(100) NULL,
				CarerChildRelations NVARCHAR(100) NULL,
				CarerAge INT NULL,
				CarerEducLevel NVARCHAR(100) NULL,
				CarerSex NVARCHAR(100) NULL,
				CarerIsIliterate NVARCHAR(100) NULL,
				CarerHhHeadRelations NVARCHAR(100) NULL,
				ChildBirthWeight INT NULL,
				ChildHeight INT NULL,
				BMI INT NULL,
				FreqOfSmoking NVARCHAR(100) NULL,
				AlcoholConsumptionWeekly NVARCHAR(100) NULL,
				ChildHealthInGen NVARCHAR(100) NULL,
				BCGVAC NVARCHAR(100) NULL,
				MeaslesVAC NVARCHAR(100) NULL,
				DPTVAC NVARCHAR(100) NULL,
				PolioVAC NVARCHAR(100) NULL,
				HIBVAC NVARCHAR(100) NULL,
				SeriousInjuryIllness NVARCHAR(100) NULL,
				ProlongedHealthProblem NVARCHAR(100) NULL,
				PermDisability NVARCHAR(100) NULL,
				HhFoodAvailability NVARCHAR(100) NULL,
				AccessToLoanCredit NVARCHAR(100) NULL,
				AccessToDrinkingWater NVARCHAR(100) NULL,
				AccessToSanitation NVARCHAR(100) NULL,
				AccessToELectricity NVARCHAR(100) NULL,
				AccessToCookingFuels NVARCHAR(100) NULL,
				LivestockOwnership NVARCHAR(100) NULL,
				OwnHouse NVARCHAR(100) NULL,
				WealthIndex FLOAT NULL,
				HousingQualityIndex FLOAT NULL,
				AccessToServicesIndex FLOAT NULL, 
				ConsumerDurablesIndex FLOAT NULL,
				CrimeDeathDisablement NVARCHAR(100) NULL,
				CrimeVictim NVARCHAR(100) NULL,
				TheftCropsLivestock NVARCHAR(100) NULL,
				TheftProperty NVARCHAR(100) NULL,
				NaturalDisaster NVARCHAR(100) NULL,
				Migration NVARCHAR(100) NULL);
				GO
				
	--	STEP SIX: CREATING FUNCTIONS FOR LENGTHY CASE STATEMENTS

				-- Functions 1 - 4 for "region" (RegionOfResidence NVARCHAR(100))
				-- Column "region" in the imported Excel dataset has several values in integer form
				-- Transforming from integers or codes to meaningful format will require a very lengthy CASE statement within the select block
				-- To address this, we create four(4) functions "fnCWBM_Region1", "fnCWBM_Region2", "fnCWBM_Region3", "fnCWBM_Region4" for "ethopia_constrcted", "india_constructed", 
				-- "peru_constructed" and "vietnam_constructed" respectively.

				--Funciton 1: "CWBM.fnRegion1" for "region" (RegionOfResidence) in Ethiopia Dataset
				CREATE FUNCTION CWBM.fnRegion1 (@region1 NVARCHAR(100))
				RETURNS NVARCHAR(100)
				AS
				BEGIN
					RETURN CASE  WHEN @region1 = 1 THEN 'Tigray' WHEN @region1 = 2 THEN 'Afar' WHEN @region1 = 3 THEN 'Amhara' WHEN @region1 = 4 THEN 'Oromiya' 
								WHEN @region1 = 5 THEN 'Somali' WHEN @region1 = 6 THEN 'Benshangul Gumz' WHEN @region1 = 7 THEN 'SNNP' WHEN @region1 = 14 THEN 'Addis Ababa' ELSE 'Unknown' END
				END;
				GO

				--Funciton 2: "CWBM.fnRegion2" for "region" (RegionOfResidence) in India Dataset
				CREATE FUNCTION CWBM.fnRegion2 (@region2 NVARCHAR(100))
				RETURNS NVARCHAR(100)
				AS
				BEGIN
					RETURN CASE  WHEN @region2 = 21 THEN 'Coastal Andhra' WHEN @region2 = 22 THEN 'Rayalaseema' WHEN @region2 = 23 THEN 'Telangana' WHEN @region2 = 24 THEN 'Others' 
								WHEN @region2 = 77 THEN 'Unknown' ELSE 'Unknown' END
				END;
				GO

				--Funciton 3: "CWBM.fnRegion3" for "region" (RegionOfResidence) in Peru Dataset
				CREATE FUNCTION CWBM.fnRegion3 (@region3 NVARCHAR(100))
				RETURNS NVARCHAR(100)
				AS
				BEGIN
					RETURN CASE  WHEN @region3 = 31 THEN 'Costa' WHEN @region3 = 32 THEN 'Sierra' WHEN @region3 = 33 THEN 'Selva' WHEN @region3 = 88 THEN 'Unknown' 
								ELSE 'Unknown' END
				END;
				GO

				--Funciton 4: "CWBM.fnRegion4" for "region" (RegionOfResidence) in Vietnam Dataset
				CREATE FUNCTION CWBM.fnRegion4 (@region4 NVARCHAR(100))
				RETURNS NVARCHAR(100)
				AS
				BEGIN
					RETURN CASE  WHEN @region4 = 51 THEN 'Northern Uplands' WHEN @region4 = 52 THEN 'Red River Delta' WHEN @region4 = 53 THEN 'Phu Yen' WHEN @region4 = 54 THEN 'Da Nang' 
								WHEN @region4 = 55 THEN 'Highlands' WHEN @region4 = 56 THEN 'South Eastern' WHEN @region4 = 57 THEN 'Mekong River Delta' WHEN @region4 = 58 THEN 'Other' ELSE 'Unknown' END
				END;
				GO

				--Funciton 5: "CWBM.fnchldrel" for "chldrel" (ChildReligion)
				CREATE FUNCTION CWBM.fnchldrel (@chldrel NVARCHAR(100))
				RETURNS NVARCHAR(100)
				AS
				BEGIN
					RETURN CASE WHEN @chldrel = 1 THEN 'Christian' WHEN @chldrel = 2 THEN 'Muslim' WHEN @chldrel = 3 THEN 'Buddhist' WHEN @chldrel = 4 THEN 'Hindu' WHEN @chldrel = 5 THEN 'Catholic' 
								WHEN @chldrel = 6 THEN 'Protestant' WHEN @chldrel = 7 THEN 'Orthodox' WHEN @chldrel = 8 THEN 'Sikh' WHEN @chldrel = 9 THEN 'Evangelist' WHEN @chldrel = 10 THEN 'Mormon'
								WHEN @chldrel = 11 THEN 'Ancestor worship' WHEN @chldrel = 12 THEN 'Hao Hao' WHEN @chldrel = 13 THEN 'Cao Dai' WHEN @chldrel = 14 THEN 'None' END
				END
				GO

				--Function 6: "CWBM.fnheadrel" for "headrel" (HhHeadRelationToChild)
				CREATE FUNCTION CWBM.fnheadrel (@headrel NVARCHAR(100))
				RETURNS NVARCHAR(100)
				AS
				BEGIN
					RETURN CASE WHEN @headrel = 0 THEN 'Child' WHEN @headrel = 1 THEN 'Biological Parent' WHEN @headrel = 2 THEN 'Non-Biological Parent' WHEN @headrel = 3 THEN 'Grandparent' 
								WHEN @headrel = 4 THEN ' Uncle/Aunt' WHEN @headrel = 5 THEN 'Sibling' WHEN @headrel = 6 THEN 'Other-Relative' WHEN @headrel = 7 THEN ' Other-NonRelative' 
								WHEN @headrel = 8 THEN 'Partner/spouse of child' WHEN @headrel = 9 THEN 'Father-in-law/mother-in-law' ELSE NULL END
				END
				GO

				--Function 7: "CWBM.fnhghgrade" for "hghgrade" (HighestGradeAcheived)
				CREATE FUNCTION CWBM.fnhghgrade (@hghgrade NVARCHAR(100))
				RETURNS NVARCHAR(100)
				AS
				BEGIN 
					RETURN CASE WHEN @hghgrade = 1 THEN 'Grade 1' WHEN @hghgrade = 2 THEN 'Grade 2' WHEN @hghgrade = 3 THEN 'Grade 3' 
								WHEN @hghgrade = 4 THEN 'Grade 4' WHEN @hghgrade = 5 THEN 'Grade 5' WHEN @hghgrade = 6 THEN 'Grade 6' WHEN @hghgrade = 7 THEN 'Grade 7' WHEN @hghgrade = 8 THEN 'Grade 8' 
								WHEN @hghgrade = 9 THEN 'Grade 9' WHEN @hghgrade = 10 THEN 'Grade 10' WHEN @hghgrade = 11 THEN 'Grade 11' WHEN @hghgrade = 12 THEN 'Grade 12' 
								WHEN @hghgrade = 13 THEN 'Post-secondary, vocational' WHEN @hghgrade = 14 THEN 'Undergraduate Uni' WHEN @hghgrade = 15 THEN 'Masters, Doctorate' 
								WHEN @hghgrade = 28 THEN 'Adult literacy' WHEN @hghgrade = 29 THEN 'Religious education' WHEN @hghgrade = 30 THEN 'Other' ELSE NULL END
				END
				GO

				--Function 8: "CWBM.fncarerel" for "carerel" (CarerChildRelations)
				CREATE FUNCTION CWBM.fncarerel (@carerel NVARCHAR(100))
				RETURNS NVARCHAR(100)
				AS
				BEGIN 
					RETURN CASE WHEN @carerel = 1 THEN 'Biological Parent' WHEN @carerel = 2 THEN 'Non-Biological Parent' WHEN @carerel = 3 THEN 'Grandparent' 
									WHEN @carerel = 4 THEN 'Uncle/Aunt' WHEN @carerel = 5 THEN 'Sibling' WHEN @carerel = 6 THEN 'Other-Relative' WHEN @carerel = 7 THEN ' Other-NonRelative' 
									WHEN @carerel = 8 THEN 'Partner/spouse of child' WHEN @carerel = 9 THEN 'Father-in-law/mother-in-law' ELSE NULL END
				END
				GO

				-- Funciton 9: "fnCWBM_caredu" for "caredu" (CarerEducLevel)
				CREATE FUNCTION CWBM.fncaredu (@caredu NVARCHAR(100))
				RETURNS NVARCHAR(100)
				AS
				BEGIN 
					RETURN CASE WHEN @caredu = 1 THEN 'Grade 1' WHEN @caredu = 2 THEN 'Grade 2' WHEN @caredu = 3 THEN 'Grade 3' 
								WHEN @caredu = 4 THEN 'Grade 4' WHEN @caredu = 5 THEN 'Grade 5' WHEN @caredu = 6 THEN 'Grade 6' WHEN @caredu = 7 THEN 'Grade 7' WHEN @caredu = 8 THEN 'Grade 8' 
								WHEN @caredu = 9 THEN 'Grade 9' WHEN @caredu = 10 THEN 'Grade 10' WHEN @caredu = 11 THEN 'Grade 11' WHEN @caredu = 12 THEN 'Grade 12' 
								WHEN @caredu = 13 THEN 'Post-secondary, vocational' WHEN @caredu = 14 THEN 'Undergraduat Uni' WHEN @caredu = 15 THEN 'Masters, Doctorate' 
								WHEN @caredu = 28 THEN 'Adult literacy' WHEN @caredu = 29 THEN 'Religious education' WHEN @caredu = 30 THEN 'Other' ELSE NULL END
				END 
				GO

	--	STEP SEVEN: TRANSFORMING AND INSERTING RAW DATA FROM "ETHOPIA_CONSTRCTED", "INDIA_CONSTRUCTED", "PERU_CONSTRUCTED" AND "VIETNAM_CONSTRUCTED" 
	--				IN "CWBM.Complete"

				INSERT INTO CWBM.Complete
				SELECT childid,
						CASE WHEN yc = 1 THEN 'Younger Cohort' WHEN yc = 0 THEN 'Older Cohort' ELSE NULL END 
					yc,
					round, 
						CASE WHEN deceased = 1 THEN 'Yes' WHEN deceased = 0 THEN 'No' ELSE NULL END 
					deceased,	
						CASE WHEN panel = 1 THEN 'Yes' WHEN panel = 0 THEN 'No' ELSE NULL END 
					panel,		
					CWBM.fnRegion1 (region),
						CASE WHEN typesite = 1 THEN 'Urban' WHEN typesite = 2 THEN 'Rural' ELSE NULL END 
					typesite,	
					agemon,
						CASE WHEN chsex = 1 THEN 'Male' WHEN chsex = 0 THEN 'Female' ELSE NULL END chsex,		
					CWBM.fnchldrel (chldrel),	
						CASE WHEN childloc = 1 THEN 'Yes' WHEN childloc = 0 THEN 'No' ELSE NULL END 
					childloc,	
						CASE WHEN dadlive = 1 THEN 'In Household' WHEN dadlive = 2 THEN 'Outside Household' WHEN dadlive = 3 THEN 'Dead' ELSE NULL END 
					dadlive,	
						CASE WHEN momlive = 1 THEN 'In Household' WHEN momlive = 2 THEN 'Outside Household' WHEN momlive = 3 THEN 'Dead' ELSE NULL END 
					momlive,	
					CWBM.fnheadrel (headrel),
					headage,
						CASE WHEN headsex = 1 THEN 'Male' WHEN headsex = 2 THEN 'Female' ELSE NULL END 
					headsex,	
					hhsize,
						CASE WHEN shfam7 = 1 THEN 'Yes' WHEN shfam7 = 0 THEN 'No' ELSE NULL END 
					shfam7,		
						CASE WHEN shfam8 = 1 THEN 'Yes' WHEN shfam8 = 0 THEN 'No' ELSE NULL END  
					shfam8,		
					CAST (dint AS DATETIME),		
					agegr1,
						CASE WHEN shfam8 = 1 THEN 'Yes' WHEN shfam8 = 0 THEN 'No' ELSE NULL END 
					enrol,		
						CASE WHEN entype = 1 THEN 'Private' WHEN entype = 2 THEN 'Public (Part Fees/Part Govt)' 
						WHEN entype = 3 THEN 'Community (NGO/Charity/Religious)' WHEN entype = 4 THEN 'Government Funded' WHEN entype = 5 THEN 'Others' ELSE NULL END
					entype,		
						CASE WHEN literate = 1 THEN 'Yes' WHEN literate = 0 THEN 'No' ELSE NULL END 
					literate,	
					CWBM.fnhghgrade (hghgrade),	
						CASE WHEN preprim = 1 THEN 'Yes' WHEN preprim = 0 THEN 'No' ELSE NULL END 
					preprim,	
					timesch, 
						CASE WHEN chrephealth1 = 0 THEN ' Very Poor' WHEN chrephealth1 = 1 THEN 'Poor' WHEN chrephealth1 = 2 THEN 'Fair' WHEN chrephealth1 = 3 THEN 'Moderate' 
						WHEN chrephealth1 = 4 THEN 'High' WHEN chrephealth1 = 5 THEN 'Very High' ELSE NULL END 
					chrephealth1,	
					hsleep, 
					htask,
					hwork,
					hschool,
					hstudy,
					hchore,
					hcare,
					hplay,
						CASE WHEN marrcohab = 1 THEN 'Yes' WHEN marrcohab = 0 THEN 'No' ELSE NULL END 
					marrcohab,	
						CASE WHEN birth = 1 THEN 'Yes' WHEN birth = 0 THEN 'No' ELSE NULL END 
					birth,		
					CWBM.fncarerel (carerel),	
					careage,
					CWBM.fncaredu (caredu),		
						CASE WHEN caresex = 1 THEN 'Male' WHEN caresex = 0 THEN 'Female' ELSE NULL END 
					caresex,	
						CASE WHEN carecantread = 1 THEN 'Yes' WHEN carecantread = 0 THEN 'No' ELSE NULL END 
					carecantread,	
						CASE WHEN carehead = 1 THEN 'Caregiver Is HhHead' WHEN carehead = 2 THEN 'Caregiver Is PartnerOfHhHead' WHEN carehead = 3 THEN 'Other' ELSE NULL END
					carehead, 
					chweight,
					chheight,
					bmi,
						CASE WHEN chsmoke = 1 THEN 'Every day' WHEN chsmoke = 2 THEN 'Weekly' WHEN chsmoke = 3 THEN 'Monthly' 
						WHEN chsmoke = 4 THEN 'Hardly' WHEN chsmoke = 5 THEN 'Never' ELSE NULL END 
					chsmoke,	
						CASE WHEN chalcohol = 1 THEN 'Yes' WHEN chalcohol = 0 THEN 'No' ELSE NULL END 
					chalcohol,	
						CASE WHEN chhealth = 1 THEN ' Very Poor' WHEN chhealth = 2 THEN 'Poor' WHEN chhealth = 3 THEN 'Average' 
						WHEN chhealth = 4 THEN 'Good' WHEN chhealth = 4 THEN 'Very Good' ELSE NULL END 
					chhealth,	
						CASE WHEN bcg = 1 THEN 'Yes' WHEN bcg = 0 THEN 'No' ELSE NULL END 
					bcg,		
						CASE WHEN measles = 1 THEN 'Yes' WHEN measles = 0 THEN 'No' ELSE NULL END
					measles,	
						CASE WHEN dpt = 1 THEN 'Yes' WHEN dpt = 0 THEN 'No' ELSE NULL END
					dpt,		
						CASE WHEN polio = 1 THEN 'Yes' WHEN polio = 0 THEN 'No' ELSE NULL END
					polio,		
						CASE WHEN hib = 1 THEN 'Yes' WHEN hib = 0 THEN 'No' ELSE NULL END
					hib,		
						CASE WHEN chmightdie = 1 THEN 'Yes' WHEN chmightdie = 0 THEN 'No' ELSE NULL END
					chmightdie,	
						CASE WHEN chhprob = 1 THEN 'Yes' WHEN chhprob = 0 THEN 'No' ELSE NULL END
					chhprob,	
						CASE WHEN chdisability = 1 THEN 'Yes' WHEN chdisability = 0 THEN 'No' ELSE NULL END 
					chdisability,	
						CASE WHEN foodsec = 1 THEN 'Enough (Always Preferred Meal)' WHEN foodsec = 2 THEN 'Enough (Not Always Preferred Meal)' 
						WHEN foodsec = 3 THEN 'Sometimes Not Enough' WHEN foodsec = 4 THEN 'frequently Not Enough' ELSE NULL END
					foodsec,	
						CASE WHEN credit = 1 THEN 'Yes' WHEN credit = 0 THEN 'No' ELSE NULL END	
					credit,			
						CASE WHEN drwaterq_new = 1 THEN 'Yes' WHEN drwaterq_new = 0 THEN 'No' ELSE NULL END
					drwaterq_new,	
						CASE WHEN toiletq_new = 1 THEN 'Yes' WHEN toiletq_new = 0 THEN 'No' ELSE NULL END 
					toiletq_new,	
						CASE WHEN elecq_new = 1 THEN 'Yes' WHEN elecq_new = 0 THEN 'No' ELSE NULL END
					elecq_new,		
						CASE WHEN cookingq_new = 1 THEN 'Yes' WHEN cookingq_new = 0 THEN 'No' ELSE NULL END
					cookingq_new,	
						CASE WHEN aniany = 1 THEN 'Yes' WHEN aniany = 0 THEN 'No' ELSE NULL END
					aniany,		
						CASE WHEN ownhouse = 1 THEN 'Yes' WHEN ownhouse = 0 THEN 'No' ELSE NULL END
					ownhouse,	
					wi_new,
					hq_new,
					sv_new,
					cd_new,
						CASE WHEN shcrime6 = 1 THEN 'Yes' WHEN shcrime6 = 0 THEN 'No' ELSE NULL END
					shcrime6,	
						CASE WHEN shcrime8 = 1 THEN 'Yes' WHEN shcrime8 = 0 THEN 'No' ELSE NULL END
					shcrime8,	
						CASE WHEN shcrime7 = 1 THEN 'Yes' WHEN shcrime7 = 0 THEN 'No' ELSE NULL END
					shfam7,	
						CASE WHEN shcrime5 = 1 THEN 'Yes' WHEN shcrime5 = 0 THEN 'No' ELSE NULL END
					shcrime5,	
						CASE WHEN shenv9 = 1 THEN 'Yes' WHEN shenv9 = 0 THEN 'No' ELSE NULL END shenv9,		
						CASE WHEN shfam14 = 1 THEN 'Yes' WHEN shfam14 = 0 THEN 'No' ELSE NULL END
					shfam14	
				FROM dbo.ethiopia_constructed
				
				UNION ALL	-- UNION ALL with india_constructed

				SELECT childid,
						CASE WHEN yc = 1 THEN 'Younger Cohort' WHEN yc = 0 THEN 'Older Cohort' ELSE NULL END 
					yc,
					round, 
						CASE WHEN deceased = 1 THEN 'Yes' WHEN deceased = 0 THEN 'No' ELSE NULL END 
					deceased,	
						CASE WHEN panel12345 = 1 THEN 'Yes' WHEN panel12345 = 0 THEN 'No' ELSE NULL END 
					panel12345,		--is the same as panel
					CWBM.fnRegion2 (region),
						CASE WHEN typesite = 1 THEN 'Urban' WHEN typesite = 2 THEN 'Rural' ELSE NULL END 
					typesite,	
					agemon,
						CASE WHEN chsex = 1 THEN 'Male' WHEN chsex = 0 THEN 'Female' ELSE NULL END chsex,		
					CWBM.fnchldrel (chldrel),	
						CASE WHEN childloc = 1 THEN 'Yes' WHEN childloc = 0 THEN 'No' ELSE NULL END 
					childloc,	
						CASE WHEN dadlive = 1 THEN 'In Household' WHEN dadlive = 2 THEN 'Outside Household' WHEN dadlive = 3 THEN 'Dead' ELSE NULL END 
					dadlive,	
						CASE WHEN momlive = 1 THEN 'In Household' WHEN momlive = 2 THEN 'Outside Household' WHEN momlive = 3 THEN 'Dead' ELSE NULL END 
					momlive,	
					CWBM.fnheadrel (headrel),
					headage,
						CASE WHEN headsex = 1 THEN 'Male' WHEN headsex = 2 THEN 'Female' ELSE NULL END 
					headsex,	
					hhsize,
						CASE WHEN shfam7 = 1 THEN 'Yes' WHEN shfam7 = 0 THEN 'No' ELSE NULL END 
					shfam7,		
						CASE WHEN shfam8 = 1 THEN 'Yes' WHEN shfam8 = 0 THEN 'No' ELSE NULL END  
					shfam8,		
					CAST (dint AS DATETIME),		
					agegr1,
						CASE WHEN shfam8 = 1 THEN 'Yes' WHEN shfam8 = 0 THEN 'No' ELSE NULL END 
					enrol,		
						CASE WHEN entype = 1 THEN 'Private' WHEN entype = 2 THEN 'Public (Part Fees/Part Govt)' 
						WHEN entype = 3 THEN 'Community (NGO/Charity/Religious)' WHEN entype = 4 THEN 'Government Funded' WHEN entype = 5 THEN 'Others' ELSE NULL END
					entype,		
						CASE WHEN literate = 1 THEN 'Yes' WHEN literate = 0 THEN 'No' ELSE NULL END 
					literate,	
					CWBM.fnhghgrade (hghgrade),	
						CASE WHEN preprim = 1 THEN 'Yes' WHEN preprim = 0 THEN 'No' ELSE NULL END 
					preprim,	
					timesch, 
						CASE WHEN chrephealth1 = 0 THEN ' Very Poor' WHEN chrephealth1 = 1 THEN 'Poor' WHEN chrephealth1 = 2 THEN 'Fair' WHEN chrephealth1 = 3 THEN 'Moderate' 
						WHEN chrephealth1 = 4 THEN 'High' WHEN chrephealth1 = 5 THEN 'Very High' ELSE NULL END 
					chrephealth1,	
					hsleep, 
					htask,
					hwork,
					hschool,
					hstudy,
					hchore,
					hcare,
					hplay,
						CASE WHEN marrcohab = 1 THEN 'Yes' WHEN marrcohab = 0 THEN 'No' ELSE NULL END 
					marrcohab,	
						CASE WHEN birth = 1 THEN 'Yes' WHEN birth = 0 THEN 'No' ELSE NULL END 
					birth,		
					CWBM.fncarerel (carerel),	
					careage,
					CWBM.fncaredu (caredu),		
						CASE WHEN caresex = 1 THEN 'Male' WHEN caresex = 0 THEN 'Female' ELSE NULL END 
					caresex,	
						CASE WHEN carecantread = 1 THEN 'Yes' WHEN carecantread = 0 THEN 'No' ELSE NULL END 
					carecantread,	
						CASE WHEN carehead = 1 THEN 'Caregiver Is HhHead' WHEN carehead = 2 THEN 'Caregiver Is PartnerOfHhHead' WHEN carehead = 3 THEN 'Other' ELSE NULL END
					carehead, 
					chweight,
					chheight,
					bmi,
						CASE WHEN chsmoke = 1 THEN 'Every day' WHEN chsmoke = 2 THEN 'Weekly' WHEN chsmoke = 3 THEN 'Monthly' 
						WHEN chsmoke = 4 THEN 'Hardly' WHEN chsmoke = 5 THEN 'Never' ELSE NULL END 
					chsmoke,	
						CASE WHEN chalcohol = 1 THEN 'Yes' WHEN chalcohol = 0 THEN 'No' ELSE NULL END 
					chalcohol,	
						CASE WHEN chhealth = 1 THEN ' Very Poor' WHEN chhealth = 2 THEN 'Poor' WHEN chhealth = 3 THEN 'Average' 
						WHEN chhealth = 4 THEN 'Good' WHEN chhealth = 4 THEN 'Very Good' ELSE NULL END 
					chhealth,	
						CASE WHEN bcg = 1 THEN 'Yes' WHEN bcg = 0 THEN 'No' ELSE NULL END 
					bcg,		
						CASE WHEN measles = 1 THEN 'Yes' WHEN measles = 0 THEN 'No' ELSE NULL END
					measles,	
						CASE WHEN dpt = 1 THEN 'Yes' WHEN dpt = 0 THEN 'No' ELSE NULL END
					dpt,		
						CASE WHEN polio = 1 THEN 'Yes' WHEN polio = 0 THEN 'No' ELSE NULL END
					polio,		
						CASE WHEN hib = 1 THEN 'Yes' WHEN hib = 0 THEN 'No' ELSE NULL END
					hib,		
						CASE WHEN chmightdie = 1 THEN 'Yes' WHEN chmightdie = 0 THEN 'No' ELSE NULL END
					chmightdie,	
						CASE WHEN chhprob = 1 THEN 'Yes' WHEN chhprob = 0 THEN 'No' ELSE NULL END
					chhprob,	
						CASE WHEN chdisability = 1 THEN 'Yes' WHEN chdisability = 0 THEN 'No' ELSE NULL END 
					chdisability,	
						CASE WHEN foodsec = 1 THEN 'Enough (Always Preferred Meal)' WHEN foodsec = 2 THEN 'Enough (Not Always Preferred Meal)' 
						WHEN foodsec = 3 THEN 'Sometimes Not Enough' WHEN foodsec = 4 THEN 'frequently Not Enough' ELSE NULL END
					foodsec,	
						CASE WHEN credit = 1 THEN 'Yes' WHEN credit = 0 THEN 'No' ELSE NULL END	
					credit,			
						CASE WHEN drwaterq = 1 THEN 'Yes' WHEN drwaterq = 0 THEN 'No' ELSE NULL END  
					drwaterq,	-- is the same as "dwaterq_new"
						CASE WHEN toiletq = 1 THEN 'Yes' WHEN toiletq = 0 THEN 'No' ELSE NULL END 
					toiletq,	-- is the same as "toiletq_new"
						CASE WHEN elecq = 1 THEN 'Yes' WHEN elecq = 0 THEN 'No' ELSE NULL END
					elecq,		-- is the same as "elecq_new"
						CASE WHEN cookingq = 1 THEN 'Yes' WHEN cookingq = 0 THEN 'No' ELSE NULL END
					cookingq,	-- is the same as "cookingq_new"
						CASE WHEN aniany = 1 THEN 'Yes' WHEN aniany = 0 THEN 'No' ELSE NULL END
					aniany,		
						CASE WHEN ownhouse = 1 THEN 'Yes' WHEN ownhouse = 0 THEN 'No' ELSE NULL END
					ownhouse,	
					wi,		-- is the same as "wi_new"
					hq,		-- is the same as "hq_new"
					sv,		-- is the same as "sv_new"
					cd,		-- is the same as "cd_new"
						CASE WHEN shcrime6 = 1 THEN 'Yes' WHEN shcrime6 = 0 THEN 'No' ELSE NULL END
					shcrime6,	
						CASE WHEN shcrime8 = 1 THEN 'Yes' WHEN shcrime8 = 0 THEN 'No' ELSE NULL END
					shcrime8,	
						CASE WHEN shfam7 = 1 THEN 'Yes' WHEN shfam7 = 0 THEN 'No' ELSE NULL END
					shfam7,	
						CASE WHEN shcrime5 = 1 THEN 'Yes' WHEN shcrime5 = 0 THEN 'No' ELSE NULL END
					shcrime5,	
						CASE WHEN shenv9 = 1 THEN 'Yes' WHEN shenv9 = 0 THEN 'No' ELSE NULL END shenv9,		
						CASE WHEN shfam14 = 1 THEN 'Yes' WHEN shfam14 = 0 THEN 'No' ELSE NULL END
					shfam14	
				FROM dbo.india_constructed

				UNION ALL	-- UNION ALL with peru_constructed

				SELECT childid,
						CASE WHEN yc = 1 THEN 'Younger Cohort' WHEN yc = 0 THEN 'Older Cohort' ELSE NULL END 
					yc,
					round, 
						CASE WHEN deceased = 1 THEN 'Yes' WHEN deceased = 0 THEN 'No' ELSE NULL END 
					deceased,	
						CASE WHEN panel12345 = 1 THEN 'Yes' WHEN panel12345 = 0 THEN 'No' ELSE NULL END 
					panel12345,		--is the same as panel
					CWBM.fnRegion3 (region),
						CASE WHEN typesite = 1 THEN 'Urban' WHEN typesite = 2 THEN 'Rural' ELSE NULL END 
					typesite,	
					agemon,
						CASE WHEN chsex = 1 THEN 'Male' WHEN chsex = 0 THEN 'Female' ELSE NULL END chsex,		
					CWBM.fnchldrel (chldrel),	
						CASE WHEN childloc = 1 THEN 'Yes' WHEN childloc = 0 THEN 'No' ELSE NULL END 
					childloc,	
						CASE WHEN dadlive = 1 THEN 'In Household' WHEN dadlive = 2 THEN 'Outside Household' WHEN dadlive = 3 THEN 'Dead' ELSE NULL END 
					dadlive,	
						CASE WHEN momlive = 1 THEN 'In Household' WHEN momlive = 2 THEN 'Outside Household' WHEN momlive = 3 THEN 'Dead' ELSE NULL END 
					momlive,	
					CWBM.fnheadrel (headrel),
					headage,
						CASE WHEN headsex = 1 THEN 'Male' WHEN headsex = 2 THEN 'Female' ELSE NULL END 
					headsex,	
					hhsize,
						CASE WHEN shfam7 = 1 THEN 'Yes' WHEN shfam7 = 0 THEN 'No' ELSE NULL END 
					shfam7,		
						CASE WHEN shfam8 = 1 THEN 'Yes' WHEN shfam8 = 0 THEN 'No' ELSE NULL END  
					shfam8,		
					CAST (dint AS DATETIME),		
					agegr1,
						CASE WHEN shfam8 = 1 THEN 'Yes' WHEN shfam8 = 0 THEN 'No' ELSE NULL END 
					enrol,		
						CASE WHEN entype = 1 THEN 'Private' WHEN entype = 2 THEN 'Public (Part Fees/Part Govt)' 
						WHEN entype = 3 THEN 'Community (NGO/Charity/Religious)' WHEN entype = 4 THEN 'Government Funded' WHEN entype = 5 THEN 'Others' ELSE NULL END
					entype,		
						CASE WHEN literate = 1 THEN 'Yes' WHEN literate = 0 THEN 'No' ELSE NULL END 
					literate,	
					CWBM.fnhghgrade (engrade),	-- "engrade" (current grade enrolled in) is the same as "hghgrade" (highest grade acheived) with same case statements and data type
						CASE WHEN preprim = 1 THEN 'Yes' WHEN preprim = 0 THEN 'No' ELSE NULL END 
					preprim,	
					timesch, 
						CASE WHEN chrephealth1 = 0 THEN ' Very Poor' WHEN chrephealth1 = 1 THEN 'Poor' WHEN chrephealth1 = 2 THEN 'Fair' WHEN chrephealth1 = 3 THEN 'Moderate' 
						WHEN chrephealth1 = 4 THEN 'High' WHEN chrephealth1 = 5 THEN 'Very High' ELSE NULL END 
					chrephealth1,	
					hsleep, 
					htask,
					hwork,
					hschool,
					hstudy,
					hchore,
					hcare,
					hplay,
						CASE WHEN marrcohab = 1 THEN 'Yes' WHEN marrcohab = 0 THEN 'No' ELSE NULL END 
					marrcohab,	
						CASE WHEN birth = 1 THEN 'Yes' WHEN birth = 0 THEN 'No' ELSE NULL END 
					birth,		
					CWBM.fncarerel (carerel),	
					careage,
					CWBM.fncaredu (caredu),		
						CASE WHEN caresex = 1 THEN 'Male' WHEN caresex = 0 THEN 'Female' ELSE NULL END 
					caresex,	
						CASE WHEN carecantread = 1 THEN 'Yes' WHEN carecantread = 0 THEN 'No' ELSE NULL END 
					carecantread,	
						CASE WHEN carehead = 1 THEN 'Caregiver Is HhHead' WHEN carehead = 2 THEN 'Caregiver Is PartnerOfHhHead' WHEN carehead = 3 THEN 'Other' ELSE NULL END
					carehead, 
					chweight,
					chheight,
					bmi,
						CASE WHEN chsmoke = 1 THEN 'Every day' WHEN chsmoke = 2 THEN 'Weekly' WHEN chsmoke = 3 THEN 'Monthly' 
						WHEN chsmoke = 4 THEN 'Hardly' WHEN chsmoke = 5 THEN 'Never' ELSE NULL END 
					chsmoke,	
						CASE WHEN chalcohol = 1 THEN 'Yes' WHEN chalcohol = 0 THEN 'No' ELSE NULL END 
					chalcohol,	
						CASE WHEN chhealth = 1 THEN ' Very Poor' WHEN chhealth = 2 THEN 'Poor' WHEN chhealth = 3 THEN 'Average' 
						WHEN chhealth = 4 THEN 'Good' WHEN chhealth = 4 THEN 'Very Good' ELSE NULL END 
					chhealth,	
						CASE WHEN bcg = 1 THEN 'Yes' WHEN bcg = 0 THEN 'No' ELSE NULL END 
					bcg,		
						CASE WHEN measles = 1 THEN 'Yes' WHEN measles = 0 THEN 'No' ELSE NULL END
					measles,	
						CASE WHEN dpt = 1 THEN 'Yes' WHEN dpt = 0 THEN 'No' ELSE NULL END
					dpt,		
						CASE WHEN polio = 1 THEN 'Yes' WHEN polio = 0 THEN 'No' ELSE NULL END
					polio,		
						CASE WHEN hib = 1 THEN 'Yes' WHEN hib = 0 THEN 'No' ELSE NULL END
					hib,		
						CASE WHEN chmightdie = 1 THEN 'Yes' WHEN chmightdie = 0 THEN 'No' ELSE NULL END
					chmightdie,	
						CASE WHEN chhprob = 1 THEN 'Yes' WHEN chhprob = 0 THEN 'No' ELSE NULL END
					chhprob,	
						CASE WHEN chdisability = 1 THEN 'Yes' WHEN chdisability = 0 THEN 'No' ELSE NULL END 
					chdisability,	
						CASE WHEN foodsec = 1 THEN 'Enough (Always Preferred Meal)' WHEN foodsec = 2 THEN 'Enough (Not Always Preferred Meal)' 
						WHEN foodsec = 3 THEN 'Sometimes Not Enough' WHEN foodsec = 4 THEN 'frequently Not Enough' ELSE NULL END
					foodsec,	
						CASE WHEN credit = 1 THEN 'Yes' WHEN credit = 0 THEN 'No' ELSE NULL END	
					credit,			
						CASE WHEN drwaterq = 1 THEN 'Yes' WHEN drwaterq = 0 THEN 'No' ELSE NULL END  
					drwaterq,	-- is the same as "dwaterq_new"
						CASE WHEN toiletq = 1 THEN 'Yes' WHEN toiletq = 0 THEN 'No' ELSE NULL END 
					toiletq,	-- is the same as "toiletq_new"
						CASE WHEN elecq = 1 THEN 'Yes' WHEN elecq = 0 THEN 'No' ELSE NULL END
					elecq,		-- is the same as "elecq_new"
						CASE WHEN cookingq = 1 THEN 'Yes' WHEN cookingq = 0 THEN 'No' ELSE NULL END
					cookingq,	-- is the same as "cookingq_new"
						CASE WHEN aniany = 1 THEN 'Yes' WHEN aniany = 0 THEN 'No' ELSE NULL END
					aniany,		
						CASE WHEN ownhouse = 1 THEN 'Yes' WHEN ownhouse = 0 THEN 'No' ELSE NULL END
					ownhouse,	
					wi,		-- is the same as "wi_new"
					hq,		-- is the same as "hq_new"
					sv,		-- is the same as "sv_new"
					cd,		-- is the same as "cd_new"
						CASE WHEN shcrime6 = 1 THEN 'Yes' WHEN shcrime6 = 0 THEN 'No' ELSE NULL END
					shcrime6,	
						CASE WHEN shcrime8 = 1 THEN 'Yes' WHEN shcrime8 = 0 THEN 'No' ELSE NULL END
					shcrime8,	
						CASE WHEN shfam7 = 1 THEN 'Yes' WHEN shfam7 = 0 THEN 'No' ELSE NULL END
					shfam7,	
						CASE WHEN shcrime5 = 1 THEN 'Yes' WHEN shcrime5 = 0 THEN 'No' ELSE NULL END
					shcrime5,	
						CASE WHEN shenv9 = 1 THEN 'Yes' WHEN shenv9 = 0 THEN 'No' ELSE NULL END shenv9,		
						CASE WHEN shfam14 = 1 THEN 'Yes' WHEN shfam14 = 0 THEN 'No' ELSE NULL END
					shfam14	
				FROM dbo.peru_constructed

				UNION ALL	-- UNION ALL with vietnam_constructed

				SELECT childid,
						CASE WHEN yc = 1 THEN 'Younger Cohort' WHEN yc = 0 THEN 'Older Cohort' ELSE NULL END 
					yc,
					round, 
						CASE WHEN deceased = 1 THEN 'Yes' WHEN deceased = 0 THEN 'No' ELSE NULL END 
					deceased,	
						CASE WHEN panel12345 = 1 THEN 'Yes' WHEN panel12345 = 0 THEN 'No' ELSE NULL END 
					panel12345,		
					CWBM.fnRegion1 (region),
						CASE WHEN typesite = 1 THEN 'Urban' WHEN typesite = 2 THEN 'Rural' ELSE NULL END 
					typesite,	
					agemon,
						CASE WHEN chsex = 1 THEN 'Male' WHEN chsex = 0 THEN 'Female' ELSE NULL END chsex,		
					CWBM.fnchldrel (chldrel),	
						CASE WHEN childloc = 1 THEN 'Yes' WHEN childloc = 0 THEN 'No' ELSE NULL END 
					childloc,	
						CASE WHEN dadlive = 1 THEN 'In Household' WHEN dadlive = 2 THEN 'Outside Household' WHEN dadlive = 3 THEN 'Dead' ELSE NULL END 
					dadlive,	
						CASE WHEN momlive = 1 THEN 'In Household' WHEN momlive = 2 THEN 'Outside Household' WHEN momlive = 3 THEN 'Dead' ELSE NULL END 
					momlive,	
					CWBM.fnheadrel (headrel),
					headage,
						CASE WHEN headsex = 1 THEN 'Male' WHEN headsex = 2 THEN 'Female' ELSE NULL END 
					headsex,	
					hhsize,
						CASE WHEN shfam7 = 1 THEN 'Yes' WHEN shfam7 = 0 THEN 'No' ELSE NULL END 
					shfam7,		
						CASE WHEN shfam8 = 1 THEN 'Yes' WHEN shfam8 = 0 THEN 'No' ELSE NULL END  
					shfam8,		
					CAST (dint AS DATETIME),		
					agegr1,
						CASE WHEN shfam8 = 1 THEN 'Yes' WHEN shfam8 = 0 THEN 'No' ELSE NULL END 
					enrol,		
						CASE WHEN entype = 1 THEN 'Private' WHEN entype = 2 THEN 'Public (Part Fees/Part Govt)' 
						WHEN entype = 3 THEN 'Community (NGO/Charity/Religious)' WHEN entype = 4 THEN 'Government Funded' WHEN entype = 5 THEN 'Others' ELSE NULL END
					entype,		
						CASE WHEN literate = 1 THEN 'Yes' WHEN literate = 0 THEN 'No' ELSE NULL END 
					literate,	
					CWBM.fnhghgrade (hghgrade),	
						CASE WHEN preprim = 1 THEN 'Yes' WHEN preprim = 0 THEN 'No' ELSE NULL END 
					preprim,	
					timesch, 
						CASE WHEN chrephealth1 = 0 THEN ' Very Poor' WHEN chrephealth1 = 1 THEN 'Poor' WHEN chrephealth1 = 2 THEN 'Fair' WHEN chrephealth1 = 3 THEN 'Moderate' 
						WHEN chrephealth1 = 4 THEN 'High' WHEN chrephealth1 = 5 THEN 'Very High' ELSE NULL END 
					chrephealth1,	
					hsleep, 
					htask,
					hwork,
					hschool,
					hstudy,
					hchore,
					hcare,
					hplay,
						CASE WHEN marrcohab = 1 THEN 'Yes' WHEN marrcohab = 0 THEN 'No' ELSE NULL END 
					marrcohab,	
						CASE WHEN birth = 1 THEN 'Yes' WHEN birth = 0 THEN 'No' ELSE NULL END 
					birth,		
					CWBM.fncarerel (carerel),	
					careage,
					CWBM.fncaredu (caredu),		
						CASE WHEN caresex = 1 THEN 'Male' WHEN caresex = 0 THEN 'Female' ELSE NULL END 
					caresex,	
						CASE WHEN carecantread = 1 THEN 'Yes' WHEN carecantread = 0 THEN 'No' ELSE NULL END 
					carecantread,	
						CASE WHEN carehead = 1 THEN 'Caregiver Is HhHead' WHEN carehead = 2 THEN 'Caregiver Is PartnerOfHhHead' WHEN carehead = 3 THEN 'Other' ELSE NULL END
					carehead, 
					chweight,
					chheight,
					bmi,
						CASE WHEN chsmoke = 1 THEN 'Every day' WHEN chsmoke = 2 THEN 'Weekly' WHEN chsmoke = 3 THEN 'Monthly' 
						WHEN chsmoke = 4 THEN 'Hardly' WHEN chsmoke = 5 THEN 'Never' ELSE NULL END 
					chsmoke,	
						CASE WHEN chalcohol = 1 THEN 'Yes' WHEN chalcohol = 0 THEN 'No' ELSE NULL END 
					chalcohol,	
						CASE WHEN chhealth = 1 THEN ' Very Poor' WHEN chhealth = 2 THEN 'Poor' WHEN chhealth = 3 THEN 'Average' 
						WHEN chhealth = 4 THEN 'Good' WHEN chhealth = 4 THEN 'Very Good' ELSE NULL END 
					chhealth,	
						CASE WHEN bcg = 1 THEN 'Yes' WHEN bcg = 0 THEN 'No' ELSE NULL END 
					bcg,		
						CASE WHEN measles = 1 THEN 'Yes' WHEN measles = 0 THEN 'No' ELSE NULL END
					measles,	
						CASE WHEN dpt = 1 THEN 'Yes' WHEN dpt = 0 THEN 'No' ELSE NULL END
					dpt,		
						CASE WHEN polio = 1 THEN 'Yes' WHEN polio = 0 THEN 'No' ELSE NULL END
					polio,		
						CASE WHEN hib = 1 THEN 'Yes' WHEN hib = 0 THEN 'No' ELSE NULL END
					hib,		
						CASE WHEN chmightdie = 1 THEN 'Yes' WHEN chmightdie = 0 THEN 'No' ELSE NULL END
					chmightdie,	
						CASE WHEN chhprob = 1 THEN 'Yes' WHEN chhprob = 0 THEN 'No' ELSE NULL END
					chhprob,	
						CASE WHEN chdisability = 1 THEN 'Yes' WHEN chdisability = 0 THEN 'No' ELSE NULL END 
					chdisability,	
						CASE WHEN foodsec = 1 THEN 'Enough (Always Preferred Meal)' WHEN foodsec = 2 THEN 'Enough (Not Always Preferred Meal)' 
						WHEN foodsec = 3 THEN 'Sometimes Not Enough' WHEN foodsec = 4 THEN 'frequently Not Enough' ELSE NULL END
					foodsec,	
						CASE WHEN credit = 1 THEN 'Yes' WHEN credit = 0 THEN 'No' ELSE NULL END	
					credit,			
						CASE WHEN drwaterq_new = 1 THEN 'Yes' WHEN drwaterq_new = 0 THEN 'No' ELSE NULL END
					drwaterq_new,	
						CASE WHEN toiletq_new = 1 THEN 'Yes' WHEN toiletq_new = 0 THEN 'No' ELSE NULL END 
					toiletq_new,	
						CASE WHEN elecq_new = 1 THEN 'Yes' WHEN elecq_new = 0 THEN 'No' ELSE NULL END
					elecq_new,		
						CASE WHEN cookingq_new = 1 THEN 'Yes' WHEN cookingq_new = 0 THEN 'No' ELSE NULL END
					cookingq_new,	
						CASE WHEN aniany = 1 THEN 'Yes' WHEN aniany = 0 THEN 'No' ELSE NULL END
					aniany,		
						CASE WHEN ownhouse = 1 THEN 'Yes' WHEN ownhouse = 0 THEN 'No' ELSE NULL END
					ownhouse,	
					wi_new,
					hq_new,
					sv_new,
					cd_new,
						CASE WHEN shcrime6 = 1 THEN 'Yes' WHEN shcrime6 = 0 THEN 'No' ELSE NULL END
					shcrime6,	
						CASE WHEN shcrime8 = 1 THEN 'Yes' WHEN shcrime8 = 0 THEN 'No' ELSE NULL END
					shcrime8,	
						CASE WHEN shcrime7 = 1 THEN 'Yes' WHEN shcrime7 = 0 THEN 'No' ELSE NULL END
					shfam7,	
						CASE WHEN shcrime5 = 1 THEN 'Yes' WHEN shcrime5 = 0 THEN 'No' ELSE NULL END
					shcrime5,	
						CASE WHEN shenv9 = 1 THEN 'Yes' WHEN shenv9 = 0 THEN 'No' ELSE NULL END shenv9,		
						CASE WHEN shfam14 = 1 THEN 'Yes' WHEN shfam14 = 0 THEN 'No' ELSE NULL END
					shfam14	
				FROM dbo.vietnam_constructed
				GO

				
	--	STEP EIGHT: CREATING A "UniqueID" TO SERVE AS PRIMARY KEY IN THE CWMB.Complete TABLE 
	--				SINCE "ChildID" IS NOT UNIQUE IN THIS TABLE BECAUSE OF ITS REPETITION IN THE FIVE ROUNDS
				
				ALTER TABLE CWBM.Complete
				ADD UniqueID INT IDENTITY NOT NULL PRIMARY KEY;
				GO
	

	--	STEP NINE: CREATING TABLES THAT EXPLAIN CHILD WELFARE IN ETHIOPIA, INDIA, PERU AND VIETNAM

			
			-- Table 1:"CWBM.AboutChild_R5" 

				SELECT ChildID, Cohort, RoundOfSurvey, ChildHasDied, ChildPresInAllRounds, RegionOfResidence, AreaOfResidence, ChildAge, ChildSex, ChildReligion, LocationOfChild, DateOfInterview
				INTO CWBM.AboutChild_R5
				FROM CWBM.Complete
				WHERE RoundOfSurvey = 5 
				ORDER BY ChildID

				ALTER TABLE CWBM.AboutChild_R5
				ADD CONSTRAINT CWBM_AboutChild_R5_PK
				PRIMARY KEY (ChildID)
				GO

			-- Table 2: "CWBM.ChildEducation_R5"
				
				SELECT ChildID, ChildAgeGrade1, ChildEnrolledInSch, SchoolType, ChildIsLiterate, HighestGradeAcheived, AttendedNurseryCreche, TravelTimeToSchoolMin, ReproductiveEduc
				INTO CWBM.ChildEducation_R5
				FROM CWBM.Complete
				WHERE RoundOfSurvey = 5 
				ORDER BY ChildID

				ALTER TABLE CWBM.ChildEducation_R5
				ADD CONSTRAINT CWBM_ChildEducation_R5_PK
				PRIMARY KEY (ChildID)
				GO

			-- Table 3: "CWBM.ChildSocialLife_R5"
				
				SELECT ChildID, SleepingHPD, DomesticTasksHPD, PaidActivityHPD, SchoolHPD, AfterSchStudyHPD, ChoresHPD, CaringForHhMemberHPD, PlayHPD, ChildMarriageCohabition, ChildHasChild
				INTO CWBM.ChildSocialLife_R5
				FROM CWBM.Complete
				WHERE RoundOfSurvey = 5 
				ORDER BY ChildID

				ALTER TABLE CWBM.ChildSocialLife_R5
				ADD CONSTRAINT CWBM_ChildSocialLife_R5_PK
				PRIMARY KEY (ChildID)
				GO

			-- Table 4: "CWBM.ChildCare_R5"
				
				SELECT ChildID, CarerChildRelations, CarerAge, CarerEducLevel, CarerSex, CarerIsIliterate, CarerHhHeadRelations
				INTO CWBM.ChildCare_R5
				FROM CWBM.Complete
				WHERE RoundOfSurvey = 5 
				ORDER BY ChildID

				ALTER TABLE CWBM.ChildCare_R5
				ADD CONSTRAINT CWBM_ChildCare_R5_PK
				PRIMARY KEY (ChildID)
				GO

			-- Table 5: "CWBM.AppearanceHealthDis_R5"
				
				SELECT ChildID, ChildBirthWeight, ChildHeight, BMI, FreqOfSmoking, AlcoholConsumptionWeekly, ChildHealthInGen, BCGVAC, MeaslesVAC, DPTVAC,
						PolioVAC, HIBVAC, SeriousInjuryIllness, ProlongedHealthProblem, PermDisability
				INTO CWBM.AppearanceHealthDis_R5
				FROM CWBM.Complete
				WHERE RoundOfSurvey = 5 
				ORDER BY ChildID

				ALTER TABLE CWBM.AppearanceHealthDis_R5
				ADD CONSTRAINT CWBM_AppearanceHealthDis_R5_PK
				PRIMARY KEY (ChildID)
				GO

			-- Table 6: "CWBM.AboutChildHh_R5"
				
				SELECT ChildID, LocationOfFather,LocationOfMother, HhHeadRelationToChild, HhHeadAge, HhHeadSex, HhSize, ParentsDivorced, BirthOfNewHhMember
				INTO CWBM.AboutChildHh_R5
				FROM CWBM.Complete
				WHERE RoundOfSurvey = 5 
				ORDER BY ChildID

				ALTER TABLE CWBM.AboutChildHh_R5
				ADD CONSTRAINT CWBM_AboutChildHh_R5_PK
				PRIMARY KEY (ChildID)
				GO

			-- Table 7: "CWBM.HhEconomyAmenitiesAccess_R5"
				
				SELECT ChildID, HhFoodAvailability,AccessToLoanCredit, AccessToDrinkingWater, AccessToSanitation, AccessToELectricity, AccessToCookingFuels, LivestockOwnership,
						OwnHouse, ROUND (WealthIndex, 2) AS WealthIndex, ROUND (HousingQualityIndex, 2) AS HousingQualityIndex, ROUND (AccessToServicesIndex, 2) AS AccessToServicesIndex,
						ROUND (ConsumerDurablesIndex, 2) AS ConsumerDurablesIndex
				INTO CWBM.HhEconomyAmenitiesAccess_R5
				FROM CWBM.Complete
				WHERE RoundOfSurvey = 5
				ORDER BY ChildID

				ALTER TABLE CWBM.HhEconomyAmenitiesAccess_R5
				ADD CONSTRAINT CWBM_HhEconomyAmenitiesAccess_R5_PK
				PRIMARY KEY (ChildID)
				GO

			-- Table 8: "CWBM.HhSecurityEnvironMigration_R5"
				
				SELECT ChildID, CrimeDeathDisablement, CrimeVictim, TheftCropsLivestock, TheftProperty, NaturalDisaster, Migration
				INTO CWBM.HhSecurityEnvironMigration_R5
				FROM CWBM.Complete
				WHERE RoundOfSurvey = 5 
				ORDER BY ChildID

				ALTER TABLE CWBM.HhSecurityEnvironMigration_R5
				ADD CONSTRAINT CWBM_HhSecurityEnvironMigration_R5_PK
				PRIMARY KEY (ChildID)
				GO

	--	STEP TEN: ADDING FOREIGN KEY CONSTRAINTS FOR EACH OF THE 8 TABLES JUST CREATED, IN THE "CWMB.complete" TABLE

				ALTER TABLE CWBM.Complete
				ADD	FOREIGN KEY (childID) REFERENCES CWBM.AboutChild_R5(childID)

				ALTER TABLE CWBM.Complete
				ADD FOREIGN KEY (childID) REFERENCES CWBM.AboutChildHh_R5(childID)

				ALTER TABLE CWBM.Complete
				ADD	FOREIGN KEY (childID) REFERENCES CWBM.AppearanceHealthDis_R5(childID)

				ALTER TABLE CWBM.Complete
				ADD	FOREIGN KEY (childID) REFERENCES CWBM.ChildCare_R5(childID)

				ALTER TABLE CWBM.Complete
				ADD FOREIGN KEY (childID) REFERENCES CWBM.ChildEducation_R5(childID)

				ALTER TABLE CWBM.Complete
				ADD FOREIGN KEY (childID) REFERENCES CWBM.ChildSocialLife_R5(childID)

				ALTER TABLE CWBM.Complete
				ADD FOREIGN KEY (childID) REFERENCES CWBM.HhEconomyAmenitiesAccess_R5(childID)
	
				ALTER TABLE CWBM.Complete
				ADD	FOREIGN KEY (childID) REFERENCES CWBM.HhSecurityEnvironMigration_R5(childID)
				GO
		
	--	STEP ELEVEN: CREATING STORED PROCEDURE WITH PARAMETERS TO ACCESS CWBM TABLES PERTAINING TO EVERY ROUND AND EVERY ROUND
		
		-- complete tables for all four countries pertaining to round 1 an round 5 respectively have been created. 
		-- However, to understand the nature of child welfare and poverty between round 2 and round 4 of the survey as it pertains to each country stored procedures are created.
		-- The STORED PROCEDURE accepts a maximum of two parameters: RoundOfSurvey as "@Round" = INT and Country as "@Country = 'ET' or 'IN' or "PE" or "VN" for Ethopia, India,
		-- Peru and Vietnam respectively.
		-- Note that the Stored procedure is designed to accept the two, one or none of the parameters. 

			-- Stored Procedure 1: "CWBM.spAboutChild"

				CREATE PROCEDURE CWBM.spAboutChild (@Round INT = NULL, @Country NVARCHAR(100) = NULL)
				AS
				BEGIN
					SELECT ChildID, Cohort, RoundOfSurvey, ChildHasDied, ChildPresInAllRounds, RegionOfResidence, AreaOfResidence, ChildAge, ChildSex, ChildReligion, LocationOfChild, DateOfInterview
					FROM CWBM.Complete
					WHERE (@Round IS NULL OR RoundOfSurvey = @Round) AND (@Country IS NULL OR ChildID LIKE @Country + '%')
					ORDER By ChildID ASC
				END
				GO

			-- Stored Procedure 2: "CWBM.spChildEducation"

				CREATE PROCEDURE CWBM.spChildEducation (@Round INT = NULL, @Country NVARCHAR(100) = NULL)
				AS
				BEGIN
					SELECT ChildID, ChildAgeGrade1, ChildEnrolledInSch, SchoolType, ChildIsLiterate, HighestGradeAcheived, AttendedNurseryCreche, TravelTimeToSchoolMin, ReproductiveEduc
					FROM CWBM.Complete
					WHERE (@Round IS NULL OR RoundOfSurvey = @Round) AND (@Country IS NULL OR ChildID LIKE @Country + '%')
					ORDER By ChildID ASC
				END
				GO

			-- Stored Procedure 3: "CWBM.spChildSocialLife"

				CREATE PROCEDURE CWBM.spChildSocialLife (@Round INT = NULL, @Country NVARCHAR(100) = NULL)
				AS
				BEGIN
					SELECT ChildID, SleepingHPD, DomesticTasksHPD, PaidActivityHPD, SchoolHPD, AfterSchStudyHPD, ChoresHPD, CaringForHhMemberHPD, PlayHPD, ChildMarriageCohabition, ChildHasChild
					FROM CWBM.Complete
					WHERE (@Round IS NULL OR RoundOfSurvey = @Round) AND (@Country IS NULL OR ChildID LIKE @Country + '%')
					ORDER By ChildID ASC
				END
				GO

			-- Stored Procedure 4: "CWBM.spChildCare"

				CREATE PROCEDURE CWBM.spChildCare (@Round INT = NULL, @Country NVARCHAR(100) = NULL)
				AS
				BEGIN
					SELECT ChildID, CarerChildRelations, CarerAge, CarerEducLevel, CarerSex, CarerIsIliterate, CarerHhHeadRelations
					FROM CWBM.Complete
					WHERE (@Round IS NULL OR RoundOfSurvey = @Round) AND (@Country IS NULL OR ChildID LIKE @Country + '%')
					ORDER By ChildID ASC
				END
				GO

			-- Stored Procedure 5: "CWBM.spAppearanceHealthDis"

				CREATE PROCEDURE CWBM.spAppearanceHealthDis (@Round INT = NULL, @Country NVARCHAR(100) = NULL)
				AS
				BEGIN
					SELECT ChildID, ChildBirthWeight, ChildHeight, BMI, FreqOfSmoking, AlcoholConsumptionWeekly, ChildHealthInGen, BCGVAC, MeaslesVAC, DPTVAC,
						PolioVAC, HIBVAC, SeriousInjuryIllness, ProlongedHealthProblem, PermDisability
					FROM CWBM.Complete
					WHERE (@Round IS NULL OR RoundOfSurvey = @Round) AND (@Country IS NULL OR ChildID LIKE @Country + '%')
					ORDER By ChildID ASC
				END
				GO

			-- Stored Procedure 6: "CWBM.spAboutChildHh"

				CREATE PROCEDURE CWBM.spAboutChildHh (@Round INT = NULL, @Country NVARCHAR(100) = NULL)
				AS
				BEGIN
					SELECT ChildID, LocationOfFather,LocationOfMother, HhHeadRelationToChild, HhHeadAge, HhHeadSex, HhSize, ParentsDivorced, BirthOfNewHhMember
					FROM CWBM.Complete
					WHERE (@Round IS NULL OR RoundOfSurvey = @Round) AND (@Country IS NULL OR ChildID LIKE @Country + '%')
					ORDER By ChildID ASC
				END
				GO

			-- Stored Procedure 7: "CWBM.spHhEconomyAmenitiesAccess"

				CREATE PROCEDURE CWBM.spHhEconomyAmenitiesAccess (@Round INT = NULL, @Country NVARCHAR(100) = NULL)
				AS
				BEGIN
					SELECT ChildID, HhFoodAvailability,AccessToLoanCredit, AccessToDrinkingWater, AccessToSanitation, AccessToELectricity, AccessToCookingFuels, LivestockOwnership,
						OwnHouse, ROUND (WealthIndex, 2) AS WealthIndex, ROUND (HousingQualityIndex, 2) AS HousingQualityIndex, ROUND (AccessToServicesIndex, 2) AS AccessToServicesIndex,
						ROUND (ConsumerDurablesIndex, 2) AS ConsumerDurablesIndex
					FROM CWBM.Complete
					WHERE (@Round IS NULL OR RoundOfSurvey = @Round) AND (@Country IS NULL OR ChildID LIKE @Country + '%')
					ORDER By ChildID ASC
				END
				GO
				
			-- Stored Procedure 8: "CWBM.spHHhSecurityEnvironMigration"

				CREATE PROCEDURE CWBM.spHhSecurityEnvironMigration (@Round INT = NULL, @Country NVARCHAR(100) = NULL)
				AS
				BEGIN
					SELECT ChildID, CrimeDeathDisablement, CrimeVictim, TheftCropsLivestock, TheftProperty, NaturalDisaster, Migration
					FROM CWBM.Complete
					WHERE (@Round IS NULL OR RoundOfSurvey = @Round) AND (@Country IS NULL OR ChildID LIKE @Country + '%')
					ORDER By ChildID ASC
				END
				GO
				
				-- @Round = 1 or 2 or 3 or 4 or 5
				-- @Country = 'ET' or 'IN'  or 'PE' or 'VN'

				-- FOR EXAMPLE:
					EXECUTE CWBM.spAboutChild @Round = 4, @Country = 'PE'
					EXECUTE CWBM.spChildEducation @Round = 2, @Country = 'ET'
					EXECUTE CWBM.spChildSocialLife @Round = 5, @Country = 'VN'
					EXECUTE CWBM.spChildCare @Round = 1, @Country = 'ET'
					EXECUTE CWBM.spAppearanceHealthDis @Round = 3, @Country = 'IN'
					EXECUTE CWBM.spAboutChildHh @Round = 1, @Country = 'ET'
					EXECUTE CWBM.spHhEconomyAmenitiesAccess @Round = 5, @Country = 'ET'
					EXECUTE CWBM.spHhSecurityEnvironMigration @Round = 1, @Country = 'PE'
				GO
				
	--	STEP TWELVE: CREATING VIEWS TO FURTHER DISPLAY AND UNDERSTAND THE WELLBEING OF CHILDREN (YOUNG LIVES) IN THESE COUNTRIES
		-- Five views were created all of which form part of the report.

			-- View 1: "vwCWBM_ChildPhyiqueNutritionalStat" to measure and understand child wellbeing in the area of pysical development and access to food,
			--  in the four countries as at the last round of survey (round 5; R5)

				CREATE VIEW CWBM.vmChildPhyiqueNutritionalStat
				AS
				SELECT a.ChildID AS [Child ID],  
						a.ChildHeight AS [Child's Height(cm) in R5], 
						a.ChildBirthWeight AS [Child's Weight (kg) in R5], 
						a.BMI AS [BMI R5], 
						a.ChildHealthInGen [General Health Status R5], 
						b.HhFoodAvailability AS [Current HH Food Availability R5]
				FROM CWBM.AppearanceHealthDis_R5 a
				INNER JOIN CWBM.HhEconomyAmenitiesAccess_R5 b ON (a.ChildID = b.ChildID)
				GO

			-- View 2: "vwChild_Vulnerability" to measure and understand child vulnerability across all four countries using the most recent round (R5).

				CREATE VIEW CWBM.vwChild_Vulnerability
				AS
				SELECT a.ChildID, 
						a.FreqOfSmoking, 
						a.AlcoholConsumptionWeekly, 
						b.ChildMarriageCohabition, 
						b.PaidActivityHPD, 
						c.LocationOfFather, 
						c.LocationOfMother, 
						c.ParentsDivorced,
						d.CrimeVictim
				FROM CWBM.AppearanceHealthDis_R5 a
				INNER JOIN CWBM.ChildSocialLife_R5 b ON (a.ChildID = b.ChildID)
				INNER JOIN CWBM.AboutChildHh_R5 c ON (b.ChildID =  c.ChildID)
				INNER JOIN CWBM.HhSecurityEnvironMigration_R5 d ON (c.ChildID = d.ChildID);
				GO

			-- View 3: "vwChild_EconomicDeprivation" to measure and understand child economic deprivations across all four countries using the most recent round (R5).

				CREATE VIEW CWBM.vwChild_EconomicDeprivation
				AS
				SELECT ChildID, 
						AccessToDrinkingWater, 
						AccessToSanitation, 
						AccessToELectricity, 
						HhFoodAvailability, 
						ConsumerDurablesIndex, 
						AccessToServicesIndex, 
						HousingQualityIndex
				FROM CWBM.HhEconomyAmenitiesAccess_R5
				GO	

			-- View 4: "vwChild_MorbidityMortality" to measure and understand child morbidity and mortality across all four countries using the most recent round (R5).

				CREATE VIEW CWBM.vwChild_MorbidityMortality
				AS
				SELECT a.ChildID, 
						a.SeriousInjuryIllness, 
						a.ProlongedHealthProblem, 
						a.PermDisability, 
						b.ChildHasDied
				FROM CWBM.AppearanceHealthDis_R5 a
				INNER JOIN CWBM.AboutChild_R5 b ON (a.ChildID = b.ChildID)
				GO

			-- View 5: "vwChild_Opportunities" to understand some opportunities for child development and advancement in life 
			--			across all four countries using the most recent round (R5).

				CREATE VIEW CWBM.vwChild_Opportunities
				AS
				SELECT a.ChildID,
						a.ChildEnrolledInSch, 
						a.SchoolType, 
						b.AfterSchStudyHPD, 
						b.PlayHPD, 
						c.HhSize, 
						c.BirthOfNewHhMember
				FROM CWBM.ChildEducation_R5 a
				INNER JOIN CWBM.ChildSocialLife_R5 b ON (a.ChildID = b.ChildID)
				INNER JOIN CWBM.AboutChildHh_R5 c ON (b.ChildID = c.ChildID)
				GO

	-- STEP THIRTEEN: CREATING TRIGGERS

		-- I. DATABASE TRIGGER : This Trigger rollback any attempt by database user to perform a DDL operation on database

			CREATE TRIGGER trgDDL_NotAllowed
			ON DATABASE 
			FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
			AS
			BEGIN
				RAISERROR ('You do not have permission to do this, contact Database Administrator', 16,10)
				PRINT 'CREATING, ALTERING AND DROPING TABLES ARE PROHIBITED'
				ROLLBACK TRANSACTION
			END
			GO

		-- II. TABLE TRIGGER : This trigger prevents anyone from compromising data in the source table. 
		--						Integrity of the "CWBM.Complete" table has got to be preserved 
		--						because it is the table from which every other table is created.

				CREATE TRIGGER trgleavetables
				ON CWBM.Complete
				AFTER INSERT, UPDATE, DELETE
				AS
				BEGIN
					RAISERROR ('You do not have permission to do this, contact Database Administrator', 16,10)
					PRINT 'YOU CANNOT MODIFY DATA IN THE SOURCE TABLE'
					ROLLBACK TRANSACTION
				END
				GO



	/* SUMMARISED REPORT:	FIVE SUMMARIZED REPORTS THAT HELPS THE CLIENT TO MEASURE CHILD POVERTY USING THE MOST RECENT ROUND OF DATA (ROUND 5)
								ARE PRESENTED BELOW. THESE SUMMARIZED REPORTS ARE ALL CREATED AS VIEWS IN THIS DATABASE*/

				SELECT * FROM CWBM.vmChildPhyiqueNutritionalStat
				SELECT * FROM CWBM.vwChild_Vulnerability
				SELECT * FROM CWBM.vwChild_EconomicDeprivation
				SELECT * FROM CWBM.vwChild_MorbidityMortality
				SELECT * FROM CWBM.vwChild_Opportunities;
				GO