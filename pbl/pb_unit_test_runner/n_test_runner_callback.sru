$PBExportHeader$n_test_runner_callback.sru
forward
global type n_test_runner_callback from nonvisualobject
end type
end forward

global type n_test_runner_callback from nonvisualobject
event started ( )
event stopped ( readonly n_test_result an_result )
end type
global n_test_runner_callback n_test_runner_callback

forward prototypes
public subroutine started ()
public subroutine stopped (readonly n_test_result an_result)
end prototypes

event started();return
end event

event stopped(readonly n_test_result an_result);return
end event

public subroutine started ();this.event started()

return
end subroutine

public subroutine stopped (readonly n_test_result an_result);this.event stopped(an_result)

return
end subroutine

on n_test_runner_callback.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_test_runner_callback.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

