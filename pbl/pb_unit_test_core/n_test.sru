$PBExportHeader$n_test.sru
forward
global type n_test from n_test_intf
end type
end forward

global type n_test from n_test_intf
end type
global n_test n_test

type variables
protected:

string is_library_name
string is_object_name
n_test in_suite
end variables

forward prototypes
public subroutine before_class () throws throwable
public subroutine after_class () throws throwable
public subroutine init () throws throwable
public function string get_library_name ()
public function string get_object_name ()
public function n_test set_library_name (readonly string as_library_name)
public function n_test set_object_name (readonly string as_object_name)
public function n_test get_suite ()
public function n_test set_suite (readonly n_test an_suite)
public subroutine after () throws throwable
public subroutine before () throws throwable
public function uint get_test_count ()
end prototypes

public subroutine before_class () throws throwable;return
end subroutine

public subroutine after_class () throws throwable;return
end subroutine

public subroutine init () throws throwable;return
end subroutine

public function string get_library_name ();return is_library_name
end function

public function string get_object_name ();return is_object_name
end function

public function n_test set_library_name (readonly string as_library_name);is_library_name = as_library_name

return this
end function

public function n_test set_object_name (readonly string as_object_name);is_object_name = as_object_name

return this
end function

public function n_test get_suite ();return in_suite
end function

public function n_test set_suite (readonly n_test an_suite);in_suite = an_suite

return this
end function

public subroutine after () throws throwable;return
end subroutine

public subroutine before () throws throwable;return
end subroutine

public function uint get_test_count ();return 1
end function

on n_test.create
call super::create
end on

on n_test.destroy
call super::destroy
end on

event constructor;call super::constructor;is_object_name = classname(this)

classdefinition lcdef
lcdef = this.classdefinition
is_library_name = lcdef.libraryname

return
end event

