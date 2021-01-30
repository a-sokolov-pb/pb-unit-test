$PBExportHeader$cv_progress.sru
forward
global type cv_progress from userobject
end type
type st_progress from statictext within cv_progress
end type
type st_status from statictext within cv_progress
end type
end forward

global type cv_progress from userobject
integer width = 361
integer height = 128
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event resize pbm_size
st_progress st_progress
st_status st_status
end type
global cv_progress cv_progress

type variables
private:

int ii_percent = 0
end variables

forward prototypes
public subroutine reset ()
public subroutine progress (readonly n_test_result_process an_process)
private subroutine restore_proportion ()
end prototypes

event resize;if not sizetype = 1 then
	st_status.move(0, this.height - st_status.height)
	st_status.width = newwidth
	
	this.restore_proportion()
end if

return
end event

public subroutine reset ();st_progress.backcolor = this.backcolor
st_status.text = ""
st_status.textcolor = 0

return
end subroutine

public subroutine progress (readonly n_test_result_process an_process);long ll_current
long ll_total_count
ll_current = an_process.get_run_count() + an_process.get_ignored_count()
ll_total_count = an_process.get_total_count()

string ls_current
string ls_total_count
string ls_failed_count
string ls_errors_count
string ls_ignored_count

ls_current = string(ll_current)
ls_total_count = string(ll_total_count)
ls_failed_count = string(an_process.get_failure_count())
ls_errors_count = string(an_process.get_errors_count())
ls_ignored_count = string(an_process.get_ignored_count())

st_status.text = ls_current + " of " + ls_total_count &
							+ " (failed: " + ls_failed_count &
							+ ", errors: " + ls_errors_count &
							+ ", ignored: " + ls_ignored_count + ")"
							
ii_percent = (100 / ll_total_count) * ll_current
this.restore_proportion()

long ll_back_color
long ll_text_color = 0
if an_process.get_errors_count() > 0 &
	or an_process.get_failure_count() > 0 then
	ll_back_color = rgb(255, 100, 100)
	ll_text_color = 255
else
	ll_back_color = rgb(100, 255, 100)
end if
st_status.textcolor = ll_text_color
st_progress.backcolor = ll_back_color
							
return 
end subroutine

private subroutine restore_proportion ();st_progress.width = (ii_percent / 100) * this.width

return
end subroutine

on cv_progress.create
this.st_progress=create st_progress
this.st_status=create st_status
this.Control[]={this.st_progress,&
this.st_status}
end on

on cv_progress.destroy
destroy(this.st_progress)
destroy(this.st_status)
end on

type st_progress from statictext within cv_progress
integer width = 357
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

type st_status from statictext within cv_progress
integer y = 60
integer width = 357
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
alignment alignment = center!
boolean focusrectangle = false
end type

