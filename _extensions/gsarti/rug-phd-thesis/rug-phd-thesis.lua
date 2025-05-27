-- Check if the current output format is PDF
local is_pdf = (quarto and quarto.doc.is_format("pdf"))

function Span (el)
  -- Paragraph inline block for LaTeX
  if is_pdf and el.classes[1] == "paragraph" then
    local content_text = pandoc.utils.stringify(el.content)
    return pandoc.RawInline('latex', '\\paragraph*{' .. content_text .. '}')
  elseif is_pdf and el.classes[1] == "subparagraph" then
    local content_text = pandoc.utils.stringify(el.content)
    return pandoc.RawInline('latex', '\\subparagraph*{' .. content_text .. '}')
  end
  return el
end

-- Simplified function using string.gsub with pattern matching
local function process_quarto_base64(content)
    -- Use gsub to find and replace all instances in one pass
    local result = content:gsub("(\\QuartoMarkdownBase64%s*{)([^{}]*)(})", function(prefix, inner_content, suffix)
        -- Check if content looks like it's already base64 encoded
        local looks_like_base64 = not inner_content:match("[%s%[@%]%(%)%*_`#]")
        
        if not looks_like_base64 and inner_content ~= "" then
            local encoded_content = quarto.base64.encode(inner_content)
            io.stderr:write(string.format("Quarto Base64 Filter: Encoded '%s' -> '%s'\n", 
                inner_content, encoded_content))
            return prefix .. encoded_content .. suffix
        else
            -- Return unchanged if already encoded or empty
            return prefix .. inner_content .. suffix
        end
    end)
    
    return result
end

-- Filter function for RawBlock elements  
function RawBlock(el)
    if is_pdf and (el.format == "latex" or el.format == "tex") then
        local original_text = el.text
        local processed_text = process_quarto_base64(original_text)
        
        if processed_text ~= original_text then
            return pandoc.RawBlock(el.format, processed_text)
        end
    end
    return el
end