$PBExportHeader$w_pb_unit_test.srw
forward
global type w_pb_unit_test from window
end type
type uo_tests from cv_tests within w_pb_unit_test
end type
type uo_test_output from cv_output within w_pb_unit_test
end type
type st_choose_pb_target from statictext within w_pb_unit_test
end type
type shl_find_tests from statichyperlink within w_pb_unit_test
end type
type shl_add_target from statichyperlink within w_pb_unit_test
end type
type ddplb_targets from dropdownpicturelistbox within w_pb_unit_test
end type
type uo_main_split from uo_split_container within w_pb_unit_test
end type
type n_gui_unit_test_runner_callback from n_test_runner_callback within w_pb_unit_test
end type
type n_gui_unit_test_output_callback from n_result_output_callback within w_pb_unit_test
end type
end forward

global type w_pb_unit_test from window
integer width = 2697
integer height = 1708
boolean titlebar = true
string title = "PB Unit Test GUI"
string menuname = "m_pb_unit_test"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event add_target ( )
event find_tests ( )
event run_tests ( )
event stop_process ( )
event getminmaxinfo pbm_getminmaxinfo
uo_tests uo_tests
uo_test_output uo_test_output
st_choose_pb_target st_choose_pb_target
shl_find_tests shl_find_tests
shl_add_target shl_add_target
ddplb_targets ddplb_targets
uo_main_split uo_main_split
n_gui_unit_test_runner_callback n_gui_unit_test_runner_callback
n_gui_unit_test_output_callback n_gui_unit_test_output_callback
end type
global w_pb_unit_test w_pb_unit_test

type variables
private:

boolean ib_in_pb_mode
boolean ib_running

int ii_target_picture_index

int ii_app_picture_index
int ii_library_picture_index
int ii_test_suite_picture_index
int ii_test_case_picture_index
int ii_test_item_picture_index

int ii_error_state_picture_index
int ii_failed_state_picture_index
int ii_ignored_state_picture_index
int ii_passed_state_picture_index
int ii_executing_state_picture_index

m_pb_unit_test im

n_unit_test_reflection in_ut_reflection
n_test_runner in_ut_runner
end variables

forward prototypes
private subroutine clear ()
private subroutine add_target ()
private subroutine set_current_target ()
private subroutine set_all_pb_targets ()
private subroutine find_tests () throws exception
private subroutine build_tree (readonly n_unit_test_library an_library, readonly long al_root_index)
private subroutine set_tv_data (readonly long al_index, readonly any aa_data)
private subroutine build_tree (readonly n_test_suite an_test_suite, readonly long al_root_index)
private function string get_test_label (readonly n_test an_test)
private subroutine run_tests (readonly n_test an_tests[])
private subroutine run_tests ()
private subroutine set_enabled (readonly boolean ab_enabled)
private function any get_tv_data (readonly long al_index)
private function boolean get_test_by_index (readonly long al_index, ref n_test an_test)
public function long find_test_index (readonly n_test an_test, readonly long al_root_index)
public function long find_test_index (readonly n_test an_test)
private subroutine set_state_picture_index (readonly long al_index, readonly integer ai_picture_index)
private function long get_tests_by_index (readonly long al_index, ref n_test an_tests[])
private function treeview get_tv ()
private subroutine stop_process ()
private subroutine reset_state_picture (readonly long al_index)
private subroutine run_tests (readonly long index)
end prototypes

event add_target();shl_add_target.triggerevent(clicked!)

return
end event

event find_tests();shl_find_tests.triggerevent(clicked!)

return
end event

event run_tests();this.run_tests()

return
end event

event stop_process();this.stop_process()

return
end event

event getminmaxinfo;n_minmaxinfo minmax
minmax.set_info(minmaxinfo &
              , PixelsToUnits(640, XPixelsToUnits!) &
				  , PixelsToUnits(480, YPixelsToUnits!))

return
end event

private subroutine clear ();uo_tests.clear()
uo_test_output.clear()
uo_test_output.reset_progress()

return
end subroutine

private subroutine add_target ();string ls_current_folder
ls_current_folder = getcurrentdirectory()

string ls_target_path

try
	string ls_file_name
	if not getfileopenname("Choose PB target file" &
						  , ref ls_target_path &
						  , ref ls_file_name &
						  , "pbt", "PB target PBT (*.pbt), *.pbt") = 1 then
		return
	end if
finally
	changedirectory(ls_current_folder)
end try

int li_index
li_index = ddplb_targets.finditem(ls_target_path, 0)
if not li_index > 0 then
	li_index = ddplb_targets.additem(ls_target_path, ii_target_picture_index)
