$PBExportHeader$n_unit_test_library.sru
forward
global type n_unit_test_library from nonvisualobject
end type
end forward

global type n_unit_test_library from nonvisualobject
end type
global n_unit_test_library n_unit_test_library

type variables
private:

string is_name
string is_file_path
n_test in_tests[]
end variables

forward prototypes
public function n_unit_test_library set_name (readonly string as_name)
public function n_unit_test_library set_file_path (readonly string as_file_path)
public function string get_name ()
public function string get_file_path ()
public function n_unit_test_library set_tests (readonly n_test an_tests[])
public function integer get_tests (ref n_test an_tests[])
end prototypes

public function n_unit_test_library set_name (readonly string as_name);is_name = as_name

return this
end function

public function n_unit_test_library set_file_path (readonly string as_file_path);is_file_path = as_file_path

return this
end function

public function string get_name ();return is_name
end function

public function string get_file_path ();return is_file_path
end function

public function n_unit_test_library set_tests (readonly n_test an_tests[]);in_tests = an_tests

return this
end function

public function integer get_tests (ref n_test an_tests[]);an_tests = in_tests

return upperbound(an_tests)
end function

on n_unit_test_library.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_unit_test_library.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

