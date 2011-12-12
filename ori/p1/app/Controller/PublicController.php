<?php
App::uses('AppController', 'Controller');
/**
 * Orders Controller
 *
 * @property Order $Order
 */
//App::import('View', 'Json');
class PublicController extends AppController {
    
    function polling(){
        ;
    }
    
    function get_poll(){
        $this->viewClass = 'Json';
        $this->set('last_request', $_GET['last_request'] ); //last_request
        $this->set('server_time', date('Y-m-d H:i:s') );
    }

}