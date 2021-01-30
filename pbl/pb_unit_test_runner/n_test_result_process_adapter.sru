$PBExportHeader$n_test_result_process_adapter.sru
forward
global type n_test_result_process_adapter from n_test_result_process
end type
end forward

global type n_test_result_process_adapter from n_test_result_process
end type
global n_test_result_process_adapter n_test_result_process_adapter

type variables
private:

n_test_result_process in_total_process
end variables

forward prototypes
public function n_test_result_process_adapter set_total_process (readonly n_test_result_process an_total_process)
public function n_test_result_process error ()
public function n_test_result_process fail ()
public function n_test_result_process run ()
public function n_test_result_process skip ()
public function n_test_result_process ignored ()
end prototypes

public function n_test_result_process_adapter set_total_process (readonly n_test_result_process an_total_process);in_total_process = an_total_process

return this
end function

public function n_test_result_process error ();in_total_process.error()

return super :: error()
end function

public function n_test_result_process fail ();in_total_process.fail()

return super :: fail()
end function

public function n_test_result_process run ();in_total_process.run()

return super :: run()
end function

public function n_test_result_process skip ();in_total_process.skip()

return super :: skip()
end function

public function n_test_result_process ignored ();in_total_process.ignored()

return super :: ignored()
end function

on n_test_result_process_adapter.create
call super::create
end on

on n_test_result_process_adapter.destroy
call super::destroy
end on

