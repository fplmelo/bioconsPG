local function flex_cols(args, kwargs)
  local width = kwargs["width"] or "50%"
  local txt1 = kwargs["txt1"] or ""
  local img1 = kwargs["img1"] or ""
  local txt2 = kwargs["txt2"] or ""
  local img2 = kwargs["img2"] or ""

  local md = string.format([[
::: {.columns style="display: flex;"}
:::{.column style="display: flex; flex-direction: column; justify-content: space-between;"}
%s

![](%s){fig-align="center" width="%s"}
:::

:::{.column style="display: flex; flex-direction: column; justify-content: space-between;"}
%s

![](%s){fig-align="center" width="%s"}
:::
:::
]], txt1, img1, width, txt2, img2, width)

  -- Parse markdown string into Pandoc AST blocks so Quarto renders it correctly
  local doc = pandoc.read(md, 'markdown')
  return doc.blocks
end

return {
  ["flex-cols"] = flex_cols
}