end if

ddplb_targets.selectitem(li_index)
ddplb_targets.event selectionchanged(li_index)

return
end subroutine

private subroutine set_current_target ();shl_add_target.enabled = false
im.m_edit.m_add_target.enabled = false
st_choose_pb_target.enabled = false
ddplb_targets.enabled = false

string ls_current_target

int li_index
li_index = ddplb_targets.additem("Working with current PB application project", ii_target_picture_index)
ddplb_targets.selectitem(li_index)
ddplb_targets.event selectionchanged(li_index)

shl_find_tests.triggerevent(clicked!)
shl_find_tests.enabled = false
im.m_edit.m_find_tests.enabled = false

return
end subroutine

private subroutine set_all_pb_targets ();environment env
if getEnvironment(ref env) = 1 then
	string ls_registry_path = "HKEY_CURRENT_USER\Software\Sybase\PowerBuilder\"
	ls_registry_path +=  string(env.PBMajorRevision) + "." &
							 + string(env.PBMinorRevision) + "\Target"
	
	string ls_keys[]
	registrykeys(ls_registry_path, ls_keys)
	
	int li_key
	for li_key = 1 to upperbound(ls_keys)
		string ls_key
		ls_key = f_string().replace_all(ls_keys[li_key], "$", "\")
		ddplb_targets.additem(ls_key, ii_target_picture_index)
	next
	
	int li_index
	li_index = ddplb_targets.finditem(f_app_settings().get_last_target_file(), 0)
	if li_index > 0 then
		ddplb_targets.selectitem(li_index)
		ddplb_targets.event selectionchanged(li_index)
	end if
end if

return
end subroutine

private subroutine find_tests () throws exception;this.clear()
in_ut_reflection.set_target(ddplb_targets.text)

string ls_root_label
ls_root_label = in_ut_reflection.get_application_name()

n_unit_test_library ln_library[]
if not in_ut_reflection.get_all_libraries(ref ln_library) > 0 then
	ls_root_label += " (No tests found)"
end if

long ll_root_index
ll_root_index = this.get_tv().insertitemfirst(0, ls_root_label, ii_app_picture_index)

int li_library
for li_library = 1 to upperbound(ln_library)
	this.build_tree(ln_library[li_library], ll_root_index)
next

this.get_tv().setfocus()
this.get_tv().selectitem(ll_root_index)
this.get_tv().expandall(ll_root_index)
uo_tests.uo_start.set_enabled((upperbound(ln_library) > 0))
im.m_edit.m_run_tests.enabled = (upperbound(ln_library) > 0)

return
end subroutine

private subroutine build_tree (readonly n_unit_test_library an_library, readonly long al_root_index);long ll_library_index
ll_library_index = this.get_tv().insertitemlast(al_root_index &
									, an_library.get_name() &
									, ii_library_picture_index)

this.set_tv_data(ll_library_index, an_library)

n_test ln_tests[]
an_library.get_tests(ref ln_tests)

long ll_test
for ll_test = 1 to upperbound(ln_tests)
	n_test ln_test
	ln_test = ln_tests[ll_test]
	
	int li_picture_index
	if f_pb_addon().instance_of(ln_test.classdefinition, "n_test_suite") then
		li_picture_index = ii_test_suite_picture_index
	else
		li_picture_index = ii_test_case_picture_index
	end if
	
	long ll_test_index
	ll_test_index = this.get_tv().insertitemlast(ll_library_index &
													  , this.get_test_label(ln_test) &
													  , li_picture_index)

	if f_pb_addon().instance_of(ln_test.classdefinition, "n_test_suite") then
		n_test_suite ln_test_suite
		ln_test_suite = ln_test
		
		this.build_tree(ln_test_suite, ll_test_index)
	end if
	
	this.set_tv_data(ll_test_index, ln_test)
next

return
end subroutine

private subroutine set_tv_data (readonly long al_index, readonly any aa_data);treeviewitem ltvi
this.get_tv().getitem(al_index, ref ltvi)
ltvi.data = aa_data
this.get_tv().setitem(al_index, ltvi)

return
end subroutine

private subroutine build_tree (readonly n_test_suite an_test_suite, readonly long al_root_index);n_test_case ln_tests[]
an_test_suite.get_tests(ref ln_tests)

long ll_test
for ll_test = 1 to upperbound(ln_tests)
	n_test_case ln_test
	ln_test = ln_tests[ll_test]
	
	long ll_test_index
	ll_test_index = this.get_tv().insertitemlast(al_root_index &
	                                     , this.get_test_label(ln_test) &
													 , ii_test_item_picture_index)
	this.set_tv_data(ll_test_index, ln_test)
next

return
end subroutine

private function string get_test_label (readonly n_test an_test);string ls_test_label
if f_pb_addon().instance_of(an_test.classdefinition, "n_test_case") then
	n_test_case ln_test_case
	ln_test_case = an_test
	ls_test_label = ln_test_case.get_event_name()
else
	ls_test_label = an_test.get_object_name()
end if

if len(an_test.get_description()) > 0 then
	ls_test_label += " [" + an_test.get_description() + "]"
end if

return ls_test_label
end function

private subroutine run_tests (readonly n_test an_tests[]);in_ut_runner.run(an_tests)

return
end subroutine

private subroutine run_tests ();this.run_tests(this.get_tv().finditem(roottreeitem!, 0))

return
end subroutine

private subroutine set_enabled (readonly boolean ab_enabled);st_choose_pb_target.enabled = ab_enabled and not ib_in_pb_mode
ddplb_targets.enabled = ab_enabled and not ib_in_pb_mode
shl_add_target.enabled = ab_enabled and not ib_in_pb_mode
shl_find_tests.enabled = ab_enabled and len(ddplb_targets.text) > 0 and not ib_in_pb_mode
uo_tests.uo_start.set_enabled(ab_enabled)

im.m_edit.m_add_target.enabled = ab_enabled and not ib_in_pb_mode
im.m_edit.m_find_tests.enabled = ab_enabled and len(ddplb_targets.text) > 0 and not ib_in_pb_mode
im.m_edit.m_run_tests.enabled = ab_enabled

return
end subroutine

private function any get_tv_data (readonly long al_index);treeviewitem ltvi
this.get_tv().getitem(al_index, ref ltvi)
return ltvi.data
end function

private function boolean get_test_by_index (readonly long al_index, ref n_test an_test);any la_data
la_data = this.get_tv_data(al_index)
if isvalid(la_data) then
	powerobject lpo
	lpo = la_data
	if f_pb_addon().instance_of(lpo.classdefinition, "n_test") then
		an_test = lpo
		
		return true
	end if
end if

return false
end function

public function long find_test_index (readonly n_test an_test, readonly long al_root_index);long ll_item_index
ll_item_index = this.get_tv().finditem(childtreeitem!, al_root_index)
do while ll_item_index > 0
	n_test ln_test
	if this.get_test_by_index(ll_item_index, ref ln_test) then
		if ln_test = an_test then
			return ll_item_index
		end if
	end if
	
	long ll_test_index
	ll_test_index = this.find_test_index(an_test, ll_item_index)
	if ll_test_index > 0 then
		return ll_test_index
	end if
	
	ll_item_index = this.get_tv().finditem(nexttreeitem!, ll_item_index)
loop

return 0
end function

public function long find_test_index (readonly n_test an_test);return this.find_test_index(an_test, this.get_tv().finditem(roottreeitem!, 0))
end function

private subroutine set_state_picture_index (readonly long al_index, readonly integer ai_picture_index);treeviewitem ltvi
this.get_tv().getitem(al_index, ref ltvi)
ltvi.statepictureindex = ai_picture_index
this.get_tv().setitem(al_index, ltvi)

return
end subroutine

private function long get_tests_by_index (readonly long al_index, ref n_test an_tests[]);n_test ln_test
if this.get_test_by_index(al_index, ref ln_test) then
	long ll_index
	ll_index = upperbound(an_tests) + 1
	an_tests[ll_index] = ln_test
	if f_pb_addon().instance_of(ln_test.classdefinition, "n_test_suite") then
		return ll_index
	end if
end if

long ll_item_index
ll_item_index = this.get_tv().finditem(childtreeitem!, al_index)
do while ll_item_index > 0
	this.get_tests_by_index(ll_item_index, ref an_tests)
	ll_item_index = this.get_tv().finditem(nexttreeitem!, ll_item_index)
loop

return upperbound(an_tests)
end function

private function treeview get_tv ();return uo_tests.tv_tests
end function

private subroutine stop_process ();if messagebox(this.title &
				, "Stop process now?" &
				, question!, okcancel!) = 1 then
	in_ut_runner.stop()
end if
	
return
end subroutine

private subroutine reset_state_picture (readonly long al_index);treeviewitem ltvi
this.get_tv().getitem(al_index, ref ltvi)
ltvi.statepictureindex = 0
this.get_tv().setitem(al_index, ltvi)

long ll_item_index
ll_item_index = this.get_tv().finditem(childtreeitem!, al_index)
do while ll_item_index > 0
	this.reset_state_picture(ll_item_index)
	ll_item_index = this.get_tv().finditem(nexttreeitem!, ll_item_index)
loop

return
end subroutine

private subroutine run_tests (readonly long index);n_test ln_tests[]
this.get_tests_by_index(index, ref ln_tests)
this.reset_state_picture(index)
this.run_tests(ln_tests)

return
end subroutine

on w_pb_unit_test.create
if this.MenuName = "m_pb_unit_test" then this.MenuID = create m_pb_unit_test
this.uo_tests=create uo_tests
this.uo_test_output=create uo_test_output
this.st_choose_pb_target=create st_choose_pb_target
this.shl_find_tests=create shl_find_tests
this.shl_add_target=create shl_add_target
this.ddplb_targets=create ddplb_targets
this.uo_main_split=create uo_main_split
this.n_gui_unit_test_runner_callback=create n_gui_unit_test_runner_callback
this.n_gui_unit_test_output_callback=create n_gui_unit_test_output_callback
this.Control[]={this.uo_tests,&
this.uo_test_output,&
this.st_choose_pb_target,&
this.shl_find_tests,&
this.shl_add_target,&
this.ddplb_targets,&
this.uo_main_split}
end on

on w_pb_unit_test.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.uo_tests)
destroy(this.uo_test_output)
destroy(this.st_choose_pb_target)
destroy(this.shl_find_tests)
destroy(this.shl_add_target)
destroy(this.ddplb_targets)
destroy(this.uo_main_split)
destroy(this.n_gui_unit_test_runner_callback)
destroy(this.n_gui_unit_test_output_callback)
end on

