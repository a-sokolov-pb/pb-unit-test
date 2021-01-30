$PBExportHeader$n_app_settings.sru
forward
global type n_app_settings from nonvisualobject
end type
end forward

global type n_app_settings from nonvisualobject
end type
global n_app_settings n_app_settings

type variables
private:

constant string IS_SECTION = "HKEY_CURRENT_USER\Software\PBUnitTest"
constant string IS_PROMPT_ON_EXIT = "PromptOnExit"
constant string IS_LAST_TARGET_FILE = "LastTargetFile"
end variables

forward prototypes
public function boolean is_prompt_on_exit ()
public subroutine set_prompt_on_exit (readonly boolean ab_prompt_on_exit)
public function string get_last_target_file ()
public subroutine set_last_target_file (readonly string as_last_target_file)
end prototypes

public function boolean is_prompt_on_exit ();string ls_prompt_on_exit
registryget(IS_SECTION, IS_PROMPT_ON_EXIT, ref ls_prompt_on_exit)
if f_string().is_empty(ls_prompt_on_exit) then
	ls_prompt_on_exit = "true"
end if

return (ls_prompt_on_exit = "true")
end function

public subroutine set_prompt_on_exit (readonly boolean ab_prompt_on_exit);registryset(IS_SECTION, IS_PROMPT_ON_EXIT, string(ab_prompt_on_exit))

return
end subroutine

public function string get_last_target_file ();string ls_last_target_file
registryget(IS_SECTION, IS_LAST_TARGET_FILE, ref ls_last_target_file)

return ls_last_target_file
end function

public subroutine set_last_target_file (readonly string as_last_target_file);registryset(IS_SECTION, IS_LAST_TARGET_FILE, as_last_target_file)

return
end subroutine

on n_app_settings.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_app_settings.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

