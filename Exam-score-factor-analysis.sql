/*
Project: Exam score factor analysis

Objective:Analysing the factor of sleep and internet access to students' academic performance by apply SQL technique

Data sources:
-Exam_score_prediction
-Sleep_quality

Previous work before applying SQL technique:
-data cleaning via excel
-split the raw data from Kaggle into two csv in order to showcase the technique of Join in SQL language
*/


--Reviewing the data before doing analysis
Select * From ScorePrediction p

Select * From Sleep_quality	q

--Finding max and min sleeping hours
Select Max(sleep_hours), Min(sleep_hours) From Sleep_quality

--Joining Table ScorePrediction and Sleep_quality to compare exam score and sleep hours, and also group the sleeping hours to 3 groups, (4-5, 6-7, 8<) 
Select exam_score, sleep_hours,
	Case When sleep_hours >=4 And sleep_hours <6  Then '4-5h'
	When sleep_hours >=6 And sleep_hours <8 Then '6-7h'
	When sleep_hours >=8 Then '8 or more'
	Else 'Unknown'
	End As sleep_group
From ScorePrediction p 
Left Join Sleep_quality q On p.student_id=q.student_id
Order By exam_score
--It seems that the more sleep that the students get, the higher score they tend to get. It is better to showcase with a chart. 

--Creating sorting order map
Create Table dbo.sleep_quality_sort_order (sort_order INT Primary Key, sleep_quality Varchar(20))

Insert into dbo.sleep_quality_sort_order
Values (1, 'poor'),
(2, 'average'),
(3, 'good');


--Checking whether the map is correct
Select * From dbo.sleep_quality_sort_order

--Joining Table ScorePrediction and Sleep_quality to compare exam score and sleep quality
Select p.exam_score, q.sleep_quality From ScorePrediction p 
Left Join Sleep_quality q On p.student_id=q.student_id
Order By exam_score
--This show the trend of better sleep, better academic performance, suggesting use a chart to do showcase. 


--Finding the average exam score of student with different sleeping quality
Select p.exam_difficulty, q.sleep_quality, AVG(exam_score) As 'Average_score' 
From Sleep_quality q 
Left Join ScorePrediction p On q.student_id=p.student_id
Left Join dbo.sleep_quality_sort_order ss On q.sleep_quality=ss.sleep_quality
Left Join dbo.exam_difficulty_sort_order es On p.exam_difficulty= es.exam_difficulty
Group By p.exam_difficulty, q.sleep_quality, ss.sort_order,es.sort_order
Order by es.sort_order,ss.sort_order
--This table shows students with better sleep qulaity tend to have higher exam score

--Finding relationship between internet access and exam score
Select AVG(exam_score) As 'average_score',
	Case When internet_access=1 Then 'Yes'
	When internet_access=0 Then 'No'
	Else 'Unknown'
	End As Have_internet
From ScorePrediction
Group By
	Case When internet_access=1 Then 'Yes'
	When internet_access=0 Then 'No'
	Else 'Unknown'
End
--The table shows students with or without internet having similar exam score, suggesting internet access alone is not a significant factor on exam score. 


/*
Conclusion:
- Students with better sleep quality and more sleep tend to have better exam results. 
- Internet access alone does not show a strong relationship with exam performance.
- Further analysis with additional factors (e.g. study hours, attendance) is recommended.
*/