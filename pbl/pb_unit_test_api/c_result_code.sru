$PBExportHeader$c_result_code.sru
forward
global type c_result_code from nonvisualobject
end type
end forward

global type c_result_code from nonvisualobject
end type
global c_result_code c_result_code

type variables
public:

constant long IL_SUCCESS = 1
constant long IL_FAILURE = -1
constant long IL_ERRORS = -2
constant long IL_NO_DATA = 0
end variables

on c_result_code.create
call super::create
TriggerEvent( this, "constructor" )
end on

on c_result_code.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

