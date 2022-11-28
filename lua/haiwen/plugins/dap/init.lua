
local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

  local dap_icons = {
    error = {
      text = "🛑",
      texthl = "LspDiagnosticsSignError",
      linehl = "",
      numhl = "",
    },
    rejected = {
      text = "",
      texthl = "LspDiagnosticsSignHint",
      linehl = "",
      numhl = "",
    },
    stopped = {
      text = "",
      texthl = "LspDiagnosticsSignInformation",
      linehl = "DiagnosticUnderlineInfo",
      numhl = "LspDiagnosticsSignInformation",
    },
  }

  vim.fn.sign_define("DapBreakpoint", dap_icons.error)
  vim.fn.sign_define("DapStopped", dap_icons.stopped)
  vim.fn.sign_define("DapBreakpointRejected", dap_icons.rejected)
