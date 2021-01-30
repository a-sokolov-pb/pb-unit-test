$PBExportHeader$n_test_result_intf.sru
forward
global type n_test_result_intf from n_time_elapsed_intf
end type
end forward

global type n_test_result_intf from n_time_elapsed_intf
end type
global n_test_result_intf n_test_result_intf

type variables
protected:

string is_status = n_test_result.IS_SKIPPED
string is_description
string is_error

n_test in_test
end variables

forward prototypes
public function string get_status ()
public function n_test_result_intf set_status (readonly string as_status)
public function string get_error ()
public function n_test_result_intf error (readonly string as_error)
public function n_test_result_intf error (readonly throwable ath)
public function n_test_result_intf fail (readonly string as_error)
public function n_test_result_intf fail (readonly throwable ath)
public function string get_description ()
public function n_test_result_intf set_description (readonly string as_description)
public subroutine ignored ()
public function n_test_result_intf set_test (readonly n_test an_test)
public function n_test get_test ()
end prototypes

public function string get_status ();return is_status
end function

public function n_test_result_intf set_status (readonly string as_status);is_status = as_status

return this
end function

public function string get_error ();return is_error
end function

public function n_test_result_intf error (readonly string as_error);is_status = n_test_result.IS_ERRORS
is_error = as_error

return this
end function

public function n_test_result_intf error (readonly throwable ath);return this.error(ath.getmessage())
end function

public function n_test_result_intf fail (readonly string as_error);is_status = n_test_result.IS_FAILURE
is_error = as_error

return this
end function

public function n_test_result_intf fail (readonly throwable ath);return this.fail(ath.getmessage())
end function

public function string get_description ();return is_description
end function

public function n_test_result_intf set_description (readonly string as_description);is_description = as_description

return this
end function

public subroutine ignored ();is_status = n_test_result.IS_IGNORED

return
end subroutine

public function n_test_result_intf set_test (readonly n_test an_test);in_test = an_test

return this.set_description(an_test.get_description())
end function

public function n_test get_test ();return in_test
end function

on n_test_result_intf.create
call super::create
end on

on n_test_result_intf.destroy
call super::destroy
end on

