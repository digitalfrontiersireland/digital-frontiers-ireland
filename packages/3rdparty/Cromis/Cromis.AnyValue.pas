(*
 * This software is distributed under BSD license.
 *
 * Copyright (c) 2006-2010 Iztok Kacin, Cromis (iztok.kacin@gmail.com).
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice, this
 *   list of conditions and the following disclaimer in the documentation and/or
 *   other materials provided with the distribution.
 * - Neither the name of the Iztok Kacin nor the names of its contributors may be
 *   used to endorse or promote products derived from this software without specific
 *   prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * ==================================================================================
 * Common unit for Cromis library
 * ==================================================================================
 * 08/03/2010 (1.0.0)
 *   - Initial release
 *   - IAnyValue, TAnyValue implementations
 * ==================================================================================
 * 26/07/2010 (1.0.1)
 *   - Added avtDateTime
 * ==================================================================================
 * 15/08/2010 (1.0.2)
 *   - Added Items property to enable iteration over all values
 *   - Added Count property
 * ==================================================================================
 * 08/10/2010 (1.0.3)
 *   - Use generic list instead of interface list for newer compilers
 * ==================================================================================
 * 28/12/2010 (1.0.4)
 *   - Create new interface object for each assignment to avoid interface sharing
 * ==================================================================================
 * 13/06/2011 (1.0.5)
 *   - Added AnsiString support
 * ==================================================================================
 * 16/06/2011 (1.1.0)
 *   - TAnyValue detached from interfaces. Uses Variants as internal storage
 *   - AsPointer, AsVariant properties added to TAnyValue and IAnyValue
 * ==================================================================================
 * 17/06/2011 (1.1.1)
 *   - IAnyValue uses TAnyValue now internally
 * ==================================================================================
 * 21/06/2011 (1.2.0)
 *   - TAnyValue uses TVarRec for simple data types and Variants for complex ones
 * ==================================================================================
 * 23/06/2011 (1.3.0)
 *   - TAnyValue uses TVarRec for simple data types and array of byes for complex ones
 * ==================================================================================
*)
unit Cromis.AnyValue;

interface

uses
  SysUtils, Classes {$IF CompilerVersion >= 20}, Generics.Collections {$IFEND};

