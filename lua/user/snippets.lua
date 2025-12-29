local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
  return
end

local snip = ls.snippet
local text = ls.text_node

ls.add_snippets(nil, {
  go = {
    snip(
      {
        trig = "iferr",
        namr = "If Err",
        dscr = "Go Error Handling"
      },
      text {
        "if err != nil {",
        "",
        "}"
      }
    )
  },
  python = {
    snip(
      {
        trig = "response",
        namr = "Response",
        dscr = "Django API response Structure"
      },
      {
        text {
          "response = Response()",
          "try: ",
          "   data = json.loads(request.body)",
          "except Exception as e:",
          "   response.error(e)",
          "return response.toJsonResponse()"
        },
      }
    )
  }
})
