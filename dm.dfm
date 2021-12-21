object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 418
  Width = 702
  object fdConnect: TFDConnection
    Params.Strings = (
      'User_Name=root'
      'Database=agenda'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 640
    Top = 8
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Programas\Embarcadero RAD Studio XE8\libmysql.dll'
    Left = 504
    Top = 8
  end
  object qrySelect: TFDQuery
    Active = True
    Connection = fdConnect
    SQL.Strings = (
      'use agenda;'
      'select * from agendamento order by Data_Hora;')
    Left = 32
    Top = 16
  end
  object qrySelectLate: TFDQuery
    Active = True
    Connection = fdConnect
    SQL.Strings = (
      'select * from agendamento '
      'Where Data_Hora < CURRENT_TIMESTAMP();')
    Left = 32
    Top = 72
  end
  object qryCount: TFDQuery
    Connection = fdConnect
    SQL.Strings = (
      'SELECT COUNT(Data_Hora) as con'
      'FROM agendamento'
      'where Data_Hora < CURRENT_TIMESTAMP(); ')
    Left = 32
    Top = 136
  end
end
