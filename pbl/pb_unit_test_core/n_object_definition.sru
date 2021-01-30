$PBExportHeader$n_object_definition.sru
forward
global type n_object_definition from n_primitive_definition
end type
end forward

global type n_object_definition from n_primitive_definition
end type
global n_object_definition n_object_definition

forward prototypes
public function string get_parent_class_name ()
public function string to_string (readonly any aa_value)
public function boolean equals (readonly n_base_definition an_compared)
public function boolean is_null (readonly any aa_value)
end prototypes

public function string get_parent_class_name ();powerobject lpo
lpo = ia_value

classdefinition lcdef
lcdef = lpo.classdefinition

string ls_parent_class_name
do while not isnull(lcdef)
	if lcdef.name = "nonvisualobject" &
		or lcdef.name = "powerobject" then
		exit
	end if
	
	ls_parent_class_name = lcdef.name
	lcdef = lcdef.ancestor
loop

return ls_parent_class_name
end function

public function string to_string (readonly any aa_value);if not isnull(aa_value) and isvalid(aa_value) then
	powerobject lpo
	lpo = aa_value
	
	classdefinition lcdef
	lcdef = lpo.classdefinition
	
	string ls_args[]
	
	scriptdefinition lsdef
	lsdef = lcdef.findmatchingfunction("to_string", ls_args)
	if isvalid(lsdef) then
		if lsdef.returntype.datatypeof = "string" and lsdef.access = public! then
			return classname(lpo) + "{" + lpo.dynamic to_string() + "}"
		end if
	end if
	
	return classname(lpo)
end if

return "null"
end function

public function boolean equals (readonly n_base_definition an_compared);if isnull(an_compared) or not isvalid(an_compared) then
	return false
end if

if an_compared.is_null() then
	return false
end if

string ls_parent_class_name
ls_parent_class_name = this.get_parent_class_name()
if not an_compared.get_parent_class_name() = ls_parent_class_name then
	return false
end if

powerobject lpo
lpo = ia_value

classdefinition lcdef
lcdef = lpo.classdefinition

string ls_args[]
ls_args[] = {ls_parent_class_name}

scriptdefinition lsdef
lsdef = lcdef.findmatchingfunction("equals", ls_args)
if isvalid(lsdef) then
	if lsdef.returntype.datatypeof = "boolean" and lsdef.access = public! then
		return lpo.dynamic equals(an_compared.get_value())
	end if
end if

return ia_value = an_compared.get_value()
end function

public function boolean is_null (readonly any aa_value);return isnull(aa_value) or not isvalid(aa_value)
end function

on n_object_definition.destroy
call super::destroy
end on

on n_object_definition.create
call super::create
end on

