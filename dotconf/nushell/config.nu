plugin use gstat

$env.config.show_banner = false

def git-prompt [] {
    let status = (gstat .)

    if $status.repo_name == "no_repository" {
        ""
    } else {
        let dirty = if $status.state == "clean" { "" } else { " *" }

        $"  (ansi cyan)󰊢 ($status.branch)($dirty)(ansi reset)"
    }
}

# Prompt
$env.PROMPT_COMMAND = {||
    let dir = if $env.PWD == $nu.home-dir {
        "~"
    } else {
        $env.PWD | str replace $nu.home-dir "~"
    }

    $"(ansi purple_bold)($dir)(ansi reset)(git-prompt)"
}

$env.PROMPT_COMMAND_RIGHT = {||
    date now | format date "%H:%M"
}

$env.PROMPT_INDICATOR = $"(ansi purple_bold)❯(ansi reset) "



