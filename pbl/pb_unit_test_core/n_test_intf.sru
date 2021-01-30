$PBExportHeader$n_test_intf.sru
forward
global type n_test_intf from nonvisualobject
end type
end forward

global type n_test_intf from nonvisualobject
end type
global n_test_intf n_test_intf

type variables
protected:

string is_description
boolean ib_ignore
end variables

forward prototypes
public function boolean is_ignore ()
public subroutine ignore ()
public function n_test_intf set_description (readonly string as_description)
public function string get_description ()
end prototypes

public function boolean is_ignore ();return ib_ignore
end function

public subroutine ignore ();ib_ignore = true

return
end subroutine

public function n_test_intf set_description (readonly string as_description);is_description = as_description

return this
end function

public function string get_description ();return is_description
end function

on n_test_intf.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_test_intf.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

