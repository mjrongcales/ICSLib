
<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/** Controller for user functions */
class C_user extends CI_Controller {


	public function __construct()
	{
		parent::__construct();
		$this->load->model('m_user');
	}
	
	public function signup_init(){
	
		$this->load->view('v_index');
	
	}
	
	function signup_insert(){
		
		$this->m_user->insert_new_user();
		
		redirect('/c_index/','refresh');
	
	}
	
	function login_confirm(){

		$res = $this->m_user->login();
		$data['transaction'] = $this->m_user->get_transaction();
		
		if($res){
			$this->load->view('v_user',$data);
		
		}else{
		
			$data['error'] = TRUE;
			$this->load->view('v_user', $data);
		
		}
	
	}
	
	function logout(){
	
		$this->session->unset_userdata('logged_in');
		$this->session->unset_userdata('username');
	
		redirect('/c_index/','refresh');
	
	}

}

	

/* End of file c_user.php */
/* Location: ./application/controllers/c_user.php */