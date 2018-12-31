//                                                                  
// Sample script for Optuma tool programming
//

// This section is where variable are defined that need to be used in both the Init and Process procedures
var
    Plot1 : TPlot;
    Events : TEvents;
    Event : TEvent;
    bCreateEvents : Boolean;  
    Sun : tPlanetInfo;

// DefineTool is where the settings for the Tool are defined
// This procedure is called once when the tool is loaded
// Normally this procedure does not need to be changed
procedure DefineTool(Tool : TTool);
begin
    Tool.Name := 'Test';
    Tool.MouseClicks := 0;
    Tool.Hint := 'Test';
    Tool.ToolType := ttDataList;
end;

// Init is called to initialise the tool
// This procedure is called once when the tool is added to a chart
procedure Init(Tool : TTool);                                                    
begin
    //Plot1 := Tool.AddPlot();
    //Plot1.Color := clBlue;
    //Plot1.PlotStyle := Shaded; // possible values are (Line, Dot, Histogram, Stepped, Shaded)
    //Plot1.FillColor := clBlue;      
    //Ephemeris.SelectPlanets('Sun');         
    //Events := Tool.AddEvents();                   
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
    Events.AddRegion(Now()-88, Now()-92, clBlue); 
    Events.AddRegion(Now()-118, Now()-122, clBlue);
    Events.AddRegion(Now()-178, Now()-182, clBlue);
    Events.AddRegion(Now()-358, Now()-362, clBlue);

    Events.FillTransparency := 40;

    Event := Events.AddEvent(Now()-90, clBlue);
    Event := Events.AddEvent(Now()-120, clBlue);
    Event := Events.AddEvent(Now()-180, clBlue); 
    Event := Events.AddEvent(Now()-360, clBlue);
end;
