function DropDownValueChanged(~,~,app)
StageIndex = find( strcmp(app.DropDown.Value,app.DropDown.Items));
if app.PhototFlag(StageIndex)
    if app.SelectionFlag(StageIndex)
        app.SelectButton.Enable = 'off';
    else
        app.SelectButton.Enable = 'on';
    end
    app.ClearButton.Enable = 'on';
else
    app.ClearButton.Enable = 'off';
    app.SelectButton.Enable = 'off';
    
end
switch StageIndex
    case 1
        app.TabGroup.SelectedTab = app.OriginalTab;
    case 2
        app.TabGroup.SelectedTab = app.RotatedTab;
end
app.UITable.Data = app.TableData{StageIndex};
app.CurrentAxe = StageIndex;
