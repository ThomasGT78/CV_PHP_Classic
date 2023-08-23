<?php

    
    /**
     * getFileName
     * @return string
     * 
     * Get the name from the name of the original file used.
     */

    function getFileName (){
        $file_name = basename ($_SERVER['PHP_SELF'], '.php');
        $arr_file_name = explode("_", $file_name);
        
        return $name = ucfirst($arr_file_name[0]);
        
    };



?>