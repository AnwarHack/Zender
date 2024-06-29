<?php
/**
 * Zender - Messaging Platform for SMS and WhatsApp, use your Android Devices as SMS Gateways (SaaS)
 * @author Titan Systems <mail@titansystems.ph>
 */ 

    /**
     * Error Reporting
     */
     
    error_reporting(E_ALL & ~E_DEPRECATED);

    /**
     * Start Session
     */
    
    session_start();

    /**
     * Updating Detection
     */
    
    if(file_exists("updating.lock")):
      echo file_get_contents("templates/_assets/html/maintenance.html");
      die();
    endif;

    /**
     * Vendors
     */
     
    require "vendor/autoload.php";

    /**
     * Framework
     */
     
    require "system/framework.php";