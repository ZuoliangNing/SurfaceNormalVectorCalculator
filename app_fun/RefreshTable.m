function RefreshTable(app,ind,val)

temp = app.TableData{ind};
temp(app.ScattersNumber(ind) + 1,1) = {num2str(val(1),4)};
temp(app.ScattersNumber(ind) + 1,2) = {num2str(val(2),4)};
app.UITable.Data = temp;
