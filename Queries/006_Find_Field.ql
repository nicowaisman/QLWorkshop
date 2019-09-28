/*
 * @name Find all access to the field "reply" 
 * @description Find all access to the field "reply"
 * @precision low
 * @tags security
 */

import cpp

from 
	FieldAccess access, Field f
where 
	f = access.getTarget() and f.hasName("reply")
select 
	access, "Access to the field reply"
