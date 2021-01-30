$PBExportHeader$n_test_suite_example.sru
forward
global type n_test_suite_example from n_test_suite
end type
end forward

global type n_test_suite_example from n_test_suite
event test_one ( )
event test_two ( )
event test_three ( )
event test_five ( )
end type
global n_test_suite_example n_test_suite_example

forward prototypes
public subroutine init () throws throwable
end prototypes

event test_one();f_assert().assert_equals("one", "one")

sleep(0.5)

return
end event

event test_two();f_assert().assert_equals("two", "two")

return
end event

event test_three();f_assert().assert_not_equals("three", "three")

return
end event

event test_five();runtimeerror err
err = create runtimeerror
err.setmessage("Can't find some object...")
throw err

return
end event

public subroutine init () throws throwable;this.add_test("test_one", "Testing #1")
this.add_test("test_two", "Testing #2")
this.add_test("test_three", "Testing #3").ignore()
//this.add_test("unknown_test")
this.add_test("test_five", "Throws RuntimeError").expected("runtimeerror")

return
end subroutine

on n_test_suite_example.create
call super::create
end on

on n_test_suite_example.destroy
call super::destroy
end on

