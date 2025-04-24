<h2>Upload and scan a file</h2>
<?php
require_once $_ENV['PLATFORM_APP_DIR'] . '/vendor/autoload.php';

use Appwrite\ClamAV\Network;

if (isset($_POST['upload_form'])) {
  $clam = new Network($_ENV['CLAMAV_HOST'], '3310');

  if ($clam->ping()) { // Check ClamAV is up and running
    $scanDestination = $_ENV['PLATFORM_APP_DIR'] . "/data/folder2scan/" . $_FILES['upfile']['name'];
    $uploadDestination = $_ENV['PLATFORM_APP_DIR'] . "/data/uploads/" . $_FILES['upfile']['name'];
    $quarantineDestination = $_ENV['PLATFORM_APP_DIR'] . "/data/quarantine/" . $_FILES['upfile']['name'];

    // Move candidate file to a shared folder with clamav app
    move_uploaded_file($_FILES['upfile']['tmp_name'], $scanDestination);

    if ($clam->fileScan($scanDestination)) {
      rename($scanDestination, $uploadDestination);
      echo "</br>No virus detected in " . $_FILES['upfile']['name'];
    } else {
      rename($scanDestination, $quarantineDestination); // move infected file to the data/quarantine folder
      echo "</br>You try to upload an infected file or the file does not exist, you should use an antivirus on your local machine.";
    }
  } else {
    echo "</br>ClamAV is not running, starting ClamAV daemon can take some time, please retry later";
  }
}
?>

<form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>" enctype="multipart/form-data">
  <label for="file">File to Upload:</label></br>
  <input type="file" name="upfile" required></br>
  <input type="submit" value="Upload" name="upload_form"/>
</form>
