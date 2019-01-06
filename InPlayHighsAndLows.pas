//                                                                                                        
// Sample script for Optuma tool programming
//                    

// This section is where variable are defined that need to be used in both the Init and Process procedures
//type   
//    Lines : array of TPlot;
//uses RTTI;     
var
    Plot1 : TPlot;             
    OldHigh : TLine;
//    InPlayHighs : array of TLine;
//    InPlayLows : array of TLine;
//    InPlayMidpoints : array of TLine;

// DefineTool is where the settings for the Tool are defined
// This procedure is called once when the tool is loaded
// Normally this procedure does not need to be changed
procedure DefineTool(Tool : TTool);
begin                                       
    Tool.Name := 'InPlayHighsAndLows';
    Tool.MouseClicks := 1;
    Tool.Hint := 'Highlight in-play highs and lows';
    Tool.ToolType := ttDataList;
end;

// Init is called to initialise the tool
// This procedure is called once when the tool is added to a chart
procedure Init(Tool : TTool);
begin
    //Plot1 := Tool.AddPlot();  
    Plot1 := Tool.AddPlot('GANNSWINGOVERLAY(SWINGCOUNT=1)');
    //DisplayMessage('Plot2', Plot1.Data);
    //Plot1 := Tool.AddPlot('MA(BARS=5)');
    //Plot1.Color := clBlue;
    Plot1.PlotStyle := Shaded; // possible values are (Line, Dot, Histogram, Stepped, Shaded)
    Plot1.FillColor := clBlue;  
    Plot1.Visible := True;  
    //Plot1.LineStyle := Solid;  
    //Plot1.ShowInPropertiesPanel := True;
    //Plot1.Create();               
end;                                           

// Process is called to calculate and drawn the tool on screen
// This procedure is called when new data is received or loaded and 
// when a selection point is moved by the user 
procedure Process(Tool : TTool; ProcessStart : Integer; ProcessEnd : Integer; DataIn : TDataList);
var
    i : Integer;   
    //GSOdata : TDataList;
begin   
    //Plot1 := Tool.AddPlot('GANNSWINGOVERLAY(SWINGCOUNT=1)');   
    //GSOdata := Tool.AddPlot('GANNSWINGOVERLAY()');                 
    Plot1.Color := clBlue;  
    //Plot1.PlotStyle := Shaded;
    Plot1.FillColor := clBlue;
    //Plot1.Visible := True;   
    DisplayMessage('Plot1.Count', Plot1.Count);                             
    DisplayMessage('Plot1.Row[395]', Plot1.Row[396]);
    
    //for i := ProcessStart to ProcessEnd do          
    for i := 0 to Plot1.Count do
    begin                                                        
        //Plot1.Row[i].Date := DataIn.Row[i].Date;
        //Plot1.Row[i].Open := DataIn.Row[i].Open;                                                       
        //Plot1.Row[i].High := DataIn.Row[i].High;
        //Plot1.Row[i].Low := DataIn.Row[i].Low;
        //Plot1.Row[i].Date := DataIn.Row[i].SwingEnd;
        Plot1.Row[i].Close := DataIn.Row[i].Close;                         
        //Plot1.Row[i].Hidden := False;
    end;
end;  
