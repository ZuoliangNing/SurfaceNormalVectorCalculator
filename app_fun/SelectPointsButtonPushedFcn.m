function SelectPointsButtonPushedFcn(button,~,app)
switch button.Text
    case 'Select'
        VisibleUIControls(app,'off',button)
        button.Text = 'Cancel';
        
        StageIndex = app.CurrentAxe;
        switch StageIndex
            case 1 ; app.UIAxes.ButtonDownFcn = {@UIAxesButtonDownFcn,app};
            case 2 ; app.UIAxes2.ButtonDownFcn = {@UIAxesButtonDownFcn,app};
        end
        
    case 'Cancel'
        VisibleUIControls(app,'on',button)
        button.Text = 'Select';
        
        app.OpenButton.Text = 'Open';
        app.UIAxes.ButtonDownFcn = [];
        app.UIAxes2.ButtonDownFcn = [];
        ind = app.CurrentAxe;
        if ishandle(app.Scatters{ind,4})
            delete(app.Scatters{ind,4})
            delete(app.Labels{ind,4})
        end
        app.UITable.Data(app.ScattersNumber(ind)+1,:) = {[]};
end