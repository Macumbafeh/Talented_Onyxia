local Talented = _G.Talented
local L = LibStub("AceLocale-3.0"):GetLocale("Talented")
local ipairs, tonumber = ipairs, tonumber
local RAID_CLASS_COLORS = CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS
local expac = GetExpansionLevel()

-------------------------------------------------------------------------------
-- Common
--

Talented.importers[".*/(.*)/talents%..-%?t?a?l?=?(%d+)$"] = function(self, url, dst)
	local s, _, class, src = url:find(".*/(.*)/talents%..-%?t?a?l?=?(%d+)$")
	if not s then return end

	dst.class = class:upper()
	local count = 1
	local info = self:UncompressSpellData(dst.class)
	local len = src:len()

	for tab, tree in ipairs(info) do
		local t = {}
		dst[tab] = t
		for index = 1, #tree do
			t[index] = tonumber(src:sub(count, count))
			count = count + 1
			if count > len then
				break
			end
		end
	end
	return dst
end

Talented.importers["/%??talent#"] = function(self, url, dst)
	local s, _, code = url:find(".*/%??talent#(.*)$")
	if not s or not code then return end
	local p = code:find(":", nil, true)
	if p then
		code = code:sub(1, p - 1)
	end
	local val, class = self:StringToTemplate(code, dst, "0zMcmVokRsaqbdrfwihuGINALpTjnyxtgevE")
	dst.class = class
	return dst
end

-------------------------------------------------------------------------------
-- WoTLKDB
--

if expac == 2 then
  Talented.exporters["WoTLKDB"] = function(self, template)
    if not RAID_CLASS_COLORS[template.class] then
      return self:ExportWhpetTemplate(template, "https://www.wotlkdb.com/?petcalc#%s")
    end
    return ("https://www.wotlkdb.com/?talent#%s"):format(self:TemplateToString(template, "0zMcmVokRsaqbdrfwihuGINALpTjnyxtgevE"))
  end

  -------------------------------------------------------------------------------
  -- EvoWOW
  --

  Talented.exporters["EvoWoW"] = function(self, template)
    if not RAID_CLASS_COLORS[template.class] then
      return self:ExportWhpetTemplate(template, "https://wotlk.evowow.com/?petcalc#%s")
    end
    return ("https://wotlk.evowow.com/?talent#%s"):format(self:TemplateToString(template, "0zMcmVokRsaqbdrfwihuGINALpTjnyxtgevE"))
  end

  -------------------------------------------------------------------------------
  -- TrueWoW
  --

  Talented.importers[".*/talent%-calculator#"] = function(self, url, dst)
    local s, _, code = url:find(".*/talent%-calculator#(.*)$")
    if not s or not code then return end
    local p = code:find(":", nil, true)
    if p then
      code = code:sub(1, p - 1)
    end
    local val, class = self:StringToTemplate(code, dst, "0zMcmVokRsaqbdrfwihuGINALpTjnyxtgevE")
    dst.class = class
    return dst
  end

  Talented.exporters["TrueWoW"] = function(self, template)
    if not RAID_CLASS_COLORS[template.class] then
      return self:ExportWhpetTemplate(template)
    end
    return ("https://truewow.org/talent-calculator#%s"):format(self:TemplateToString(template, "0zMcmVokRsaqbdrfwihuGINALpTjnyxtgevE"))
  end

  -------------------------------------------------------------------------------
  -- Altervista
  --

  Talented.importers["rpgworld%.altervista%.org/335/"] = function(self, url, dst)
    local s, _, class, src = url:find(".*rpgworld%.altervista%.org/335/([^=]+)%.php%?([0-5]+)")
    if not s then return end

    dst.class = class:upper()
    local count = 1
    local info = self:UncompressSpellData(dst.class)
    local len = src:len()

    for tab, tree in ipairs(info) do
      local t = {}
      dst[tab] = t
      for index = 1, #tree do
        t[index] = tonumber(src:sub(count, count))
        count = count + 1
        if count > len then
          break
        end
      end
    end
    return dst
  end

  Talented.exporters["Altervista"] = function(self, template)
    if not RAID_CLASS_COLORS[template.class] then
      return self:ExportWhpetTemplate(template)
    end
    local s = {}
    for _, tree in ipairs(template) do
      for _, n in ipairs(tree) do
        s[#s + 1] = tostring(n)
      end
    end
    return ("http://rpgworld.altervista.org/335/%s.php?%s"):format(template.class:lower(), table.concat(s))
  end
elseif expac == 1 then
  --TBC Code Here
elseif expac == 0 then
-------------------------------------------------------------------------------
-- ClassicDB.ch
--
  Talented.exporters["ClassicDB"] = function(self, template)
    if not RAID_CLASS_COLORS[template.class] then
      return
    end
    return ("https://classicdb.ch/?talent#%s"):format(self:TemplateToString(template, "0zMcmVokRsaqbdrfwihuGINALpTjnyxtgevE"))
  end
end
-------------------------------------------------------------------------------
-- WoWHead
--
-- .*/(.*)/talent-calc/(\w+)/((?:\-?\d+)+)

Talented.importers[".*/talent%-calc/"] = function(self, url, dst)
	local s, class, code = url:match(".*/(.*)/talent%-calc/(%a+)/(.+)")
  local expacs = {[0] = "classic", [1] = "tbc", [2] = "wotlk"}
  if s ~= expacs[expac] then return end  --not current phase link
	if not class or not code then return end
  
  class = string.upper(class)
  if not RAID_CLASS_COLORS[class] then return end
  if code:len() <= 0 then return end

  template = dst or {}
  template.class = class

  local talents = self:UncompressSpellData(class)
  assert(talents)

  local tab = 1
  local t = wipe(template[tab] or {})
  template[tab] = t

  for i = 1, code:len() do
    local char = code:sub(i, i)
    if char == "-" then
      if #t > #talents[tab] then
        tab = tab + 1
        t = wipe(template[tab] or {})
        template[tab] = t
      end
      tab = tab + 1
      t = wipe(template[tab] or {})
      template[tab] = t
    else
      if #t > #talents[tab] then
        tab = tab + 1
        t = wipe(template[tab] or {})
        template[tab] = t
      end
      t[#t + 1] = tonumber(char)
    end
  end

  assert(#template <= #talents, "Too many branches")
  do
    for tb, tree in ipairs(talents) do
      local _t = template[tb] or {}
      template[tb] = _t
      for i = 1, #tree do
        _t[i] = _t[i] or 0
      end
    end
  end

	return dst
end

Talented.exporters["WoWHead"] = function(self, template)
	if not RAID_CLASS_COLORS[template.class] then
    if expac == 2 then
		  return self:ExportWhpetTemplate(template)
    else
      return
    end
	end
  
  local expacs = {[0] = "classic", [1] = "tbc", [2] = "wotlk"}

  local url = "https://www.wowhead.com/" ..expacs[expac].."/talent-calc/"
  url = url .. string.lower(template.class) .. "/"
  
  local code = ""
  for tab, tree in ipairs(template) do
    for _, ranks in ipairs(tree) do
      code = code .. tostring(ranks)
    end
    code = string.gsub(code, "0*$", "")
    if tab ~= #template then
      code = code .. "-"
    end
  end
  code = string.gsub(code, "-*$", "")
  
  local url = url .. code  
	return url
end