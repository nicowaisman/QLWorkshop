/*
 * @name Find all calls to snprintf with dataflow between the size argument and the return address
 * @description The query look for dataflow between the return address and the size argument and with a format string with a string
 * 	We are looking for a scenario such as 
 * 		blah += snprintf(buf, sizeof(buf)- blah, "blah:%s", szBlah);
 *  We are looking for potential bugs that could be trigger by the corner case where the output was truncated by the size limit, but
 * return the amount of characters that would have been written on the final string. 
 *  This behaviour on a loop could potentially trigger a integer overflow and a result an overflow by a next call to snprintf
 * as describe in this example:
 * 	https://blog.semmle.com/cve-2018-18820-snprintf-vulnerability-icecast/
 *  
 * @precision low
 * @tags security
 */

import cpp
import semmle.code.cpp.dataflow.TaintTracking

from FunctionCall call
where call.getTarget().getName() = "snprintf"
  and call.getArgument(2).getValue().regexpMatch("(?s).*%s.*")
  and TaintTracking::localTaint(DataFlow::exprNode(call), DataFlow::exprNode(call.getArgument(1)))
select call, "potentially dangerous call to snprintf."

