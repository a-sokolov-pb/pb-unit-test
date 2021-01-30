$PBExportHeader$w_confirm_exit.srw
forward
global type w_confirm_exit from window
end type
type p_icon from picture within w_confirm_exit
end type
type st_label from statictext within w_confirm_exit
end type
type cb_cancel from commandbutton within w_confirm_exit
end type
type cb_exit from commandbutton within w_confirm_exit
end type
type cbx_ask_me_again from checkbox within w_confirm_exit
end type
end forward

global type w_confirm_exit from window
integer width = 1431
integer height = 400
boolean titlebar = true
string title = "Confirm Exit"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 16777215
string icon = "AppIcon!"
boolean center = true
p_icon p_icon
st_label st_label
cb_cancel cb_cancel
cb_exit cb_exit
cbx_ask_me_again cbx_ask_me_again
end type
global w_confirm_exit w_confirm_exit

on w_confirm_exit.create
this.p_icon=create p_icon
this.st_label=create st_label
this.cb_cancel=create cb_cancel
this.cb_exit=create cb_exit
this.cbx_ask_me_again=create cbx_ask_me_again
this.Control[]={this.p_icon,&
this.st_label,&
this.cb_cancel,&
this.cb_exit,&
this.cbx_ask_me_again}
end on

on w_confirm_exit.destroy
destroy(this.p_icon)
destroy(this.st_label)
destroy(this.cb_cancel)
destroy(this.cb_exit)
destroy(this.cbx_ask_me_again)
end on

event resize;if not sizetype = 1 then
	cb_cancel.move(newwidth - cb_cancel.width - pixelstounits(5, xpixelstounits!) &
	              , newheight - cb_cancel.height - pixelstounits(5, ypixelstounits!))
	cb_exit.y = cb_cancel.y
	cb_exit.x = cb_cancel.x - cb_exit.width - pixelstounits(5, xpixelstounits!)
	cbx_ask_me_again.y = cb_exit.y + cb_exit.height / 2 - cbx_ask_me_again.height / 2
end if

return
end event

type p_icon from picture within w_confirm_exit
integer x = 27
integer y = 28
integer width = 146
integer height = 128
boolean originalsize = true
string picturename = ".\assets\image\msg_question.bmp"
boolean focusrectangle = false
end type

type st_label from statictext within w_confirm_exit
integer x = 233
integer y = 36
integer width = 1147
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
string text = "Are you sure you want to exit PB Unit Test?"
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within w_confirm_exit
integer x = 1038
integer y = 192
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
boolean cancel = true
end type

event clicked;close(parent)

return
end event

type cb_exit from commandbutton within w_confirm_exit
integer x = 681
integer y = 192
integer width = 343
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Exit"
boolean default = true
end type

event clicked;closewithreturn(parent, 1)

return
end event

type cbx_ask_me_again from checkbox within w_confirm_exit
integer x = 27
integer y = 204
integer width = 549
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "Do not ask me again"
end type

event clicked;f_app_settings().set_prompt_on_exit(not this.checked)

return
end event

