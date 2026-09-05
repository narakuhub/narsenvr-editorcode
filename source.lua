local SOURCE_URL = ...

assert(type(SOURCE_URL) == "string" and SOURCE_URL ~= "", "source.lua: missing source URL")

local LOAD_URL = SOURCE_URL:gsub("/source%.lua$", "/load.lua")

assert(LOAD_URL ~= SOURCE_URL, "source.lua: invalid source.lua URL")

local ok, source = pcall(function()
	return game:HttpGet(LOAD_URL)
end)

assert(ok and type(source) == "string" and source ~= "", "source.lua: failed to retrieve load.lua")

local execute, compileError = loadstring(source)

assert(execute, "source.lua: failed to compile load.lua: " .. tostring(compileError))

local success, runtimeError = pcall(execute)

assert(success, "source.lua: load.lua execution failed: " .. tostring(runtimeError))

return runtimeError
