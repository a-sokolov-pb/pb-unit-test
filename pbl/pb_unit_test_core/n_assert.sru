$PBExportHeader$n_assert.sru
forward
global type n_assert from nonvisualobject
end type
end forward

global type n_assert from nonvisualobject
end type
global n_assert n_assert

type variables

end variables

forward prototypes
public subroutine assert_equals (readonly string as_expected, readonly string as_actual, readonly string as_message)
public subroutine assert_equals (readonly string as_expected, readonly string as_actual)
protected function string format (readonly n_base_definition an_expected, readonly n_base_definition an_actual, readonly string as_message)
protected subroutine assert_equals (readonly n_base_definition an_expected, readonly n_base_definition an_actual)
protected subroutine assert_equals (readonly n_base_definition an_expected, readonly n_base_definition an_actual, readonly string as_message)
protected subroutine fail_not_equals (readonly n_base_definition an_expected, readonly n_base_definition an_actual, readonly string as_message)
protected function boolean equals (readonly n_base_definition an_expected, readonly n_base_definition an_actual)
protected subroutine assert_primitive_equals (readonly any aa_expected, readonly any aa_actual, readonly string as_message)
protected function string format (readonly string as_expected, readonly string as_actual, readonly string as_message)
protected function string to_string (readonly n_base_definition an_definition)
protected subroutine assert_array_equals (readonly n_base_definition an_expected, readonly n_base_definition an_actual, string as_message)
public subroutine assert_equals (readonly boolean ab_expected, readonly boolean ab_actual, readonly string as_message)
public subroutine assert_equals (readonly boolean ab_expected, readonly boolean ab_actual)
public subroutine assert_equals (readonly date ad_expected, readonly date ad_actual, readonly string as_message)
public subroutine assert_equals (readonly date ad_expected, readonly date ad_actual)
public subroutine assert_equals (readonly time at_expected, readonly time at_actual, readonly string as_message)
public subroutine assert_equals (readonly time at_expected, readonly time at_actual)
public subroutine assert_equals (readonly datetime adt_expected, readonly datetime adt_actual, readonly string as_message)
public subroutine assert_equals (readonly datetime adt_expected, readonly datetime adt_actual)
public subroutine assert_equals (readonly decimal adc_expected, readonly decimal adc_actual, readonly string as_message)
public subroutine assert_equals (readonly decimal adc_expected, readonly decimal adc_actual)
protected subroutine assert_object_equals (readonly any aa_expected, readonly any aa_actual, readonly string as_message)
public subroutine assert_equals (readonly powerobject apo_expected, readonly powerobject apo_actual, readonly string as_message)
public subroutine assert_equals (readonly powerobject apo_expected, readonly powerobject apo_actual)
protected subroutine assert_primitive_not_equals (readonly any aa_expected, readonly any aa_actual, readonly string as_message)
public subroutine assert_not_equals (readonly boolean ab_expected, readonly boolean ab_actual, readonly string as_message)
public subroutine assert_not_equals (readonly boolean ab_expected, readonly boolean ab_actual)
public subroutine assert_not_equals (readonly date ad_expected, readonly date ad_actual, readonly string as_message)
public subroutine assert_not_equals (readonly date ad_expected, readonly date ad_actual)
public subroutine assert_not_equals (readonly datetime adt_expected, readonly datetime adt_actual, readonly string as_message)
public subroutine assert_not_equals (readonly datetime adt_expected, readonly datetime adt_actual)
public subroutine assert_not_equals (readonly decimal adc_expected, readonly decimal adc_actual, readonly string as_message)
public subroutine assert_not_equals (readonly decimal adc_expected, readonly decimal adc_actual)
public subroutine assert_not_equals (readonly powerobject apo_expected, readonly powerobject apo_actual, readonly string as_message)
public subroutine assert_not_equals (readonly powerobject apo_expected, readonly powerobject apo_actual)
protected subroutine assert_object_not_equals (readonly any aa_expected, readonly any aa_actual, readonly string as_message)
protected subroutine assert_not_equals (readonly n_base_definition an_expected, readonly n_base_definition an_actual, readonly string as_message)
public subroutine assert_not_equals (readonly string as_expected, readonly string as_actual, readonly string as_message)
public subroutine assert_not_equals (readonly string as_expected, readonly string as_actual)
public subroutine assert_not_equals (readonly time at_expected, readonly time at_actual, readonly string as_message)
public subroutine assert_not_equals (readonly time at_expected, readonly time at_actual)
public subroutine fail (readonly string as_message)
public subroutine assert_true (readonly boolean ab_condition, readonly string as_message)
public subroutine assert_false (readonly boolean ab_condition, readonly string as_message)
public subroutine assert_true (readonly boolean ab_condition)
public subroutine assert_false (readonly boolean ab_condition)
public subroutine assert_null (readonly any aa_object)
public subroutine assert_not_null (readonly any aa_object)
public subroutine assert_valid (readonly powerobject apo)
public subroutine assert_not_valid (readonly powerobject apo)
public subroutine assert_equals (readonly boolean ab_expected[], readonly boolean ab_actual[], readonly string as_message)
public subroutine assert_equals (readonly boolean ab_expected[], readonly boolean ab_actual[])
public subroutine assert_equals (readonly date ad_expected[], readonly date ad_actual[], readonly string as_message)
public subroutine assert_equals (readonly date ad_expected[], readonly date ad_actual[])
public subroutine assert_equals (readonly datetime adt_expected[], readonly datetime adt_actual[], readonly string as_message)
public subroutine assert_equals (readonly datetime adt_expected[], readonly datetime adt_actual[])
public subroutine assert_equals (readonly decimal adc_expected[], readonly decimal adc_actual[], readonly string as_message)
public subroutine assert_equals (readonly decimal adc_expected[], readonly decimal adc_actual[])
public subroutine assert_equals (readonly powerobject apo_expected[], readonly powerobject apo_actual[], readonly string as_message)
public subroutine assert_equals (readonly powerobject apo_expected[], readonly powerobject apo_actual[])
public subroutine assert_equals (readonly string as_expected[], readonly string as_actual[], readonly string as_message)
public subroutine assert_equals (readonly string as_expected[], readonly string as_actual[])
public subroutine assert_equals (readonly time at_expected[], readonly time at_actual[], readonly string as_message)
public subroutine assert_equals (readonly time at_expected[], readonly time at_actual[])
public subroutine assert_null (readonly any aa_object, string as_message)
public subroutine assert_not_null (readonly any aa_object, string as_message)
public subroutine assert_valid (readonly powerobject apo, string as_message)
public subroutine assert_not_valid (readonly powerobject apo, string as_message)
public subroutine assert_same (readonly powerobject apo_expected, readonly powerobject apo_actual, readonly string as_message)
public subroutine assert_same (readonly powerobject apo_expected, readonly powerobject apo_actual)
public subroutine assert_not_same (readonly powerobject apo_expected, readonly powerobject apo_actual, readonly string as_message)
public subroutine assert_not_same (readonly powerobject apo_expected, readonly powerobject apo_actual)
end prototypes

