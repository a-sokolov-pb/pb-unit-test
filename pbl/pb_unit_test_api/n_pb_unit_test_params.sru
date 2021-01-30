$PBExportHeader$n_pb_unit_test_params.sru
forward
global type n_pb_unit_test_params from nonvisualobject
end type
end forward

global type n_pb_unit_test_params from nonvisualobject
end type
global n_pb_unit_test_params n_pb_unit_test_params

type variables
private:

string is_target_file
string is_log_file
string is_test_scope
string is_test_expression
n_output_callback in_output
end variables

forward prototypes
public function n_pb_unit_test_params set_target_file (readonly string as_target_file)
public function n_pb_unit_test_params set_log_file (readonly string as_log_file)
public function n_pb_unit_test_params set_test_scope (readonly string as_test_scope)
public function n_pb_unit_test_params set_output (readonly n_output_callback an_output)
public function string get_target_file ()
public function string get_log_file ()
public function string get_test_scope ()
public function n_output_callback get_output ()
public function string get_test_expression ()
public function n_pb_unit_test_params set_test_expression (readonly string as_test_expression)
end prototypes

public function n_pb_unit_test_params set_target_file (readonly string as_target_file);is_target_file = as_target_file

return this
end function

public function n_pb_unit_test_params set_log_file (readonly string as_log_file);is_log_file = as_log_file

return this
end function

public function n_pb_unit_test_params set_test_scope (readonly string as_test_scope);is_test_scope = as_test_scope

return this
end function

public function n_pb_unit_test_params set_output (readonly n_output_callback an_output);in_output = an_output

return this
end function

public function string get_target_file ();return is_target_file
end function

public function string get_log_file ();return is_log_file
end function

public function string get_test_scope ();return is_test_scope
end function

public function n_output_callback get_output ();return in_output
end function

public function string get_test_expression ();return is_test_expression
end function

public function n_pb_unit_test_params set_test_expression (readonly string as_test_expression);is_test_expression = as_test_expression

return this
end function

on n_pb_unit_test_params.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_pb_unit_test_params.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

