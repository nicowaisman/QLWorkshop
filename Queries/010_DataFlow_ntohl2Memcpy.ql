import cpp
import semmle.code.cpp.dataflow.TaintTracking

class NetworkMemFunc extends TaintTracking::Configuration {
	 NetworkMemFunc() { this = "NetworkMemFunc" }
	 override predicate isSource(DataFlow::Node source) {
	 	exists(MacroInvocation mi | 
	 		source.asExpr() = mi.getExpr()
	 		and mi.getOutermostMacroAccess().getMacroName().regexpMatch("(?i)(^|.*_)ntoh(l|ll|s)")
	 		)
	 	
	 }
	 override predicate isSink(DataFlow::Node sink) {
	 	exists( FunctionCall fc  | 
	 	sink.asExpr() = fc.getArgument(2)
	 	and fc.getTarget().hasQualifiedName("memcpy")
	 	)
	 }
	
}

from Expr Reply, Expr Size, NetworkMemFunc conf
where
	conf.hasFlow(DataFlow::exprNode(Reply), DataFlow::exprNode(Size) )
select Reply, "Found a memcpy with a size coming from ntoh*", Size


