function UIAxesButtonDownFcn_2(axe,~,app)
ind = app.CurrentAxe;
x = axe.CurrentPoint(1,1);
y = axe.CurrentPoint(1,2);
app.AdjustPoint(:,ind) = [x,y];
if ishandle(app.Scatters{ind,4})
    delete(app.Scatters{ind,4})
    delete(app.Labels{ind,4})
else
    app.SyncButton.Enable = 'on';
    if ind==1
        app.SyncButton.Text = 'Next';
    else
        app.SyncButton.Text = 'Done';
    end
end
app.Scatters{ind,4} = scatter( axe, ...
    x , y , ...
    12 , 'r', 'filled' , ...
    'PickableParts','none');
dev = diff(axe.XLim)*0.015;
app.Labels{ind,4} = text( axe, ...
    x+dev , y , ...
    'R', ...
    'FontSize',17, ...
    'Color','r', ...
    'PickableParts','none');