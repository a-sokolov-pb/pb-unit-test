$PBExportHeader$pb_unit_test.sra
$PBExportComments$Generated Application Object
forward
global type pb_unit_test from application
end type
type n_pb_unit_app_output_callback from n_output_callback within pb_unit_test
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables

end variables

global type pb_unit_test from application
string appname = "pb_unit_test"
string displayname = "PB Unit Test (beta 2.0)"
n_pb_unit_app_output_callback n_pb_unit_app_output_callback
end type
global pb_unit_test pb_unit_test

type variables
private:

long il_error_level
end variables

on pb_unit_test.create
appname="pb_unit_test"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
this.n_pb_unit_app_output_callback=create n_pb_unit_app_output_callback
end on

on pb_unit_test.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
destroy(this.n_pb_unit_app_output_callback)
end on

event open;// DEBUG
//commandline = "test /test.library=ascc_unit_tests /target=D:\work\dev\pb\storage-pb-client-8.0.merge\cash.pbt"

n_pb_unit_test_manager ln_ut_manager
ln_ut_manager = create n_pb_unit_test_manager
ln_ut_manager.set_output(n_pb_unit_app_output_callback)

choose case ln_ut_manager.start(trim(commandline))
	case c_result_code.IL_ERRORS
		il_error_level = 2
	case c_result_code.IL_FAILURE
		il_error_level = 1
	case else
		il_error_level = 0
end choose

return
end event

event close;message.longparm = il_error_level

return
end event

type n_pb_unit_app_output_callback from n_output_callback within pb_unit_test descriptor "pb_nvo" = "true" 
end type

on n_pb_unit_app_output_callback.create
call super::create
end on

on n_pb_unit_app_output_callback.destroy
call super::destroy
end on

event log;call super::log;if not f_pb_addon().is_pb_mode() then
	f_console().println(as_text)
end if

return
end event

