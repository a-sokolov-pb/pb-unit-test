$PBExportHeader$n_primitive_definition.sru
forward
global type n_primitive_definition from n_base_definition
end type
end forward

global type n_primitive_definition from n_base_definition
end type
global n_primitive_definition n_primitive_definition

type variables
protected:

CONSTANT string ANY = "any"
CONSTANT string BLOB = "blob"
CONSTANT string BOOLEAN = "boolean"
CONSTANT string CHAR = "char"
CONSTANT string CHARACTER = "character"
CONSTANT string STRING = "string"
CONSTANT string DATETIME = "datetime"
CONSTANT string DATE = "date"
CONSTANT string TIME = "time"
CONSTANT string DEC = "dec"
CONSTANT string DECIMAL = "decimal"
CONSTANT string DOUBLE = "double"
CONSTANT string REAL = "real"
CONSTANT string INT = "int"
CONSTANT string INTEGER = "integer"
CONSTANT string UINT = "uint"
CONSTANT string UNSIGNEDINT = "unsignedint"
CONSTANT string UNSIGNEDINTEGER = "unsignedinteger"
CONSTANT string LONG = "long"
CONSTANT string LONGLONG = "longlong"
CONSTANT string ULONG = "ulong"
CONSTANT string UNSIGNEDLONG = "unsignedlong"
CONSTANT string NUMBER = "number"
CONSTANT string POWEROBJECT = "powerobject"
end variables

forward prototypes
public function boolean is_array ()
public function string get_class_name ()
public function string get_parent_class_name ()
public function boolean equals (readonly n_base_definition an_compared)
public function boolean is_null (readonly any aa_value)
public function string to_string (readonly any aa_value)
end prototypes

public function boolean is_array ();return not upperbound(ia_value) = -1
end function

public function string get_class_name ();return classname(ia_value)
end function

public function string get_parent_class_name ();return classname(ia_value)
end function

public function boolean equals (readonly n_base_definition an_compared);if isnull(an_compared) or not isvalid(an_compared) then
	return false
end if

if an_compared.is_null() then
	return false
end if

return ia_value = an_compared.get_value()
end function

public function boolean is_null (readonly any aa_value);return isnull(aa_value)
end function

public function string to_string (readonly any aa_value);return string(aa_value)
end function

on n_primitive_definition.create
call super::create
end on

on n_primitive_definition.destroy
call super::destroy
end on

