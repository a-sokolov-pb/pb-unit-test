$PBExportHeader$n_unit_test_reflection.sru
forward
global type n_unit_test_reflection from nonvisualobject
end type
end forward

shared variables
string gs_application_library_list
end variables

global type n_unit_test_reflection from nonvisualobject
end type
global n_unit_test_reflection n_unit_test_reflection

type variables
protected:

string is_target_folder
string is_application_name
string is_target_library_list[]
string is_total_library_list[]
string is_core_library_list[] = {"pb_unit_test_core" &
										 , "pb_unit_test_gui" &
										 , "pb_unit_test_runner" &
										 , "pb_unit_test_reflection" &
										 , "pb_unit_test_utilities"}
end variables

forward prototypes
public subroutine set_target (readonly string as_target_file) throws exception
protected function integer get_library_object_list (readonly string as_library_file, ref string as_object_list[])
public function integer get_target_library_list (ref string as_target_library_list[])
protected function integer append_tests (ref n_test an_target[], readonly n_test an_source[])
protected function string get_library_name_from_file (readonly string as_library_path)
protected function boolean is_core_library (readonly string as_library_name)
protected subroutine set_target_library_list (readonly string as_library_list[])
public function string get_application_name ()
protected function classdefinition find_class_definition (readonly string as_class_name)
protected function integer get_library_test_list (readonly string as_library_file, ref n_test an_tests[]) throws exception
public function integer get_all_libraries (ref n_unit_test_library an_libraries[]) throws exception
public function integer get_all_tests (ref n_test an_all_tests[]) throws exception
public function integer get_tests_by_library_list (readonly string as_library_list[], ref n_test an_all_tests[]) throws exception
end prototypes

public subroutine set_target (readonly string as_target_file) throws exception;if f_string().is_empty(as_target_file) then
	throw f_exception().exception("PB target file must specified")
end if

if not fileexists(as_target_file) then
	throw f_exception().exception("PB target file '" + as_target_file + "' does not exists")
end if

