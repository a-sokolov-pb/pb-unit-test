$PBExportHeader$n_base_definition.sru
forward
global type n_base_definition from nonvisualobject
end type
end forward

global type n_base_definition from nonvisualobject
end type
global n_base_definition n_base_definition

type variables
protected:

any ia_value
end variables

forward prototypes
public function string to_string ()
public function boolean equals (readonly n_base_definition an_compared)
public subroutine set_value (readonly any aa_value)
public function any get_value ()
public function boolean is_null ()
public function string get_class_name ()
public function string to_string (readonly any aa_value)
public function string get_parent_class_name ()
public function boolean is_array ()
public function boolean is_null (readonly any aa_value)
end prototypes

public function string to_string ();return this.to_string(ia_value)
end function

public function boolean equals (readonly n_base_definition an_compared);return false
end function

public subroutine set_value (readonly any aa_value);ia_value = aa_value

return
end subroutine

public function any get_value ();return ia_value
end function

public function boolean is_null ();return this.is_null(ia_value)
end function

public function string get_class_name ();return ""
end function

public function string to_string (readonly any aa_value);return ""
end function

public function string get_parent_class_name ();return ""
end function

public function boolean is_array ();return false
end function

public function boolean is_null (readonly any aa_value);return false
end function

on n_base_definition.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_base_definition.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

