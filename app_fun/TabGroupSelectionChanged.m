function TabGroupSelectionChanged(~,~,app)
    selectedTab = app.TabGroup.SelectedTab;
    if selectedTab == app.OriginalTab
        app.DropDown.Value = app.DropDown.Items{1};
    else
        app.DropDown.Value = app.DropDown.Items{2};
    end
    DropDownValueChanged([],[],app)
end