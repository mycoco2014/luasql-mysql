local mysql = require('luasqlmysql')
print(mysql)

local env  = mysql.mysql()
-- dbname
-- username
-- password
-- hostname
local conn,err = env:connect('testdb','root','test1test1','127.0.0.1')
print(conn,err)

conn:execute("SET NAMES UTF8")

local cursor,err = conn:execute("select * from test_data")
row = cursor:fetch({},'a')

while row do
    print(string.format("Id: %s, Name: %s", row.id, row.month))
    row = cursor:fetch (row, "a")
end


conn:close()  --关闭数据库连接
env:close()   --关闭数据库环境

