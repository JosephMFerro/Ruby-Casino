class Welcome
  def initialize
    def welcome_logo
      puts
    " **       **          **                                      **********         
      /**      /**         /**                                     /////**///          
      /**   *  /**  *****  /**  *****   ******  **********   *****     /**      ****** 
      /**  *** /** **///** /** **///** **////**//**//**//** **///**    /**     **////**
      /** **/**/**/******* /**/**  // /**   /** /** /** /**/*******    /**    /**   /**
      /**** //****/**////  /**/**   **/**   /** /** /** /**/**////     /**    /**   /**
      /**/   ///**//****** ***//***** //******  *** /** /**//******    /**    //****** 
      //       //  ////// ///  /////   //////  ///  //  //  //////     //      //////  
      "
    end

    def dpl_logo
      puts  
    " *******   *******  **         ******                    **                  
      /**////** /**////**/**        **////**                  //                   
      /**    /**/**   /**/**       **    //   ******    ****** ** *******   ****** 
      /**    /**/******* /**      /**        //////**  **//// /**//**///** **////**
      /**    /**/**////  /**      /**         ******* //***** /** /**  /**/**   /**
      /**    ** /**      /**      //**    ** **////**  /////**/** /**  /**/**   /**
      /*******  /**      /******** //****** //******** ****** /** ***  /**//****** 
      ///////   //       ////////   //////   //////// //////  // ///   //  //////  
      "
    end

    welcome_logo
    dpl_logo
  end
end

Welcome.new
