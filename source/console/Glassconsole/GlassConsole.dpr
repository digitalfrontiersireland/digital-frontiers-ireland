program GlassConsole;
{
  Ivan Malone
  Digital Frontiers Ireland
  Date: 29/08/2012

  Email: info@digitalfrontiersireland.com
    Web: http://www.digitalfrontiersireland.com

This software and its code are offered under the
GNU General Public License (gpl) version 3 or above.

See http://www.gnu.org/copyleft/gpl.html
}

{Todo List

  TODO: Add check windows version and report if unsupported
  TODO: Check if its possible to emulate the effect on older
        operating systems
}
{$APPTYPE CONSOLE}

uses
  Windows,
  SysUtils;

type
  DWM_BLURBEHIND = record
    dwFlags                 : DWORD;
    fEnable                 : BOOL;
    hRgnBlur                : HRGN;
    fTransitionOnMaximized  : BOOL;
  end;


  //function to enable the glass effect
  function DwmEnableBlurBehindWindow(hWnd : HWND; const pBlurBehind : DWM_BLURBEHIND) : HRESULT; stdcall; external  'dwmapi.dll' name 'DwmEnableBlurBehindWindow';

  //get the handle of the console window
  function GetConsoleWindow: HWND; stdcall; external kernel32 name 'GetConsoleWindow';

procedure ShowHelp();
Begin
  WriteLn('GlassConsole by Ivan Malone (ivanm@digitalfrontiersireland.com)');
  WriteLn('');
  WriteLn('This program is licensed under the terms of the GNU GPL v3');
  WriteLn('See http://www.gnu.org/licenses/gpl-3.0.html for further details');
  WriteLn('');
  WriteLn('   Email: support@digitalfrontiersireland.com');
  WriteLn('     WWW: www.digitalfrontiersireland.com');
  WriteLn('');
  WriteLn('Usage:');
  WriteLn(ExtractFileName(ParamStr(0)) + ' on - to enable glass effect');
  WriteLn(ExtractFileName(ParamStr(0)) + ' off - to disable glass effect');
  WriteLn('');
  WriteLn('Additional Switches to Enable glass: on/o/e/enabled/enable');
  WriteLn('Additional Switches to Disable glass: off/f/d/disabled/disable');
  WriteLn('');
  WriteLn('Supported Operating Systems');
  WriteLn('   Windows 2008, Vista, 7 and Above');
  WriteLn('   Windows 9x and XP are not supported');
  WriteLn('');

End;

procedure ProcessCommandLine();
function DWM_EnableBlurBehind(hwnd : HWND; AEnable: Boolean; hRgnBlur : HRGN = 0; ATransitionOnMaximized: Boolean = False; AFlags: Cardinal = 1): HRESULT;
var
  pBlurBehind : DWM_BLURBEHIND;
begin
  pBlurBehind.dwFlags:=AFlags;
  pBlurBehind.fEnable:=AEnable;
  pBlurBehind.hRgnBlur:=hRgnBlur;
  pBlurBehind.fTransitionOnMaximized:=ATransitionOnMaximized;
  Result:=DwmEnableBlurBehindWindow(hwnd, pBlurBehind);
end;
Begin
Try
    Begin
    if (Lowercase(ParamStr(1))  = 'on')       or
       (Lowercase(ParamStr(1))  = 'o')        or
       (LowerCase(ParamStr(1))  = 'e')        or
       (LowerCase(ParamStr(1))  = 'enabled')  or
       (LowerCase(ParamStr(1))  = 'enable')   then
          Begin
            // guess we should enable the glass effect
          DWM_EnableBlurBehind(GetConsoleWindow, True);
          Exit;
          End;
    if (Lowercase(ParamStr(1))  = 'off')      or
       (Lowercase(ParamStr(1))  = 'f')        or
       (LowerCase(ParamStr(1))  = 'd')        or
       (LowerCase(ParamStr(1))  = 'disabled') or
       (LowerCase(ParamStr(1)) = 'disable')   then
          Begin
            // guess we should disable the glass effect
          DWM_EnableBlurBehind(GetConsoleWindow, False);
          Exit;
          End;
    // if we got to here, then paramater was not understood
    Windows.Beep(1000,100);
    if ParamCount >= 1 then
       Begin
       WriteLn('Wow, watch where you throw those command line arguments!');
       WriteLn('Seriously, I dont have a clue what ' + ParamStr(1) + ' means so ' +
               'read the help screen provided to see what to throw at this program');
       WriteLn('');
       End;
    ShowHelp;
    End;
Except on E:Exception do
     Begin
     WriteLn('Something mad happened, maybe this isnt supported on your version of Windows!');
     WriteLn('');
     Writeln(E.Classname, ': ', E.Message);
     End;
  End;
End;

begin
//  try
    if ParamCount = 0 then
       Begin
         // Nothing on command line
         ShowHelp();
       End
    ELSE
       Begin
         // Paramaters entered
       ProcessCommandLine();
       End;
end.