public subroutine assert_equals (readonly string as_expected, readonly string as_actual, readonly string as_message);this.assert_primitive_equals(as_expected, as_actual, as_message)

return
end subroutine

public subroutine assert_equals (readonly string as_expected, readonly string as_actual);this.assert_equals(as_expected, as_actual, "")

return
end subroutine

protected function string format (readonly n_base_definition an_expected, readonly n_base_definition an_actual, readonly string as_message);return this.format(this.to_string(an_expected) &
                 , this.to_string(an_actual) &
					  , as_message)
end function

protected subroutine assert_equals (readonly n_base_definition an_expected, readonly n_base_definition an_actual);this.assert_equals(an_expected, an_actual, "")

return
end subroutine

protected subroutine assert_equals (readonly n_base_definition an_expected, readonly n_base_definition an_actual, readonly string as_message);if not an_expected.is_null() or not an_actual.is_null() then
	if not an_expected.is_null() then
		if an_expected.is_array() then
			this.assert_array_equals(an_expected, an_actual, as_message)
			
			return
		end if
		
		if this.equals(an_expected, an_actual) then
			return
		end if
	end if
	
	this.fail_not_equals(an_expected, an_actual, as_message)
end if

return
end subroutine

protected subroutine fail_not_equals (readonly n_base_definition an_expected, readonly n_base_definition an_actual, readonly string as_message);this.fail(this.format(an_expected, an_actual, as_message))

return
end subroutine

protected function boolean equals (readonly n_base_definition an_expected, readonly n_base_definition an_actual);return an_expected.equals(an_actual)
end function

protected subroutine assert_primitive_equals (readonly any aa_expected, readonly any aa_actual, readonly string as_message);n_primitive_definition ln_expected
ln_expected = create n_primitive_definition
ln_expected.set_value(aa_expected)

n_primitive_definition ln_actual
ln_actual = create n_primitive_definition
ln_actual.set_value(aa_actual)

this.assert_equals(ln_expected, ln_actual, as_message)

return
end subroutine

protected function string format (readonly string as_expected, readonly string as_actual, readonly string as_message);string ls_formatted = ""
if not isnull(as_message) and len(as_message) > 0 then
	ls_formatted = as_message + " "
