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
			    attempt =
			      if builtins.typeOf try != "lambda" then builtins.throw "b5673f23-daec-4280-9c89-145860124a94"
			      else if ! builtins.tryEval ( try seed ).success then builtins.throw "885226ff-6043-45bb-a3c9-389d43a50e4a"
			      else try seed ;
			    success =
			      if ! builtins.hasAttr "success" attempt then builtins.throw "3b7d2e23-99a1-4753-8f16-894b9bac7043"
			      else if builtins.typeOf "success" attempt != "bool" then builtins.throw "10731da8-b333-4581-b619-9008750a75e9"
			      else attempt.success ;
			    value =
			      if ! builtins.hasAttr "value" attempt then builtins.throw "39d518b8-51df-4156-b82a-a307dd6d6ec6"
			      else attempt.value ;
			    in if attempt.success then attempt.value else trial ( seed + 1 ) ;
		      in ( try 0 ).value ;
              }
      ) ;
    }
