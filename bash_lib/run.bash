function command::run() {
  local day00="${1:-$(date "+%d")}"
  local day="$(printf "%d" "${day00}")"
  local challenge_dir="${REPO_ROOT:?}/challenges/${day00}"
  cd "${challenge_dir}"

  cargo run
}
