unit uDFICommon;

interface
uses classes;

CONST
    VCL_TOOL_PAGE     =       'Digital Frontiers Ireland';




procedure Register();

implementation
uses uDllUtilsEx, uStubDllEventHandler, uCustomLists;


procedure Register();
Begin
  RegisterComponents(VCL_TOOL_PAGE,[TDLLManager,
                                    TStubDllEventHandler,
                                    TFileManager]);
End;

end.
