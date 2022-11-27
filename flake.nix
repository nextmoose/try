  {
      inputs =
        {
          flake-utils.url = "github:numtide/flake-utils" ;
        } ;
      outputs =
        { self , flake-utils } :
          flake-utils.lib.eachDefaultSystem
          (
            system :
              {
	        lib =
		  try :
		    let
		      trial =
		        seed :
			  let
			    eval = builtins.tryEval ( try seed ) ;
			    in if eval.success then eval.value else trial ( seed + 1 ) ;
		       in trial 0 ;
              }
      ) ;
    }
