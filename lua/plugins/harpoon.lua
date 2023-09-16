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
        "<a-1>",
        function()
          require("harpoon.ui").nav_file(1)
        end,
        silent = false,
        desc = "Harpoon - Nav to File 1",
      },
      {
        "<a-2>",
        function()
          require("harpoon.ui").nav_file(2)
        end,
        silent = true,
        desc = "Harpoon - Nav to File 2",
      },
      {
        "<a-3>",
        function()
          require("harpoon.ui").nav_file(3)
        end,
        silent = true,
        desc = "Harpoon - Nav to File 3",
      },
      {
        "<a-4>",
        function()
          require("harpoon.ui").nav_file(4)
        end,
        silent = true,
        desc = "Harpoon - Nav to File 4",
      },
    },
  },
}
