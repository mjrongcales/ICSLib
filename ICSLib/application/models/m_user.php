<?php

class M_user extends CI_Model{
	/*
    function get_db($bktitle){
	
		$query = $this->db->query("SELECT title FROM book WHERE title = '$bktitle'");
		return $query->result();
	
	}
	*/
	function insert_new_user(){
	
		$data = array(
		
			'name' =>  $this->input->post('name'),
			'username' => $this->input->post('uname'),
			'password' => $this->input->post('pword'),
			'email' => $this->input->post('email') ,
			'mobile_no' =>$this->input->post('cnum') ,
			'college' => $this->input->post('college') ,
			'userid_no' => $this->input->post('usr_num'),
			'user_type' => 'User' ,
			
		);
	
		$this->db->insert('user', $data);
	
	}
	
	function login(){
	
		$uname = $this->input->post('uname');
		$pword = $this->input->post('pword');
	
		$found = $this->db->simple_query("SELECT username, password FROM user WHERE username = '$uname' AND password = '$pword' ");

		if($found){
		
			$userdata = array(
		
				'username' => $uname,
				'logged_in' => TRUE
			
			);
			
			$this->session->set_userdata($userdata);
			
			return TRUE;
			
		}else{
		
			return FALSE;
		
		}
	
	}
	/** Function to retrieve user details */
	public function get_userinfo($username='default')
	{
		/** Select necessary user details of logged in user*/
		$this->db->select('username,name,userid_no,email,college,mobile_no');
		$this->db->from('user');
		$this->db->like('username',$username);
		$query = $this->db->get();
		return $query->row_array(6);	// return results as a row array
	}
	/* Function to retrieve account history */
	public function get_transaction($username='default')
	{
		/** Get the library id of user logged in */
		$this->db->select('library_id');
		$this->db->from('user');
		$this->db->like('username',$username);
		$uid = $this->db->get();
		$library_id = $uid->free_result();
		/* Select requests of logged in user */
		$this->db->select('*');
		$this->db->from('request');
		$this->db->like('request.library_id',$library_id);
		$this->db->join('book','book.book_id = request.book_id');
		$this->db->join('transaction','transaction.request_id = request.request_id');
		$query = $this->db->get();
		return $query->result_array();	//return results as an array

	}
	public function get_library_id($username='default')
	
	{	$this->db->select('library_id');
		$this->db->from('user');
		$this->db->like('username',$username);
		$query = $this->db->get();
		//$query = $this->db->query("SELECT library_id FROM user WHERE username = '$username'");
		return $query->free_result();
	}
}

?>