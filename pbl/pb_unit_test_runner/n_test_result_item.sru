$PBExportHeader$n_test_result_item.sru
forward
global type n_test_result_item from n_test_result_intf
end type
end forward

global type n_test_result_item from n_test_result_intf
end type
global n_test_result_item n_test_result_item

type variables
protected:

string is_test_name
end variables

forward prototypes
public function string get_test_name ()
public function n_test_result_item set_test_name (readonly string as_test_name)
end prototypes

public function string get_test_name ();return is_test_name
end function

public function n_test_result_item set_test_name (readonly string as_test_name);is_test_name = as_test_name

return this
end function

on n_test_result_item.create
call super::create
end on

on n_test_result_item.destroy
call super::destroy
end on

