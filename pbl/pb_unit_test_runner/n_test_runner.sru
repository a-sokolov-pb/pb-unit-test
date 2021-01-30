$PBExportHeader$n_test_runner.sru
forward
global type n_test_runner from n_result_output_callback
end type
end forward

global type n_test_runner from n_result_output_callback
end type
global n_test_runner n_test_runner

type variables
protected:

constant string IS_TAB = "    "
constant string IS_RESULT_TEMPLATE = "Tests run: %, Failures: %, Errors: %, Skipped: %, Ignored: %, Time elapsed: % sec"
constant string IS_CASE_TEMPLATE = "% - %, Time elapsed: %"

n_test_runner_callback in_callback
n_output_callback in_outputs[]

boolean ib_running
boolean ib_stop_process

n_test_result in_result
n_test_result_process in_total_process
end variables

forward prototypes
protected function string get_total (readonly n_test_result_info an_info)
protected function string get_total (readonly n_test_result_item an_item)
protected subroutine output (readonly n_test_result_info an_info)
protected subroutine set_place_holder (ref string as_template, readonly any aa_value)
protected function n_test_result_item create_result_item (readonly n_test_case an_test_case)
protected function n_test_result_info create_result_info (readonly n_test an_test)
protected function string get_total (readonly n_test_result_process an_process, readonly n_time_elapsed_intf an_time_elapsed)
public function n_test_runner set_output (readonly n_result_output_callback an_outputs[])
public function n_test_runner set_output (readonly n_result_output_callback an_output)
public function n_test_runner add_output (readonly n_result_output_callback an_output)
public subroutine log (readonly datetime adt_time, readonly string as_text)
public subroutine process (readonly n_test_result_process an_process)
protected subroutine output (readonly n_test_result an_result, readonly n_test_result_process an_total_process)
public subroutine running (readonly n_test an_test)
public subroutine finished (readonly n_test_result_intf an_result)
public subroutine total_process (readonly n_test_result_process an_process)
protected function n_result_composite_output create_composite (readonly n_test_result_intf an_result, readonly n_test_result_process an_process)
protected function n_result_composite_output create_composite (readonly n_test_result_intf an_result)
protected subroutine call_event (readonly n_test_case an_case, readonly n_test_result_intf an_result) throws throwable
protected subroutine run_case (ref n_test_result_info an_info, readonly n_test_case an_case) throws n_cancel_testing_exception
public subroutine stop ()
public function n_test_runner set_callback (readonly n_test_runner_callback an_callback)
protected function long count_tests (readonly n_test an_tests[])
protected subroutine run_test (ref n_test_result_info an_info, readonly n_test an_test) throws n_cancel_testing_exception
public function n_test_result run (readonly n_test an_tests[])
end prototypes

protected function string get_total (readonly n_test_result_info an_info);return this.get_total(an_info.get_process(), an_info)
end function

protected function string get_total (readonly n_test_result_item an_item);string ls_total
ls_total = IS_CASE_TEMPLATE

this.set_place_holder(ref ls_total, an_item.get_test_name())
this.set_place_holder(ref ls_total, an_item.get_status())
this.set_place_holder(ref ls_total, an_item.get_time_elapsed_in_string())

if len(an_item.get_description()) > 0 then
	ls_total = "[" + an_item.get_description() + "] " + ls_total
end if

return ls_total
end function

protected subroutine output (readonly n_test_result_info an_info);string ls_test_definition
ls_test_definition = an_info.get_library_name() + "\" + an_info.get_object_name()
if len(an_info.get_description()) > 0 then
	ls_test_definition += " [" + an_info.get_description() + "]"
end if

this.log_line()
this.log(ls_test_definition)

n_test_result_item ln_items[]
if an_info.get_items(ref ln_items) > 0 then
	string ls_suite_total
	ls_suite_total = this.get_total(an_info)
	this.log(fill(IS_TAB, len(IS_TAB)) + ls_suite_total)
	
	long ll_item
	for ll_item = 1 to upperbound(ln_items)
		string ls_case_total
		ls_case_total = this.get_total(ln_items[ll_item])
		this.log(fill(IS_TAB, len(IS_TAB) * 2) + ls_case_total)
	next
else
	this.log(fill(IS_TAB, len(IS_TAB)) + "No tests found")
end if

return
end subroutine

protected subroutine set_place_holder (ref string as_template, readonly any aa_value);long ll_pos
ll_pos = pos(as_template, "%")
if ll_pos > 0 then
	as_template = replace(as_template, ll_pos, 1, string(aa_value)) 
end if

return
end subroutine

protected function n_test_result_item create_result_item (readonly n_test_case an_test_case);n_test_result_item ln_item
ln_item = create n_test_result_item
return ln_item.set_test_name(an_test_case.get_event_name()) &
				  .set_test(an_test_case)
end function

protected function n_test_result_info create_result_info (readonly n_test an_test);n_test_result_info ln_result_info
ln_result_info = create n_test_result_info
return ln_result_info.set_test(an_test)
end function

