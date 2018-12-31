//                                                                         
// Sample script for Optuma tool programming
//

// This section is where variable are defined that need to be used in both the Init and Process procedures
var
    Plot1 : TPlot;
    Events : TEvents;
    Event : TEvent;
    bCreateEvents : Boolean;

// DefineTool is where the settings for the Tool are defined
// This procedure is called once when the tool is loaded
// Normally this procedure does not need to be changed
procedure DefineTool(Tool : TTool);
begin
    Tool.Name := 'TxD dates';
    Tool.MouseClicks := 0;
    Tool.Hint := '90, 120, 180, 360 TxD dates looking backwards';
    Tool.ToolType := ttDataList;
end;

// Init is called to initialise the tool
// This procedure is called once when the tool is added to a chart
procedure Init(Tool : TTool);
begin
end;
                 
// Process is called to calculate and drawn the tool on screen
// This procedure is called when new data is received or loaded and 
// when a selection point is moved by the user 
procedure Process(Tool : TTool; ProcessStart : Integer; ProcessEnd : Integer; DataIn : TDataList);
var
    i : Integer;                                  
begin                                                   
    Events := Tool.AddEvents();         
    Events.Extend := true; 
    //Events.AddRegion(Now()-88, Now()-92, clYellow); 
    Events.AddRegion(IncMonth(Now(),-3)-2, IncMonth(Now(),-3)+2, clYellow);
    Events.AddRegion(IncMonth(Now(),-4)-2, IncMonth(Now(),-4)+2, clYellow);      
    Events.AddRegion(IncMonth(Now(),-6)-2, IncMonth(Now(),-6)+2, clYellow);
    Events.AddRegion(IncMonth(Now(),-12)-2, IncMonth(Now(),-12)+2, clYellow);

    Events.FillTransparency := 20;

    //Event := Events.AddEvent(Now()-90, clBlue);
    //Event := Events.AddEvent(Now()-120, clBlue);
    //Event := Events.AddEvent(Now()-180, clBlue); 
    //Event := Events.AddEvent(Now()-360, clBlue);
end;                            
