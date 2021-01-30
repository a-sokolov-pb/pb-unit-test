$PBExportHeader$w_settings.srw
forward
global type w_settings from window
end type
type cbx_prompt_on_exit from checkbox within w_settings
end type
type cb_exit from commandbutton within w_settings
end type
end forward

global type w_settings from window
integer width = 1445
integer height = 456
boolean titlebar = true
string title = "Settings"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cbx_prompt_on_exit cbx_prompt_on_exit
cb_exit cb_exit
end type
global w_settings w_settings

on w_settings.create
this.cbx_prompt_on_exit=create cbx_prompt_on_exit
this.cb_exit=create cb_exit
this.Control[]={this.cbx_prompt_on_exit,&
this.cb_exit}
end on

on w_settings.destroy
destroy(this.cbx_prompt_on_exit)
destroy(this.cb_exit)
end on

event open;cbx_prompt_on_exit.checked = f_app_settings().is_prompt_on_exit()

return
end event

event resize;if not sizetype = 1 then
	cb_exit.move(newwidth - cb_exit.width - pixelstounits(5, xpixelstounits!) &
	              , newheight - cb_exit.height - pixelstounits(5, ypixelstounits!))
end if

return
end event

type cbx_prompt_on_exit from checkbox within w_settings
integer x = 23
integer y = 20
integer width = 443
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Prompt on Exit"
end type

event clicked;f_app_settings().set_prompt_on_exit(this.checked)

return
end event

type cb_exit from commandbutton within w_settings
integer x = 1074
integer y = 276
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
boolean cancel = true
end type

event clicked;close(parent)

return
end event