type
  TValueType = (avtNone, avtBoolean, avtInteger, avtInt64, avtCardinal, avtFloat, avtString,
                avtObject, avtPointer, avtInterface, avtAnsiString, avtWideString,
                avtDateTime);


  IAnyValue = Interface(IInterface)
  ['{9D866D8B-6FEC-4633-B968-AF8677AF6B40}']
    function GetName: string;
    function GetAsInt64: Int64;
    function GetAsFloat: Extended;
    function GetAsString: string;
    function GetAsObject: TObject;
    function GetAsInteger: Integer;
    function ValueType: TValueType;
    function GetAsBoolean: Boolean;
    function GetAsPointer: Pointer;
    function GetAsCardinal: Cardinal;
    function GetAsDateTime: TDateTime;
    function GetAsInterface: IInterface;
    {$IFDEF UNICODE}
    function GetAsAnsiString: AnsiString;
    {$ENDIF}
    function GetAsWideString: WideString;
    procedure SetName(const Value: string);
    procedure SetAsString(const Value: string);
    procedure SetAsInt64(const Value: Int64);
    procedure SetAsFloat(const Value: Extended);
    procedure SetAsObject(const Value: TObject);
    procedure SetAsInteger(const Value: Integer);
    procedure SetAsBoolean(const Value: Boolean);
    procedure SetAsPointer(const Value: Pointer);
    procedure SetAsCardinal(const Value: Cardinal);
    procedure SetAsDateTime(const Value: TDateTime);
    procedure SetAsInterface(const Value: IInterface);
    {$IFDEF UNICODE}
    procedure SetAsAnsiString(const Value: AnsiString);
    {$ENDIF}
    procedure SetAsWideString(const Value: WideString);
    property Name: string read GetName write SetName;
    property AsInt64: Int64 read GetAsInt64 write SetAsInt64;
    property AsFloat: Extended read GetAsFloat write SetAsFloat;
    property AsString: string read GetAsString write SetAsString;
    property AsObject: TObject read GetAsObject write SetAsObject;
    property AsBoolean: Boolean read GetAsBoolean write SetAsBoolean;
    property AsInteger: Integer read GetAsInteger write SetAsInteger;
    property AsPointer: Pointer read GetAsPointer write SetAsPointer;
    property AsCardinal: Cardinal read GetAsCardinal write SetAsCardinal;
    property AsDateTime: TDateTime read GetAsDateTime write SetAsDateTime;
    property AsInterface: IInterface read GetAsInterface write SetAsInterface;
    {$IFDEF UNICODE}
    property AsAnsiString: AnsiString read GetAsAnsiString write SetAsAnsiString;
    {$ENDIF}
    property AsWideString: WideString read GetAsWideString write SetAsWideString;
  end;

  IValueList = Interface(IInterface)
  ['{54B01683-17B0-4719-B620-48FDF31BC574}']
    function GetCount: Integer;
    function GetItems(const Index: Integer): IAnyValue;
    function Get(const Name: string): IAnyValue;
    function Exists(const Name: string): Boolean;
    function Ensure(const Name: string): IAnyValue;
    property Items[const Index: Integer]: IAnyValue read GetItems;
    property Count: Integer read GetCount;
    procedure Clear;
  end;

  TSimpleData = record { do not pack this record; it is compiler-generated }
    case Byte of
      vtInteger:   (VInteger: Integer);
      vtBoolean:   (VBoolean: Boolean);
      vtObject:    (VObject: TObject);
      vtPointer:   (VPointer: Pointer);
      vtClass:     (VClass: TClass);
      vtWideChar:  (VWideChar: WideChar);
      vtChar:      (VChar: AnsiChar);
      vtInt64:     (VInt64: Int64);
      vtExtended:  (VExtended: Extended);
  end;

  TAnyValue = packed record
  private
    FValueType: TValueType;
    FSimpleData: TSimpleData;
    FComplexData: array of Byte;
    function GetAsBoolean: Boolean; inline;
    function GetAsCardinal: Cardinal; inline;
    function GetAsFloat: Extended; inline;
    function GetAsInt64: Int64; inline;
    function GetAsInteger: Integer; inline;
    function GetAsInterface: IInterface; inline;
    function GetAsObject: TObject; inline;
    function GetAsString: string; inline;
    function GetAsPointer: Pointer; inline;
    function GetAsDateTime: TDateTime; inline;
    function GetAsWideString: WideString; inline;
    {$IFDEF UNICODE}
    function  GetAsAnsiString: AnsiString; inline;
    {$ENDIF}
    procedure SetAsBoolean(const Value: Boolean); inline;
    procedure SetAsCardinal(const Value: Cardinal); inline;
    procedure SetAsFloat(const Value: Extended); inline;
    procedure SetAsInt64(const Value: Int64); inline;
    procedure SetAsInteger(const Value: Integer); inline;
    procedure SetAsInterface(const Value: IInterface); inline;
    procedure SetAsObject(const Value: TObject); inline;
    procedure SetAsString(const Value: string); inline;
    procedure SetAsDateTime(const Value: TDateTime); inline;
    {$IFDEF UNICODE}
    procedure SetAsAnsiString(const Value: AnsiString); inline;
    {$ENDIF}
    procedure SetAsWideString(const Value: WideString); inline;
    procedure SetAsPointer(const Value: Pointer); inline;
  public
    procedure Clear; inline;
    function IsNil: Boolean; inline;
    function IsEmpty: Boolean; inline;
    function ValueSize: Integer; inline;
    function ValueType: TValueType; inline;
    class function Null: TAnyValue; static; inline;
    function Equal(const Value: TAnyValue): Boolean;
    class operator Implicit(const Value: Boolean): TAnyValue; inline;
    class operator Implicit(const Value: Extended): TAnyValue; inline;
    class operator Implicit(const Value: Integer): TAnyValue; inline;
    class operator Implicit(const Value: Int64): TAnyValue; inline;
    class operator Implicit(const Value: string): TAnyValue; inline;
    class operator Implicit(const Value: IInterface): TAnyValue; inline;
    class operator Implicit(const Value: WideString): TAnyValue; inline;
    {$IFDEF UNICODE}
    class operator Implicit(const Value: AnsiString): TAnyValue; inline;
    {$ENDIF}
    class operator Implicit(const Value: Pointer): TAnyValue; inline;
    class operator Implicit(const Value: TObject): TAnyValue; inline;
    class operator Implicit(const Value: TDateTime): TAnyValue; inline;
    class operator Implicit(const Value: TAnyValue): Int64; inline;
    class operator Implicit(const Value: TAnyValue): TObject; inline;
    class operator Implicit(const Value: TAnyValue): Extended; inline;
    class operator Implicit(const Value: TAnyValue): string; inline;
    class operator Implicit(const Value: TAnyValue): Integer; inline;
    class operator Implicit(const Value: TAnyValue): WideString; inline;
    {$IFDEF UNICODE}
    class operator Implicit(const Value: TAnyValue): AnsiString; inline;
    {$ENDIF}
    class operator Implicit(const Value: TAnyValue): Boolean; inline;
    class operator Implicit(const Value: TAnyValue): IInterface; inline;
    class operator Implicit(const Value: TAnyValue): TDateTime; inline;
    class operator Implicit(const Value: TAnyValue): Pointer; inline;
    property AsInt64: Int64 read GetAsInt64 write SetAsInt64;
    property AsFloat: Extended read GetAsFloat write SetAsFloat;
    property AsBoolean: Boolean read GetAsBoolean write SetAsBoolean;
    property AsCardinal: Cardinal read GetAsCardinal write SetAsCardinal;
    property AsInteger: Integer read GetAsInteger write SetAsInteger;
    property AsInterface: IInterface read GetAsInterface write SetAsInterface;
    property AsPointer: Pointer read GetAsPointer write SetAsPointer;
    property AsObject: TObject read GetAsObject write SetAsObject;
    property AsString: string read GetAsString write SetAsString;
    {$IFDEF UNICODE}
    property AsAnsiString: AnsiString read GetAsAnsiString write SetAsAnsiString;
    {$ENDIF}
    property AsWideString: WideString read GetAsWideString write SetAsWideString;
    property AsDateTime: TDateTime read GetAsDateTime write SetAsDateTime;
  end;

  // acquire function that returns the interface
  function AcquireValueList: IValueList;
  function AcquireValue: IAnyValue;

