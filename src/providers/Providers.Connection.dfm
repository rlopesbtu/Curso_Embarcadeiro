object ProvidersConnection: TProvidersConnection
  OldCreateOrder = False
  Height = 217
  Width = 217
  object FDPhysPgDriverLink: TFDPhysPgDriverLink
    VendorHome = 'C:\Users\Ricardo\Documents\Curso Horse\rest\business'
    Left = 40
    Top = 80
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=Curso_Pooled')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 16
  end
end
