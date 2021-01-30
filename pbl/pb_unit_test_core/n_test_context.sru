$PBExportHeader$n_test_context.sru
forward
global type n_test_context from nonvisualobject
end type
end forward

global type n_test_context from nonvisualobject
end type
global n_test_context n_test_context

type variables
protected:

string is_library_list[]
end variables

forward prototypes
public function n_test_context set_library_list (readonly string as_library_list[])
public function classdefinition find_class_definition (readonly string as_name)
end prototypes

public function n_test_context set_library_list (readonly string as_library_list[]);is_library_list = as_library_list

return this
end function

public function classdefinition find_class_definition (readonly string as_name);if upperbound(is_library_list) > 0 then
	return findclassdefinition(as_name, is_library_list)
else
	return findclassdefinition(as_name)
end if
end function

on n_test_context.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_test_context.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

