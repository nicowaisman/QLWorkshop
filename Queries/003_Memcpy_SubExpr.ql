/**
 * @name Find all memcpy with a Substraction on the size argument
 * @description Find all memcpy with a Sub Expresiopn on 3rd argument
 * @precision low
 * @tags security
 */

import cpp

from FunctionCall f
where
	f.getTarget().getName() = "memcpy"
	and f.getArgument(2)  instanceof SubExpr  
	
select f, "Memcpy with a substraction in the Size argument", f.getArgument(2)



