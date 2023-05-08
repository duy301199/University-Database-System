<html>
<body>
<?php
$link=mysqli_connect('mariadb','cs332g22','uDM5jjoW','cs332g22');
if(!$link) {
die('Could not connect: '. mysql_error()); }
echo 'Connected sucessfully<p>';
$query = 'SELECT C.cno,c_title,grade FROM Course C, Students S, Enrollment E WHERE
S.id="'.$_POST['sid'].'" AND S.id=E.student_id AND C.cno=E.cno';
$result = $link->query($query);
$nor=$result->num_rows;
for($i=0;$i<$nor;$i++) {
$row=$result->fetch_assoc();
echo "Course: ",$row["cno"],"<br>";
echo "Title : ",$row["c_title"],"<br>";
echo "Grade : ",$row["grade"],"<br>";
echo "------------------------","<br>";
}
$result->free_result();
$link->close();
?>
</body>
</html>