implementation

type
  TAnyValueObject = class(TInterfacedObject, IAnyValue)
  private
    FName: string;
    FValue: TAnyValue;
    function GetName: string;
    function GetAsInt64: Int64;
    function GetAsFloat: Extended;
    function GetAsString: string;
    function GetAsObject: TObject;
    function GetAsInteger: Integer;
    function GetAsBoolean: Boolean;
    function GetAsPointer: Pointer;
    function GetAsCardinal: Cardinal;
    function GetAsDateTime: TDateTime;
    function GetAsInterface: IInterface;
    {$IFDEF UNICODE}
    function GetAsAnsiString: AnsiString;
    {$ENDIF}
    function GetAsWideString: WideString;
    procedure SetName(const Value: string);
    procedure SetAsString(const Value: string);
    procedure SetAsInt64(const Value: Int64);
    procedure SetAsFloat(const Value: Extended);
    procedure SetAsObject(const Value: TObject);
    procedure SetAsInteger(const Value: Integer);
    procedure SetAsBoolean(const Value: Boolean);
    procedure SetAsPointer(const Value: Pointer);
    procedure SetAsCardinal(const Value: Cardinal);
    procedure SetAsDateTime(const Value: TDateTime);
    procedure SetAsInterface(const Value: IInterface);
    {$IFDEF UNICODE}
    procedure SetAsAnsiString(const Value: AnsiString);
    {$ENDIF}
    procedure SetAsWideString(const Value: WideString);
  public
    constructor Create;
    function ValueType: TValueType;
    property Name: string read GetName write SetName;
    property AsInt64: Int64 read GetAsInt64 write SetAsInt64;
    property AsFloat: Extended read GetAsFloat write SetAsFloat;
    property AsString: string read GetAsString write SetAsString;
    property AsObject: TObject read GetAsObject write SetAsObject;
    property AsBoolean: Boolean read GetAsBoolean write SetAsBoolean;
    property AsInteger: Integer read GetAsInteger write SetAsInteger;
    property AsPointer: Pointer read GetAsPointer write SetAsPointer;
    property AsCardinal: Cardinal read GetAsCardinal write SetAsCardinal;
    property AsDateTime: TDateTime read GetAsDateTime write SetAsDateTime;
    property AsInterface: IInterface read GetAsInterface write SetAsInterface;
    {$IFDEF UNICODE}
    property AsAnsiString: AnsiString read GetAsAnsiString write SetAsAnsiString;
    {$ENDIF}
    property AsWideString: WideString read GetAsWideString write SetAsWideString;
  end;

  TValueList = class(TInterfacedObject, IValueList)
  private
  {$IF CompilerVersion >= 20}
    FValuesList: TList<IInterface>;
  {$ELSE}
    FValuesList: TInterfaceList;
  {$IFEND}
    function GetItems(const Index: Integer): IAnyValue;
    function GetCount: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    function Get(const Name: string): IAnyValue;
    function Ensure(const Name: string): IAnyValue;
    function Exists(const Name: string): Boolean;
    property Items[const Index: Integer]: IAnyValue read GetItems;
    property Count: Integer read GetCount;
    procedure Clear;
  end;

  function AcquireValueList: IValueList;
  begin
    Result := TValueList.Create;
  end;

  function AcquireValue: IAnyValue;
  begin
    Result := TAnyValueObject.Create;
  end;

