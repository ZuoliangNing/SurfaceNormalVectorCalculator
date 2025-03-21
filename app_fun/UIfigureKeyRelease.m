function UIfigureKeyRelease (~,KeyData,app)
key = KeyData.Key;
if app.KeyState && strcmp(key,app.Key)
    if app.TabGroup.SelectedTab == app.OriginalTab
        app.TabGroup.SelectedTab = app.RotatedTab;
    else
        app.TabGroup.SelectedTab = app.OriginalTab;
    end
    app.KeyState = false;
end
