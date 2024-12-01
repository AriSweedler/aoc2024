function command::code() {
  local day00="${1:-$(date "+%d")}"
  local day="$(printf "%d" "${day00}")"
  local challenge_dir="${REPO_ROOT:?}/challenges/${day00}"

  mkdir -p "${challenge_dir}"
  cd "${challenge_dir}"
  if ! [ -f "Cargo.toml" ]; then
    log::info "Initializing challenge"
    cargo init --name "c${day00}"
    cargo run
    command::input "${day00}"
    echo "# Day ${day}" > README.md
  fi
  "$EDITOR" "src/main.rs"
}
