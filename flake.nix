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
			    attempt = try seed ;
			    in if attempt.success then attempt.value else trial ( seed + 1 ) ;
		      in trial 0 ;
              }
      ) ;
    }
