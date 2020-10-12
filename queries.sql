'Obtain the names of all patients who has been undergone a procedure costing more than 5,000€ and the name of their doctor:'
SELECT p.name AS "Patient"
    d.name AS "Doctor"
    pd.price AS "Medical Care Cost"
FROM patient p
JOIN bill_for b ON b.pid =p.pid
JOIN attended_by a ON a.employee_id=d.employee_id
JOIN medical_care mc ON b.bill_id=mc.bill_id
WHERE mc.price>5000;

'Display the names of patients with more than one appointment, and the number of appointments they had:'
SELECT p.name AS "Patient"
    count(t.patient) AS "Appointment for No. of Physicians"
FROM appointment a
JOIN patient p ON a.pid=p.pid
GROUP BY p.name HAVING count(a.patient)>=1;

'Find the name of the patients and the number of the room they have to go to for their treatment.'
SELECT p.name AS "Patient"
    a.room AS "Room No."
    a.time AS "Date and Time of appointment"
FROM patient p
JOIN appointment a ON p.pid=a.pid;

"Display the name of the patients, their treating physicians and medication:"
SELECT p.name AS "Patient"
    d.name AS "Physician"
    m.code AS "Medication"
FROM patient p
JOIN bill_for b ON b.pid=p.pid
JOIN attended_by a ON b.pid=a.pid
JOIN doctor d ON a.doctor_id=d.employee_id
JOIN medicine m ON m.bill_id = b.bill_for;

"Display the name of the patients who discharge before 2020-01-01"
SELECT p.name AS "Patient"
FROM patient p
where p.Date_Of_Discharge < 2020-01-01;

"Display the dose of the Medicine"
SELECT Medicne.dose 
from Medicine;

"Find the appointment of the given patient ID = 003"
Select (*) 
from Appointments A
where A.pid = 003
;

"Find the doctor name and room of appointment of the given patient ID #003"
SELECT A.Room_ID, E.E_name
from Appoinment A and Employee E
where (A.pid = 003) 
;

"Check the Doctor ID who is reported by nurse_ID #234"
SELECT R.doctor_ID "r stands for report _to"
from Reports_to R
where R.nurse_ID = 234
;


"Find the name of patients who currently stay in Room #201"
SELECT P.pid AS "Patient"
from patient P, assigned_to A
Where P.pid = A.pid AND A.Room_ID = "#201";

"Find the name of patients who currently stay in Room #201 and have stayed longer than 2 months"
SELECT P.ID AS "Patient"
from patient P, assigned_to A
Where P.pid = A.pid AND A.Room_ID = "#201"
    And P.ID IN (   Select P2.ID
                    From patient P2, assigned_to A2, rooms R
                    where P2.pid = A2.Room_ID and A2.Room_ID = R.Room_ID 
                    and R.Start_Date - select convert(varchar, getdate(), 5)  > 2 months)
    );

"List the name of the trainee doctors who ends their internship before 2020-01-01"
SELECT e.E_name as "name of doctors"
from trainee_doctors t and Employee e
where   t.end_date < 2020-01-01 
    and t.employee_ID = e.employee_ID;
  