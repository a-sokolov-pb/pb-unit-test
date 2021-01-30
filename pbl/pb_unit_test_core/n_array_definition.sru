$PBExportHeader$n_array_definition.sru
forward
global type n_array_definition from n_base_definition
end type
end forward

global type n_array_definition from n_base_definition
end type
global n_array_definition n_array_definition

type variables
protected:

n_base_definition in_definition
end variables

forward prototypes
public function long get_length ()
public subroutine set_value (readonly any aa_value)
public function any get_value ()
public function string to_string ()
public function string get_class_name ()
public function string get_parent_class_name ()
public function boolean equals (readonly n_base_definition an_compared)
public function boolean is_null ()
public function boolean is_array ()
public function string to_string (readonly any aa_value)
public subroutine set_definition (readonly n_base_definition an_definition)
public function n_base_definition get (readonly long al_index)
end prototypes

public function long get_length ();any la_array[]
la_array = in_definition.get_value()
return upperbound(la_array)
end function

public subroutine set_value (readonly any aa_value);in_definition.set_value(aa_value)

return
end subroutine

public function any get_value ();return in_definition.get_value()
end function

public function string to_string ();any la_array[]
la_array = in_definition.get_value()

string ls_array_to_string

long i
for i = 1 to upperbound(la_array)
	if i > 1 then
		ls_array_to_string += ", "
	end if
	
	ls_array_to_string += this.to_string(la_array[i])
next

return ls_array_to_string
end function

public function string get_class_name ();any la_array[]
la_array = in_definition.get_value()
return classname(la_array[lowerbound(la_array)])
end function

public function string get_parent_class_name ();return in_definition.get_parent_class_name()
end function

public function boolean equals (readonly n_base_definition an_compared);if isnull(an_compared) or not isvalid(an_compared) then
	return false
end if

if an_compared.is_null() then
	return false
end if

if not an_compared.is_array() then
	return false
end if

if not an_compared.get_class_name() = this.get_class_name() then
	return false
end if

any la_compared
la_compared = an_compared.get_value()

any la_current
la_current = in_definition.get_value()

return upperbound(la_current) = upperbound(la_compared)
end function

public function boolean is_null ();if in_definition.is_null() then
	return true
end if

try
	any la_array[]
	la_array = in_definition.get_value()
	return upperbound(la_array) = 0
catch (throwable npe)
	return true
end try
end function

public function boolean is_array ();return in_definition.is_array()
end function

public function string to_string (readonly any aa_value);return in_definition.to_string(aa_value)
end function

public subroutine set_definition (readonly n_base_definition an_definition);in_definition = an_definition

return
end subroutine

public function n_base_definition get (readonly long al_index);n_base_definition ln_data_type
ln_data_type = create using classname(in_definition)

any la_array[]
la_array = in_definition.get_value()
ln_data_type.set_value(la_array[al_index])

return ln_data_type
end function

on n_array_definition.create
call super::create
end on

on n_array_definition.destroy
call super::destroy
end on

