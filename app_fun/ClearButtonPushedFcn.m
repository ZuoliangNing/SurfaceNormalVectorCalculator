function ClearButtonPushedFcn(~,~,app)
ind = app.CurrentAxe;
for i = 1:4
   if ishandle(app.Scatters{ind,i})
       delete(app.Scatters{ind,i})
       delete(app.Labels{ind,i})
   end
end
if ishandle(app.Lines{ind})
   delete(app.Lines{ind})
end
app.Coords(2*ind-1:2*ind,:) = 0;
app.SelectionFlag(ind) = false;
app.ScattersNumber(ind) = 0;
DropDownValueChanged([],[],app)
app.TableData{ind} = repmat({[]},6,3);
app.UITable.Data = app.TableData{ind};

app.CalculateButton.Enable = 'off'; 