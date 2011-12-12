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
        $this->set('last_request', isset($_GET['last_request']) ? $_GET['last_request'] : '--' ); //last_request so we can tell whe it's sent
        
        //@EXAMPLE - build out the query so we only get events that have changed since the last poll
        $conditions = array();
        if( isset($_GET['last_request']) ) {
            $conditions['Order.modified > ? '] = array( $_GET['last_request'] );
        }
        
        $this->set('server_time', date('Y-m-d H:i:s') );
    }

}