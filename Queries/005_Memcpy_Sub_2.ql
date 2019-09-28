/**
 * @name Find all memcpy with a substraction of two 
 * @description Find all memcpy with a SubExpr and the right operand being a 2
 * @precision low
 * @tags security
 */

import cpp

from FunctionCall f, SubExpr s
where
	f.getTarget().getName() = "memcpy" 
	and f.getArgument(2)  = s
	and s.getRightOperand().getValue().toInt() = 2
	
select f, "Memcpy with a Substraction of 2 on the Size argument", f.getArgument(2)


