SELECT C.CourseName, CR.Grade FROM StudentRegistrationsToDegrees as SRTD, Courses as C, CourseOffers as CO,CourseRegistrations as CR WHERE SRTD.StudentId = %1% AND SRTD.DegreeId = %2% AND SRTD.StudentRegistrationId = CR.StudentRegistrationId AND CR.CourseOfferId = CO.CourseOfferId AND CO.CourseId = C.CourseId AND CR.Grade >= 5 ORDER BY CO.Year, CO.Quartile, CO.CourseOfferId;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT CO.CourseId, AVG(case when CRWG.Grade >= 4 then 1 else 0 end) as percentagePassing FROM CourseOffers as CO, CourseRegistrationsWithGrade as CRWG WHERE CO.CourseOfferId = CRWG.CourseOfferId GROUP BY CO.CourseId;
SELECT 0;
SELECT 0;
SELECT C.CourseName, CO.Year, CO.Quartile FROM SACountPerCO, SCountPerCO, CourseOffers as CO, Courses as C WHERE SACountPerCO.CourseOfferId = CO.CourseOfferId AND C.CourseId = CO.CourseId AND SCountPerCO.CourseOfferId = CO.CourseOfferId AND FLOOR(SCountPerCO.Count / 50) > SACountPerCO.Count ORDER BY CO.CourseOfferId;
