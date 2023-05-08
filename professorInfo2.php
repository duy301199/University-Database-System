<html>
<body>
<?php
$link=mysqli_connect('mariadb','cs332g22','uDM5jjoW','cs332g22');
if(!$link) {
die('Could not connect: '. mysql_error()); }
echo 'Connected sucessfully<p>';
$query = 'SELECT grade, COUNT(*) as count FROM Enrollment E INNER JOIN Section S
ON E.sno = S.sno WHERE S.cno="'.$_POST['icn'].'" AND S.sno ="'.$_POST['isn'].'" GROUP
BY grade';
$result = $link->query($query);
$nor=$result->num_rows;
for($i=0;$i<$nor;$i++) {
$row1=$result->fetch_assoc();
echo "Grade: ",$row1["grade"],"<br>";
echo "Count: ",$row1["count"],"<br>";
echo "-------------------------","<br>";
}
$result->free_result();
$link->close();
?>
</body>
</html>
