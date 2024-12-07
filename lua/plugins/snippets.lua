return {
    'L3MON4D3/LuaSnip',
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { 'rafamadriz/friendly-snippets' },
    config = function()
        local ls = require("luasnip")
        local types = require("luasnip.util.types")

        ls.config.set_config {
            -- This tells LuaSnip to remember to keep around the last snippet.
            -- You can jump back into it even if you move outside of the selection
            history = true,

            -- This one is cool cause if you have dynamic snippets, it updates as you type!
            updateevents = "TextChanged,TextChangedI",

            -- Autosnippets:
            enable_autosnippets = true,

            -- Crazy highlights!!
            ext_opts = {
                [types.choiceNode] = {
                    active = {
                        virt_text = { { "●", "Special" } },
                    }
                }
            }
        }

        -- Load snippets from friendly-snippets
        require("luasnip.loaders.from_vscode").lazy_load()

        -- You can add your own custom snippets here
        -- Example:
        ls.add_snippets("all", {
            ls.snippet("todo", {
                ls.text_node("// TODO: "),
                ls.insert_node(0)
            })
        })

        -- Key mappings for snippet navigation
        vim.keymap.set({"i", "s"}, "<c-k>", function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end, {silent = true})

        vim.keymap.set({"i", "s"}, "<c-j>", function()
            if ls.jumpable(-1) then
                ls.jump(-1)
            end
        end, {silent = true})
    end
}