protected function string get_total (readonly n_test_result_process an_process, readonly n_time_elapsed_intf an_time_elapsed);string ls_total
ls_total = IS_RESULT_TEMPLATE

this.set_place_holder(ref ls_total, an_process.get_run_count())
this.set_place_holder(ref ls_total, an_process.get_failure_count())
this.set_place_holder(ref ls_total, an_process.get_errors_count())
this.set_place_holder(ref ls_total, an_process.get_skipped_count())
this.set_place_holder(ref ls_total, an_process.get_ignored_count())
this.set_place_holder(ref ls_total, an_time_elapsed.get_time_elapsed_in_string())

return ls_total
end function

public function n_test_runner set_output (readonly n_result_output_callback an_outputs[]);in_outputs = an_outputs

return this
end function

public function n_test_runner set_output (readonly n_result_output_callback an_output);return this.set_output({an_output})
end function

public function n_test_runner add_output (readonly n_result_output_callback an_output);int i
for i = 1 to upperbound(in_outputs)
	if in_outputs[i] = an_output then
		return this
	end if
next

int li_index
li_index = upperbound(in_outputs) + 1
in_outputs[li_index] = an_output

return this
end function

public subroutine log (readonly datetime adt_time, readonly string as_text);int i
for i = 1 to upperbound(in_outputs)
	in_outputs[i].log(adt_time, as_text)
next

return
end subroutine

public subroutine process (readonly n_test_result_process an_process);int i
for i = 1 to upperbound(in_outputs)
	if f_pb_addon().instance_of(in_outputs[i].classdefinition, "n_result_output_callback") then
		n_result_output_callback ln_result_output
		ln_result_output = in_outputs[i]
		ln_result_output.process(an_process)
	end if
next

return
end subroutine

protected subroutine output (readonly n_test_result an_result, readonly n_test_result_process an_total_process);this.log_line()

string ls_output
ls_output = this.get_total(an_total_process, an_result)

this.log(ls_output)
this.log_line()
this.log(upper(an_result.get_status()))

return
end subroutine

public subroutine running (readonly n_test an_test);int i
for i = 1 to upperbound(in_outputs)
	if f_pb_addon().instance_of(in_outputs[i].classdefinition, "n_result_output_callback") then
		n_result_output_callback ln_result_output
		ln_result_output = in_outputs[i]
		ln_result_output.running(an_test)
	end if
next

return
end subroutine

public subroutine finished (readonly n_test_result_intf an_result);int i
for i = 1 to upperbound(in_outputs)
	if f_pb_addon().instance_of(in_outputs[i].classdefinition, "n_result_output_callback") then
		n_result_output_callback ln_result_output
		ln_result_output = in_outputs[i]
		ln_result_output.finished(an_result)
	end if
next

return
end subroutine

public subroutine total_process (readonly n_test_result_process an_process);int i
for i = 1 to upperbound(in_outputs)
	if f_pb_addon().instance_of(in_outputs[i].classdefinition, "n_result_output_callback") then
		n_result_output_callback ln_result_output
		ln_result_output = in_outputs[i]
		ln_result_output.total_process(an_process)
	end if
next

return
end subroutine

protected function n_result_composite_output create_composite (readonly n_test_result_intf an_result, readonly n_test_result_process an_process);n_result_composite_output ln_composite
ln_composite = create n_result_composite_output
return ln_composite.set_output(this) &
	                .set_result(an_result) &
						 .set_process(an_process)
end function

protected function n_result_composite_output create_composite (readonly n_test_result_intf an_result);n_test_result_process ln_empty
return this.create_composite(an_result, ln_empty)
end function

protected subroutine call_event (readonly n_test_case an_case, readonly n_test_result_intf an_result) throws throwable;string ls_event_name
ls_event_name = an_case.get_event_name()

boolean lb_catch_expected
classdefinition lcdef_expected
lcdef_expected = an_case.get_expected()

int li_trigger_event_result

try
	long ll_cpu
	ll_cpu = cpu()
	
	try
		if not an_case.get_suite().triggerevent(ls_event_name) = 1 then
			n_invalid_test_name_exception ln_invalid_test_name
			ln_invalid_test_name = create n_invalid_test_name_exception
			ln_invalid_test_name.setmessage("Can't find test '" + ls_event_name + "'")
			throw ln_invalid_test_name
		end if
	finally
		an_result.set_time_elapsed(cpu() - ll_cpu)
	end try
catch (throwable case_err)
	if isvalid(lcdef_expected) then
		classdefinition lcdef_err
		lcdef_err = case_err.classdefinition
		lb_catch_expected = (lcdef_err.name = lcdef_expected.name)
	end if
	
	if not isvalid(lcdef_expected) or not lb_catch_expected then
		throw case_err
	end if
end try

if isvalid(lcdef_expected) and not lb_catch_expected then
	f_assert().fail("Test expected '" + lcdef_expected.name + "' error")
