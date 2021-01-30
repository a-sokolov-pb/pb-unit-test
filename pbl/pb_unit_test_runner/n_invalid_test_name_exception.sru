$PBExportHeader$n_invalid_test_name_exception.sru
forward
global type n_invalid_test_name_exception from exception
end type
end forward

global type n_invalid_test_name_exception from exception
end type
global n_invalid_test_name_exception n_invalid_test_name_exception

on n_invalid_test_name_exception.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_invalid_test_name_exception.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

