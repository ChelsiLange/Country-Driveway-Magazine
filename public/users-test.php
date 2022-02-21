<?php require_once('../private/initialize.php'); ?>


<h1>Database Connection Test Page</h1>

<table>
  <tr>
    <th>User ID</th>
    <th>Newsletter Code</th>
    <th>Role Code</th>
    <th>Preferred Name</th>
    <th>Email</th>
    <th>Membership Date</th>
  </tr>
<?php
$accounts =Accounts::find_all();
?>

  <?php foreach($accounts as $account) { ?>
  <tr>
    <td><?php echo $account->user_id; ?></td>
    <td><?= $account->newsletter_id_fk; ?></td>
    <td><?= $account->user_role_id_fk; ?></td>
    <td><?= $account->preferred_name; ?></td>
    <td><?= $account->email; ?></td>
    <td><?= $account->member_date; ?></td>
  </tr>
<?php } ?>
</table>
