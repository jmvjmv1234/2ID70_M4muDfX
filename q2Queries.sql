SELECT C.CourseName, CR.Grade FROM StudentRegistrationsToDegrees as SRTD, Courses as C, CourseOffers as CO,CourseRegistrations as CR WHERE SRTD.StudentId = %1% AND SRTD.DegreeId = %2% AND SRTD.StudentRegistrationId = CR.StudentRegistrationId AND CR.CourseOfferId = CO.CourseOfferId AND CO.CourseId = C.CourseId AND CR.Grade >= 5 ORDER BY CO.Year, CO.Quartile, CO.CourseOfferId;






SELECT C.CourseName, CO.Year, CO.Quartile FROM SACountPerCO, SCountPerCO, CourseOffers as CO, Courses as C WHERE SACountPerCO.CourseOfferId = CO.CourseOfferId AND C.CourseId = CO.CourseId AND SCountPerCO.CourseOfferId = CO.CourseOfferId ANDFLOOR(SCountPerCO.Count / 50) > SACountPerCO.Count ORDER BY CO.CourseOfferId;
