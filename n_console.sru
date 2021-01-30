$PBExportHeader$n_console.sru
forward
global type n_console from nonvisualobject
end type
end forward

global type n_console from nonvisualobject
end type
global n_console n_console

type prototypes
FUNCTION boolean AttachConsole(long ProcID) LIBRARY "kernel32.dll"
FUNCTION long GetStdHandle(long nStdHandle) LIBRARY "kernel32.dll"
FUNCTION int FreeConsole() LIBRARY "Kernel32.dll"
FUNCTION ulong WriteConsole(long Handle, String OutPut, long NumCharsToWrite, &
     REF long NumCharsWritten, long reserved) LIBRARY "Kernel32.dll" ALIAS FOR "WriteConsoleW"
SUBROUTINE keybd_event( int bVk, int bScan, int dwFlags, int dwExtraInfo) LIBRARY "user32.dll"
SUBROUTINE ExitProcess(ulong uExitCode) LIBRARY "kernel32.dll"
function integer MultiByteToWideChar (uint CodePage,  ulong dwFlags,  ref string lpMultiByteStr, int cbMultiByte,  ref blob lpWideCharStr,  int cchWideChar) LIBRARY "kernel32.dll"
//FUNCTION ulong SetConsoleOutputCP(ulong wCodePageID) LIBRARY "kernel32.dll"
//FUNCTION ulong SetConsoleCP(ulong wCodePageID) LIBRARY "kernel32.dll"
//FUNCTION boolean CharToOemA(ref string src, ref string dst) LIBRARY "USER32.DLL"
end prototypes

type variables
private:

CONSTANT long ATTACH_PARENT_PROCESS = -1

CONSTANT long STD_OUTPUT_HANDLE = -11
CONSTANT long STD_ERROR_HANDLE = -12
CONSTANT long STD_INPUT_HANDLE = -10
long hwnd
end variables

forward prototypes
public subroutine println (readonly string as_value)
private function blob ansi2unicode (string as_value, unsignedinteger ai_codepage)
end prototypes

public subroutine println (readonly string as_value);string s
s = as_value + "~r~n"

IF not (Handle(GetApplication()) = 0 OR IsNull(hwnd)) THEN
	long result
	
//	string ls_unicode_value
//	ls_unicode_value = string(this.ansi2unicode(s, 866))
//	WriteConsole(hwnd, ls_unicode_value, len(ls_unicode_value), result, 0)
	WriteConsole(hwnd, s, len(s), result, 0)
else
	messagebox("Console", s)
end if

return
end subroutine

private function blob ansi2unicode (string as_value, unsignedinteger ai_codepage);blob lc_buff
integer li_output_size
string ls_temp_buff
integer li_input_size

SetNull(lc_buff)

li_input_size = len(as_value)
li_output_size = len(blob(as_value))

if li_input_size = li_output_size then 
	//ANSI
	//convert
	lc_buff = Blob("*")
	li_output_size = MultiByteToWideChar (ai_codepage,  0,  as_value, li_input_size,  lc_buff,  0)
	
	if li_output_size > 0 then
		ls_temp_buff = Space(li_output_size * 2)
		lc_buff = blob(ls_temp_buff)
		li_output_size = MultiByteToWideChar (ai_codepage,  0,  as_value, li_input_size,  lc_buff,  li_output_size)
	else
		lc_buff = blob('')
	end if
else
	//UNICODE
	//not convert
	lc_buff = blob(as_value)
end if

return lc_buff
end function

on n_console.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_console.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;IF Handle(GetApplication()) > 0 THEN
   IF AttachConsole(ATTACH_PARENT_PROCESS) THEN
      hwnd = GetStdHandle(STD_OUTPUT_HANDLE)
   ELSE
      SetNull(hwnd)
   END IF
END IF

return
end event

event destructor;IF Handle(GetApplication()) > 0 THEN
   keybd_event( 13, 1, 0, 0 )
   FreeConsole()
   ExitProcess(1)
END IF

return
end event

