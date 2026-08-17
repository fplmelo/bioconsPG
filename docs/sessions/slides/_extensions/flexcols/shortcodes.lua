return {
  ["flex-cols"] = function(args, kwargs)
    local width = kwargs["width"] or "50%"
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
]], kwargs["txt1"] or "", kwargs["img1"] or "", width, kwargs["txt2"] or "", kwargs["img2"] or "", width)

    return pandoc.RawBlock('markdown', md)
  end
}