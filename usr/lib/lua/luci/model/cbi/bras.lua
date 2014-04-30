--[[
   LuCI-app-Bras
   Maintainer: Chunyang Xu <xuchunyang56@gmail.com>
]]--

require("luci.tools.webadmin")

m = Map("bras", translate("SEU Bras 客户端"))

s = m:section(TypedSection, "bras")
s.anonymous = true

un = s:option(Value, "username", translate("Username"))
un.default=luci.util.exec("uci get bras.@bras[0].username")

pw = s:option(Value, "password", translate("Password"))
pw.password = true
pw.default=luci.util.exec("uci get bras.@bras[0].password")

local pid = luci.util.exec("/usr/bin/pgrep xl2tpd")
local pppd_pid = luci.util.exec("/usr/bin/pgrep pppd")

function bras_process_status()
   local status = ""

   if pppd_pid ~= "" then
      status = "Connected to Bras!"
   else
      status = "Bras does not start!"
   end
   local status = { status=status }
   local table = { pid=status }
   return table
end

t = m:section(Table, bras_process_status())
t.anonymous = true

t:option(DummyValue, "status", translate("Bras status"))


if pppd_pid == "" then
   start = t:option(Button, "_start", translate("Start"))
   start.inputstyle = "apply"
   function start.write(self, section)
      luci.util.exec("/etc/init.d/bras start 2>&1")
      luci.util.exec("sleep 2")
      luci.http.redirect(
         luci.dispatcher.build_url("admin", "services", "bras")
      )
   end
else
   stop = t:option(Button, "_stop", translate("Stop"))
   stop.inputstyle = "reset"
   function stop.write(self, section)
      luci.util.exec("/etc/init.d/bras stop")
      luci.util.exec("sleep 2")
      luci.http.redirect(
         luci.dispatcher.build_url("admin", "services", "bras")
      )
   end
end

return m
