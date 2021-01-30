$PBExportHeader$n_test_result_info.sru
forward
global type n_test_result_info from n_test_result_intf
end type
end forward

global type n_test_result_info from n_test_result_intf
end type
global n_test_result_info n_test_result_info

type variables
protected:

string is_library_name
string is_object_name

n_test_result_process in_process
n_test_result_item in_items[]
end variables

forward prototypes
public function string get_library_name ()
public function string get_object_name ()
public function n_test_result_process get_process ()
public function n_test_result_info set_library_name (readonly string as_library_name)
public function n_test_result_info set_object_name (readonly string as_object_name)
public function n_test_result_info add_item (readonly n_test_result_item an_item)
public function n_test_result_intf set_test (readonly n_test an_test)
public function long get_items (ref n_test_result_item an_items[])
public function n_test_result_info set_process (readonly n_test_result_process an_process)
end prototypes

public function string get_library_name ();return is_library_name
end function

public function string get_object_name ();return is_object_name
end function

public function n_test_result_process get_process ();return in_process
end function

public function n_test_result_info set_library_name (readonly string as_library_name);is_library_name = as_library_name

return this
end function

public function n_test_result_info set_object_name (readonly string as_object_name);is_object_name = as_object_name

return this
end function

public function n_test_result_info add_item (readonly n_test_result_item an_item);long ll_index
ll_index = upperbound(in_items) + 1
in_items[ll_index] = an_item

choose case this.get_status()
	case n_test_result.IS_ERRORS
	case n_test_result.IS_FAILURE
	case else
		if not an_item.get_status() = n_test_result.IS_IGNORED then
			this.set_status(an_item.get_status())
		end if
end choose

this.append(an_item)

return this
end function

public function n_test_result_intf set_test (readonly n_test an_test);super :: set_test(an_test)

return this.set_library_name(an_test.get_library_name()) &
           .set_object_name(an_test.get_object_name())
end function

public function long get_items (ref n_test_result_item an_items[]);an_items = in_items

return upperbound(an_items)
end function

public function n_test_result_info set_process (readonly n_test_result_process an_process);in_process = an_process

return this
end function

on n_test_result_info.create
call super::create
end on

on n_test_result_info.destroy
call super::destroy
end on

