{ -----------------------------------------------------------------------------
  Unit Name: UIVMsgs
  Purpose:   UI生成的一些消息
  History:
  ----------------------------------------------------------------------------- }

unit UIVMsgs;

interface

uses
  VMsgMonitor, Classes, Windows;

type
  TBaseUIVMsg = class(TVMsg);

  TUpdateAppColorMsg = class(TVMsg)
  end;





implementation

// { TUIIMUserBaseInfoChangedMsg }
//
// function TUIIMUserBaseInfoChangedMsg.Clone: TVMsg;
// begin
// Result := TUIIMUserBaseInfoChangedMsg.Create;
// Result.Assign(Self);
// end;

initialization


end.

