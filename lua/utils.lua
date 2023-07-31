local u = {}

function u.make_progress(percent)
    local str = ""
    local p10 = percent * 10
    for i = 1, 10 do
        if p10 + 0.05 >= i then
            if i == 1 then
                str = str..""
            elseif i == 10 then
                str = str..""
            else
                str = str..""
            end
        else
            if i == 1 then
                str = str..""
            elseif i == 10 then
                str = str..""
            else
                str = str..""
            end
        end
    end
    return str
end

function u.is_big_file()
  local line_count = vim.fn.line('$')
  return line_count > 100000
end


local tconcat = table.concat
local tinsert = table.insert
local srep = string.rep
local INDENT = "    "

function u.print_r_dump(root)
    local cache = { [root] = "." }
    local function _dump(t, indent, name)
        indent = indent or ""
        name = name or ""

        local temp = {}
        if t == nil then
            tinsert(temp, indent .. "nil")
        elseif type(t) == "table" then
            local next_indent = indent .. INDENT
            tinsert(temp, "{")

            for k, v in pairs(t) do
                local key = tostring(k)

                if cache[v] then
                    tinsert(temp, next_indent .. "+" .. key .. "=>{" .. cache[v] .. "}")
                else
                    local new_key = name .. "." .. key
                    if type(v) == "table" then
                        cache[v] = new_key
                    end
                    tinsert(temp, next_indent .. "+" .. key .. _dump(v, next_indent, new_key))
                end
            end

            tinsert(temp, indent .. "}")
        else
            tinsert(temp, ":" .. tostring(t) .. "")
        end

        return tconcat(temp, "\n")
    end

	return _dump(root)
end

function u.print_r(root)
    if __RELEASE__ then
        return
    end

   print(u.print_r_dump(root))
end

return u
