local parser = require "redis.parser"

local ad_id = ngx.var.id

local res = ngx.location.capture("/backend/redis/eval",
    { args = { cmd = 
    	"if tonumber(redis.call('get',KEYS[1]..'k')) > 0 then local x=redis.call('get',KEYS[1]);"..
    	"redis.call('DECR',KEYS[1]..'k');return x; else return nil end", 
    	arg1="1", arg2=ad_id} }
--     "redis.call('DECR',KEYS[1]..'k'); return 'test'", arg1="1", arg2=ad_id} }
)


if res.status ~= 200 then
    ngx.exit(res.status)
elseif res.body == "$-1\r\n" then
    ngx.exit(404)
else
	local res = tostring(parser.parse_reply( tostring(res.body) ))
	ngx.var.foo = res
    ngx.say( res )
end 

