local ls = require("luasnip")

local snip = ls.snippet
local text = ls.text_node

ls.add_snippets(nil, {
	go = {
		snip(
			{
				trig = "iferr",
				namr = "If Err",
				dscr = "Go Error Handling",
			},
			text({
				"if err != nil {",
				"",
				"}",
			})
		),
	},
})
