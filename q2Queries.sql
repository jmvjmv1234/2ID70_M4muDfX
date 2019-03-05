SELECT C.CourseName, CR.Grade
FROM StudentRegistrationsToDegrees as SRTD,
	Courses as C, 
	CourseOffers as CO,
	CourseRegistrations as CR
WHERE SRTD.StudentId = %1% AND
	SRTD.DegreeId = %2% AND
	SRTD.StudentRegistrationId = CR.StudentRegistrationId AND
	CR.CourseOfferId = CO.CourseOfferId AND
	CO.CourseId = C.CourseId AND
	CR.Grade >= 5
ORDER BY CO.Year, CO.Quartile, CO.CourseOfferId;

(SELECT StudentId FROM StudentGPA WHERE StudentGPA.GPA>%1%)
	EXCEPT (SELECT StudentId FROM StudentsNotFullPass)
ORDER BY StudentId;

SELECT SRTD.DegreeId, 
	AVG(case ActS.Gender when 'F' then 1 else 0 end) * 100 as percentage
FROM StudentRegistrationsToDegrees as SRTD, 
	ActiveStudents as ActS
WHERE SRTD.StudentId = ActS.StudentId
GROUP BY SRTD.DegreeId;

SELECT 0;

SELECT CO.CourseId, 
	AVG(case when CR.Grade > %1% then 1 else 0 end) * 100 as percentagePassing
FROM CourseOffers as CO, CourseRegistrations as CR 
WHERE CO.CourseOfferId = CR.CourseOfferId
GROUP BY CourseOfferId;

SELECT ExcellentStudentsPerCOCount.StudentId, 
	ExcellentStudentsPerCOCount.Count
FROM ExcellentStudentsPerCOCount
WHERE ExcellentStudentsPerCOCount >= %1%;

SELECT 0;


SELECT C.CourseName, CO.Year, CO.Quartile
FROM SACountPerCO, SRTDCountPerCO, CourseOffers as CO, Courses as C
WHERE SACountPerCO.CourseOfferId = CO.CourseOfferId AND
	C.CourseId = CO.CourseId AND
	SRTDCountPerCO.CourseOfferId = CO.CourseOfferId AND
	FLOOR(SRTDCountPerCO.Count / 50) > SACountPerCO.Count;
