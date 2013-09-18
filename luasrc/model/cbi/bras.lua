--[[
LuCI - Lua Configuration Interface

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

]]--

require("luci.tools.webadmin")

m = Map("bras", translate("Bras Connection"))

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

   if pid ~= "" then
      status = "Bras Connected!"
   else
      status = "Bras not start!"
   end
   local status = { status=status }
   local table = { pid=status }
   return table
end

t = m:section(Table, bras_process_status())
t.anonymous = true

t:option(DummyValue, "status", translate("Bras status"))


if pid == "" then
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

if nixio.fs.access("/etc/rc.d/S60bras") then
   disable = t:option(Button, "_disable", translate("Disable from startup"))
   disable.inputstyle = "remove"
   function disable.write(self, section)
      luci.util.exec("/etc/init.d/bras disable")
      luci.util.exec("sleep 1")
      luci.http.redirect(
         luci.dispatcher.build_url("admin", "services", "bras")
      )
   end
else
   enable = t:option(Button, "_enable", translate("Enable on startup"))
   enable.inputstyle = "apply"
   function enable.write(self, section)
      luci.util.exec("/etc/init.d/bras enable")
      luci.util.exec("sleep 1")
      luci.http.redirect(
         luci.dispatcher.build_url("admin", "services", "bras")
      )
   end
end

return m