end if

return ls_formatted + "expected [" + as_expected &
                 + "] but found [" + as_actual + "]" 
end function

protected function string to_string (readonly n_base_definition an_definition);return an_definition.to_string()
end function

protected subroutine assert_array_equals (readonly n_base_definition an_expected, readonly n_base_definition an_actual, string as_message);if an_actual.is_array() then
	n_array_definition ln_expected_array
	ln_expected_array = create n_array_definition
	ln_expected_array.set_definition(an_expected)
	
	n_array_definition ln_actual_array
	ln_actual_array = create n_array_definition
	ln_actual_array.set_definition(an_actual)
	
	long ll_expected_length
	ll_expected_length = ln_expected_array.get_length()
	if ll_expected_length = ln_actual_array.get_length() then
		long ll_index
		for ll_index = 1 to ll_expected_length
			n_base_definition ln_expected_object
			ln_expected_object = ln_expected_array.get(ll_index)
			
			n_base_definition ln_actual_object
			ln_actual_object = ln_actual_array.get(ll_index)
			
			try
				this.assert_equals(ln_expected_object, ln_actual_object)
			catch (n_assertion_error assertion_err)
				if not isnull(as_message) and len(as_message) > 0 then
					as_message += " (values as index " + string(ll_index) + " are not the same)"
				end if
				this.fail_not_equals(ln_expected_array, ln_actual_array, as_message)
			end try
		next
		
		return
	end if
	
	if not isnull(as_message) and len(as_message) > 0 then
		as_message += " (Array lengths are not the same)"
	end if
	this.fail(this.format(string(ll_expected_length) &
			             , string(ln_actual_array.get_length()) &
							 , as_message))
end if

this.fail_not_equals(an_expected, an_actual, as_message)

return
end subroutine

public subroutine assert_equals (readonly boolean ab_expected, readonly boolean ab_actual, readonly string as_message);this.assert_primitive_equals(ab_expected, ab_actual, as_message)

return
end subroutine

public subroutine assert_equals (readonly boolean ab_expected, readonly boolean ab_actual);this.assert_equals(ab_expected, ab_actual, "")

return
end subroutine

public subroutine assert_equals (readonly date ad_expected, readonly date ad_actual, readonly string as_message);this.assert_primitive_equals(ad_expected, ad_actual, as_message)

return
end subroutine

public subroutine assert_equals (readonly date ad_expected, readonly date ad_actual);this.assert_equals(ad_expected, ad_actual, "")

return
end subroutine

public subroutine assert_equals (readonly time at_expected, readonly time at_actual, readonly string as_message);this.assert_primitive_equals(at_expected, at_actual, as_message)

return
end subroutine

public subroutine assert_equals (readonly time at_expected, readonly time at_actual);this.assert_equals(at_expected, at_actual, "")

return
end subroutine

public subroutine assert_equals (readonly datetime adt_expected, readonly datetime adt_actual, readonly string as_message);this.assert_primitive_equals(adt_expected, adt_actual, as_message)

return
end subroutine

public subroutine assert_equals (readonly datetime adt_expected, readonly datetime adt_actual);this.assert_equals(adt_expected, adt_actual, "")

return
end subroutine

public subroutine assert_equals (readonly decimal adc_expected, readonly decimal adc_actual, readonly string as_message);this.assert_primitive_equals(adc_expected, adc_actual, as_message)

return
end subroutine

public subroutine assert_equals (readonly decimal adc_expected, readonly decimal adc_actual);this.assert_equals(adc_expected, adc_actual, "")

return
end subroutine

protected subroutine assert_object_equals (readonly any aa_expected, readonly any aa_actual, readonly string as_message);n_object_definition ln_expected
ln_expected = create n_object_definition
ln_expected.set_value(aa_expected)

n_object_definition ln_actual
ln_actual = create n_object_definition
ln_actual.set_value(aa_actual)

this.assert_equals(ln_expected, ln_actual, as_message)

return
end subroutine

public subroutine assert_equals (readonly powerobject apo_expected, readonly powerobject apo_actual, readonly string as_message);this.assert_object_equals(apo_expected, apo_actual, as_message)

return
end subroutine

public subroutine assert_equals (readonly powerobject apo_expected, readonly powerobject apo_actual);this.assert_equals(apo_expected, apo_actual, "")

return
end subroutine

protected subroutine assert_primitive_not_equals (readonly any aa_expected, readonly any aa_actual, readonly string as_message);n_primitive_definition ln_expected
ln_expected = create n_primitive_definition
ln_expected.set_value(aa_expected)

