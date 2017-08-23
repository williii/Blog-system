<h2><?php echo $post['title']; ?></h2>
<small class="post-date">Posted on: <?php echo $post['created_at']; ?></small><br/>

<?php if($post['post_image']!='noimage.png'): ?>
	<img class="post-image" src="<?php echo site_url(); ?>assets/images/posts/<?php echo 
	$post['post_image']?>">
<?php endif; ?>

<div class="post-body">
	<?php echo $post['body']; ?>
</div>

<?php if($this->session->userdata('user_id') == $post['user_id'] || $this->session->userdata('user_id') == 1): ?>
	<hr>
	<a class="btn btn-default pull-left" href="<?php echo base_url(); ?>posts/edit/
		<?php echo $post['slug']; ?>">Edit
	</a>

	<?php echo form_open('/posts/delete/'.$post['id']); ?>
		<input type="submit" value="Unpublish" class="btn btn-danger">
	</form>
<?php endif; ?>

<hr>
<h3>Comments</h3>
<?php if($comments) : ?>
	<?php foreach($comments as $comment) : ?>
		<div class="well">
			<h5>
				<?php echo $comment['body']; ?>
				 <strong>[by <?php echo $comment['name'];?> ] </strong>
				at <?php echo $comment['created_at']; ?>
			</h5>
		</div>
	<?php endforeach; ?>

<?php else : ?>
	<p>No Comments to Display</p>
<?php endif; ?>
<hr>
<h3>Add Comment</h3>
<?php echo validation_errors(); ?>
<?php echo form_open('comments/create/'.$post['id']); ?>
	<?php if(!$this->session->userdata('logged_in')) : ?>
		<div class="form-group">
			<input type="hidden" name="name" class="form-control" value="Annonymus">
		</div>
		<div class="form-group">
			<label>Body</label>
			<textarea type="text" name="body" class="form-control"></textarea>
		</div>
	<?php endif; ?>
	
	<?php if($this->session->userdata('logged_in')) : ?>
		<div class="form-group">
			<input type="hidden" name="name" class="form-control" value="<?php echo $this->session->userdata('username');?>" readonly>
		</div>
		<div class="form-group">
			<label>Body</label>
			<textarea type="text" name="body" class="form-control"></textarea>
		</div>
	<?php endif; ?>
	<input type="hidden" name="slug" value="<?php echo $post['slug']; ?>">
	<button class="btn btn-primary" type="submit">Submit</button>
</form>
