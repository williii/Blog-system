<?php
	class Authors extends CI_Controller {
		public function index() {
			$data['title'] = 'Authors';
			
			$data['users'] = $this->author_model->get_authors();
			
			$this->load->view('templates/header');
			$this->load->view('authors/index', $data);
			$this->load->view('templates/footer');
		}
		
		public function deactivate($id) {
			if (!$this->session->userdata('logged_in')) {
				redirect('users/login');
			} else {
				
				$this->author_model->deactivate_author($id);
				
				$this->session->set_flashdata('author_deactivated',
					'Author has been deactivated');
				
				redirect('authors');
			}
		
		}
		
		public function activate($id) {
			if (!$this->session->userdata('logged_in')) {
				redirect('users/login');
			} else {
				
				$this->author_model->activate_author($id);
				
				$this->session->set_flashdata('author_activated',
					'Author has been deactivated');
				
				redirect('authors');
			}
		
		}
	}