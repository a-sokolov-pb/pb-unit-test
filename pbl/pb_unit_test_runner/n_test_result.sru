$PBExportHeader$n_test_result.sru
forward
global type n_test_result from n_time_elapsed_intf
end type
end forward

global type n_test_result from n_time_elapsed_intf
end type
global n_test_result n_test_result

type variables
public:

constant string IS_SKIPPED = "success"
constant string IS_FAILURE = "failure"
constant string IS_ERRORS = "errors"
constant string IS_IGNORED = "ignored"
constant string IS_ABORTED = "aborted"

string is_status = IS_SKIPPED
n_test_result_info in_infos[]
end variables

forward prototypes
public function string get_status ()
public function n_test_result add_info (readonly n_test_result_info an_info)
public function long get_infos (ref n_test_result_info an_infos[])
public function n_test_result set_status (readonly string as_status)
public subroutine abort ()
end prototypes

public function string get_status ();return is_status
end function

public function n_test_result add_info (readonly n_test_result_info an_info);long ll_index
ll_index = upperbound(in_infos) + 1
in_infos[ll_index] = an_info

choose case this.get_status()
	case n_test_result.IS_ERRORS
	case n_test_result.IS_FAILURE
	case else
		if not an_info.get_status() = n_test_result.IS_IGNORED then
			is_status = an_info.get_status()
		end if
end choose

this.append(an_info)

return this
end function

public function long get_infos (ref n_test_result_info an_infos[]);an_infos = in_infos

return upperbound(an_infos)
end function

public function n_test_result set_status (readonly string as_status);is_status = as_status

return this
end function

public subroutine abort ();is_status = IS_ABORTED

return
end subroutine

on n_test_result.create
call super::create
end on

on n_test_result.destroy
call super::destroy
end on

