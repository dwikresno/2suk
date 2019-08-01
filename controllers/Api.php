<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Api extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('apimodel');
    }

    public function index()
    {
        $entityBody = file_get_contents('php://input');
        if ($entityBody != null) {
            $result = json_decode($entityBody);
            $res = [];
            $data['status'] = '0';
            $data['desc'] = 'Ok';
            $version = $this->apimodel->get_version($result->app_version);
            if ($result->mode == 'get_banner') {
                if (count($version) == 0) {
                    $data['status'] = '-1';
                    $data['desc'] = 'New Version is Available. Please Update First';
                    $data['ar_banner'] = $res;
                } else {
                    $res = $this->apimodel->get_content();
                    $data['status'] = '1';
                    $data['desc'] = 'Ok';
                    if ($res == NULL) {
                        $data['ar_banner'] = $res;
                    } else {
                        $data['ar_banner'] = $res;
                    }
                }
            } else {
                //query lainnya
            }


            echo (json_encode($data));
        } else {
            $data['status'] = '404';
            $data['desc'] = 'Api not found';
            echo (json_encode($data));
        }
    }


    public function whatsapp()
    {
        if (!isset($_GET['text']) or !isset($_GET['phone'])) {
            die('Not enough data');
        }

        $apiURL = 'https://eu50.chat-api.com/instance55900/';
        $token = 'lvm5oz0l33xyt80t';

        $message = $_GET['text'];
        $phone = $_GET['phone'];

        $data = json_encode(
            array(
                'chatId' => $phone . '@c.us',
                'body' => $message
            )
        );
        $url = $apiURL . 'message?token=' . $token;
        $options = stream_context_create(
            array(
                'http' =>
                array(
                    'method'  => 'POST',
                    'header'  => 'Content-type: application/json',
                    'content' => $data
                )
            )
        );
        $response = file_get_contents($url, false, $options);
        echo $response;
        exit;
    }

    public function whatsappView()
    {
        $data['page'] = 'whatsapp';
        $data['subpage'] = 'view';
        $this->load->view("desktop/index", $data);
    }
}
