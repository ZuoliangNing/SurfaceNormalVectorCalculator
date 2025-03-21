function UIAxesButtonDownFcn(axe,~,app)
ind = app.CurrentAxe;
x = axe.CurrentPoint(1,1);
y0 = axe.CurrentPoint(1,2);
my = app.Photos{ind}.YData(2);
y = my - y0;
app.Coords(2*ind-1:2*ind,4) = [x;y];
RefreshTable(app,ind,[x,y])


if ishandle(app.Scatters{ind,4})
    delete(app.Scatters{ind,4})
    delete(app.Labels{ind,4})
else
    app.OpenButton.Enable = 'on';
    app.OpenButton.Text = 'Confirm';
end
app.Scatters{ind,4} = scatter( axe, ...
    x , y0 , ...
    12 , 'r', 'filled' , ...
    'PickableParts','none');
dev = diff(axe.XLim)*0.015;
app.Labels{ind,4} = text( axe, ...
    x+dev , y0 , ...
    app.TextList{app.ScattersNumber(ind) + 1}, ...
    'FontSize',17, ...
    'Color','r', ...
    'PickableParts','none');