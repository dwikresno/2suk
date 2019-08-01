<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ApiModel extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
        $this->db_seniku = $this->load->database('db_seniku', TRUE);
    }
    // check version
    function get_version($version)
    {
        return $this->db_seniku->query("SELECT * FROM (SELECT app_info FROM (SELECT CONCAT(app_name,'_',OS,'_',app_version) AS app_info,OS  FROM tb_version ORDER BY app_version DESC) AS alias GROUP BY OS) AS appInfo WHERE app_info LIKE '$version'")->result();
    }

    //fungsi check login
    function get_content()
    {
        $data = array();
        $query = $this->db->get('tb_content');
        $res   = $query->result();        
        return $res;
    
    }
}