object dmStubDll: TdmStubDll
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 150
  Width = 215
  object StubDllEventHandler: TStubDllEventHandler
    IPCServerName = 'TStubDllEventHandler'
    Left = 56
    Top = 24
  end
end