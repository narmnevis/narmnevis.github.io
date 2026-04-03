-- Filter: Validate and enhance metadata for bilingual blog
function Meta(meta)
  -- Ensure required fields exist
  if not meta.lang then
    meta.lang = "en"  -- Default to English
  end
  
  -- Validate language code
  local lang = pandoc.utils.stringify(meta.lang)
  if lang ~= "en" and lang ~= "fa" then
    -- Log warning: unknown language
    io.stderr:write("Warning: Unknown language: " .. lang .. "\n")
  end
  
  -- Ensure dir matches lang semantics
  if lang == "fa" then
    meta.dir = "rtl"
  elseif lang == "en" then
    meta.dir = "ltr"
  end
  
  -- Add generated fields
  meta.is_rtl = lang == "fa" or lang == "fa-IR"
  meta.is_ltr = lang == "en"
  
  return meta
end

return {{Meta = Meta}}
