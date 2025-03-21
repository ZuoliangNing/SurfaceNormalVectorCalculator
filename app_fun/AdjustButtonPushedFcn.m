function AdjustButtonPushedFcn(button,~,app)
switch button.Text
    case 'Adjust'
        app.TabGroup.SelectedTab = app.OriginalTab;
        TabGroupSelectionChanged([],[],app)
        VisibleUIControls(app,'off',button)
        button.Text = 'Cancel';
        
        axe = app.UIAxes;
        axe.ButtonDownFcn = {@UIAxesButtonDownFcn_2,app};
        
    case 'Cancel'
        VisibleUIControls(app,'on',button)
        button.Text = 'Adjust';
        app.SyncButton.Text = 'Sync';
        
        app.UIAxes.ButtonDownFcn = [];
        app.UIAxes2.ButtonDownFcn = [];
        
        for i = 1:2
            if ishandle(app.Scatters{i,4})
                delete(app.Scatters{i,4})
                delete(app.Labels{i,4})
            end
        end
end
