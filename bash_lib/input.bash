function command::input() {
  local day00="${1:-$(date "+%d")}"

  local day="$(printf "%d" "${day00}")"
  local challenge_dir="${REPO_ROOT:?}/challenges/${day00}"
  local dest="${challenge_dir}/input.aoc"

  log::info "Getting input for day | day='${day}' dest='${dest#${REPO_ROOT}/}'"
  api --path "day/${day}/input" --output "${dest}"

  log::info "GOT N LINES OF INPUT | N='$(wc -l "${dest}" | awk '{print $1}')'"
}
