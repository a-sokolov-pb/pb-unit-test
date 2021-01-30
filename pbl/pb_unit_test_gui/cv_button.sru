$PBExportHeader$cv_button.sru
forward
global type cv_button from userobject
end type
type p_button from picture within cv_button
end type
end forward

global type cv_button from userobject
integer width = 105
integer height = 92
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event button_clicked ( )
p_button p_button
end type
global cv_button cv_button

type variables
private:

boolean ib_border
boolean ib_enabled = true
string is_enabled_picture
string is_disabled_picture

long il_back_color
end variables

forward prototypes
public function boolean is_enabled ()
public function cv_button set_border (readonly boolean ab_border)
public function cv_button set_enabled (readonly boolean ab_enabled)
public function cv_button set_picture (readonly string as_enabled_picture, readonly string as_disabled_picture)
public function cv_button set_tip_text (readonly string as_tip_text)
public function cv_button set_picture (readonly string as_enabled_picture)
public function boolean is_border ()
end prototypes

event button_clicked();return
end event

public function boolean is_enabled ();return ib_enabled
end function

public function cv_button set_border (readonly boolean ab_border);ib_border = ab_border

if ib_border then
	this.backcolor = rgb(135, 135, 135)
else
	this.backcolor = il_back_color
end if

return this
end function

public function cv_button set_enabled (readonly boolean ab_enabled);ib_enabled = ab_enabled

if ib_enabled then
	p_button.picturename = is_enabled_picture
else
	p_button.picturename = is_disabled_picture
end if

return this
end function

public function cv_button set_picture (readonly string as_enabled_picture, readonly string as_disabled_picture);is_enabled_picture = as_enabled_picture
is_disabled_picture = as_disabled_picture

p_button.picturename = is_enabled_picture

return this
end function

public function cv_button set_tip_text (readonly string as_tip_text);p_button.powertiptext = as_tip_text

return this
end function

public function cv_button set_picture (readonly string as_enabled_picture);long ll_pos
ll_pos = lastpos(as_enabled_picture, "\")

string ls_disabled_picture
ls_disabled_picture = left(as_enabled_picture, ll_pos) &
					    + "disabled\" + right(as_enabled_picture, len(as_enabled_picture) - ll_pos)


return this.set_picture(as_enabled_picture, ls_disabled_picture)
end function

public function boolean is_border ();return ib_border
end function

on cv_button.create
this.p_button=create p_button
this.Control[]={this.p_button}
end on

on cv_button.destroy
destroy(this.p_button)
end on

event constructor;il_back_color = this.backcolor

return
end event

type p_button from picture within cv_button
integer x = 9
integer y = 8
integer width = 87
integer height = 76
boolean focusrectangle = false
end type

event clicked;if parent.ib_enabled then
	parent.event button_clicked()
end if

return
end event

