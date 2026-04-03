-- Filter: Ensure lang and dir consistency, add language class
function Meta(meta)
  if meta.lang then
    local lang = pandoc.utils.stringify(meta.lang)
    
    -- Auto-set dir based on lang if not explicitly set
    if not meta.dir or pandoc.utils.stringify(meta.dir) == "" then
      if lang == "fa" or lang == "fa-IR" then
        meta.dir = "rtl"
      else
        meta.dir = "ltr"
      end
    end
    
    -- Add language class for CSS targeting
    meta.body_class = "lang-" .. lang
  end
  
  return meta
end

-- Add language class to body via template variable
return {{Meta = Meta}}
