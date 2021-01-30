$PBExportHeader$n_pb_unit_test_manager.sru
forward
global type n_pb_unit_test_manager from nonvisualobject
end type
type n_pb_ut_manager_result_output_callback from n_result_output_callback within n_pb_unit_test_manager
end type
end forward

global type n_pb_unit_test_manager from nonvisualobject
n_pb_ut_manager_result_output_callback n_pb_ut_manager_result_output_callback
end type
global n_pb_unit_test_manager n_pb_unit_test_manager

type variables
protected:

constant string IS_ERROR_FILE = "pb_unit_test.error.log"
constant string IS_OUTPUT_FILE = "pb_unit_test.output.log"

string is_error_file_path
string is_current_folder

int ii_log_file_handle

n_output_callback in_output
end variables

forward prototypes
public function long start ()
public function long start (string as_command_line)
protected subroutine output (readonly string as_text)
public function n_pb_unit_test_manager set_output (readonly n_output_callback an_output)
protected subroutine get_default_params (ref n_pb_unit_test_params an_params) throws exception
protected subroutine set_params_from_commandline (ref n_pb_unit_test_params an_params, readonly n_command_line_parser an_parser) throws exception
protected subroutine log_error (readonly string as_text)
protected subroutine log_error (readonly exception err)
protected function long run_tests (readonly n_pb_unit_test_params an_ut_params) throws exception
protected subroutine free_resources ()
end prototypes

public function long start ();return this.start("")
end function

public function long start (string as_command_line);long ll_result_code = c_result_code.IL_NO_DATA

try
	if len(as_command_line) > 0 then
		open(w_listbox_container)
		w_listbox_container.hide()
		this.output(getapplication().displayname)
		
		is_current_folder = getcurrentdirectory()
		if not right(is_current_folder, 1) = "\" then
			is_current_folder += "\"
		end if
		
		is_error_file_path = is_current_folder + IS_ERROR_FILE
		this.output("Current folder is '" + is_current_folder + "'")
		
		try
			if left(as_command_line, 4) = "test" then
				/*
					Run tests from command line
					
					Params:
						test
							/test.all
							/test.library=libraryname,libraryname,...
							/target=path
							/log.file=path
				*/
				n_pb_unit_test_params ln_ut_params
				ln_ut_params = create n_pb_unit_test_params
				ln_ut_params.set_output(in_output)
				
				n_command_line_parser ln_parser
				ln_parser = create n_command_line_parser
				this.get_default_params(ref ln_ut_params)
				if ln_parser.parse(as_command_line) > 0 then
					this.set_params_from_commandline(ref ln_ut_params, ln_parser)
				end if
				
				ll_result_code = this.run_tests(ln_ut_params)
			else
				throw f_exception().exception("Can't parsing '" + as_command_line + "' value")
			end if
		catch (exception err)
			ll_result_code = c_result_code.IL_ERRORS
			this.log_error(err)
			this.output(err.getmessage())
		end try
	else
		open(w_pb_unit_test)
	end if
finally
	this.free_resources()
end try

if not ll_result_code = c_result_code.IL_SUCCESS then
	this.log_error("Return code " + string(ll_result_code))
end if

return ll_result_code
end function

protected subroutine output (readonly string as_text);if isvalid(in_output) then
	in_output.log_without_time(as_text)
end if

return
end subroutine

public function n_pb_unit_test_manager set_output (readonly n_output_callback an_output);in_output = an_output

return this
end function

protected subroutine get_default_params (ref n_pb_unit_test_params an_params) throws exception;string ls_log_file
ls_log_file = is_current_folder + IS_OUTPUT_FILE
		
an_params.set_test_scope(c_test_scope.IS_ALL) &
			.set_test_expression("") &
			.set_target_file("") &
		   .set_log_file(ls_log_file)
		
return
end subroutine

protected subroutine set_params_from_commandline (ref n_pb_unit_test_params an_params, readonly n_command_line_parser an_parser) throws exception;n_command_param ln_target
if an_parser.get_param("target", ref ln_target) then
	an_params.set_target_file(ln_target.get_value())
else
	listbox lsb_dir
	lsb_dir = w_listbox_container.box
	lsb_dir.dirlist(is_current_folder + "*.pbt", 0)
	
	string ls_target_file
	choose case lsb_dir.totalitems()
		case 1
			an_params.set_target_file(is_current_folder + lsb_dir.text(1))
		case is > 1
			throw f_exception().exception("Found more than one PB target file")
		case else
			throw f_exception().exception("Can't find current PB target file")
	end choose
end if

string ls_test_scope
string ls_test_expression

