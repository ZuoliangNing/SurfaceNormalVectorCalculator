function VisibleUIControls(app,state,button)
app.DropDown.Enable = state;
app.RotaionaxisLabel.Enable = state;
app.DropDown_2.Enable = state;
app.OpenButton.Enable = state;
app.DirectionButtonGroup.Enable = state;
app.clockwiseButton.Enable = state;
app.anticlockwiseButton.Enable = state;
app.AngleLabel.Enable = state;
app.EditField.Enable = state;
app.ClearButton.Enable = state;
app.SelectButton.Enable = state;
if strcmp(state,'on') && all(app.PhototFlag)
    app.AdjustButton.Enable = 'on';
    app.SyncButton.Enable = 'on';
else
    app.AdjustButton.Enable = 'off';
    app.SyncButton.Enable = 'off';
end
button.Enable = 'on';