event open;this.title = getapplication().displayname
uo_tests.init_components()
uo_tests.set_parent(this)
uo_test_output.init_components()
uo_main_split.set_objects(uo_tests, uo_test_output)
im = this.menuid

ii_target_picture_index = ddplb_targets.addpicture(".\assets\icon\target.ico")

ii_app_picture_index = this.get_tv().addpicture(".\assets\icon\application.ico")
ii_library_picture_index = this.get_tv().addpicture(".\assets\icon\library.ico")
ii_test_suite_picture_index = this.get_tv().addpicture(".\assets\icon\test_suite.ico")
ii_test_case_picture_index = this.get_tv().addpicture(".\assets\icon\test_case.ico")
ii_test_item_picture_index = this.get_tv().addpicture("VCRNext!")

ii_error_state_picture_index = this.get_tv().addstatepicture(".\assets\icon\error.ico")
ii_failed_state_picture_index = this.get_tv().addstatepicture(".\assets\icon\failed.ico")
ii_ignored_state_picture_index = this.get_tv().addstatepicture(".\assets\icon\ignored.ico")
ii_passed_state_picture_index = this.get_tv().addstatepicture(".\assets\icon\passed.ico")
ii_executing_state_picture_index = this.get_tv().addstatepicture(".\assets\icon\executing.ico")

