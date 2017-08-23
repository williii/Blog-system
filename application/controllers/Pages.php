<?php
	class Pages extends CI_Controller {
		public function view($page = 'home') {
			if (!file_exists(APPPATH.'views/pages/'.$page.'.php')) {
				show_404();
			}
			
			$config['base_url'] = base_url() . 'posts/index/';
			$config['total_rows'] = $this->db->count_all('posts');
			$config['per_page'] = 3;
			$config['uri_segment'] = 3;
			$config['attributes'] = array('class' => 'pagination-link');
			
			$this->pagination->initialize($config);
			
			$data['posts'] = $this->post_model->get_posts(FALSE, $config['per_page']);
			
			$data['title'] = ucfirst($page);
			
			$this->load->view('templates/header');
			$this->load->view('pages/'.$page, $data);
			$this->load->view('templates/footer');
		}
	}