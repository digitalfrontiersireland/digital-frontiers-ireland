unit uStubDllRequired;

interface
uses  uStubCommon, Classes, ComCtrls;

// TODO: Need to redesign the messaging system now that everything works here


        function stub_Initialize(Var InitData : TStub_InitObject) : boolean; export;
        function stub_Deinitalize() : boolean; export; stdcall
        FUNCTION stub_MessageIn(aMessage : String;  Var Handled : Boolean) : boolean export;
        FUNCTION stub_MessageInWithData( aMessage : String; Data : TObject;  Var Handled : Boolean) : boolean export;
        PROCEDURE stub_GetExportedFunctionNames(Sender : TObject; Var aStringList : TStringlist); export;
        FUNCTION stub_AskForListItemCaption(Sender : TObject) : string; export;
        FUNCTION stub_AskForGroupDetails(Sender : TObject) : TGroupInfoRec; export;



exports stub_Initialize,
        stub_Deinitalize,
        stub_MessageIn,
        stub_MessageInWithData,
        stub_GetExportedFunctionNames,
        stub_AskForGroupDetails,
        stub_AskForListItemCaption;

implementation
uses udmStubDll;
Var
  IsInitOk : boolean;

function stub_AskForListItemCaption(Sender : TObject) : string; export;
Begin
if (Assigned(dmStubDll) = true) AND (IsInitOk = true) then
  Begin
  if Assigned(dmStubDll.StubEventHandler.OnAskForListItemCaption) then
//     Assigned(aListItem) then
     Begin
     Result := dmStubDll.StubEventHandler.OnAskForListItemCaption(Sender);
     End;

  End;
End;

FUNCTION stub_AskForGroupDetails(Sender : TObject) : TGroupInfoRec; export;
Begin
if (Assigned(dmStubDll) = true) AND (IsInitOk = true) then
  Begin
  if Assigned(dmStubDll.StubEventHandler.OnAskForGroupDetails) then
     Begin
       Result := dmStubDll.StubEventHandler.OnAskForGroupDetails(Sender);
     End;
  End;
End;

PROCEDURE stub_GetExportedFunctionNames(Sender : TObject; Var aStringList : TStringlist);
Begin
if (Assigned(aStringList) = true) AND (IsInitOk = true) then
   Begin
     // return exported functions
   aStringList.Clear;
   // Add default required functions to the list
   aStringList.Add(FUNC_PREFIX_STUB + FUNC_Init);
   aStringList.Add(FUNC_PREFIX_STUB + FUNC_deinit);
   aStringList.Add(FUNC_PREFIX_STUB + FUNC_Message);
   aStringList.Add(FUNC_PREFIX_STUB + FUNC_MessageData);
   aStringList.Add(FUNC_PREFIX_STUB + FUNC_GetExportedFunctionNames);
   aStringList.Add(FUNC_PREFIX_STUB + FUNC_AskForGroupDetails);
   aStringList.Add(FUNC_PREFIX_STUB + FUNC_AskForListItemCaption);

   if Assigned(dmStubDll.StubEventHandler.OnGetExportedFunctions) then
      Begin
      dmStubDll.StubEventHandler.OnGetExportedFunctions(Sender,aStringList);
      End;

   End;
End;


function stub_Initialize(Var InitData : TStub_InitObject) : boolean; export;
Begin
if not Assigned(dmStubDll) then dmStubDll := TdmStubDll.Create(NIL);
if (Assigned(dmStubDll) = true)  AND (IsInitOk = false) then
   Begin
   if Assigned(dmStubDll.StubEventHandler.OnDllInit) then
      Begin
      dmStubDll.StubEventHandler.OnDllInit(dmStubDll.StubEventHandler, InitData);
      dmStubDll.StubEventHandler.OwnerInitData := InitData;
      End;
   IsInitOk := True;
   Result := True;
   End
else
   Begin
     Result := False;
   End;

End;

function stub_Deinitalize() : boolean; export;
Begin
if (Assigned(dmStubDll) = true)  AND (IsInitOk = true) then
   Begin
   if Assigned(dmStubDll.StubEventHandler.OnDllDeInit) then
      Begin
      dmStubDll.StubEventHandler.OnDllDeInit(dmStubDll.StubEventHandler);
      End;
   dmStubDll.StubEventHandler.OwnerInitData := nil;
   IsInitOk := False; // set to false so init can be called again
   Result := True;
   End
else
   Begin
     REsult := False;
   End;
End;


FUNCTION stub_MessageIn( aMessage : String;  Var Handled : Boolean) : boolean export;
Begin
if (Assigned(dmStubDll) = True) AND
   (IsInitOk = true) then
   Begin
   if Assigned(dmStubDll.StubEventHandler.OnMessageRecieved) then
      Begin
      dmStubDll.StubEventHandler.OnMessageRecieved(dmStubDll.StubEventHandler, aMessage, Handled);
      End
   ELSE
      Begin
      // There is no handler assigned so it can't have been handled here
      Handled := False;
      End;
   Result := True;
   End
else
   Begin
     Handled := False;
     Result := False;
   End;
End;

FUNCTION stub_MessageInWithData(aMessage : String; Data : TObject;  Var Handled : Boolean) : boolean export;
Begin
if (Assigned(dmStubDll) = True) AND
   (IsInitOk = true) then
   Begin
   if Assigned(dmStubDll.StubEventHandler.OnMessageDataRecieved) then
      Begin
      dmStubDll.StubEventHandler.OnMessageDataRecieved(dmStubDll.StubEventHandler,aMessage,Data, Handled);
      End
   ELSE
      Begin
      // There is no handler assigned so it can't have been handled here
      Handled := False;
      End;
     Result := True;
   End
ELSE
   Begin
   Handled := False;
   Result := False;
   End;
End;



initialization
  Begin
  IsInitOk := false;


  End;
finalization
  Begin
  if Assigned(dmStubDll) then dmStubDll.Free;

//  FreeAndNil(dmStubDll);
  End;



end.
