unit uStubCommon;

interface
uses   SysUtils, IniFiles, StrUtils, Classes, Windows;

Const
          ERROR_INCORRECT_DLL       =       'A Plugin has been corrupted or is not of the correct format';
          ERROR_STUBDLL_INIT_FAIL   =       'Note: There may have been one or more errors while attempting to initialize a plugin!';
          ERROR_STUBDLL_DEINIT_FAIL   =     'Note: There may have been one or more errors while attempting to deinitalize a plugin!';
          ERROR_NO_TOKEN            =       'A plugin returned an invalid or empty init token';
          ERROR_FORMLOAD            =       'Something went wrong while trying create an application window...';
          ERROR_DOUBLEINIT          =       'An Attempt to initalise a plugin failed because the plugin has already been initialized';
          ERROR_MISSINGEXPORTEDFUNC =       'Failed to find Exported Function name in DLL Exports, was it added to the plugins export list at compile time? Not Found: ';

          FUNC_PREFIX_STUB          =       'stub_';
//          STUB_SHOW_ABOUT           =       'stub_show_about';

          FUNC_Init                 =       'Initialize';
          FUNC_deinit               =       'Deinitalize';
          FUNC_Message              =       'MessageIn';
          FUNC_MessageData          =       'MessageInWithData';
          FUNC_GetExportedFunctionNames=    'GetExportedFunctionNames';
          FUNC_AskForGroupDetails   =       'AskForGroupDetails';
          FUNC_AskForListItemCaption=       'AskForListItemCaption';

          DEFAULT_INI_EXT           =       '.ini';

Type    TGroupDescriptionDataRec    =       packed record
        Top                         :       string;
        Bottom                      :       string;
end;

Type    TTextDataRec              =       packed record
        Text                      :       string;
        Align                     :       TAlignment;
end;

Type    TGroupInfoRec         =       packed record
        Header                :       TTextDataRec;
        Footer                :       TTextDataRec;
        Description           :       TGroupDescriptionDataRec;
        ExtendedImage         :       integer;
        TitleImage            :       integer;
        SubsetTitle           :       String;
        Subtitle              :       String;
end;


Type      TStub_AdditionalInfoRec   =       record
 //         PluginName                :       string;
          CompanyName               :       string;
          CompanyURL                :       string;
          CompanyEmail              :       string;
          CompanyComment            :       string;
          end;

Type      TStub_InitObject          =       class
          Private
          FAdditionalInfo           :       TStub_AdditionalInfoRec;
          FAppFolder                :       string;
          FAppName                  :       string;
          FAppExtension             :       string;
          FWorkingFolderRoot        :       String;
          FOwnerExe                 :       TFileName;
          FOwnerHandle              :       THandle;
          FDataStore                :       String;
          FIniFile                  :       TIniFile;
          Public
          // Constructor
          constructor Create(const aWorkingFolder   : String;
                             const aOwnerExe        : TFileName;
                             const aOwnerHandle     : THandle;
                             const aDataStore       : String);
          PROCEDURE SetAddInfo(aInfo : TStub_AdditionalInfoRec);
          PROPERTY AppFolder : string read FAppFolder;
          PROPERTY AppName : string read FAppName;
          PROPERTY AppExtension : string read FAppExtension;
          PROPERTY WorkingFolderRoot : string Read FWorkingFolderRoot;
          PROPERTY OwnerExe : TFileName read FOwnerExe;
          PROPERTY OwnerHandle : THandle read FOwnerHandle;
          PROPERTY DataStore : string read FDataStore;
          PROPERTY IniFile : TIniFile read FIniFile write FIniFile;
          PROPERTY AdditionalInfo : TStub_AdditionalInfoRec read FAdditionalInfo write SetAddInfo;
          // Events
end;


Type      TMessageParamRec          =       record
          L_Param                   :       lParam;
          W_Param                   :       wParam;
          end;

Type      TFUNC_Initialize          =       FUNCTION(Var InitData : TStub_InitObject) : boolean;
Type      TFUNC_Deinitalize         =       FUNCTION() : boolean;
Type      TFUNC_Message             =       FUNCTION(aMessage : String; Var Handled : Boolean) : boolean;
Type      TFUNC_MessageWithData     =       FUNCTION(aMessage : String; aData : TMessageParamRec;  Var Handled : Boolean) : boolean;
Type      TFUNC_GetGroupDetails     =       FUNCTION(Sender : TOBject) : TGroupInfoRec;
//Type      TFUNC_GetListItemCaption  =       FUNCTION(Sender : TObject) : string;
Type      TFUNC_GetStr              =       FUNCTION(Sender : TObject) : string;
Type      TGetExportedFunctionNames =       PROCEDURE(Sender : TObject; Var aStringList : TStringlist);


implementation

constructor TStub_InitObject.Create(const aWorkingFolder   : String;
                                    const aOwnerExe        : TFileName;
                                    const aOwnerHandle     : THandle;
                                    const aDataStore       : string);
Var
  TempInt : integer;
Begin
FWorkingFolderRoot  := aWorkingFolder;
FOwnerExe           := aOwnerExe;
FOwnerHandle        := aOwnerHandle;
FDataStore          := aDataStore;

FAppFolder          := ExtractFilePath(FOwnerExe);
FAppName            := ExtractFileName(FOwnerExe); // exe name of this application
FAppExtension       := ExtractFileExt(FAppName); // Extension of this application

// get position of Extension in AppName
TempInt := Pos(FAppExtension,FAppName);

// Construct IniFileName from AppName - Position of Extension
FDataStore := LeftStr(AppName,TempInt-1);
FDataStore := FDataStore + DEFAULT_INI_EXT;

if DirectoryExists(FWorkingFolderRoot) then
   Begin
   FIniFile := TIniFile.Create(IncludeTrailingPathDelimiter(FWorkingFolderRoot) + FDataStore);
   End;
End;



PROCEDURE TStub_InitObject.SetAddInfo(aInfo : TStub_AdditionalInfoRec);
Begin
FAdditionalInfo.CompanyName := aInfo.CompanyName;
FAdditionalInfo.CompanyURL := aInfo.CompanyURL;
FAdditionalInfo.CompanyEmail := aInfo.CompanyEmail;
FAdditionalInfo.CompanyComment := aInfo.CompanyComment;
End;

end.