is_target_folder = left(as_target_file, lastpos(as_target_file, "\"))

string ls_file_data
ls_file_data = f_file_factory().read_file_data(as_target_file)
if not pos(ls_file_data, "appname") > 0 then
	throw f_exception().exception("File '" + as_target_file + "' does't contains Application name data")
end if

is_application_name = f_string().between(ls_file_data, 'appname "', '";')

if not pos(ls_file_data, "LibList") > 0 then
	throw f_exception().exception("File '" + as_target_file + "' does't contains library list")
end if

string ls_lib_list
ls_lib_list = f_string().between(ls_file_data, 'LibList "', '"')

string ls_library_list[]
f_string().split(ls_lib_list, ";", ref ls_library_list)

this.set_target_library_list(ls_library_list)

string ls_application_library_list[]
f_string().split(gs_application_library_list, ",", ref ls_application_library_list)

string ls_total_library_list[]
ls_total_library_list = is_target_library_list
f_array().append(ref ls_total_library_list, ls_application_library_list)
f_test_context().set_library_list(ls_total_library_list)

setlibrarylist(f_string().join(ls_total_library_list, ","))
is_total_library_list = ls_total_library_list

return
end subroutine

protected function integer get_library_object_list (readonly string as_library_file, ref string as_object_list[]);string ls_objects_list
ls_objects_list = librarydirectory(as_library_file, diruserobject!)

datastore lds_object_list
lds_object_list = create datastore
lds_object_list.dataobject = "d_library_objects_list"
lds_object_list.importstring(ls_objects_list)
lds_object_list.sort()

string ls_object_list[]

long ll_row
for ll_row = 1 to lds_object_list.rowcount()
	ls_object_list[ll_row] = lds_object_list.getitemstring(ll_row, "name")
next

as_object_list = ls_object_list

return upperbound(as_object_list)
end function

public function integer get_target_library_list (ref string as_target_library_list[]);as_target_library_list = is_target_library_list

return upperbound(as_target_library_list)
end function

protected function integer append_tests (ref n_test an_target[], readonly n_test an_source[]);int li_index
li_index = upperbound(an_target)

int i
for i = 1 to upperbound(an_source)
	li_index ++
	an_target[li_index] = an_source[i]
next

return upperbound(an_target)
end function

protected function string get_library_name_from_file (readonly string as_library_path);string ls_library_name
ls_library_name = right(as_library_path, len(as_library_path) - lastpos(as_library_path, "\"))
ls_library_name = left(ls_library_name, lastpos(ls_library_name, ".") - 1)

return ls_library_name
end function

protected function boolean is_core_library (readonly string as_library_name);int i
for i = 1 to upperbound(is_core_library_list)
	if f_string().equals(as_library_name, is_core_library_list[i]) then
		return true
	end if
next

return false
end function

protected subroutine set_target_library_list (readonly string as_library_list[]);int li_index
string ls_target_library_list[]

int li_library
for li_library = 1 to upperbound(as_library_list)
	string ls_library_file
	ls_library_file = is_target_folder + as_library_list[li_library]
	
	string ls_library_name
	ls_library_name = this.get_library_name_from_file(ls_library_file)
	if not this.is_core_library(ls_library_name) then
		li_index ++
		ls_target_library_list[li_index] = ls_library_file
	end if
next

is_target_library_list = ls_target_library_list

return
end subroutine

public function string get_application_name ();return is_application_name
end function

protected function classdefinition find_class_definition (readonly string as_class_name);return findclassdefinition(as_class_name, is_total_library_list)
end function

protected function integer get_library_test_list (readonly string as_library_file, ref n_test an_tests[]) throws exception;int li_index
n_test ln_tests[]

string ls_object_list[]
if this.get_library_object_list(as_library_file, ref ls_object_list) > 0 then
	int li_object
	for li_object = 1 to upperbound(ls_object_list)
		string ls_object_name
		ls_object_name = ls_object_list[li_object]
		
		classdefinition lcdef
		lcdef = this.find_class_definition(ls_object_name)
		if isvalid(lcdef) then
			if f_pb_addon().instance_of(lcdef, "n_test") then
				try
					li_index ++
					ln_tests[li_index] = create using ls_object_name
					ln_tests[li_index].init()
				catch (throwable th)
					throw f_exception().exception("Erorr while create '" + ls_object_name &
													   + "' test: " + th.getmessage()) 
				end try
			end if
		end if
	next
end if

an_tests = ln_tests

return upperbound(an_tests)
end function

public function integer get_all_libraries (ref n_unit_test_library an_libraries[]) throws exception;int li_index
n_unit_test_library ln_libraries[]

int li_library
for li_library = 1 to upperbound(is_target_library_list)
	string ls_library_file
	ls_library_file = is_target_library_list[li_library]
		
	n_test ln_tests[]
	if this.get_library_test_list(ls_library_file, ref ln_tests) > 0 then
		n_unit_test_library ln_library
		ln_library = create n_unit_test_library
		ln_library.set_name(this.get_library_name_from_file(ls_library_file)) &
					 .set_file_path(ls_library_file) &
					 .set_tests(ln_tests)
		
		li_index ++
		ln_libraries[li_index] = ln_library
	end if
next

an_libraries = ln_libraries

return upperbound(an_libraries)
end function

public function integer get_all_tests (ref n_test an_all_tests[]) throws exception;n_test ln_all_tests[]

int li_library
for li_library = 1 to upperbound(is_target_library_list)
	string ls_library_file
	ls_library_file = is_target_library_list[li_library]
		
	n_test ln_tests[]
	if this.get_library_test_list(ls_library_file, ref ln_tests) > 0 then
		this.append_tests(ref ln_all_tests, ln_tests)
	end if
next

an_all_tests = ln_all_tests

return upperbound(an_all_tests)
end function

public function integer get_tests_by_library_list (readonly string as_library_list[], ref n_test an_all_tests[]) throws exception;int li_index
string ls_library_list[]

int li_library
for li_library = 1 to upperbound(as_library_list)
	string ls_library_name
	ls_library_name = lower(as_library_list[li_library]) + ".pbl"
	
	int li_target_library
	for li_target_library = 1 to upperbound(is_target_library_list)
		string ls_library_path
		ls_library_path = is_target_library_list[li_target_library]
		
		if right(ls_library_path, len(ls_library_name)) = ls_library_name then
			li_index ++
			ls_library_list[li_index] = ls_library_path
			exit
		end if
	next
next

n_test ln_all_tests[]

for li_library = 1 to upperbound(ls_library_list)
	string ls_library_file
	ls_library_file = ls_library_list[li_library]
		
	n_test ln_tests[]
	if this.get_library_test_list(ls_library_file, ref ln_tests) > 0 then
		this.append_tests(ref ln_all_tests, ln_tests)
	end if
next

an_all_tests = ln_all_tests

return upperbound(an_all_tests)
end function

on n_unit_test_reflection.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_unit_test_reflection.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;if f_string().is_empty(gs_application_library_list) then
	gs_application_library_list = getlibrarylist()
end if

return
end event