{ TTaskValue }

constructor TAnyValueObject.Create;
begin
  FValue.Clear;
end;

{$IFDEF UNICODE}
function TAnyValueObject.GetAsAnsiString: AnsiString;
begin
  Result := FValue.AsAnsiString;
end;
{$ENDIF}

function TAnyValueObject.GetAsBoolean: Boolean;
begin
  Result := FValue.AsBoolean;
end;

function TAnyValueObject.GetAsCardinal: Cardinal;
begin
  Result := FValue.AsCardinal;
end;

function TAnyValueObject.GetAsDateTime: TDateTime;
begin
  Result := FValue.AsDateTime;
end;

function TAnyValueObject.GetAsFloat: Extended;
begin
  Result := FValue.AsFloat;
end;

function TAnyValueObject.GetAsInt64: Int64;
begin
  Result := FValue.AsInt64;
end;

function TAnyValueObject.GetAsInteger: Integer;
begin
  Result := FValue.AsInteger;
end;

function TAnyValueObject.GetAsInterface: IInterface;
begin
  Result := FValue.AsInterface;
end;

function TAnyValueObject.GetAsObject: TObject;
begin
  Result := FValue.AsObject;
end;

function TAnyValueObject.GetAsPointer: Pointer;
begin
  Result := FValue.AsPointer;
end;

function TAnyValueObject.GetAsString: string;
begin
  Result := FValue.AsString;
end;

function TAnyValueObject.GetAsWideString: WideString;
begin
  Result := FValue.AsWideString;
end;

function TAnyValueObject.GetName: string;
begin
  Result := FName;
end;

{$IFDEF UNICODE}
procedure TAnyValueObject.SetAsAnsiString(const Value: AnsiString);
begin
  FValue.AsAnsiString := Value;
end;
{$ENDIF}

procedure TAnyValueObject.SetAsBoolean(const Value: Boolean);
begin
  FValue.AsBoolean := Value;
end;

procedure TAnyValueObject.SetAsCardinal(const Value: Cardinal);
begin
  FValue.AsCardinal := Value;
end;

procedure TAnyValueObject.SetAsDateTime(const Value: TDateTime);
begin
  FValue.AsDateTime := Value;
end;

procedure TAnyValueObject.SetAsFloat(const Value: Extended);
begin
  FValue.AsFloat := Value;
end;

procedure TAnyValueObject.SetAsInt64(const Value: Int64);
begin
  FValue.AsInt64 := Value;
end;

procedure TAnyValueObject.SetAsInteger(const Value: Integer);
begin
  FValue.AsInteger := Value;
end;

procedure TAnyValueObject.SetAsInterface(const Value: IInterface);
begin
  FValue.AsInterface := Value;
end;

procedure TAnyValueObject.SetAsObject(const Value: TObject);
begin
  FValue.AsObject := Value;
end;

procedure TAnyValueObject.SetAsPointer(const Value: Pointer);
begin
  FValue.AsPointer := Value;
end;

procedure TAnyValueObject.SetAsString(const Value: string);
begin
  FValue.AsString := Value;
end;

procedure TAnyValueObject.SetAsWideString(const Value: WideString);
begin
  FValue.AsWideString := Value;
end;

procedure TAnyValueObject.SetName(const Value: string);
begin
  FName := Value;
end;

function TAnyValueObject.ValueType: TValueType;
begin
  Result := FValue.ValueType;
end;

{ TTaskValues }

