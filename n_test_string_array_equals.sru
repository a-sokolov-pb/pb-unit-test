$PBExportHeader$n_test_string_array_equals.sru
forward
global type n_test_string_array_equals from n_test_case
end type
end forward

global type n_test_string_array_equals from n_test_case
string is_description = "Testing TWO string array"
end type
global n_test_string_array_equals n_test_string_array_equals

event run;call super::run;string ls_expected[] = {"one", "two", "three"}
string ls_actual[] = {"one", "two", "three"}

sleep(1)

f_assert().assert_equals(ls_expected, ls_actual)

return
end event

on n_test_string_array_equals.create
call super::create
end on

on n_test_string_array_equals.destroy
call super::destroy
end on

