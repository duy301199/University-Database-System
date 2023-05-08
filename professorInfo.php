<html>
<body>
<?php
$link=mysqli_connect('mariadb','cs332g22','uDM5jjoW','cs332g22');
if(!$link) {
die('Could not connect: '. mysql_error()); }
echo 'Connected sucessfully<p>';
$query = 'SELECT ssn,c_title, classroom, meeting_days, start_time, end_time
FROM Professor P, Section S, Course C
WHERE P.ssn = "'.$_POST['sno'].'" AND P.ssn = S.professor_ssn AND S.cno =
C.cno';
$result = $link->query($query);
$nor=$result->num_rows;
for($i=0;$i<$nor;$i++) {
$row=$result->fetch_assoc();
echo "Classroom: ",$row['classroom'],"<br>";
printf("SSN : %s<br>\n", $row['ssn']);
printf("Title: %s<br>\n", $row["c_title"]);
echo "Meeting_days: ", $row['meeting_days'],"<br>";
echo "Start: ",$row['start_time'],"<br>";
echo "End: ",$row['end_time'],"<br>";
echo "---------------------------------","<br>"; }
$result->free_result();
$link->close();
?>
</body>
</html>
