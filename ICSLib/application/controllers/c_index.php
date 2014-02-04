<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class C_index extends CI_Controller {


	public function __construct()
	{
		parent::__construct();
		$this->load->model('m_user');
	}
	/** Index Page for this controller */
	public function index()
	{
		if($this->session->userdata('logged_in')){
			$this->load->view('v_user');	
		}	
		else{
			
			$this->load->view('v_index');
			
		}
	}
	

}

	

/* End of file c_index.php */
/* Location: ./application/controllers/c_index.php */