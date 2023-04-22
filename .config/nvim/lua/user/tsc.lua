local spinner = {
  "⣾",
  "⣽",
  "⣻",
  "⢿",
  "⡿",
  "⣟",
  "⣯",
  "⣷",
}

local function open_qf_list(errors)
  vim.fn.setqflist({}, "r", { title = "TSC", items = errors })

  if #errors > 0 then
    vim.cmd("copen")
  end
end

local function parse_tsc_output(_, output)
  if output == nil then
    return
  end

  local errors = {}
  for _, line in ipairs(output) do
    local filename, lineno, colno, message = line:match("^(.+)%((%d+),(%d+)%)%s*:%s*(.+)$")
    if filename ~= nil then
      table.insert(errors, {
        filename = filename,
        lnum = tonumber(lineno),
        col = tonumber(colno),
        text = message,
        type = "E",
      })
    end
  end
  open_qf_list(errors)
end

local format_notification_msg = function(msg, spinner_idx)
  if spinner_idx == 0 then
    return string.format(" %s", msg)
  end

  return string.format(" %s %s", spinner[spinner_idx], msg)
end

local function tsc()
  local cmd = "tsc --noEmit"
  local notify_record
  local spinner_idx = 0
  local finished = false

  local function notify()
    if finished then
      return
    end

    local notify_opts = { title = "TSC" }

    if notify_record ~= nil then
      notify_opts = vim.tbl_extend("force", { replace = notify_record.id }, notify_opts)
    end

    notify_record = vim.notify(
      format_notification_msg("Type-checking your project, sit tight 🚀", spinner_idx),
      nil,
      notify_opts
    )
    spinner_idx = spinner_idx + 1
    if spinner_idx > #spinner then
      spinner_idx = 1
    end

    vim.defer_fn(notify, 125)
  end

  notify()

  local on_exit = function()
    finished = true

    local notify_opts = {}
    if notify_record ~= nil then
      notify_opts = { replace = notify_record.id }
    end

    vim.notify(" Type-checking complete 🎉", nil, notify_opts)
  end

  local opts = {
    on_stdout = parse_tsc_output,
    on_exit = on_exit,
    stdout_buffered = true,
  }

  vim.fn.jobstart(cmd, opts)
end

vim.api.nvim_create_user_command("TSC", tsc, { force = true })
