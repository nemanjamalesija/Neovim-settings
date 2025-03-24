-- Filename: ~/github/dotfiles-latest/neovim/neobean/lua/plugins/luasnip.lua
-- ~/github/dotfiles-latest/neovim/neobean/lua/plugins/luasnip.lua

-- This allows me to create my custom snippets
-- All you need to do, if using the lazyvim.org distro, is to enable the
-- coding.luasnip LazyExtra and then add this file

-- If you're a dotfiles scavenger, definitely watch this video (you're welcome)
-- https://youtu.be/FmHhonPjvvA?si=8NrcRWu4GGdmTzee

return {
  "L3MON4D3/LuaSnip",
  enabled = true,
  opts = function(_, opts)
    local ls = require("luasnip")

    -- Add prefix ";" to each one of my snippets using the extend_decorator
    -- I use this in combination with blink.cmp. This way I don't have to use
    -- the transform_items function in blink.cmp that removes the ";" at the
    -- beginning of each snippet. I added this because snippets that start with
    -- a symbol like ```bash aren't having their ";" removed
    -- https://github.com/L3MON4D3/LuaSnip/discussions/895
    -- NOTE: THis extend_decorator works great, but I also tried to add the ";"
    -- prefix to all of the snippets loaded from friendly-snippets, but I was
    -- unable to do so, so I still have to use the transform_items in blink.cmp
    local extend_decorator = require("luasnip.util.extend_decorator")
    -- Create trigger transformation function
    local function auto_semicolon(context)
      if type(context) == "string" then
        return { trig = ";" .. context }
      end
      return vim.tbl_extend("keep", { trig = ";" .. context.trig }, context)
    end
    -- Register and apply decorator properly
    extend_decorator.register(ls.s, {
      arg_indx = 1,
      extend = function(original)
        return auto_semicolon(original)
      end,
    })
    local s = extend_decorator.apply(ls.s, {})

    -- local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node

    -- Custom snippets
    -- the "all" after ls.add_snippets("all" is the filetype, you can know a
    -- file filetype with :set ft
    -- Custom snippets

    -- #####################################################################
    --                            Markdown
    -- #####################################################################

    -- Helper function to create code block snippets
    local function create_code_block_snippet(lang)
      return s({
        trig = lang,
        name = "Codeblock",
        desc = lang .. " codeblock",
      }, {
        t({ "```" .. lang, "" }),
        i(1),
        t({ "", "```" }),
      })
    end

    -- Define languages for code blocks
    local languages = {
      "txt",
      "lua",
      "sql",
      "regex",
      "bash",
      "markdown",
      "markdown_inline",
      "yaml",
      "json",
      "jsonc",
      "cpp",
      "csv",
      "java",
      "javascript",
      "vue",
      "dockerfile",
      "html",
      "css",
      "templ",
      "php",
    }

    -- Generate snippets for all languages
    local snippets = {}

    for _, lang in ipairs(languages) do
      table.insert(snippets, create_code_block_snippet(lang))
    end

    table.insert(
      snippets,
      s({
        trig = "cl",
        name = "Console log",
        desc = "Console.log with message and value",
      }, {
        t('console.log("'),
        i(1, "message"),
        t('", '),
        i(2, "value"),
        t(");"),
      })
    )

    table.insert(
      snippets,
      s({
        trig = "dimport",
        name = "import, dynamic",
        desc = "Dynamic import statement",
      }, {
        t("import "),
        i(1, "name"),
        t(" from '"),
        i(2, "path"),
        t("'"),
        i(0),
      })
    )

    table.insert(
      snippets,
      s({
        trig = "afn",
        name = "Arrow Function",
        desc = "Create an arrow function",
      }, {
        t("const "),
        i(1, "functionName"),
        t(" = ("),
        i(2, "param"),
        t(") =>"),
      })
    )

    table.insert(
      snippets,
      s({
        trig = "todo",
        name = "Add TODO: item",
        desc = "Add TODO: item",
      }, {
        t("/** TODO: "),
        i(1),
        t("*/"),
      })
    )

    table.insert(
      snippets,
      s({
        trig = "scomp",
        name = "vue computed property",
        desc = "create a vue computed property",
      }, {
        t("computed(() =>"),
        i(1, "//code"),
        t(" )"),
      })
    )

    table.insert(
      snippets,
      s({
        trig = "smoun",
        name = "Vue composition api on mounted",
        desc = "Initiates onMounted lifecycle hook",
      }, {
        t("onMounted(() => {"),
        t({ "", "  " }),
        i(1, "// code here"),
        t({ "", "})" }),
      })
    )

    table.insert(
      snippets,
      s({
        trig = "moun",
        name = "Vue options api on mounted",
        desc = "Initiates mounted lifecycle hook",
      }, {
        t("mounted(() {"),
        t({ "", "  " }),
        i(1, "// code here"),
        t({ "", "}" }),
      })
    )

    table.insert(
      snippets,
      s({
        trig = "sfo",
        name = "Vue SFC with Options API",
        desc = "Create a Vue Single-File Component with Options API structure",
      }, {
        t({
          "<template>",
          "//",
          "</template>",
          "<script setup>",
          "export default {",
          "  components: {},",
          "  props: {},",
          "  data() {",
          "    return {};",
          "  },",
          "  computed: {",
          "    //",
          "  },",
          "  mounted() {",
          "    //",
          "  },",
          "  methods: {",
          "    //",
          "  },",
          "}",
          "</script>",
        }),
      })
    )
    table.insert(
      snippets,
      s({
        trig = "sfst",
        name = "Vue SFC with TypeScript Setup",
        desc = "Create a Vue Single-File Component with TypeScript setup syntax",
      }, {
        t('<script lang="ts" setup>\n'),
        i(1, "// script content"),
        t("\n</script>\n<template>\n"),
        i(2, "// template content"),
        t("\n</template>"),
      })
    )

    table.insert(
      snippets,
      s({
        trig = "sfsj",
        name = "Vue SFC with Javascript Setup",
        desc = "Create a Vue Single-File Component with TypeScript setup syntax",
      }, {
        t("<script >\n"),
        i(1, "// script content"),
        t("\n</script>\n<template>\n"),
        i(2, "// template content"),
        t("\n</template>"),
      })
    )

    table.insert(
      snippets,
      s({
        trig = "btn",
        name = "HTML Button",
        desc = "Create an HTML button element",
        -- Optional: add HTML scope constraint
        ft = "html", -- Uncomment if you want to limit to HTML files only
      }, {
        t('<button type="'),
        i(1, "type"),
        t('">'),
        i(2, "content"),
        t("</button>"),
      })
    )

    table.insert(
      snippets,
      s({
        trig = "cls",
        name = "Class Attribute",
        desc = "Insert class attribute with placeholder",
        -- Optional: add HTML scope constraint
        ft = "html", -- Uncomment if you want to limit to HTML files only
      }, {
        t('class="'),
        i(1, "className"),
        t('"'),
      })
    )

    ls.add_snippets("javascript", snippets)
    ls.add_snippets("vue", snippets)
    -- #####################################################################
    --                         all the filetypes
    -- #####################################################################
    ls.add_snippets("all", {
      s({
        trig = "workflow",
        name = "Add this -> lamw26wmal",
        desc = "Add this -> lamw26wmal",
      }, {
        t("lamw26wmal"),
      }),

      s({
        trig = "lam",
        name = "Add this -> lamw26wmal",
        desc = "Add this -> lamw26wmal",
      }, {
        t("lamw26wmal"),
      }),

      s({
        trig = "mw25",
        name = "Add this -> lamw26wmal",
        desc = "Add this -> lamw26wmal",
      }, {
        t("lamw26wmal"),
      }),
    })

    return opts
  end,
}
