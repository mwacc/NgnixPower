local mysql = require "resty.mysql"
local cjson = require "cjson"

local age = ngx.var.age

local db, err = mysql:new()
if not db then
	io.stderr:write("failed to instantiate mysql: "..err)
	ngx.exit(503)
    return
end

local ok, err, errno, sqlstate = db:connect{
    host = "127.0.0.1",
    port = 3306,
    database = "test1",
    user = "root",
    password = "root"}

if not ok then
	io.stderr:write("failed to connect: "..err..": "..errno.." "..sqlstate)
	ngx.exit(503)
    return
end

-- run a select query, expected about 10 rows in
-- the result set:
res, err, errno, sqlstate =
    db:query("select * from cnt where age between 20 and 30 ")
if not res then
	io.stderr:write("bad result: "..err..": "..errno..": "..sqlstate)
    ngx.exit(503)
    return
end

ngx.say(cjson.encode(res))

-- put it into the connection pool of size 500,
-- with 60 seconds max idle timeout
local ok, err = db:set_keepalive(60*1000, 500)
if not ok then
    ngx.say("failed to set keepalive: ", err)
    return
end