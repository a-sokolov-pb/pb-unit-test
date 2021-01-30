$PBExportHeader$n_unit_test_reflection_in_pb_mode.sru
forward
global type n_unit_test_reflection_in_pb_mode from n_unit_test_reflection
end type
end forward

global type n_unit_test_reflection_in_pb_mode from n_unit_test_reflection
end type
global n_unit_test_reflection_in_pb_mode n_unit_test_reflection_in_pb_mode

forward prototypes
protected function classdefinition find_class_definition (readonly string as_class_name)
public subroutine set_target (readonly string as_target_file) throws exception
end prototypes

protected function classdefinition find_class_definition (readonly string as_class_name);return findclassdefinition(as_class_name)
end function

public subroutine set_target (readonly string as_target_file) throws exception;string ls_target_library_list[]
f_string().split(getlibrarylist(), ",", ref ls_target_library_list)

this.set_target_library_list(ls_target_library_list)
is_application_name = classname(getapplication())

return
end subroutine

on n_unit_test_reflection_in_pb_mode.create
call super::create
end on

on n_unit_test_reflection_in_pb_mode.destroy
call super::destroy
end on

