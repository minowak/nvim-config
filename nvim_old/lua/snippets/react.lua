local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local d = ls.dynamic_node
local f = ls.function_node
local sn = ls.snippet_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local function file_name_node(index, camel_case, lowercase_first)
  camel_case = camel_case or false
  lowercase_first = lowercase_first or false

  return d(index, function(_, parent)
    local file_name = (parent.env or {}).TM_FILENAME
    local core_name = file_name:match("^([%a_-]+)%.?")

    if camel_case then
      -- Convert core_name to camel case
      local camel_case_name = core_name:gsub("_(%a)", string.upper):gsub("^%l", string.upper)
      if lowercase_first then
        -- Make the first letter lowercase
        camel_case_name = camel_case_name:gsub("^%u", string.lower)
      end
      return sn(nil, { i(1, camel_case_name) })
    else
      return sn(nil, { i(1, core_name) })
    end
  end, {})
end

ls.add_snippets("typescriptreact", {
  s(
    {
      trig = "svg",
      name = "SVG Element",
      desc = "Create SVG Element",
    },
    fmt(
      [[
    type Props = {{
      className?: string;
    }}

    export const {}: React.FC<Props> = ({{ className }}) => {{
      return (
        <>
        </>
      );
    }}
    ]],
      {
        file_name_node(1),
      }
    )
  ),
  s(
    {
      trig = "component",
      name = "React component",
      desc = "Create React component",
    },
    fmt(
      [[
    export const {}: React.FC = () => {{
      return (
        <>
        </>
      );
    }}
    ]],
      {
        file_name_node(1),
      }
    )
  ),
})

ls.add_snippets("typescript", {
  s(
    {
      trig = "resources",
      name = "i18n Resources",
      desc = "Create i18n Translations resources (eviva)",
    },
    fmt(
      [[
  import {{ ResourceLanguage }} from "i18next";

  export const {}Resources: ResourceLanguage = {{
   {}: {{

   }}
  }}
      ]],
      {
        file_name_node(1, true),
        file_name_node(2, true, true),
      }
    )
  ),
})
