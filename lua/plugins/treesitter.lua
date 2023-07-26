return {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    build = ':TSUpdate',
    -- 由于 opts 默认的操作对象是这个module的主标题 (也就是顶上第一个字符串 'nvim-treesitter/nvim-treesitter' )
    -- 一般来说不会有问题，但 treesitter 的 config 操作对象是 'nvim-treesitter.configs'
    -- 所以要用 opts 这个简写的话得用 main 关键词修改一下它的操作对象
    main = 'nvim-treesitter.configs',

    -- [[ Treesitter Options ]]
    opts = {
        -- A list of parser names, or "all" (the five listed parsers should always be installed)
        ensure_installed = { 
            "c", "c_sharp", "lua", "luadoc", "vim", "vimdoc", "query", "comment", "toml", "yaml",
            "html", "css", "scss", "java", "javascript", "json", "json5",
            "python", "tsx"
        },
        -- ensure_installed = "all",
        highlight = {
            enable = true
        },
        indent = {
            enable = true
        }
    }
}