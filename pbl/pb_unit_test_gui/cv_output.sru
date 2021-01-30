$PBExportHeader$cv_output.sru
forward
global type cv_output from userobject
end type
type uo_progress from cv_progress within cv_output
end type
type uo_clear_all from cv_button within cv_output
end type
type uo_print from cv_button within cv_output
end type
type uo_auto_scroll_down from cv_button within cv_output
end type
type uo_word_wrap from cv_button within cv_output
end type
type mle_log from multilineedit within cv_output
end type
end forward

global type cv_output from userobject
integer width = 695
integer height = 460
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event resize pbm_size
uo_progress uo_progress
uo_clear_all uo_clear_all
uo_print uo_print
uo_auto_scroll_down uo_auto_scroll_down
uo_word_wrap uo_word_wrap
mle_log mle_log
end type
global cv_output cv_output

type variables

end variables

forward prototypes
public subroutine log (readonly string as_text)
public subroutine init_components ()
public subroutine show_progress (readonly n_test_result_process an_process)
public subroutine reset_progress ()
public subroutine clear ()
private subroutine resize_controls (readonly integer newwidth, readonly integer newheight)
private subroutine resize_controls ()
end prototypes

event resize;if not sizetype = 1 then
	this.resize_controls(newwidth, newheight)
end if

return
end event

public subroutine log (readonly string as_text);try
	mle_log.setredraw(false)
	
	if len(mle_log.text) > 0 then
		mle_log.text += "~r~n"
	end if
	
	mle_log.text += as_text
	if uo_auto_scroll_down.is_border() then
		mle_log.post selecttext(len(mle_log.text), 0)
	end if
finally
	mle_log.post setredraw(true)
end try

return
end subroutine

public subroutine init_components ();uo_word_wrap.set_picture(".\assets\image\word_wrap.bmp") &
            .set_tip_text("Use word wrap")
				
uo_auto_scroll_down.set_picture(".\assets\image\auto_scroll_down.bmp") &
                   .set_tip_text("Auto scroll down") &
						 .set_border(true)
						 
uo_print.set_picture(".\assets\image\print.bmp") &
        .set_tip_text("Print") &
		  .set_enabled(false)
		  
uo_clear_all.set_picture(".\assets\image\clear_all.bmp") &
            .set_tip_text("Clear all")

return
end subroutine

public subroutine show_progress (readonly n_test_result_process an_process);if not uo_progress.visible then
	uo_progress.move(0, 0)
	uo_progress.width = this.width
	mle_log.move(0, uo_progress.height)
	
	uo_word_wrap.y += uo_progress.height
	uo_auto_scroll_down.y += uo_progress.height
	uo_print.y += uo_progress.height
	uo_clear_all.y += uo_progress.height
	
	uo_progress.show()
	this.resize_controls()
end if

uo_progress.progress(an_process)

return
end subroutine

public subroutine reset_progress ();if uo_progress.visible then
	mle_log.move(0, 0)
	
	uo_word_wrap.y -= uo_progress.height
	uo_auto_scroll_down.y -= uo_progress.height
	uo_print.y -= uo_progress.height
	uo_clear_all.y -= uo_progress.height
	
	uo_progress.reset()
	uo_progress.hide()
	this.resize_controls()
end if

return
end subroutine

public subroutine clear ();mle_log.text = ""

return
end subroutine

private subroutine resize_controls (readonly integer newwidth, readonly integer newheight);mle_log.height = newheight - mle_log.y
mle_log.width = newwidth - uo_word_wrap.width - 10
uo_word_wrap.x = newwidth - uo_word_wrap.width - 5
uo_auto_scroll_down.x = newwidth - uo_auto_scroll_down.width - 5
uo_print.x = newwidth - uo_print.width - 5
uo_clear_all.x = newwidth - uo_clear_all.width - 5
uo_progress.width = newwidth

return
end subroutine

private subroutine resize_controls ();this.resize_controls(this.width, this.height)

return
end subroutine

on cv_output.create
this.uo_progress=create uo_progress
this.uo_clear_all=create uo_clear_all
this.uo_print=create uo_print
this.uo_auto_scroll_down=create uo_auto_scroll_down
this.uo_word_wrap=create uo_word_wrap
this.mle_log=create mle_log
this.Control[]={this.uo_progress,&
this.uo_clear_all,&
this.uo_print,&
this.uo_auto_scroll_down,&
this.uo_word_wrap,&
this.mle_log}
end on

on cv_output.destroy
destroy(this.uo_progress)
destroy(this.uo_clear_all)
destroy(this.uo_print)
destroy(this.uo_auto_scroll_down)
destroy(this.uo_word_wrap)
destroy(this.mle_log)
end on

type uo_progress from cv_progress within cv_output
boolean visible = false
integer taborder = 10
end type

on uo_progress.destroy
call cv_progress::destroy
end on

type uo_clear_all from cv_button within cv_output
integer x = 585
integer y = 316
integer taborder = 60
end type

on uo_clear_all.destroy
call cv_button::destroy
end on

event button_clicked;call super::button_clicked;parent.clear()

return
end event

type uo_print from cv_button within cv_output
integer x = 585
integer y = 212
integer taborder = 50
end type

on uo_print.destroy
call cv_button::destroy
end on

event button_clicked;call super::button_clicked;return
end event

type uo_auto_scroll_down from cv_button within cv_output
integer x = 585
integer y = 108
integer taborder = 40
end type

on uo_auto_scroll_down.destroy
call cv_button::destroy
end on

event button_clicked;call super::button_clicked;this.set_border(not this.is_border())

return
end event

type uo_word_wrap from cv_button within cv_output
integer x = 585
integer y = 4
integer taborder = 30
end type

on uo_word_wrap.destroy
call cv_button::destroy
end on

event button_clicked;call super::button_clicked;this.set_border(not this.is_border())
mle_log.hscrollbar = not this.is_border()

return
end event

type mle_log from multilineedit within cv_output
integer width = 581
integer height = 356
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean border = false
boolean hscrollbar = true
boolean vscrollbar = true
end type

