$PBExportHeader$n_test_result_process.sru
forward
global type n_test_result_process from nonvisualobject
end type
end forward

global type n_test_result_process from nonvisualobject
end type
global n_test_result_process n_test_result_process

type variables
protected:

long il_run_count
long il_failure_count
long il_errors_count
long il_skipped_count
long il_ignored_count
long il_total_count

n_test_result_process in_appender
end variables

forward prototypes
public function n_test_result_process run ()
public function n_test_result_process fail ()
public function n_test_result_process error ()
public function n_test_result_process skip ()
public function n_test_result_process append (readonly n_test_result_process an_process)
public function long get_errors_count ()
public function long get_failure_count ()
public function long get_ignored_count ()
public function long get_run_count ()
public function long get_skipped_count ()
public function long get_total_count ()
public function n_test_result_process set_total_count (readonly long al_total_count)
public function n_test_result_process ignored ()
public subroutine reset ()
end prototypes

public function n_test_result_process run ();il_run_count ++

return this
end function

public function n_test_result_process fail ();il_failure_count ++

return this
end function

public function n_test_result_process error ();il_errors_count ++

return this
end function

public function n_test_result_process skip ();il_skipped_count ++

return this
end function

public function n_test_result_process append (readonly n_test_result_process an_process);il_run_count += an_process.get_run_count()
il_failure_count += an_process.get_failure_count()
il_errors_count += an_process.get_errors_count()
il_skipped_count += an_process.get_skipped_count()
il_ignored_count += an_process.get_ignored_count()

return this
end function

public function long get_errors_count ();return il_errors_count
end function

public function long get_failure_count ();return il_failure_count
end function

public function long get_ignored_count ();return il_ignored_count
end function

public function long get_run_count ();return il_run_count
end function

public function long get_skipped_count ();return il_skipped_count
end function

public function long get_total_count ();return il_total_count
end function

public function n_test_result_process set_total_count (readonly long al_total_count);il_total_count = al_total_count

return this
end function

public function n_test_result_process ignored ();il_ignored_count ++

return this
end function

public subroutine reset ();il_run_count = 0
il_failure_count = 0
il_errors_count = 0
il_skipped_count = 0
il_ignored_count = 0
il_total_count = 0

return
end subroutine

on n_test_result_process.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_test_result_process.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

