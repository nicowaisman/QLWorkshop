/**
 * @name Find all memcpy without a Arithmetic Operation 
 * @description Find all memcpy with a Binary/Arithmetic Operation as 3rd argument
 * @precision low
 * @tags security
 */

import cpp

from FunctionCall f
where
	f.getTarget().getName() = "memcpy"
	and f.getArgument(2)  instanceof BinaryArithmeticOperation  
	
select f, "Memcpy with a Arithmetic operation in the Size argument", f.getArgument(2)



