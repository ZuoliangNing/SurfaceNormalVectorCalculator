function SyncButtonPushedFcn(button,~,app)
switch button.Text
    case 'Sync'
        ind = app.CurrentAxe;
        switch ind
            case 1 ; axe = app.UIAxes; axe2 = app.UIAxes2;
            case 2 ; axe = app.UIAxes2; axe2 = app.UIAxes;
        end
        axe2.Position = axe.Position;
        axe2.XLim = axe.XLim;
        axe2.YLim = axe.YLim;
    case 'Next'
        app.TabGroup.SelectedTab = app.RotatedTab;
        TabGroupSelectionChanged([],[],app)
        app.UIAxes.ButtonDownFcn = [];
        app.UIAxes2.ButtonDownFcn = {@UIAxesButtonDownFcn_2,app};
    case 'Done'
        VisibleUIControls(app,'on',button)
        app.AdjustButton.Text = 'Adjust';
        app.SyncButton.Text = 'Sync';
        
        app.UIAxes.ButtonDownFcn = [];
        app.UIAxes2.ButtonDownFcn = [];
        
        for i = 1:2
            if ishandle(app.Scatters{i,4})
                delete(app.Scatters{i,4})
                delete(app.Labels{i,4})
            end
        end
        
        coord = app.AdjustPoint;
        temp = diff(coord,1,2)';
        pos_1 = [app.Photos{1}.XData(2),app.Photos{1}.YData(2)];
        pos_2 = [app.Photos{2}.XData(2),app.Photos{2}.YData(2)];
        siz = [0,0];
        for i = 1:2
            if temp(i)>0 ; siz(i) = pos_2(i) - temp(i) ;
            else ; siz(i) = pos_1(i) + temp(i) ; end
        end
        val_1 = max([-temp;0,0]);
        val_2 = max([temp;0,0]);
        app.Photos{1}.CData = imcrop( app.Photos{1}.CData , ...
            [val_1,siz]);
        app.Photos{2}.CData = imcrop( app.Photos{2}.CData , ...
            [val_2,siz]);
end

