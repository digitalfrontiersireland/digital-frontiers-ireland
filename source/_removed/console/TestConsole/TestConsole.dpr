program TestConsole;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    WriteLn(GetCurrentDir);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