procedure TValueList.Clear;
begin
  FValuesList.Clear;
end;

constructor TValueList.Create;
begin
{$IF CompilerVersion >= 20}
  FValuesList := TList<IInterface>.Create;
{$ELSE}
  FValuesList := TInterfaceList.Create;
{$IFEND}
end;

destructor TValueList.Destroy;
begin
  FreeAndNil(FValuesList);

  inherited;
end;

function TValueList.Get(const Name: string): IAnyValue;
var
  I: Integer;
begin
  Result := nil;

  for I := 0 to FValuesList.Count - 1 do
  begin
    if SameText(Name, IAnyValue(FValuesList[I]).Name) then
    begin
      Result := IAnyValue(FValuesList[I]);
      Exit;
    end;
  end;
end;

function TValueList.GetCount: Integer;
begin
  Result := FValuesList.Count;
end;

function TValueList.GetItems(const Index: Integer): IAnyValue;
begin
  Result := IAnyValue(FValuesList.Items[Index]);
end;

function TValueList.Ensure(const Name: string): IAnyValue;
begin
  Result := Get(Name);

  if Result = nil then
  begin
    Result := TAnyValueObject.Create;
    FValuesList.Add(Result);
    Result.Name := Name;
  end;
end;

function TValueList.Exists(const Name: string): Boolean;
begin
  Result := Get(Name) <> nil;
end;

{ TAnyValue }

procedure TAnyValue.Clear;
begin
  FValueType := avtNone;
  SetLength(FComplexData, 0);
end;

{$IFDEF UNICODE}
function TAnyValue.GetAsAnsiString: AnsiString;
begin
  case FValueType of
    avtNone: Result := '';
    avtBoolean: Result := AnsiString(BoolToStr(AsBoolean, True));
    avtInteger: Result := AnsiString(IntToStr(AsInteger));
    avtFloat: Result := AnsiString(FloatToStr(AsFloat));
    avtWideString: Result := AnsiString(AsWideString);
    avtString: Result := AnsiString(AsString);
    avtAnsiString:
      begin
        case Length(FComplexData) = 0 of
          False: SetString(Result, PAnsiChar(@FComplexData[0]), Length(FComplexData) div SizeOf(AnsiChar));
          True: Result := '';
        end;
      end;
    else
      raise Exception.Create('Value cannot be converted to AnsiString');
  end;
end;
{$ENDIF}

function TAnyValue.GetAsBoolean: Boolean;
begin
  Result := FSimpleData.VBoolean;
end;

function TAnyValue.GetAsCardinal: Cardinal;
begin
  Result := Cardinal(FSimpleData.VInt64);
end;

function TAnyValue.GetAsDateTime: TDateTime;
begin
  Result := FSimpleData.VExtended;
end;

function TAnyValue.GetAsFloat: Extended;
begin
  Result := FSimpleData.VExtended;
end;

function TAnyValue.GetAsInt64: Int64;
begin
  Result := FSimpleData.VInt64;
end;

function TAnyValue.GetAsInteger: Integer;
begin
  Result := FSimpleData.VInteger;
end;

function TAnyValue.GetAsInterface: IInterface;
begin
  Result := IUnknown(FSimpleData.VPointer);
end;

function TAnyValue.GetAsObject: TObject;
begin
  Result := FSimpleData.VObject;
end;

function TAnyValue.GetAsPointer: Pointer;
begin
  Result := FSimpleData.VPointer;
end;

function TAnyValue.GetAsString: string;
begin
  case FValueType of
    avtNone: Result := '';
    avtBoolean: Result := BoolToStr(AsBoolean, True);
    avtCardinal: Result := IntToStr(AsCardinal);
    avtInteger: Result := IntToStr(AsInteger);
    avtInt64: Result := IntToStr(AsInt64);
    avtFloat: Result := FloatToStr(AsFloat);
    avtDateTime: Result := DateTimeToStr(AsDateTime);
    avtString:
      begin
        case Length(FComplexData) = 0 of
          False: SetString(Result, PChar(@FComplexData[0]), Length(FComplexData) div SizeOf(Char));
          True: Result := '';
        end;
      end;
  {$IFDEF UNICODE}
    avtAnsiString: Result := string(AsAnsiString);
  {$ENDIF}
    avtWideString: Result := AsWideString;
    else
      raise Exception.Create('Value cannot be converted to string');
  end;
