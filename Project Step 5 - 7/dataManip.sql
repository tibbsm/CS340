-- Marc Tibbs (tibbsm@oregonstate.edu)
-- These are some Database Manipulation queries for my project.

-- 
-- INSERT QUERIES
-- 

-- get all student info
SELECT stu_id, stu_fname, stu_lname, stu_email FROM student

-- get all class info
SELECT cla_id, cla_title, cla_url FROM class

-- get all resource info
SELECT res_id, res_title, res_author, res_url, cla_id FROM resource

-- get all group info
SELECT gro_id, gro_name, cla_id FROM group

-- get all students the classes that they are taking
SELECT stu_id, stu_fname, stu_lname, class.cla_id, class.cla_title
FROM student 
INNER JOIN student_class ON stu_id = student_class.stu_id
INNER JOIN class ON student_class.cla_id = class.cla_id

-- get all students and the groups that they are in
SELECT stu_id, stu_fname, stu_lname, group.gro_id, group.gro_name
FROM student 
INNER JOIN student_group ON stu_id = student_group.stu_id
INNER JOIN group ON student_group.gro_id = group.gro_id

-- get all the resources for each class
SELECT cla_id, cla_title, resource.res_id, resource.res_name, resource.res_url 
FROM class
INNER JOIN class_resource ON cla_id = resource.cla_id

-- get all the groups for each class
SELECT cla_id, cla_title, group.gro_id, group.gro_name
FROM class
INNER JOIN class_resource ON cla_id = resource.cla_id

-- 
-- UPDATE QUERIES
-- 
-- UPDATE a student info
UPDATE student SET stu_fname=[fnameInput], stu_lname=[lnameInput], stu_email=[email] WHERE stu_id = [student_ID_from_the_update_form]

-- UPDATE a class info
UPDATE class SET cla_title=[titleInput], cla_url=[urlInput] WHERE cla_id = [class_ID_from_the_update_form]

-- UPDATE a resource info
UPDATE resource SET res_title=[titleInput],  res_author=[authorInput], res_url=[urlInput], cla_id=[cla_idInput] WHERE res_id = [resource_ID_from_the_update_form]

-- UPDATE a group info
UPDATE group SET gro_name=[nameInput], cla_id=[cla_idInput] WHERE gro_id = [group_ID_from_the_update_form]

-- UPDATE a student info
UPDATE student_class SET stu_id=[stu_idInput], cla_id=[cla_idInput] WHERE stu_id = [student_ID_from_the_update_form] AND cla_id = [class_ID_from_the_update_form]

-- UPDATE a class info
UPDATE student_group SET stu_id=[stu_idInput], gro_id=[gro_idInput] WHERE stu_id = [student_ID_from_the_update_form  AND gro_id = [group_ID_from_the_update_form]


-- 
-- DELETE QUERIES
-- 
-- delete a student
DELETE FROM student WHERE stu_id = [student_ID_selected_from_student_page]

-- delete a class
DELETE FROM class WHERE cla_id = [class_ID_selected_from_class_page]

-- delete a resource
DELETE FROM resource WHERE res_id = [resource_ID_selected_from_resource_page]

-- delete a group
DELETE FROM group WHERE gro_id = [group_ID_selected_from_group_page]

-- dis-associate a student from a class (M-to-M relationship deletion)
DELETE FROM student_class WHERE stu_id = [student_ID_selected_from_student_and_class_list] AND cla_id = [class_ID_selected_from_student_and_class_list]

-- dis-associate a student from a group (M-to-M relationship deletion)
DELETE FROM student_group WHERE stu_id = [student_ID_selected_from_student_and_group_list] AND gro_id = [group_ID_selected_from_student_and_group_list]