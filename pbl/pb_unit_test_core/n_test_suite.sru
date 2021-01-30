$PBExportHeader$n_test_suite.sru
forward
global type n_test_suite from n_test
end type
end forward

global type n_test_suite from n_test
end type
global n_test_suite n_test_suite

type variables
protected:

n_test_case in_tests[]
end variables

forward prototypes
public function integer get_tests (ref n_test_case an_tests[])
protected function n_test_case add_test (readonly string as_event_name, readonly string as_description) throws throwable
protected function n_test_case add_test (readonly string as_event_name) throws throwable
public function unsignedinteger get_test_count ()
end prototypes

public function integer get_tests (ref n_test_case an_tests[]);an_tests = in_tests

return upperbound(an_tests)
end function

protected function n_test_case add_test (readonly string as_event_name, readonly string as_description) throws throwable;if isnull(as_event_name) or len(trim(as_event_name)) = 0 then
	exception err
	err = create exception
	err.setmessage("Must specified event name")
	throw err
end if

n_test_case ln_test
ln_test = create n_test_case
ln_test.set_suite(this)
ln_test.init()

ln_test.set_event_name(as_event_name) &
       .set_description(as_description)

int li_index
li_index = upperbound(in_tests) + 1
in_tests[li_index] = ln_test

return ln_test
end function

protected function n_test_case add_test (readonly string as_event_name) throws throwable;return this.add_test(as_event_name, "")
end function

public function unsignedinteger get_test_count ();return upperbound(in_tests)
end function

on n_test_suite.create
call super::create
end on

on n_test_suite.destroy
call super::destroy
end on

