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

return u
