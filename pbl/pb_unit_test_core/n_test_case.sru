$PBExportHeader$n_test_case.sru
forward
global type n_test_case from n_test
end type
end forward

shared variables

end variables

global type n_test_case from n_test
event run ( )
end type
global n_test_case n_test_case

type variables
protected:

string is_event_name = "run"
classdefinition icdef_expected
end variables

forward prototypes
public function string get_event_name ()
public function n_test_case set_event_name (readonly string as_event_name)
public function classdefinition get_expected ()
public function n_test_case expected (readonly classdefinition acdef_expected)
public function n_test_case expected (readonly string as_class_name)
end prototypes

event run;return
end event

public function string get_event_name ();return is_event_name
end function

public function n_test_case set_event_name (readonly string as_event_name);is_event_name = as_event_name

return this
end function

public function classdefinition get_expected ();return icdef_expected
end function

public function n_test_case expected (readonly classdefinition acdef_expected);icdef_expected = acdef_expected

return this
end function

public function n_test_case expected (readonly string as_class_name);return this.expected(f_test_context().find_class_definition(as_class_name))
end function

on n_test_case.create
call super::create
end on

on n_test_case.destroy
call super::destroy
end on

event constructor;call super::constructor;this.set_suite(this)

return
end event

