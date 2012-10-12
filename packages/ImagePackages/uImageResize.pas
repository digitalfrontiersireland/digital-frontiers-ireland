unit uImageResize;

interface
uses Classes, Vcl.Graphics, SysUtils, Types;

Type        TDirtyImageResize         =         class(TComponent)
            Protected
            FFiles                    :         TStringList;
            FImageList                :         TList;
            FResizeW                  :         integer;
            FResizeH                  :         integer;
            Private
            Public
            PROCEDURE AddFiles(Var aFileList : TStrings);
            PROCEDURE DoResize();
            PROCEDURE Reset();
            CONSTRUCTOR Create(AOwner : TComponent); override;
            DESTRUCTOR Destroy(); override;
            Published
            PROPERTY ToWidth : integer read FResizeW write FResizeW default 200;
            PROPERTY ToHeight : integer read FResizeH write FResizeH default 150;
            PROPERTY Images: TList read FImageList;
end;

implementation

PROCEDURE TDirtyImageResize.Reset();
Var
  Image : TPicture;
  i : integer;
Begin
   for i := 0 to FImageList.Count - 1 do
        Begin
        Image := FImageList.Items[i];
        FreeAndNil(Image);
        End;
   FImageList.Clear;

   FFiles.Clear;
End;

CONSTRUCTOR TDirtyImageResize.Create(AOwner: TComponent);
begin
  Inherited Create(AOwner);

  FFiles := TStringList.Create;

  FImageList := TList.Create;

end;

DESTRUCTOR TDirtyImageResize.Destroy;
begin
  Reset;
  FImageList.Free;
  Inherited Destroy();
end;

PROCEDURE TDirtyImageResize.AddFiles(Var aFileList: TStrings);
Var
  i         :     integer;
  Image     :     TPicture;
begin
if assigned(aFileList) then
   Begin
   // Clear lists
   Reset;

   // Load images and add to list
     for i := 0 to aFileList.Count - 1 do
        Begin
        if FileExists(aFileList.Strings[i]) then
           Begin
           Image := TPicture.Create;
           Image.LoadFromFile(aFileList.Strings[i]);
           FImageList.Add(Image);
           End;
        End;
   End;
end;

PROCEDURE TDirtyImageResize.DoResize;
Var
  thumbRect : TRect;
  i : integer;
  image : TPicture;
begin
  thumbRect.Left := 0;
  thumbRect.Top := 0;

  for i := 0 to FImageList.Count - 1 do
     Begin
     Image := FImageList.Items[i];

     if Image.Bitmap.Width > Image.Bitmap.Height then
       begin
         thumbRect.Right := ToWidth;
         thumbRect.Bottom := (ToWidth * image.Bitmap.Height) div image.Bitmap.Width;
       end
     else
       begin
         thumbRect.Bottom := toHeight;
         thumbRect.Right := (toHeight * image.Bitmap.Width) div image.Bitmap.Height;
       end;

     image.bitmap.Canvas.StretchDraw(thumbRect, image.bitmap) ;

     image.Bitmap.Width := thumbRect.Right;
     image.Bitmap.Height := thumbRect.Bottom;
     end;


end;

end.