ib_in_pb_mode = f_pb_addon().is_pb_mode()
if ib_in_pb_mode then
	// Working from PB mode
	in_ut_reflection = create n_unit_test_reflection_in_pb_mode
	this.set_current_target()
	this.title += " [PB mode]"
else
	// Working from Runtime mode
	in_ut_reflection = create n_unit_test_reflection
	this.set_all_pb_targets()
end if

in_ut_runner = create n_test_runner
in_ut_runner.set_output(n_gui_unit_test_output_callback) &
            .set_callback(n_gui_unit_test_runner_callback)

environment env
if getenvironment(ref env) = 1 then
	this.resize(pixelstounits(env.screenwidth * 0.7, xpixelstounits!) &
				 , pixelstounits(env.screenheight * 0.7, ypixelstounits!))
else
	this.resize(pixelstounits(800, xpixelstounits!) &
				 , pixelstounits(600, ypixelstounits!))
end if

return
end event

event resize;if not sizetype = 1 then
	uo_main_split.width = newwidth
	uo_main_split.height = newheight - uo_main_split.y
	ddplb_targets.width = newwidth - ddplb_targets.x
end if

return
end event

event closequery;if ib_running then
	return 1
end if

if f_app_settings().is_prompt_on_exit() then
	open(w_confirm_exit)
	if not message.doubleparm = 1 then
		return 1
	end if
end if

return 0
end event

type uo_tests from cv_tests within w_pb_unit_test
integer x = 50
integer y = 392
integer taborder = 30
end type

on uo_tests.destroy
call cv_tests::destroy
end on

