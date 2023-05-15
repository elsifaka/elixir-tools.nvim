local V = require("elixir.elixirls.version")
local M = {}

function M.check()
  vim.health.report_start("elixir-tools.nvim report")

  local version_string = vim.fn.system("elixir --version")
  local ex_version = V.elixir_version(version_string)
  local otp_version = V.erlang_version(version_string)

  if type(ex_version) == "string" then
    vim.health.report_ok("Elixir v" .. ex_version)
  else
    vim.health.report_error("couldn't figure out elixir version")
  end

  if type(otp_version) == "string" then
    vim.health.report_ok("OTP " .. otp_version)
  else
    vim.health.report_error("couldn't figure out OTP version")
  end
end

return M
