unit uStubDllEventHandler;

interface
uses Classes, uStubCommon;


//Type    TOnInitMessageRecieved      =       PROCEDURE(Sender : TObject; Var InitData : TStub_InitObject) of object;
Type    TOnInitMessageRecieved      =       PROCEDURE(Sender : TObject) of object;
Type    TOnMessageRecieved          =       PROCEDURE(Sender : TObject; aMessage : String; Var Handled : Boolean) of object;
Type    TOnMessageDataRecieved      =       PROCEDURE(sender : TObject; aMessage : String; Data : TMessageParamRec; Var Handled : Boolean) of object;
Type    TOnGetExportedFunctions     =       PROCEDURE(sender : Tobject; aStringList : TStringList) of object;
Type    TOnAskForGroupDetails       =       PROCEDURE(sender : TObject; Var aGroupDetails : TGroupInfoRec) of object;
Type    TOnAskForListItemCaption    =       FUNCTION(Sender : TObject) : String of object;

type    TStubDllEventHandler        =       class(TComponent)
          Private
//          FOwnerInitData            :       TStub_InitObject;
          FOnAskForGroupDetails     :       TOnAskForGroupDetails;
          FOnAskForListItemCaption  :       TOnAskForListItemCaption;
          FOnStubInit               :       TOnInitMessageRecieved;
          FOnStubDeInit             :       TNotifyEvent;
          FOnMessageRecieved        :       TOnMessageRecieved;
          FOnMessageDataRecieved    :       TOnMessageDataRecieved;
          FOnGetExportedFunctions   :       TOnGetExportedFunctions;
          Public
          Published
          CONSTRUCTOR Create(AOwner : TComponent); override;
          DESTRUCTOR Destroy(); override;
          Protected
          Published
//          PROPERTY OwnerInitData : TStub_InitObject read FOwnerInitData write  FOwnerInitData;
          PROPERTY OnDllInit : TOnInitMessageRecieved read FOnStubInit write FOnStubInit;
          PROPERTY OnDllDeInit : TNotifyEvent read FOnStubDeInit write FOnStubDeInit;
          PROPERTY OnMessageRecieved :  TOnMessageRecieved read FOnMessageRecieved write FOnMessageRecieved;
          PROPERTY OnMessageDataRecieved : TOnMessageDataRecieved read FOnMessageDataRecieved write FOnMessageDataRecieved;
          PROPERTY OnGetExportedFunctions : TOnGetExportedFunctions read FOnGetExportedFunctions write FOnGetExportedFunctions;
          PROPERTY OnAskForGroupDetails : TOnAskForGroupDetails read FOnAskForGroupDetails write FOnAskForGroupDetails;
          PROPERTY OnAskForListItemCaption : TOnAskForListItemCaption read FOnAskForListItemCaption write FOnAskForListItemCaption;
end;


implementation



CONSTRUCTOR TStubDLlEventHandler.Create(AOwner: TComponent);
begin
  Inherited Create(AOwner);
end;

DESTRUCTOR TStubDllEventHandler.Destroy;
begin
//  if Assigned(FOwnerInitData) then FOwnerInitData.Free;

  Inherited Destroy();
end;

end.
