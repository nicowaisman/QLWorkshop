/**
 * @name Find all the function call to a memcpy
 * @description Find all the function calls to memcpy
 * @problem.severity warning
 * @precision low
 * @tags security
 */

import cpp

from FunctionCall f
where
	f.getTarget().getName() = "memcpy"
select f, "Find all the locations that call memcpy"


