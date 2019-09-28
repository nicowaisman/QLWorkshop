/**
 * @name Find all memcpy without a Literal as a Size
 * @description Find all memcpy without a Literal as a Size
 * @precision low
 * @tags security
 */

import cpp

from FunctionCall f
where
	f.getTarget().getName() = "memcpy"
	and not f.getArgument(2)  instanceof Literal
	
select f, "Memcpy call with a non constant size ", 	f.getArgument(2)