end;

function TAnyValue.GetAsWideString: WideString;
begin
  case FValueType of
    avtNone: Result := '';
    avtBoolean: Result := BoolToStr(AsBoolean, True);
    avtInteger: Result := IntToStr(AsInteger);
    avtFloat: Result := FloatToStr(AsFloat);
  {$IFDEF UNICODE}
    avtAnsiString: Result := WideString(AsAnsiString);
  {$ENDIF}
    avtWideString:
      begin
        case Length(FComplexData) = 0 of
          False: SetString(Result, PWideChar(@FComplexData[0]), Length(FComplexData) div SizeOf(WideChar));
          True: Result := '';
        end;
      end;
    avtString: Result := AsString;
    else
      raise Exception.Create('Value cannot be converted to WideString');
  end;
end;

class operator TAnyValue.Implicit(const Value: string): TAnyValue;
begin
  Result.AsString := Value;
end;

class operator TAnyValue.Implicit(const Value: Int64): TAnyValue;
begin
  Result.AsInt64 := Value;
end;

class operator TAnyValue.Implicit(const Value: TObject): TAnyValue;
begin
  Result.AsObject := Value;
end;

class operator TAnyValue.Implicit(const Value: IInterface): TAnyValue;
begin
  Result.AsInterface := Value;
end;

class operator TAnyValue.Implicit(const Value: Boolean): TAnyValue;
begin
  Result.AsBoolean := Value;
end;

class operator TAnyValue.Implicit(const Value: Integer): TAnyValue;
begin
  Result.AsInteger := Value;
end;

class operator TAnyValue.Implicit(const Value: Extended): TAnyValue;
begin
  Result.AsFloat := Value;
end;

class operator TAnyValue.Implicit(const Value: TAnyValue): WideString;
begin
  Result := Value.AsWideString;
end;

class operator TAnyValue.Implicit(const Value: TAnyValue): Integer;
begin
  Result := Value.AsInteger;
end;

class operator TAnyValue.Implicit(const Value: TAnyValue): Boolean;
begin
  Result := Value.AsBoolean;
end;

{$IFDEF UNICODE}
class operator TAnyValue.Implicit(const Value: AnsiString): TAnyValue;
begin
  Result.AsAnsiString := Value;
end;
{$ENDIF}

class operator TAnyValue.Implicit(const Value: WideString): TAnyValue;
begin
  Result.AsWideString := Value;
end;

class operator TAnyValue.Implicit(const Value: TDateTime): TAnyValue;
begin
  Result.AsDateTime := Value;
end;

function TAnyValue.IsEmpty: Boolean;
begin
  Result := FValueType = avtNone;
end;

function TAnyValue.IsNil: Boolean;
begin
  Result := (FValueType = avtPointer) and (AsPointer = nil);
end;

class function TAnyValue.Null: TAnyValue;
begin
  Result.Clear;
end;

class operator TAnyValue.Implicit(const Value: TAnyValue): IInterface;
begin
  Result := Value.AsInterface;
end;

class operator TAnyValue.Implicit(const Value: TAnyValue): TObject;
begin
  Result := Value.AsObject;
end;

class operator TAnyValue.Implicit(const Value: TAnyValue): Int64;
begin
  Result := Value.AsInt64;
end;

class operator TAnyValue.Implicit(const Value: TAnyValue): string;
begin
  Result := Value.AsString;
end;

class operator TAnyValue.Implicit(const Value: TAnyValue): Extended;
begin
  Result := Value.AsFloat;
end;

class operator TAnyValue.Implicit(const Value: TAnyValue): TDateTime;
begin
  Result := Value.AsDateTime;
end;

class operator TAnyValue.Implicit(const Value: Pointer): TAnyValue;
begin
  Result.AsPointer := Value;
end;

class operator TAnyValue.Implicit(const Value: TAnyValue): Pointer;
begin
  Result := Value.AsPointer;
end;

