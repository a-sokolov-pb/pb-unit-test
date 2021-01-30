$PBExportHeader$cv_tests.sru
forward
global type cv_tests from userobject
end type
type tv_tests from treeview within cv_tests
end type
type uo_stop from cv_button within cv_tests
end type
type uo_start from cv_button within cv_tests
end type
end forward

global type cv_tests from userobject
integer width = 690
integer height = 484
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event resize pbm_size
event start ( )
event stop ( )
event start_by_index ( readonly long index )
tv_tests tv_tests
uo_stop uo_stop
uo_start uo_start
end type
global cv_tests cv_tests

type variables
private:

window iw
end variables

forward prototypes
public subroutine init_components ()
public subroutine clear ()
public subroutine set_parent (readonly window aw)
end prototypes

event resize;if not sizetype = 1 then
	uo_start.x = 5
	uo_stop.x = 5
	tv_tests.x = uo_stop.x + uo_stop.width + 5
	tv_tests.width = newwidth - tv_tests.x
	tv_tests.height = newheight
end if

return
end event

event start();return
end event

event stop();return
end event

event start_by_index(readonly long index);return
end event

public subroutine init_components ();uo_start.set_picture(".\assets\image\start.bmp") &
        .set_tip_text("Run tests (Ctrl+R)") &
	     .set_enabled(false)
		  
uo_stop.set_picture(".\assets\image\stop.bmp") &
        .set_tip_text("Stop process (Ctrl+S)") &
        .set_enabled(false)
		  
return
end subroutine

public subroutine clear ();do while tv_tests.finditem(roottreeitem!, 0) > 0
	tv_tests.deleteitem(tv_tests.finditem(roottreeitem!, 0))
loop

return
end subroutine

public subroutine set_parent (readonly window aw);iw = aw

return
end subroutine

on cv_tests.create
this.tv_tests=create tv_tests
this.uo_stop=create uo_stop
this.uo_start=create uo_start
this.Control[]={this.tv_tests,&
this.uo_stop,&
this.uo_start}
end on

on cv_tests.destroy
destroy(this.tv_tests)
destroy(this.uo_stop)
destroy(this.uo_start)
end on

type tv_tests from treeview within cv_tests
event run_all ( )
event run_selected ( )
integer x = 128
integer width = 544
integer height = 464
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean border = false
boolean linesatroot = true
boolean hideselection = false
boolean trackselect = true
boolean fullrowselect = true
integer picturewidth = 16
integer pictureheight = 16
long picturemaskcolor = 12632256
integer statepicturewidth = 16
integer statepictureheight = 16
long statepicturemaskcolor = 12632256
end type

event run_all();parent.event start()

return
end event

event run_selected();parent.event start_by_index(tv_tests.finditem(currenttreeitem!, 0))

return
end event

event rightclicked;if this.finditem(roottreeitem!, 0) > 0 then
	if handle > 0 then
		this.selectitem(handle)
	end if
	
	m_pb_unit_context_menu lm_context
	lm_context = create m_pb_unit_context_menu
	lm_context.set_requestor(this)
	
	lm_context.m_run_all.enabled = uo_start.is_enabled()
	lm_context.m_run_selected.enabled = uo_start.is_enabled() and handle > 0
	
	lm_context.popmenu(iw.pointerx() + 5, iw.pointery() + 5)
end if
					  
return
end event

type uo_stop from cv_button within cv_tests
integer x = 5
integer y = 108
integer taborder = 30
end type

on uo_stop.destroy
call cv_button::destroy
end on

event button_clicked;call super::button_clicked;parent.event stop()

return
end event

type uo_start from cv_button within cv_tests
integer x = 5
integer taborder = 20
end type

on uo_start.destroy
call cv_button::destroy
end on

event button_clicked;call super::button_clicked;parent.event start()

return
end event

