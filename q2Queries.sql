SELECT C.CourseName, CR.Grade FROM StudentRegistrationsToDegrees as SRTD, Courses as C, CourseOffers as CO,CourseRegistrations as CRWHERE SRTD.StudentId = %1% AND SRTD.DegreeId = %2% AND SRTD.StudentRegistrationId = CR.StudentRegistrationId AND CR.CourseOfferId = CO.CourseOfferId AND CO.CourseId = C.CourseId AND CR.Grade >= 5 ORDER BY CO.Year, CO.Quartile;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT 0;
SELECT C.CourseName, CO.Year, CO.Quartile FROM SACountPerCO, SRTDCountPerCO, CourseOffers as CO, Courses as C WHERE SACountPerCO.CourseOfferId = CO.CourseOfferId AND C.CourseId = CO.CourseId AND SRTDCountPerCO.CourseOfferId = CO.CourseOfferId AND FLOOR(SRTDCountPerCO.Count / 50) > SACountPerCO.Count;
