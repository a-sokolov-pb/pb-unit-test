$PBExportHeader$n_result_composite_output.sru
forward
global type n_result_composite_output from nonvisualobject
end type
end forward

global type n_result_composite_output from nonvisualobject
end type
global n_result_composite_output n_result_composite_output

type variables
protected:

n_result_output_callback in_output
n_test_result_intf in_result
n_test_result_process in_process
end variables

forward prototypes
public function n_result_composite_output set_output (readonly n_result_output_callback an_output)
public function n_result_composite_output error (readonly throwable err)
public function n_result_composite_output fail (readonly string as_error)
public function n_result_composite_output ignored ()
public function n_result_composite_output set_result (readonly n_test_result_intf an_result)
public function n_result_composite_output set_process (readonly n_test_result_process an_process)
public function n_result_composite_output fail (readonly n_assertion_error err, readonly string as_message)
end prototypes

public function n_result_composite_output set_output (readonly n_result_output_callback an_output);in_output = an_output

return this
end function

public function n_result_composite_output error (readonly throwable err);in_output.log_line()
in_output.log_error(err)

in_result.error(err)
if isvalid(in_process) then
	in_process.error()
end if

return this	
end function

public function n_result_composite_output fail (readonly string as_error);in_output.log(as_error)
in_result.fail(as_error)
in_process.fail()

return this
end function

public function n_result_composite_output ignored ();in_result.ignored()
in_process.ignored()	

return this
end function

public function n_result_composite_output set_result (readonly n_test_result_intf an_result);in_result = an_result

return this
end function

public function n_result_composite_output set_process (readonly n_test_result_process an_process);in_process = an_process

return this
end function

public function n_result_composite_output fail (readonly n_assertion_error err, readonly string as_message);in_output.log_line()
in_output.log(classname(err) + ":")
in_output.log(as_message)

in_result.fail(err)
in_process.fail()

return this
end function

on n_result_composite_output.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_result_composite_output.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

