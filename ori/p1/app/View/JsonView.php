<?php
//Vastly simplified from http://bakery.cakephp.org/articles/jrbasso/2008/10/26/generating-automatized-json-as-output
//Just dump all the view vars as a JSON object
class JsonView extends View {

    /** Check if any JSON specific veiw vars are set, if so - encode them.
     *
     */
    function render($action = null, $layout = null, $file = null) {  
        header('Content-type: application/json');  
        
        
        $json_data = json_encode( $this->viewVars  );
        
        if( isset($this->viewVars['callback'])) {
            $json_data = "{$this->viewVars['callback']}({$json_data});"; //with a callback
        }
        
        return $json_data;

    }  
}