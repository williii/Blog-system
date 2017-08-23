<?php
	class Author_model extends CI_Model {
		public function __construct() {
			$this->load->database();
		}
		
		public function get_authors() {
			$this->db->order_by('name');
			$query = $this->db->get('users');
			return $query->result_array();
		}
		
		public function deactivate_author($id) {
			$this->db->where('id',$id);
			$this->db->update('users', array('status' => 'deactivated'));
			
			return true;
		}
		
		public function activate_author($id) {
			$this->db->where('id',$id);
			$this->db->update('users', array('status' => 'active'));
			
			return true;
		}
	}