n_primitive_definition ln_actual
ln_actual = create n_primitive_definition
ln_actual.set_value(aa_actual)

this.assert_not_equals(ln_expected, ln_actual, as_message)

return
end subroutine

public subroutine assert_not_equals (readonly boolean ab_expected, readonly boolean ab_actual, readonly string as_message);this.assert_primitive_not_equals(ab_expected, ab_actual, as_message)

return
end subroutine

public subroutine assert_not_equals (readonly boolean ab_expected, readonly boolean ab_actual);this.assert_not_equals(ab_expected, ab_actual, "")

return
end subroutine

public subroutine assert_not_equals (readonly date ad_expected, readonly date ad_actual, readonly string as_message);this.assert_primitive_not_equals(ad_expected, ad_actual, as_message)

return
end subroutine

public subroutine assert_not_equals (readonly date ad_expected, readonly date ad_actual);this.assert_not_equals(ad_expected, ad_actual, "")

return
end subroutine

public subroutine assert_not_equals (readonly datetime adt_expected, readonly datetime adt_actual, readonly string as_message);this.assert_primitive_not_equals(adt_expected, adt_actual, as_message)

return
end subroutine

public subroutine assert_not_equals (readonly datetime adt_expected, readonly datetime adt_actual);this.assert_not_equals(adt_expected, adt_actual, "")

return
end subroutine

public subroutine assert_not_equals (readonly decimal adc_expected, readonly decimal adc_actual, readonly string as_message);this.assert_primitive_not_equals(adc_expected, adc_actual, as_message)

return
end subroutine

public subroutine assert_not_equals (readonly decimal adc_expected, readonly decimal adc_actual);this.assert_not_equals(adc_expected, adc_actual, "")

return
end subroutine

public subroutine assert_not_equals (readonly powerobject apo_expected, readonly powerobject apo_actual, readonly string as_message);this.assert_object_not_equals(apo_expected, apo_actual, as_message)

return
end subroutine

public subroutine assert_not_equals (readonly powerobject apo_expected, readonly powerobject apo_actual);this.assert_not_equals(apo_expected, apo_actual, "")

return
end subroutine

protected subroutine assert_object_not_equals (readonly any aa_expected, readonly any aa_actual, readonly string as_message);n_object_definition ln_expected
ln_expected = create n_object_definition
ln_expected.set_value(aa_expected)

n_object_definition ln_actual
ln_actual = create n_object_definition
ln_actual.set_value(aa_actual)

this.assert_not_equals(ln_expected, ln_actual, as_message)

return
end subroutine

protected subroutine assert_not_equals (readonly n_base_definition an_expected, readonly n_base_definition an_actual, readonly string as_message);boolean lb_fail = false

try
	this.assert_equals(an_expected, an_actual, as_message)
	lb_fail = true
catch (n_assertion_error assertion_err)
	//
end try

if lb_fail then
	this.fail(as_message)
end if

return
end subroutine

public subroutine assert_not_equals (readonly string as_expected, readonly string as_actual, readonly string as_message);this.assert_primitive_not_equals(as_expected, as_actual, as_message)

return
end subroutine

public subroutine assert_not_equals (readonly string as_expected, readonly string as_actual);this.assert_not_equals(as_expected, as_actual, "")

return
end subroutine

public subroutine assert_not_equals (readonly time at_expected, readonly time at_actual, readonly string as_message);this.assert_primitive_not_equals(at_expected, at_actual, as_message)

return
end subroutine

public subroutine assert_not_equals (readonly time at_expected, readonly time at_actual);this.assert_not_equals(at_expected, at_actual, "")

return
end subroutine

public subroutine fail (readonly string as_message);n_assertion_error ln_error
ln_error = create n_assertion_error
ln_error.setmessage(as_message)
throw ln_error

return
end subroutine

public subroutine assert_true (readonly boolean ab_condition, readonly string as_message);this.assert_equals(true, ab_condition, as_message)

return
end subroutine

public subroutine assert_false (readonly boolean ab_condition, readonly string as_message);this.assert_equals(false, ab_condition, as_message)

return
end subroutine

public subroutine assert_true (readonly boolean ab_condition);this.assert_true(ab_condition, "")

return
end subroutine

public subroutine assert_false (readonly boolean ab_condition);this.assert_false(ab_condition, "")

return
end subroutine

public subroutine assert_null (readonly any aa_object);this.assert_null(aa_object, "")

return
end subroutine

public subroutine assert_not_null (readonly any aa_object);this.assert_not_null(aa_object, "")

return
end subroutine

public subroutine assert_valid (readonly powerobject apo);this.assert_valid(apo, "")

