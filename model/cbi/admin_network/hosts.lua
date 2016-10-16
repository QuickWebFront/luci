
m = Map("system", "主机名和回环地址")
m:chain("network")

s = m:section(TypedSection, "system", "") 
s.anonymous = true
s.addremove = false



o=s:option(Value,"hostname","主机名")
o.dataType="hostname"
o=s:option(Value,"_ipaddr","回环接口（lo0）地址")

function o.cfgvalue(...)
	return m.uci:get("network", "loopback", "ipaddr")
end
function o.write(self, section, value)
	Value.write(self, section, value)
	m.uci:set("network", "loopback", "ipaddr", value)
end



--function s:filter(value)
  -- return value == "loopback" -- only config loopback
--end 



--s:taboption("loop",Value,"ipaddr","回环接口（lo0）地址")

-- system hostname 不在 Map network 中，所以要重写 get write 函数
--o=s:taboption("hostname",Value,"hostname","主机名")

--function o.cfgvalue(...)
	--return sys.hostname()
--end



return m