function TAnyValue.Equal(const Value: TAnyValue): Boolean;
begin
  Result := FValueType = Value.ValueType;

  if Result then
  begin
    case FValueType of
      avtNone: Result := Value.IsEmpty;
      avtBoolean: Result := AsBoolean = Value.AsBoolean;
      avtInteger: Result := AsInteger = Value.AsInteger;
      avtInt64: Result := AsInt64 = Value.AsInt64;
      avtCardinal: Result := AsCardinal = Value.AsCardinal;
      avtFloat: Result := AsFloat = Value.AsFloat;
      avtString: Result := AsString = Value.AsString;
      avtObject: Result := AsObject = Value.AsObject;
      avtPointer: Result := AsPointer = Value.AsPointer;
      avtInterface: Result := AsInterface = Value.AsInterface;
      avtWideString: Result := AsWideString = Value.AsWideString;
      avtDateTime: Result := AsDateTime = Value.AsDateTime;
    {$IFDEF UNICODE}
      avtAnsiString: Result := AsAnsiString = Value.AsAnsiString;
    {$ENDIF}
    end;
  end;
end;

{$IFDEF UNICODE}
class operator TAnyValue.Implicit(const Value: TAnyValue): AnsiString;
begin
  Result := Value.AsAnsiString;
end;

procedure TAnyValue.SetAsAnsiString(const Value: AnsiString);
var
  Size: Integer;
begin
  FValueType := avtAnsiString;

  Size := Length(Value) * SizeOf(AnsiChar);
  SetLength(FComplexData, Size);

  if Size > 0 then
    Move(Value[1], FComplexData[0], Size);
end;
{$ENDIF}

procedure TAnyValue.SetAsBoolean(const Value: Boolean);
begin
  FValueType := avtBoolean;
  FSimpleData.VBoolean := Value;
end;

procedure TAnyValue.SetAsCardinal(const Value: Cardinal);
begin
  FValueType := avtCardinal;
  FSimpleData.VInt64 := Value;
end;

procedure TAnyValue.SetAsDateTime(const Value: TDateTime);
begin
  FValueType := avtDateTime;
  FSimpleData.VExtended := Value;
end;

procedure TAnyValue.SetAsFloat(const Value: Extended);
begin
  FValueType := avtFloat;
  FSimpleData.VExtended := Value;
end;

procedure TAnyValue.SetAsInt64(const Value: Int64);
begin
  FValueType := avtInt64;
  FSimpleData.VInt64 := Value;
end;

procedure TAnyValue.SetAsInteger(const Value: Integer);
begin
  FValueType := avtInteger;
  FSimpleData.VInt64 := Value;
end;

procedure TAnyValue.SetAsInterface(const Value: IInterface);
begin
  IUnknown(FSimpleData.VPointer) := IUnknown(Value);
  FValueType := avtInterface;
end;

procedure TAnyValue.SetAsObject(const Value: TObject);
begin
  FSimpleData.VObject := VAlue;
  FValueType := avtObject;
end;

procedure TAnyValue.SetAsPointer(const Value: Pointer);
begin
  FSimpleData.VPointer := VAlue;
  FValueType := avtPointer;
end;

procedure TAnyValue.SetAsString(const Value: string);
var
  Size: Integer;
begin
  FValueType := avtString;

  Size := Length(Value)* SizeOf(Char);
  SetLength(FComplexData, Size);

  if Size > 0 then
    Move(Value[1], FComplexData[0], Size);
end;

procedure TAnyValue.SetAsWideString(const Value: WideString);
var
  Size: Integer;
begin
  FValueType := avtWideString;

  Size := Length(Value) * SizeOf(WideChar);
  SetLength(FComplexData, Size);

  if Size > 0 then
    Move(Value[1], FComplexData[0], Size);
end;

function TAnyValue.ValueSize: Integer;
begin
  Result := 0;

  case FValueType of
    avtNone: Result := 0;
    avtBoolean: Result := SizeOf(Boolean);
    avtInteger: Result := SizeOf(Integer);
    avtInt64: Result := SizeOf(Int64);
    avtCardinal: Result := SizeOf(Cardinal);
    avtFloat: Result := SizeOf(Extended);
    avtString: Result := Length(FComplexData) * SizeOf(Char);
    avtObject: Result := SizeOf(TObject);
    avtPointer: Result := SizeOf(Pointer);
    avtInterface: Result := SizeOf(IInterface);
    avtWideString: Result := Length(FComplexData) * SizeOf(WideChar);
    avtDateTime: Result := SizeOf(TDateTime);
  {$IFDEF UNICODE}
    avtAnsiString: Result := Length(FComplexData) * SizeOf(AnsiChar);
  {$ENDIF}
  end;
end;

function TAnyValue.ValueType: TValueType;
begin
  Result := FValueType;
end;

end.
