<h2><?= $title; ?></h2>
<table class="table table-hover">
	<tr>
		<td>
			Username
		</td>
		<td>
			Status
		</td>
		<td>
			Option
		</td>
	</tr>
	<?php foreach($users as $author) : ?>
	<tr>
		<td>
			<?php echo $author['name']; ?>
		</td>
		<td>
			<?php echo $author['status']; ?>
		</td>
		<td>
			<?php if($author['role'] == 'admin'):?>
				ADMIN
			<?php endif; ?>
			
			<?php if($author['status']=='deactivated' && $author['role'] != 'admin'):?>
				<form class="user-deactivate" action="authors/activate/<?php echo $author['id']; ?>" method="POST">
					<input type="submit" class="btn-link text-danger" value="[ACTIVATE USER]">
				</form>	
			<?php endif; ?>
			
			<?php if($author['status']=='active' && $author['role'] != 'admin'):?>
				<form class="user-deactivate" action="authors/deactivate/<?php echo $author['id']; ?>" method="POST">
					<input type="submit" class="btn-link text-danger" value="[DEACTIVATE USER]">
				</form>	
			<?php endif; ?>
		</td>
	</tr>
	<?php endforeach; ?>
</table>