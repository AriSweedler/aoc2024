function command::input() {
  local day00="${1:-$(date "+%d")}"
  local day="$(printf "%d" "${day00}")"
  local challenge_dir="${REPO_ROOT:?}/challenges/${day00}"
  local dest="${challenge_dir}/input.aoc"

  log::info "Getting input for day | day='${day}' dest='${dest#${REPO_ROOT}/}'"
  local curl_args=(
    --header "cookie: session=${SESSION}"
    --header "referer: https://adventofcode.com/2024/day/${day}"
    --header "user-agent: AriSweedler AoC CLI"
    --header 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7'
    --header 'accept-language: en-US,en;q=0.9'
    --header 'cache-control: max-age=0'
    --header 'dnt: 1'
    --header 'priority: u=0, i'
    --header 'sec-ch-ua: "Not?A_Brand";v="99", "Chromium";v="130"'
    --header 'sec-ch-ua-mobile: ?0'
    --header 'sec-ch-ua-platform: "macOS"'
    --header 'sec-fetch-dest: document'
    --header 'sec-fetch-mode: navigate'
    --header 'sec-fetch-site: same-origin'
    --header 'sec-fetch-user: ?1'
    --header 'upgrade-insecure-requests: 1'
  )
  curl_args+=(
    --silent
    --output "${dest}"
    --url "https://adventofcode.com/2024/day/${day}/input"
  )
  curl "${curl_args[@]}"

  log::info "GOT N LINES OF INPUT | N='$(wc -l "${dest}" | awk '{print $1}')'"
}
