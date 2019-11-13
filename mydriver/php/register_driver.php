<?php
error_reporting(0);
include_once ("dbconnect.php");
$email = $_POST['email'];
$password = sha1($_POST['password']);
$phone = $_POST['phone'];
$name = $_POST['name'];
$encoded_string = $_POST["encoded_string"];
$decoded_string = base64_decode($encoded_string);
$sql_e = "SELECT * FROM DRIVER WHERE EMAIL='$email'";
$result = $conn->query($sql_e);
if($result->num_rows > 0) {
    echo "Email already exist, try another email.";
} else{
$sqlinsert = "INSERT INTO DRIVER(NAME,EMAIL,PASSWORD,PHONE,VERIFY) VALUES ('$name','$email','$password','$phone','0')";
if ($conn->query($sqlinsert) === TRUE) {
    $path = '../profile/'.$email.'.jpg';
    file_put_contents($path, $decoded_string);
    sendEmail($email);
    echo "Success, please check your email to verify your account";
} 
else {
    echo "Failed, please ensure your information is valid";
}
}
function sendEmail($useremail) {
    $to      = $useremail; 
    $subject = 'Verification for MyExpress'; 
    $message = 'Please click the link to activate your account http://alifmirzaandriyanto.com/mydriver/php/verify.php?email='.$useremail; 
    $headers = 'From: myexpressdriver@alifmirzaandriyanto.com' . "\r\n" . 
    'Reply-To: '.$useremail . "\r\n" . 
    'X-Mailer: PHP/' . phpversion(); 
    mail($to, $subject, $message, $headers); 
}
?>