function UIFigureKeyPress (~,KeyData,app)
key = KeyData.Key;
if ~app.KeyState
    if strcmp(key,app.Key)
        if app.TabGroup.SelectedTab == app.OriginalTab
            app.TabGroup.SelectedTab = app.RotatedTab;
        else
            app.TabGroup.SelectedTab = app.OriginalTab;
        end
        app.KeyState = true;
    end
end