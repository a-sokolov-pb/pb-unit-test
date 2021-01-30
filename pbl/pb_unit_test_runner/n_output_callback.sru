$PBExportHeader$n_output_callback.sru
forward
global type n_output_callback from nonvisualobject
end type
end forward

global type n_output_callback from nonvisualobject
event log ( readonly string as_text )
end type
global n_output_callback n_output_callback

type variables
private:

boolean ib_post_event_call
end variables

forward prototypes
public subroutine log (readonly datetime adt_time, readonly string as_text)
public subroutine set_post_event_call (readonly boolean ab_post_event_call)
protected function boolean is_post_event_call ()
public subroutine log (readonly string as_text)
public subroutine log_line ()
public subroutine log_error (readonly throwable ath)
public subroutine log_without_time (readonly string as_text)
end prototypes

event log(readonly string as_text);return
end event

public subroutine log (readonly datetime adt_time, readonly string as_text);string ls_array[]
f_string().split(as_text, "~r~n", ref ls_array, false)

long i
for i = 1 to upperbound(ls_array)
	string ls_line
	if not isnull(adt_time) then
		ls_line = string(adt_time, "hh:mm:ss") + "    " + ls_array[i]
	else
		ls_line = ls_array[i]
	end if
	
	if ib_post_event_call then
		this.post event log(ls_line)
	else
		this.event log(ls_line)
	end if
next

return
end subroutine

public subroutine set_post_event_call (readonly boolean ab_post_event_call);ib_post_event_call = ab_post_event_call

return
end subroutine

protected function boolean is_post_event_call ();return ib_post_event_call
end function

public subroutine log (readonly string as_text);this.log(datetime(today(), now()), as_text)

return
end subroutine

public subroutine log_line ();this.log("~t")

return
end subroutine

public subroutine log_error (readonly throwable ath);this.log(classname(ath) + ":")
if f_pb_addon().instance_of(ath.classdefinition, "runtimeerror") then
	runtimeerror lrt_err
	lrt_err = ath
	
	string ls_error
	ls_error = "line - " + string(lrt_err.line) + "~r~n" &
				+ "number - " + string(lrt_err.number) + "~r~n" &
				+ "class - " + lrt_err.class + "~r~n" &
				+ "object name - " + lrt_err.objectname + "~r~n" &
				+ "event/method - " + lrt_err.routinename
	this.log(ls_error)
end if

this.log(ath.getmessage())
		
return
end subroutine

public subroutine log_without_time (readonly string as_text);datetime ldt_null
setnull(ldt_null)

this.log(ldt_null, as_text)

return
end subroutine

on n_output_callback.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_output_callback.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