event start;call super::start;parent.run_tests()

return
end event

event stop;call super::stop;parent.stop_process()

return
end event

event start_by_index;call super::start_by_index;parent.run_tests(index)

return
end event

type uo_test_output from cv_output within w_pb_unit_test
event destroy ( )
integer x = 795
integer y = 396
integer taborder = 40
end type

on uo_test_output.destroy
call cv_output::destroy
end on

type st_choose_pb_target from statictext within w_pb_unit_test
integer x = 23
integer y = 12
integer width = 471
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Choose PB target:"
boolean focusrectangle = false
boolean disabledlook = true
end type

type shl_find_tests from statichyperlink within w_pb_unit_test
integer x = 544
integer y = 180
integer width = 329
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 134217856
long backcolor = 67108864
boolean enabled = false
string text = "Find tests (F5)"
alignment alignment = center!
boolean focusrectangle = false
boolean disabledlook = true
end type

event clicked;try
	setpointer(hourglass!)
	
	parent.find_tests()
catch (exception err)
	messagebox(parent.title, err.getmessage(), exclamation!)
finally
	setpointer(arrow!)
end try

return
end event

type shl_add_target from statichyperlink within w_pb_unit_test
integer x = 23
integer y = 180
integer width = 535
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 134217856
long backcolor = 67108864
string text = "Add target... (Ctrl+T)"
alignment alignment = center!
boolean focusrectangle = false
boolean disabledlook = true
end type

event clicked;parent.add_target()

return
end event

type ddplb_targets from dropdownpicturelistbox within w_pb_unit_test
integer x = 5
integer y = 72
integer width = 2656
integer height = 1028
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
string picturename[] = {""}
long picturemaskcolor = 536870912
end type

event selectionchanged;if not index > 0 then
	return
end if

parent.clear()
shl_find_tests.enabled = true
uo_tests.uo_start.set_enabled(false)
uo_tests.uo_stop.set_enabled(false)
im.m_edit.m_find_tests.enabled = true
im.m_edit.m_run_tests.enabled = false
im.m_edit.m_stop_process.enabled = false
uo_test_output.reset_progress()

if not ib_in_pb_mode then
	f_app_settings().set_last_target_file(this.text(index))
end if

return
end event

type uo_main_split from uo_split_container within w_pb_unit_test
integer y = 260
integer width = 2656
integer height = 1264
integer taborder = 50
integer #proportion = 35
end type

on uo_main_split.destroy
call uo_split_container::destroy
end on

type n_gui_unit_test_runner_callback from n_test_runner_callback within w_pb_unit_test descriptor "pb_nvo" = "true" 
end type

event started;call super::started;ib_running = true
parent.set_enabled(false)
uo_tests.uo_stop.set_enabled(true)
uo_test_output.uo_progress.reset()
im.m_edit.m_stop_process.enabled = true

return
end event

on n_gui_unit_test_runner_callback.create
call super::create
end on

on n_gui_unit_test_runner_callback.destroy
call super::destroy
end on

event stopped;call super::stopped;ib_running = false
parent.set_enabled(true)
uo_tests.uo_stop.set_enabled(false)
im.m_edit.m_stop_process.enabled = false

return
end event

type n_gui_unit_test_output_callback from n_result_output_callback within w_pb_unit_test descriptor "pb_nvo" = "true" 
end type

on n_gui_unit_test_output_callback.create
call super::create
end on

on n_gui_unit_test_output_callback.destroy
call super::destroy
end on

event log;call super::log;uo_test_output.log(as_text)

return
end event

event running;call super::running;long ll_item_index
ll_item_index = parent.find_test_index(an_test)
if ll_item_index > 0 then
	parent.set_state_picture_index(ll_item_index &
					, ii_executing_state_picture_index)
end if

return
end event

event finished;call super::finished;long ll_item_index
ll_item_index = parent.find_test_index(an_result.get_test())
if ll_item_index > 0 then
	int li_picture_index
	choose case an_result.get_status()
		case n_test_result.IS_SKIPPED
			li_picture_index = ii_passed_state_picture_index
		case n_test_result.IS_FAILURE
			li_picture_index = ii_failed_state_picture_index
		case n_test_result.IS_ERRORS
			li_picture_index = ii_error_state_picture_index
		case n_test_result.IS_IGNORED
			li_picture_index = ii_ignored_state_picture_index
	end choose
	
	parent.set_state_picture_index(ll_item_index, li_picture_index)
end if

return
end event

event total_process;call super::total_process;uo_test_output.show_progress(an_process)

return
end event