n_command_param ln_test
if an_parser.get_param_starts_with("test.", ref ln_test) then
	ls_test_scope = ln_test.get_name()
	ls_test_expression = ln_test.get_value()
end if

an_params.set_test_scope(ls_test_scope) &
			.set_test_expression(ls_test_expression)

return
end subroutine

protected subroutine log_error (readonly string as_text);try
	datetime ldt_now
	ldt_now = datetime(today(), now())
	
	n_file_writer ln_writer
	ln_writer = create n_file_writer
	ln_writer.ci(f_file_factory().get_for_write(is_error_file_path, linemode!, append!))
	ln_writer.write_in(string(ldt_now, "dd.mm.yyyy hh:mm:ss") + " " + as_text)
catch (exception err_log)
	// silent mode
end try

return
end subroutine

protected subroutine log_error (readonly exception err);this.log_error(err.getmessage())

return
end subroutine

protected function long run_tests (readonly n_pb_unit_test_params an_ut_params) throws exception;string ls_log_file
ls_log_file = an_ut_params.get_log_file()
ii_log_file_handle = fileopen(ls_log_file, linemode!, write!, lockwrite!, append!)
if not ii_log_file_handle > 0 then
	throw f_exception().exception("Can't create log file '" + ls_log_file + "'")
end if

n_unit_test_reflection ln_ut_reflection
if f_pb_addon().is_pb_mode() then
	ln_ut_reflection = create n_unit_test_reflection_in_pb_mode
else
	ln_ut_reflection = create n_unit_test_reflection
end if

ln_ut_reflection.set_target(an_ut_params.get_target_file())

n_test ln_tests[]

string ls_test_scope
ls_test_scope = an_ut_params.get_test_scope()
choose case ls_test_scope
	case c_test_scope.IS_ALL
		ln_ut_reflection.get_all_tests(ref ln_tests)
	case else
		choose case ls_test_scope
			case c_test_scope.IS_OBJECT_LIST
				throw f_exception().exception("The test scope '" + ls_test_scope + "' not implemented yet")
			case c_test_scope.IS_LIBRARY_LIST
				string ls_library_list[]
				f_string().split(an_ut_params.get_test_expression(), ",", ref ls_library_list)
				
				ln_ut_reflection.get_tests_by_library_list(ls_library_list, ref ln_tests)
			case else
				throw f_exception().exception("Unsupported test scope '" + ls_test_scope + "'")
		end choose
end choose

n_pb_ut_manager_result_output_callback.log_line()
n_pb_ut_manager_result_output_callback.log("AppName: " + ln_ut_reflection.get_application_name())
n_pb_ut_manager_result_output_callback.log("Target: " + an_ut_params.get_target_file())

n_test_runner ln_test_runner
ln_test_runner = create n_test_runner
ln_test_runner.set_output({in_output, n_pb_ut_manager_result_output_callback})
				  
n_test_result ln_result 
ln_result = ln_test_runner.run(ln_tests)

long ll_return_code
choose case ln_result.get_status()
	case n_test_result.IS_SKIPPED
		ll_return_code = c_result_code.IL_SUCCESS
	case n_test_result.IS_ERRORS
		ll_return_code = c_result_code.IL_ERRORS
	case n_test_result.IS_FAILURE
		ll_return_code = c_result_code.IL_FAILURE
	case n_test_result.IS_ABORTED
		ll_return_code = c_result_code.IL_FAILURE
	case n_test_result.IS_IGNORED
		ll_return_code = c_result_code.IL_NO_DATA
end choose

return ll_return_code
end function

protected subroutine free_resources ();if ii_log_file_handle > 0 then
	fileclose(ii_log_file_handle)
	ii_log_file_handle = 0
end if

if isvalid(w_listbox_container) then
	close(w_listbox_container)
end if

return
end subroutine

on n_pb_unit_test_manager.create
call super::create
this.n_pb_ut_manager_result_output_callback=create n_pb_ut_manager_result_output_callback
TriggerEvent( this, "constructor" )
end on

on n_pb_unit_test_manager.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.n_pb_ut_manager_result_output_callback)
end on

event destructor;this.free_resources()

return
end event

type n_pb_ut_manager_result_output_callback from n_result_output_callback within n_pb_unit_test_manager descriptor "pb_nvo" = "true" 
end type

on n_pb_ut_manager_result_output_callback.create
call super::create
end on

on n_pb_ut_manager_result_output_callback.destroy
call super::destroy
end on

event log;call super::log;if ii_log_file_handle > 0 then
	filewrite(ii_log_file_handle, as_text)
end if

return
end event

