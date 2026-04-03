-- Filter: Remove content blocks marked for other languages
function Div(div)
  if not PANDOC_DOCUMENT then
    return div
  end
  
  local meta = PANDOC_DOCUMENT.meta
  if not meta.lang then
    return div
  end
  
  local current_lang = pandoc.utils.stringify(meta.lang)
  
  -- Remove divs marked for other languages
  for _, class in ipairs(div.classes) do
    if class == "only-en" and current_lang == "fa" then
      return {}  -- Remove this block for Persian
    elseif class == "only-fa" and current_lang == "en" then
      return {}  -- Remove this block for English
    end
  end
  
  return div
end

return {{Div = Div}}
