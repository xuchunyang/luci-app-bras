--[[
LuCI - Lua Configuration Interface

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0
]]--

module("luci.controller.bras", package.seeall)

function index()

   if not nixio.fs.access('/etc/config/bras') then
      return
   end

   local page

   page = entry({"admin", "services", "bras"}, cbi("bras"), _("BRAS"))
   page.i18n = "bras"
   page.dependent = true
end
