//                                                                                                        
// Sample script for Optuma tool programming
//

// This section is where variable are defined that need to be used in both the Init and Process procedures
var
    Plot1 : TPlot;     
    Text1 : TText;

// DefineTool is where the settings for the Tool are defined
// This procedure is called once when the tool is loaded
// Normally this procedure does not need to be changed
procedure DefineTool(Tool : TTool);
begin
    Tool.Name := 'Gann3PtRule';
    Tool.MouseClicks := 0;
    Tool.Hint := 'Numeric value to use for Gann 3 Point Rule in this market';                               
    Tool.ToolType := ttDataList;
end;

// Init is called to initialise the tool
// This procedure is called once when the tool is added to a chart
procedure Init(Tool : TTool);
begin
    Text1 := Tool.AddText('', Now(), 10);  
    Text1.FontSize := 14;
    Text1.FontColor := clFuchsia;                                                             
end;                                              

// Process is called to calculate and drawn the tool on screen
// This procedure is called when new data is received or loaded and 
// when a selection point is moved by the user 
procedure Process(Tool : TTool; ProcessStart : Integer; ProcessEnd : Integer; DataIn : TDataList);
var
    i : Integer; 
    iLastBar : Integer;  
    GannPV : Float;
begin
    //for i := ProcessStart to ProcessEnd do
    //begin
        //Plot1.Row[i].Date := DataIn.Row[i].Date;
        //Plot1.Row[i].Open := DataIn.Row[i].Open;
        //Plot1.Row[i].High := DataIn.Row[i].High;
        //Plot1.Row[i].Low := DataIn.Row[i].Low;
        //Plot1.Row[i].Close := DataIn.Row[i].Close;
        //Plot1.Row[i].Hidden := False;
    //end;                
    iLastBar := DataIn.Count-1;
    Text1.Price := DataIn.Row[iLastBar].High; 
    Text1.Idx := DataIn.Count-10;                                                                         
    //Gann33PV := Gann3PtMove();            
    Text1.Text := 'Gann3PR value: ' + FloatToStr(123.45);
end;
