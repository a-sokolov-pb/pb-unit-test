$PBExportHeader$n_cancel_testing_exception.sru
forward
global type n_cancel_testing_exception from exception
end type
end forward

global type n_cancel_testing_exception from exception
end type
global n_cancel_testing_exception n_cancel_testing_exception

on n_cancel_testing_exception.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cancel_testing_exception.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