end if

return
end subroutine

protected subroutine run_case (ref n_test_result_info an_info, readonly n_test_case an_case) throws n_cancel_testing_exception;n_test_result_process ln_process
ln_process = an_info.get_process()

n_test_result_item ln_item
ln_item = this.create_result_item(an_case)

n_result_composite_output ln_composite_output
ln_composite_output = this.create_composite(ln_item, ln_process)

try
	this.running(an_case)
	
	if an_case.is_ignore() or an_case.get_suite().is_ignore() then
		ln_composite_output.ignored()
	else
		ln_process.run()
		an_case.get_suite().before()
		
		try
			this.call_event(an_case, ln_item)
			ln_process.skip()
		catch (n_assertion_error assertion_err)
			ln_composite_output.fail(assertion_err & 
							 , an_case.get_suite().get_object_name() &
							 + "#" + an_case.get_event_name() &
							 + " {~r~n" + fill(IS_TAB, len(IS_TAB) * 1) + assertion_err.getmessage() + "~r~n}")
		finally
			an_case.get_suite().after()
		end try
	end if
catch (throwable err)
	ln_composite_output.error(err)
finally
	this.finished(ln_item)
end try

an_info.add_item(ln_item)
this.process(ln_process)
this.total_process(in_total_process)

do while yield(); loop;
if ib_stop_process then
	ib_stop_process = false
	
	n_cancel_testing_exception ln_cancel_testing
	ln_cancel_testing = create n_cancel_testing_exception
	throw ln_cancel_testing
end if

return
end subroutine

public subroutine stop ();ib_stop_process = true

return
end subroutine

public function n_test_runner set_callback (readonly n_test_runner_callback an_callback);in_callback = an_callback

return this
end function

protected function long count_tests (readonly n_test an_tests[]);long ll_counter

long ll_test
for ll_test = 1 to upperbound(an_tests)
	ll_counter += an_tests[ll_test].get_test_count()
next

return ll_counter
end function

protected subroutine run_test (ref n_test_result_info an_info, readonly n_test an_test) throws n_cancel_testing_exception;n_test_result_process_adapter ln_process_adapter
ln_process_adapter = create n_test_result_process_adapter
ln_process_adapter.set_total_process(in_total_process)
an_info.set_process(ln_process_adapter)

this.running(an_test)

try
	if not an_test.is_ignore() then
		an_test.before_class()
	end if
	
	if f_pb_addon().instance_of(an_test.classdefinition, "n_test_case") then
		n_test_case ln_case
		ln_case = an_test
		
		this.run_case(ref an_info, ln_case)
	elseif f_pb_addon().instance_of(an_test.classdefinition, "n_test_suite") then
		n_test_suite ln_suite
		ln_suite = an_test
		
		n_test_case ln_cases[]
		ln_suite.get_tests(ref ln_cases)
		
		an_info.get_process().set_total_count(upperbound(ln_cases))
		
		long ll_case
		for ll_case = 1 to upperbound(ln_cases)
			this.run_case(ref an_info, ln_cases[ll_case])
		next
	else
		throw f_exception().exception("Unsupported test class type: " + classname(an_test))
	end if
	
	if not an_test.is_ignore() then
		an_test.after_class()
	end if
catch (n_cancel_testing_exception cancel)
	throw cancel
catch (throwable err)
	this.create_composite(an_info) &
	    .error(err)
finally
	this.finished(an_info)
end try

return
end subroutine

public function n_test_result run (readonly n_test an_tests[]);if ib_running then
	runtimeerror rt_err
	rt_err = create runtimeerror
	rt_err.setmessage("Process is already started")
	throw rt_err
end if

ib_running = true

destroy(in_result)
in_result = create n_test_result

try
	if isvalid(in_callback) then
		in_callback.started()
	end if
	
	this.log(fill("-", 100))
	if not upperbound(an_tests) > 0 then
		this.log("No tests found")
	else
		in_total_process.reset()
		
		long ll_total_count
		ll_total_count = this.count_tests(an_tests)
		in_total_process.set_total_count(ll_total_count)
		
		try
			long ll_test
			for ll_test = 1 to upperbound(an_tests)
				n_test ln_test
				ln_test = an_tests[ll_test]
				
				n_test_result_info ln_info
				ln_info = this.create_result_info(ln_test)
				
				try
					this.run_test(ref ln_info, ln_test)
				finally
				 	in_result.add_info(ln_info)
					this.output(ln_info)
				end try
			next
		catch (n_cancel_testing_exception cancel)
			in_result.abort()
		finally
			this.output(in_result, in_total_process)
		end try
	end if
finally
	ib_stop_process = false
	ib_running = false
	if isvalid(in_callback) then
		in_callback.stopped(in_result)
	end if
end try

return in_result
end function

on n_test_runner.create
call super::create
end on

on n_test_runner.destroy
call super::destroy
end on

event constructor;call super::constructor;in_total_process = create n_test_result_process

return
end event

