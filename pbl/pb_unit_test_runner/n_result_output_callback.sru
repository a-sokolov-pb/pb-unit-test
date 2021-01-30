$PBExportHeader$n_result_output_callback.sru
forward
global type n_result_output_callback from n_output_callback
end type
end forward

global type n_result_output_callback from n_output_callback
event process ( readonly n_test_result_process an_process )
event running ( readonly n_test an_test )
event finished ( readonly n_test_result_intf an_result )
event total_process ( readonly n_test_result_process an_process )
end type
global n_result_output_callback n_result_output_callback

forward prototypes
public subroutine process (readonly n_test_result_process an_process)
public subroutine running (readonly n_test an_test)
public subroutine finished (readonly n_test_result_intf an_result)
public subroutine total_process (readonly n_test_result_process an_process)
end prototypes

event process(readonly n_test_result_process an_process);return
end event

event running(readonly n_test an_test);return
end event

event finished(readonly n_test_result_intf an_result);return
end event

event total_process(readonly n_test_result_process an_process);return
end event

public subroutine process (readonly n_test_result_process an_process);this.event process(an_process)

return
end subroutine

public subroutine running (readonly n_test an_test);this.event running(an_test)

return
end subroutine

public subroutine finished (readonly n_test_result_intf an_result);this.event finished(an_result)

return
end subroutine

public subroutine total_process (readonly n_test_result_process an_process);this.event total_process(an_process)

return
end subroutine

on n_result_output_callback.create
call super::create
end on

on n_result_output_callback.destroy
call super::destroy
end on

