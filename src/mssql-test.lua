local mssql = require('luasqlmssql')
print(mssql)

local env  = mssql.mssql()
-- dbname
-- username
-- password
-- hostname
local conn,err = env:connect('master','sa','sa','172.16.22.24')
print('conn',conn, ', err:',err)

--
--conn:execute("SET NAMES UTF8")
-- select * from test_data
local cursor,err = conn:execute("select top 1 * from sysobjects order by id")
print('cursor:',cursor,'  ,err:',err)

row = cursor:fetch({},'a')
print(row)

--
--while row do
--    print(string.format("Id: %s, Name: %s", row.id, row.month))
--    row = cursor:fetch (row, "a")
--end
--
--
--conn:close()  --关闭数据库连接
--env:close()   --关闭数据库环境

