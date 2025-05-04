return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && npm install",
  keys = {
    {
      "<leader>mp",
      "<cmd>MarkdownPreview<cr>",
      desc = "Markdown Preview",
    },
    {
      "<leader>ms",
      "<cmd>MarkdownPreviewStop<cr>",
      desc = "Stop Markdown Preview",
    },
    {
      "<leader>tt",
      function()
        local line = vim.fn.getline(".")
        if line:match("%- %[%s%]") then
          line = line:gsub("%- %[%s%]", "- [x]")
        elseif line:match("%- %[x%]") then
          line = line:gsub("%- %[x%]", "- [ ]")
        end
        vim.fn.setline(".", line)
      end,
      desc = "Toggle Markdown Checkbox",
    },
  },
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
}
