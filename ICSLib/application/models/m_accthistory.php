<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class M_accthistory extends CI_Model {

	public function __construct()
	{
		parent::__construct();
		$this->load->database();
	}
	public function get_transaction()
	{
		// get library_id of user logged in from session
		$library_id = 1;
		$this->db->select('*');
		$this->db->from('request');
		$this->db->join('book','book.book_id = request.book_id');
		$this->db->join('transaction','transaction.request_id = request.request_id');
		$query = $this->db->get();
		return $query->result_array();

		
		// select request.request_id, request.book_id, request.request_status, 
		// request.request_date, title, call_no from request, book where library_id=logged_in and request.book_id = book.book_id;
		// select request_id, book_id, status, request_date from request where library_id=logged_in;
		// select title, call_no from book where book_id=book_id;
		// select request_id, fine, return_date from transaction where request_id=request_id;

	}

}

/* End of file m_accthistory.php */
/* Location: ./application/models/m_accthistory.php */