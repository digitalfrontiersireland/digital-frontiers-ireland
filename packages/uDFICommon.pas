unit uDFICommon;

interface
uses classes;

CONST
    VCL_TOOL_PAGE     =       'Digital Frontiers Ireland';


procedure Register();

implementation
uses uDllUtilsEx, uStubDllEventHandler, uPluginUtilsEx;

procedure Register();
Begin
  RegisterComponents(VCL_TOOL_PAGE,[TDLLManager,
                                    TPluginManager,
                                    TStubDllEventHandler]);
End;

end.
