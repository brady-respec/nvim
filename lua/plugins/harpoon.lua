return {
  {
    "ThePrimeagen/harpoon",
    keys = {
      {
        "<leader>a",
        function()
          require("harpoon.mark").add_file()
        end,
        silent = true,
        desc = "Add harpoon mark",
      },
      {
        "<C-e>",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        silent = true,
        desc = "Harpoon toggle",
      },
      {
        "<C-1>",
        function()
          require("harpoon.ui").nav_file(1)
        end,
        silent = true,
        desc = "Harpoon - Nav to File 1",
      },
      {
        "<C-2>",
        function()
          require("harpoon.ui").nav_file(2)
        end,
        silent = true,
        desc = "Harpoon - Nav to File 2",
      },
      {
        "<C-3>",
        function()
          require("harpoon.ui").nav_file(3)
        end,
        silent = true,
        desc = "Harpoon - Nav to File 3",
      },
      {
        "<C-4>",
        function()
          require("harpoon.ui").nav_file(4)
        end,
        silent = true,
        desc = "Harpoon - Nav to File 4",
      },
    },
  },
}
