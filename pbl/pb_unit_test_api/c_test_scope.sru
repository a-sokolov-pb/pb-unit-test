$PBExportHeader$c_test_scope.sru
forward
global type c_test_scope from nonvisualobject
end type
end forward

global type c_test_scope from nonvisualobject
end type
global c_test_scope c_test_scope

type variables
public:

constant string IS_ALL = "test.all"
constant string IS_OBJECT_LIST = "test.object"
constant string IS_LIBRARY_LIST = "test.library"
end variables

on c_test_scope.create
call super::create
TriggerEvent( this, "constructor" )
end on

on c_test_scope.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

