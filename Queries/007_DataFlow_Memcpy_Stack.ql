/*
 * @name Find all calls to memcpy with a stack variable as destination
 * @description Find all calls to memcpy with a stack variable as destination
 * @precision low
 * @tags security
 */

import cpp
import semmle.code.cpp.dataflow.StackAddress

from FunctionCall call, Expr destArg, Expr sizeArg
where 
	call.getTarget().getName() = "memcpy"
	and destArg = call.getArgument(0)
	and sizeArg = call.getArgument(2)
	and stackPointerFlowsToUse(destArg, _, _, _)
select call, destArg, "A memcpy with a stack variable as destination",  sizeArg
 