return
end subroutine

public subroutine assert_not_valid (readonly powerobject apo);this.assert_not_valid(apo, "")

return
end subroutine

public subroutine assert_equals (readonly boolean ab_expected[], readonly boolean ab_actual[], readonly string as_message);this.assert_primitive_equals(ab_expected, ab_actual, as_message)

return
end subroutine

public subroutine assert_equals (readonly boolean ab_expected[], readonly boolean ab_actual[]);this.assert_equals(ab_expected, ab_actual, "")

return
end subroutine

public subroutine assert_equals (readonly date ad_expected[], readonly date ad_actual[], readonly string as_message);this.assert_primitive_equals(ad_expected, ad_actual, as_message)

return
end subroutine

public subroutine assert_equals (readonly date ad_expected[], readonly date ad_actual[]);this.assert_equals(ad_expected, ad_actual, "")

return
end subroutine

public subroutine assert_equals (readonly datetime adt_expected[], readonly datetime adt_actual[], readonly string as_message);this.assert_primitive_equals(adt_expected, adt_actual, as_message)

return
end subroutine

public subroutine assert_equals (readonly datetime adt_expected[], readonly datetime adt_actual[]);this.assert_equals(adt_expected, adt_actual, "")

return
end subroutine

public subroutine assert_equals (readonly decimal adc_expected[], readonly decimal adc_actual[], readonly string as_message);this.assert_primitive_equals(adc_expected, adc_actual, as_message)

return
end subroutine

public subroutine assert_equals (readonly decimal adc_expected[], readonly decimal adc_actual[]);this.assert_equals(adc_expected, adc_actual, "")

return
end subroutine

public subroutine assert_equals (readonly powerobject apo_expected[], readonly powerobject apo_actual[], readonly string as_message);this.assert_object_equals(apo_expected, apo_actual, as_message)

return
end subroutine

public subroutine assert_equals (readonly powerobject apo_expected[], readonly powerobject apo_actual[]);this.assert_equals(apo_expected, apo_actual, "")

return
end subroutine

public subroutine assert_equals (readonly string as_expected[], readonly string as_actual[], readonly string as_message);this.assert_primitive_equals(as_expected, as_actual, as_message)

return
end subroutine

public subroutine assert_equals (readonly string as_expected[], readonly string as_actual[]);this.assert_equals(as_expected, as_actual, "")

return
end subroutine

public subroutine assert_equals (readonly time at_expected[], readonly time at_actual[], readonly string as_message);this.assert_primitive_equals(at_expected, at_actual, as_message)

return
end subroutine

public subroutine assert_equals (readonly time at_expected[], readonly time at_actual[]);this.assert_equals(at_expected, at_actual, "")

return
end subroutine

public subroutine assert_null (readonly any aa_object, string as_message);if not isnull(aa_object) then
	if not isnull(as_message) and len(as_message) > 0 then
		as_message += " (object are not null)"
	end if
	this.fail(as_message)
end if

return
end subroutine

public subroutine assert_not_null (readonly any aa_object, string as_message);if isnull(aa_object) then
	if not isnull(as_message) and len(as_message) > 0 then
		as_message += " (object is null)"
	end if
	this.fail(as_message)
end if

return
end subroutine

public subroutine assert_valid (readonly powerobject apo, string as_message);if not isvalid(apo) then
	if not isnull(as_message) and len(as_message) > 0 then
		as_message += " (object are not valid)"
	end if
	this.fail(as_message)
end if

return
end subroutine

public subroutine assert_not_valid (readonly powerobject apo, string as_message);if isvalid(apo) then
	if not isnull(as_message) and len(as_message) > 0 then
		as_message += " (object are valid)"
	end if
	this.fail(as_message)
end if

return
end subroutine

public subroutine assert_same (readonly powerobject apo_expected, readonly powerobject apo_actual, readonly string as_message);if not apo_expected = apo_actual then
	this.assert_equals(apo_expected, apo_actual, as_message)
end if

return
end subroutine

public subroutine assert_same (readonly powerobject apo_expected, readonly powerobject apo_actual);this.assert_same(apo_expected, apo_actual, "")

return
end subroutine

public subroutine assert_not_same (readonly powerobject apo_expected, readonly powerobject apo_actual, readonly string as_message);if apo_expected = apo_actual then
	this.assert_not_equals(apo_expected, apo_actual, as_message)
end if

return
end subroutine

public subroutine assert_not_same (readonly powerobject apo_expected, readonly powerobject apo_actual);this.assert_not_same(apo_expected, apo_actual, "")

return
end subroutine

on n_assert.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_assert.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

