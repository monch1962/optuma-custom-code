//                                                                                                                        
// Sample script for Optuma tool programming
//
// This section is where variable are defined that need to be used in both the Init and Process procedures
var  
    Line1 : TLine;     
    Text1 : TText;
       
// DefineTool is where the settings for the Tool are defined
// This procedure is called once when the tool is loaded
// Normally this procedure does not need to be changed
procedure DefineTool(Tool : TTool);
begin
    Tool.Name := 'TrendLinePPD';
    Tool.MouseClicks := 3;
    Tool.Hint := 'Trend Line Points Per Day';
    Tool.ToolType := ttDrawing;
end;

// Init is called to initialise the tool
// This procedure is called once when the tool is added to a chart
procedure Init(Tool : TTool);
begin
    Line1 := Tool.AddLine();
    Line1.Color := clFuchsia;
    Line1.Style := Solid; // Types of TLineStyle=(Solid, DotDot, Dash, DashDot, LongDash, LongDashDot, LongDashDotDot)
    Line1.Width := 1;           
    Text1 := Tool.AddText('', Now(), 10); 
    Text1.FontColor := clFuchsia;
    //Text1.FontSize := 14;
end;

// Process is called to calculate and drawn the tool on screen
// This procedure is called when new data is received or loaded and 
// when a selection point is moved by the user 
procedure Process(Tool : TTool; ProcessStart : Integer; ProcessEnd : Integer; DataIn : TDataList); 
var
    PriceDelta : Float;
    TimeDelta : Float;  
    PPD : Float;
begin
    Line1.P1.Date := Tool.MP[0].Date;
    Line1.P1.Price := Tool.MP[0].Price;
    Line1.P2.Date := Tool.MP[1].Date;
    Line1.P2.Price := Tool.MP[1].Price;    
    PriceDelta := Tool.MP[1].Price - Tool.MP[0].Price;
    TimeDelta := Tool.MP[1].Date - Tool.MP[0].Date;      
    if TimeDelta = 0 then
        PPD := 0
    else                                                                                                           
        PPD := PriceDelta / TimeDelta;
    Text1.Price := Tool.MP[2].Price;                                                                                
    Text1.Date := Tool.MP[2].Date;                                            
    Text1.Text := 'Pts/Day: ' + FormatFloat('0.####', FloatToStr(PPD)) + #13#10 + 'Days: ' + IntToStr(TimeDelta) + #13#10 + 'Range: ' + FormatFloat('0.###', FloatToStr(PriceDelta));
end;
