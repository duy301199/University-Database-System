<html>
<body>
<?php
$link=mysqli_connect('mariadb','cs332g22','uDM5jjoW','cs332g22');
if(!$link) {
die('Could not connect: '. mysql_error()); }
echo 'Connected sucessfully<p>';
$query ='SELECT S.sno,classroom,meeting_days,start_time,end_time,no_seats FROM
Section S, Course C, Enrollment E WHERE C.cno="'.$_POST['icn'].'" AND C.cno=S.cno AND
C.cno=E.cno';
$result = $link->query($query);
$nor=$result->num_rows;
for($i=0;$i<$nor;$i++){
$row=$result->fetch_assoc();
echo "Section: ",$row['sno'],"<br>";
echo "Classroom: ",$row['classroom'],"<br>";
printf("Meeting Days : %s<br>\n", $row['meeting_days']);
printf("Start: %s<br>\n", $row['start_time']);
echo "End: ",$row['end_time'],"<br>";
echo "Number of seats: ",$row['no_seats'],"<br>";
echo "---------------------------------","<br>"; }
$result->free_result();
$link->close();
?>
</body>
</html>
