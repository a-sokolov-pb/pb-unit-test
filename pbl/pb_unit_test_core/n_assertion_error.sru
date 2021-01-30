$PBExportHeader$n_assertion_error.sru
forward
global type n_assertion_error from runtimeerror
end type
end forward

global type n_assertion_error from runtimeerror
end type
global n_assertion_error n_assertion_error

type variables

end variables

on n_assertion_error.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_assertion_error.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

