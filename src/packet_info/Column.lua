---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by markus.
--- DateTime: 2/15/19 11:31 PM
---

function Column.new(txt)
    local column = {
        __type = "column";
        m_text = txt or "";
        m_fence = false;
    };

    function column:set(text)
        if not self.m_fence then
            self.m_text = text;
        end
    end

    function column:clear()
        if not self.m_fence then
            self.m_text = "";
        end
    end

    function column:append(text)
        self.m_text = self.m_text .. text;
    end

    function column:prepend(text)
        if not self.m_fence then
            self.m_text = text .. self.m_text;
        end
    end

    function column:fence()
        self.m_fence = true;
    end

    function column:clear_fence()
        self.m_fence = false;
    end

    function column:__tostring()
        return self.m_text;
    end

    function column.__concat(op1, op2)
        if op1.__type == "column" then
            return op1.m_text .. op2;
        else
            return op1 .. op2.m_text;
        end
    end

    setmetatable(column, column);

    return column;
end