$PBExportHeader$n_time_elapsed_intf.sru
forward
global type n_time_elapsed_intf from nonvisualobject
end type
end forward

global type n_time_elapsed_intf from nonvisualobject
end type
global n_time_elapsed_intf n_time_elapsed_intf

type variables
protected:

long il_time_elapsed
end variables

forward prototypes
public function long get_time_elapsed ()
public function n_time_elapsed_intf set_time_elapsed (readonly long al_time_elapsed)
public function decimal get_time_elapsed_in_sec ()
public function string get_time_elapsed_in_string ()
public function n_time_elapsed_intf append (readonly n_time_elapsed_intf an_time_elapsed)
end prototypes

public function long get_time_elapsed ();return il_time_elapsed
end function

public function n_time_elapsed_intf set_time_elapsed (readonly long al_time_elapsed);il_time_elapsed = al_time_elapsed

return this
end function

public function decimal get_time_elapsed_in_sec ();return truncate(il_time_elapsed / 1000, 3)
end function

public function string get_time_elapsed_in_string ();dec ldc_time_elapsed
ldc_time_elapsed = this.get_time_elapsed_in_sec()
if ldc_time_elapsed = 0 then
	return "0.000"
else
	return string(ldc_time_elapsed)
end if
end function

public function n_time_elapsed_intf append (readonly n_time_elapsed_intf an_time_elapsed);il_time_elapsed += an_time_elapsed.get_time_elapsed()

return this
end function

on n_time_elapsed_intf.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_time_elapsed_intf.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

