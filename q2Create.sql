-- Exercise 5
CREATE VIEW CourseRegistrationsWithGrade as(
SELECT * FROM CourseRegistrations as CR WHERE CR.Grade > 0);

-- Exercise 8

CREATE VIEW SACountPerCO as(
SELECT CO.CourseOfferId, COUNT(DISTINCT SA.StudentRegistrationId) as Count
FROM CourseOffers as CO, StudentAssistants as SA
WHERE CO.CourseOfferId = SA.CourseOfferId
GROUP BY CO.CourseOfferId);

CREATE VIEW SCountPerCO as(
SELECT CO.CourseOfferId, COUNT(DISTINCT CR.StudentRegistrationId) as Count
FROM CourseOffers as CO, CourseRegistrations as CR
WHERE CO.CourseOfferId = CR.CourseOfferId
GROUP BY CO.CourseOfferId);
